<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.PictureBox = New System.Windows.Forms.PictureBox
        Me.ConvertButton = New System.Windows.Forms.Button
        Me.OpenFolderButton = New System.Windows.Forms.Button
        Me.FolderBrowserDialog = New System.Windows.Forms.FolderBrowserDialog
        Me.OpenFileDialog = New System.Windows.Forms.OpenFileDialog
        Me.OpenFilesButton = New System.Windows.Forms.Button
        Me.ClearButton = New System.Windows.Forms.Button
        Me.CorrectImageDimensionsCheckBox = New System.Windows.Forms.CheckBox
        Me.OutputPathLabel = New System.Windows.Forms.Label
        Me.SetOutputButton = New System.Windows.Forms.Button
        Me.JobListBox = New System.Windows.Forms.ListBox
        Me.LogRichTextBox = New System.Windows.Forms.RichTextBox
        Me.CorrectFileNameCheckBox = New System.Windows.Forms.CheckBox
        CType(Me.PictureBox, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'PictureBox
        '
        Me.PictureBox.Location = New System.Drawing.Point(26, 168)
        Me.PictureBox.Name = "PictureBox"
        Me.PictureBox.Size = New System.Drawing.Size(47, 58)
        Me.PictureBox.TabIndex = 1
        Me.PictureBox.TabStop = False
        '
        'ConvertButton
        '
        Me.ConvertButton.Enabled = False
        Me.ConvertButton.Location = New System.Drawing.Point(697, 197)
        Me.ConvertButton.Name = "ConvertButton"
        Me.ConvertButton.Size = New System.Drawing.Size(75, 23)
        Me.ConvertButton.TabIndex = 2
        Me.ConvertButton.Text = "Convert"
        Me.ConvertButton.UseVisualStyleBackColor = True
        '
        'OpenFolderButton
        '
        Me.OpenFolderButton.Location = New System.Drawing.Point(12, 12)
        Me.OpenFolderButton.Name = "OpenFolderButton"
        Me.OpenFolderButton.Size = New System.Drawing.Size(75, 23)
        Me.OpenFolderButton.TabIndex = 3
        Me.OpenFolderButton.Text = "Open Folder"
        Me.OpenFolderButton.UseVisualStyleBackColor = True
        '
        'OpenFileDialog
        '
        Me.OpenFileDialog.FileName = "OpenFileDialog1"
        Me.OpenFileDialog.Filter = "XML files (*.xml)|*.xml"
        Me.OpenFileDialog.Multiselect = True
        '
        'OpenFilesButton
        '
        Me.OpenFilesButton.Location = New System.Drawing.Point(12, 41)
        Me.OpenFilesButton.Name = "OpenFilesButton"
        Me.OpenFilesButton.Size = New System.Drawing.Size(75, 23)
        Me.OpenFilesButton.TabIndex = 4
        Me.OpenFilesButton.Text = "Open File(s)"
        Me.OpenFilesButton.UseVisualStyleBackColor = True
        '
        'ClearButton
        '
        Me.ClearButton.Location = New System.Drawing.Point(12, 90)
        Me.ClearButton.Name = "ClearButton"
        Me.ClearButton.Size = New System.Drawing.Size(75, 23)
        Me.ClearButton.TabIndex = 5
        Me.ClearButton.Text = "Clear Job"
        Me.ClearButton.UseVisualStyleBackColor = True
        '
        'CorrectImageDimensionsCheckBox
        '
        Me.CorrectImageDimensionsCheckBox.AutoSize = True
        Me.CorrectImageDimensionsCheckBox.Location = New System.Drawing.Point(118, 177)
        Me.CorrectImageDimensionsCheckBox.Name = "CorrectImageDimensionsCheckBox"
        Me.CorrectImageDimensionsCheckBox.Size = New System.Drawing.Size(388, 17)
        Me.CorrectImageDimensionsCheckBox.TabIndex = 6
        Me.CorrectImageDimensionsCheckBox.Text = "Check and correct image dimensions (place referenced image in same folder)"
        Me.CorrectImageDimensionsCheckBox.UseVisualStyleBackColor = True
        '
        'OutputPathLabel
        '
        Me.OutputPathLabel.AutoSize = True
        Me.OutputPathLabel.Location = New System.Drawing.Point(115, 144)
        Me.OutputPathLabel.Name = "OutputPathLabel"
        Me.OutputPathLabel.Size = New System.Drawing.Size(181, 13)
        Me.OutputPathLabel.TabIndex = 0
        Me.OutputPathLabel.Text = "Check and correct image dimensions"
        '
        'SetOutputButton
        '
        Me.SetOutputButton.Location = New System.Drawing.Point(12, 139)
        Me.SetOutputButton.Name = "SetOutputButton"
        Me.SetOutputButton.Size = New System.Drawing.Size(75, 23)
        Me.SetOutputButton.TabIndex = 7
        Me.SetOutputButton.Text = "Set Output"
        Me.SetOutputButton.UseVisualStyleBackColor = True
        '
        'JobListBox
        '
        Me.JobListBox.FormattingEnabled = True
        Me.JobListBox.HorizontalScrollbar = True
        Me.JobListBox.Location = New System.Drawing.Point(118, 12)
        Me.JobListBox.Name = "JobListBox"
        Me.JobListBox.Size = New System.Drawing.Size(654, 121)
        Me.JobListBox.TabIndex = 8
        '
        'LogRichTextBox
        '
        Me.LogRichTextBox.Location = New System.Drawing.Point(12, 241)
        Me.LogRichTextBox.Name = "LogRichTextBox"
        Me.LogRichTextBox.ReadOnly = True
        Me.LogRichTextBox.Size = New System.Drawing.Size(760, 311)
        Me.LogRichTextBox.TabIndex = 9
        Me.LogRichTextBox.Text = ""
        '
        'CorrectFileNameCheckBox
        '
        Me.CorrectFileNameCheckBox.AutoSize = True
        Me.CorrectFileNameCheckBox.Location = New System.Drawing.Point(118, 201)
        Me.CorrectFileNameCheckBox.Name = "CorrectFileNameCheckBox"
        Me.CorrectFileNameCheckBox.Size = New System.Drawing.Size(371, 17)
        Me.CorrectFileNameCheckBox.TabIndex = 10
        Me.CorrectFileNameCheckBox.Text = "Change file name of referenced image to XML file name with extension .tif"
        Me.CorrectFileNameCheckBox.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(784, 564)
        Me.Controls.Add(Me.CorrectFileNameCheckBox)
        Me.Controls.Add(Me.LogRichTextBox)
        Me.Controls.Add(Me.JobListBox)
        Me.Controls.Add(Me.SetOutputButton)
        Me.Controls.Add(Me.CorrectImageDimensionsCheckBox)
        Me.Controls.Add(Me.ClearButton)
        Me.Controls.Add(Me.OpenFilesButton)
        Me.Controls.Add(Me.OpenFolderButton)
        Me.Controls.Add(Me.ConvertButton)
        Me.Controls.Add(Me.PictureBox)
        Me.Controls.Add(Me.OutputPathLabel)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.Name = "Form1"
        Me.Text = "PAGE Converter"
        CType(Me.PictureBox, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents PictureBox As System.Windows.Forms.PictureBox
    Friend WithEvents ConvertButton As System.Windows.Forms.Button
    Friend WithEvents OpenFolderButton As System.Windows.Forms.Button
    Friend WithEvents FolderBrowserDialog As System.Windows.Forms.FolderBrowserDialog
    Friend WithEvents OpenFileDialog As System.Windows.Forms.OpenFileDialog
    Friend WithEvents OpenFilesButton As System.Windows.Forms.Button
    Friend WithEvents ClearButton As System.Windows.Forms.Button
    Friend WithEvents CorrectImageDimensionsCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents OutputPathLabel As System.Windows.Forms.Label
    Friend WithEvents SetOutputButton As System.Windows.Forms.Button
    Friend WithEvents JobListBox As System.Windows.Forms.ListBox
    Friend WithEvents LogRichTextBox As System.Windows.Forms.RichTextBox
    Friend WithEvents CorrectFileNameCheckBox As System.Windows.Forms.CheckBox

End Class
