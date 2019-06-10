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

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim MyDir As System.IO.DirectoryInfo
        MyDir = New System.IO.DirectoryInfo(".")
        baseFolder = MyDir.FullName
        tempFolder = baseFolder + "\temp"
        defaultInFolder = baseFolder + "\in"
        outputFolder = baseFolder + "\out"
        pageSchema = baseFolder + "\xsd\pagecontent.xsd"
        cleanUpStylesheet = baseFolder + "\xsl\DeleteTextEquiv.xsl"
        aletheiaToPAGEStylesheet = baseFolder + "\xsl\AletheiaToPAGE.xsl"

        ' determine if temp already exists
        If My.Computer.FileSystem.DirectoryExists(tempFolder) Then
            ' delete everything in temp
            For Each foundFile As String In My.Computer.FileSystem.GetFiles( _
                    tempFolder, _
                    FileIO.SearchOption.SearchAllSubDirectories, _
                    "*.*")
                My.Computer.FileSystem.DeleteFile(foundFile, _
                    FileIO.UIOption.OnlyErrorDialogs, _
                    FileIO.RecycleOption.DeletePermanently)
            Next
        Else
            ' create temp folder
            My.Computer.FileSystem.CreateDirectory(tempFolder)
        End If

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

            ChangeNamespaceAndCopy(xmlFile, tempFolder + "\t1_" + fileInfo.Name)

            TransformXML(tempFolder + "\t1_" + fileInfo.Name, cleanUpStylesheet, tempFolder + "\t2_" + fileInfo.Name)

            TransformXML(tempFolder + "\t2_" + fileInfo.Name, aletheiaToPAGEStylesheet, outputFolder + "\" + fileInfo.Name)

            ValidateXML(outputFolder + "\" + fileInfo.Name)
        Next

        ' clean temp folder
        For Each foundFile As String In My.Computer.FileSystem.GetFiles( _
                tempFolder, _
                FileIO.SearchOption.SearchAllSubDirectories, _
                "*.*")
            My.Computer.FileSystem.DeleteFile(foundFile, _
                FileIO.UIOption.OnlyErrorDialogs, _
                FileIO.RecycleOption.DeletePermanently)
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

    Private Sub ChangeNamespaceAndCopy(ByVal inFile As String, ByVal outFile As String)

        ' check if outFile already exists and delete if necessary
        If My.Computer.FileSystem.FileExists(outFile) Then
            My.Computer.FileSystem.DeleteFile(outFile, _
                    FileIO.UIOption.OnlyErrorDialogs, _
                    FileIO.RecycleOption.DeletePermanently)
        End If

        ' file to read from
        Dim fileReader As System.IO.StreamReader
        fileReader = My.Computer.FileSystem.OpenTextFileReader(inFile)
        Dim line As String
        ' file to write to
        Dim fileWriter As System.IO.StreamWriter
        fileWriter = My.Computer.FileSystem.OpenTextFileWriter(outFile, True)

        Dim replaced As Boolean = False
        Dim lineCounter As Integer = 0
        Do
            line = fileReader.ReadLine()
            lineCounter = lineCounter + 1
            Dim tempLine As String
            tempLine = line
            If Not tempLine Is Nothing Then
                ' change namespace temporarily for conversion
                If Not replaced Then
                    If line.Contains("http://schema.primaresearch.org/PAGE/gts/pagecontent/2009-03-16") Then
                        tempLine = Replace(line, "http://schema.primaresearch.org/PAGE/gts/pagecontent/2009-03-16", "http://schema.primaresearch.org/gt/gts/pagecontent/2009-04-27")
                        replaced = True
                    End If
                End If

                ' change image_filename (in XML file) to the XML file name with extension .tif
                If tempLine.Contains("image_filename=") Then
                    Dim imgFileString As String
                    imgFileString = tempLine.Substring(tempLine.IndexOf("image_filename=")).Split(Chr(34))(1)

                    Dim firstPartFile As String
                    firstPartFile = tempLine.Substring(0, tempLine.IndexOf("image_filename=") + 16)

                    Dim secondPartFile As String
                    secondPartFile = tempLine.Substring(tempLine.IndexOf("image_filename=") + 16)
                    secondPartFile = secondPartFile.Substring(secondPartFile.IndexOf(Chr(34)))

                    Dim fileInfo As System.IO.FileInfo
                    fileInfo = My.Computer.FileSystem.GetFileInfo(inFile)

                    If CorrectFileNameCheckBox.Checked Then
                        tempLine = firstPartFile + fileInfo.Name.Substring(0, fileInfo.Name.IndexOf(fileInfo.Extension)) + ".tif" + secondPartFile
                    End If

                    ' read image properties and display image
                    If CorrectImageDimensionsCheckBox.Checked Then
                        Try
                            ' Retrieve the image.
                            image = New Bitmap(fileInfo.DirectoryName + "\" + imgFileString, True)

                            ' Set the PictureBox to display the image.
                            ' PictureBox.SizeMode = PictureBoxSizeMode.Zoom
                            ' PictureBox.Image = image1

                            ' write image dimensions to the XML file
                            If tempLine.Contains("image_width=") Then
                                Dim widthString As String
                                widthString = tempLine.Substring(tempLine.IndexOf("image_width=")).Split(Chr(34))(1)

                                If image.Width.ToString <> widthString Then
                                    LogRichTextBox.AppendText("Width corrected: " & fileInfo.Name & System.Environment.NewLine)
                                End If

                                Dim firstPartWidth As String
                                firstPartWidth = tempLine.Substring(0, tempLine.IndexOf("image_width=") + 13)

                                Dim secondPartWidth As String
                                secondPartWidth = tempLine.Substring(tempLine.IndexOf("image_width=") + 13)
                                secondPartWidth = secondPartWidth.Substring(secondPartWidth.IndexOf(Chr(34)))

                                tempLine = firstPartWidth + image.Width.ToString + secondPartWidth
                            End If

                            If tempLine.Contains("image_height=") Then
                                Dim heightString As String
                                heightString = tempLine.Substring(tempLine.IndexOf("image_height=")).Split(Chr(34))(1)

                                If image.Height.ToString <> heightString Then
                                    LogRichTextBox.AppendText("Height corrected: " & fileInfo.Name & System.Environment.NewLine)
                                End If

                                Dim firstPartHeight As String
                                firstPartHeight = tempLine.Substring(0, tempLine.IndexOf("image_height=") + 14)

                                Dim secondPartHeight As String
                                secondPartHeight = tempLine.Substring(tempLine.IndexOf("image_height=") + 14)
                                secondPartHeight = secondPartHeight.Substring(secondPartHeight.IndexOf(Chr(34)))

                                tempLine = firstPartHeight + image.Height.ToString + secondPartHeight
                            End If

                            If Not image Is Nothing Then
                                image.Dispose()
                            End If

                        Catch ex As ArgumentException
                            LogRichTextBox.AppendText(fileInfo.DirectoryName + "\" + imgFileString & " could not be found." & System.Environment.NewLine)
                        End Try
                    End If
                End If

                fileWriter.WriteLine(tempLine)
            End If

        Loop Until line Is Nothing

        fileReader.Close()
        fileWriter.Close()

        If Not replaced Then
            LogRichTextBox.AppendText("Error, namespace could not be changed in file: " & inFile & System.Environment.NewLine)
        End If

        'RichTextBox1.AppendText("ChangeNamespaceAndCopy " & inFile & " " & outFile & System.Environment.NewLine)
    End Sub

    Private Sub TransformXML(ByVal inFile As String, ByVal schemaFile As String, ByVal outFile As String)

        ' Load the style sheet.
        Dim xslt As New XslCompiledTransform()
        xslt.Load(schemaFile)

        ' Execute the transform and output the results to a file.
        xslt.Transform(inFile, outFile)

        ' RichTextBox1.AppendText("TransformXML " & inFile & " " & outFile & " " & schemaFile & System.Environment.NewLine)
    End Sub

    Private Sub ValidateXML(ByVal inFile As String)
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

            LogRichTextBox.AppendText("Validation failed for: " & inFile & System.Environment.NewLine)
            LogRichTextBox.AppendText(ex.Message & System.Environment.NewLine)

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
