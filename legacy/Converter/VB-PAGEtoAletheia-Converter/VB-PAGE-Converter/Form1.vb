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
    Dim PAGEtoAletheiaStylesheet As String

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim MyDir As System.IO.DirectoryInfo
        MyDir = New System.IO.DirectoryInfo(".")
        baseFolder = MyDir.FullName
        defaultInFolder = baseFolder + "\in"
        outputFolder = baseFolder + "\out"
        pageSchema = baseFolder + "\xsd\pagecontent.xsd"
        PAGEtoAletheiaStylesheet = baseFolder + "\xsl\PageToAletheia.xsl"

        ' determine if defaultIn already exists
        If Not (My.Computer.FileSystem.DirectoryExists(defaultInFolder)) Then
            My.Computer.FileSystem.CreateDirectory(defaultInFolder)
        End If

        ' determine if outputFolder already exists
        If Not (My.Computer.FileSystem.DirectoryExists(outputFolder)) Then
            My.Computer.FileSystem.CreateDirectory(outputFolder)
        End If

        OutputPathLabel.Text = outputFolder

        LogRichTextBox.AppendText("PAGE converter started." & System.Environment.NewLine)
        LogRichTextBox.AppendText("Working directory: " & MyDir.FullName & System.Environment.NewLine)
    End Sub

    Private Sub Convert(ByVal sender As System.Object, _
        ByVal e As System.EventArgs) Handles ConvertButton.Click

        For Each xmlFile In JobListBox.Items

            ' determine file name
            Dim fileInfo As System.IO.FileInfo
            fileInfo = My.Computer.FileSystem.GetFileInfo(xmlFile)

            TransformXML(xmlFile, PAGEtoAletheiaStylesheet, outputFolder + "\" + fileInfo.Name + ".old-format.xml")

        Next

        LogRichTextBox.AppendText(JobListBox.Items.Count & " file(s) converted." & System.Environment.NewLine)
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

    Private Sub SetOutputPath(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SetOutputButton.Click
        Dim result As DialogResult = FolderBrowserDialog.ShowDialog()
        ' OK button was pressed.
        If (result = DialogResult.OK) Then
            LogRichTextBox.AppendText("Output folder set to: " & FolderBrowserDialog.SelectedPath & System.Environment.NewLine)
            outputFolder = FolderBrowserDialog.SelectedPath
            OutputPathLabel.Text = outputFolder
        ElseIf (result = DialogResult.Cancel) Then
            Return
        End If
    End Sub


    Private Sub TransformXML(ByVal inFile As String, ByVal schemaFile As String, ByVal outFile As String)

        ' Load the style sheet.
        Dim xslt As New XslCompiledTransform()
        xslt.Load(schemaFile)

        ' Execute the transform and output the results to a file.
        xslt.Transform(inFile, outFile)

        ' RichTextBox1.AppendText("TransformXML " & inFile & " " & outFile & " " & schemaFile & System.Environment.NewLine)
    End Sub

End Class
