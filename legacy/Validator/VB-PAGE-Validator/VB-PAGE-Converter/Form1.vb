Imports System.Xml
Imports System.Xml.Xsl
Imports System.Xml.Schema
Imports System.Xml.XPath

Public Class Form1

    Dim image As Bitmap
    Dim outputFolder As String
    Dim baseFolder As String
    Dim tempFolder As String
    Dim defaultInFolder As String
    Dim pageSchema As String
    Dim cleanUpStylesheet As String
    Dim aletheiaToPAGEStylesheet As String
    Dim invalidCounter As Integer


    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim MyDir As System.IO.DirectoryInfo
        MyDir = New System.IO.DirectoryInfo(".")
        baseFolder = MyDir.FullName
        defaultInFolder = baseFolder + "\in"
        pageSchema = baseFolder + "\xsd\pagecontent.xsd"

        LogRichTextBox.AppendText("PAGE validator started." & System.Environment.NewLine)
        LogRichTextBox.AppendText("Working directory: " & MyDir.FullName & System.Environment.NewLine)
    End Sub

    Private Sub Validate(ByVal sender As System.Object, _
        ByVal e As System.EventArgs) Handles ConvertButton.Click

        invalidCounter = 0
        For Each xmlFile In JobListBox.Items

            ValidateXML(xmlFile)
        Next

        LogRichTextBox.AppendText(JobListBox.Items.Count & " file(s) validated. " & invalidCounter & " Error(s)" & System.Environment.NewLine)
        JobListBox.Items.Clear()
        UpdateConvertButton()
    End Sub

    Private Sub AddFolder(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OpenFolderButton.Click
        Dim counter As Integer = 0
        Dim result As DialogResult = FolderBrowserDialog.ShowDialog()

        ' OK button was pressed.
        If (result = DialogResult.OK) Then
            LogRichTextBox.AppendText("Folder: " & FolderBrowserDialog.SelectedPath & System.Environment.NewLine)

            Dim MyDir As System.IO.DirectoryInfo
            MyDir = New System.IO.DirectoryInfo(FolderBrowserDialog.SelectedPath)
            Dim MyFile As System.IO.FileInfo
            For Each MyFile In MyDir.GetFiles()
                If MyFile.Name Like "*.xml" Then
                    JobListBox.Items.Add(MyFile.FullName.ToString())
                    counter = counter + 1
                End If
            Next
        ElseIf (result = DialogResult.Cancel) Then
            Return
        End If
        LogRichTextBox.AppendText(counter & " file(s) added " & System.Environment.NewLine)
        UpdateConvertButton()
    End Sub

    Private Sub AddFiles(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OpenFilesButton.Click
        OpenFileDialog.ShowDialog()
    End Sub

    Private Sub OpenFileDialog1_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles OpenFileDialog.FileOk
        JobListBox.Items.AddRange(OpenFileDialog.FileNames)
        LogRichTextBox.AppendText(OpenFileDialog.FileNames.Length & " file(s) added " & System.Environment.NewLine)
        UpdateConvertButton()
        'MessageBox.Show(FileList.Count)
    End Sub

    Private Sub ClearJobList(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ClearButton.Click
        JobListBox.Items.Clear()
        LogRichTextBox.AppendText("Job list cleared" & System.Environment.NewLine)
        UpdateConvertButton()
    End Sub

    Private Sub UpdateConvertButton()
        If (JobListBox.Items.Count > 0) Then
            ConvertButton.Enabled = True
        Else
            ConvertButton.Enabled = False
        End If
    End Sub

    Private Sub ValidateXML(ByVal inFile As String)

        LogRichTextBox.AppendText(inFile & System.Environment.NewLine)

        Try

            Dim settings As XmlReaderSettings = New XmlReaderSettings()
            settings.Schemas.Add("http://schema.primaresearch.org/PAGE/gts/pagecontent/2010-01-12", pageSchema)
            settings.ValidationType = ValidationType.Schema

            Dim reader As XmlReader = XmlReader.Create(inFile, settings)
            Dim document As XmlDocument = New XmlDocument()
            document.Load(reader)

            Dim eventHandler As ValidationEventHandler = New ValidationEventHandler(AddressOf ValidationEventHandler)

            ' validate
            document.Validate(eventHandler)

            reader.Close()

        Catch ex As Exception

            LogRichTextBox.AppendText("Error in: " & inFile & System.Environment.NewLine)
            LogRichTextBox.AppendText(ex.Message & System.Environment.NewLine)

            invalidCounter = invalidCounter + 1

        End Try

        ' RichTextBox1.AppendText("TransformXML " & inFile & " " & outFile & " " & schemaFile & System.Environment.NewLine)
    End Sub

    Shared Sub ValidationEventHandler(ByVal sender As Object, ByVal e As ValidationEventArgs)

        Select Case e.Severity
            Case XmlSeverityType.Error
                Console.WriteLine("Error: {0}", e.Message)
            Case XmlSeverityType.Warning
                Console.WriteLine("Warning {0}", e.Message)
        End Select

    End Sub

End Class
