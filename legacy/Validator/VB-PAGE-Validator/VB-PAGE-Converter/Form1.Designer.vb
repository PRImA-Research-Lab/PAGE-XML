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
        Me.ConvertButton = New System.Windows.Forms.Button
        Me.OpenFolderButton = New System.Windows.Forms.Button
        Me.FolderBrowserDialog = New System.Windows.Forms.FolderBrowserDialog
        Me.OpenFileDialog = New System.Windows.Forms.OpenFileDialog
        Me.OpenFilesButton = New System.Windows.Forms.Button
        Me.ClearButton = New System.Windows.Forms.Button
        Me.JobListBox = New System.Windows.Forms.ListBox
        Me.LogRichTextBox = New System.Windows.Forms.RichTextBox
        Me.SuspendLayout()
        '
        'ConvertButton
        '
        Me.ConvertButton.Enabled = False
        Me.ConvertButton.Location = New System.Drawing.Point(12, 149)
        Me.ConvertButton.Name = "ConvertButton"
        Me.ConvertButton.Size = New System.Drawing.Size(75, 23)
        Me.ConvertButton.TabIndex = 2
        Me.ConvertButton.Text = "Validate"
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
        Me.ClearButton.Location = New System.Drawing.Point(12, 70)
        Me.ClearButton.Name = "ClearButton"
        Me.ClearButton.Size = New System.Drawing.Size(75, 23)
        Me.ClearButton.TabIndex = 5
        Me.ClearButton.Text = "Clear Job"
        Me.ClearButton.UseVisualStyleBackColor = True
        '
        'JobListBox
        '
        Me.JobListBox.FormattingEnabled = True
        Me.JobListBox.HorizontalScrollbar = True
        Me.JobListBox.Location = New System.Drawing.Point(118, 12)
        Me.JobListBox.Name = "JobListBox"
        Me.JobListBox.Size = New System.Drawing.Size(654, 160)
        Me.JobListBox.TabIndex = 8
        '
        'LogRichTextBox
        '
        Me.LogRichTextBox.Location = New System.Drawing.Point(12, 194)
        Me.LogRichTextBox.Name = "LogRichTextBox"
        Me.LogRichTextBox.ReadOnly = True
        Me.LogRichTextBox.Size = New System.Drawing.Size(760, 358)
        Me.LogRichTextBox.TabIndex = 9
        Me.LogRichTextBox.Text = ""
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(784, 564)
        Me.Controls.Add(Me.LogRichTextBox)
        Me.Controls.Add(Me.JobListBox)
        Me.Controls.Add(Me.ClearButton)
        Me.Controls.Add(Me.OpenFilesButton)
        Me.Controls.Add(Me.OpenFolderButton)
        Me.Controls.Add(Me.ConvertButton)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.Name = "Form1"
        Me.Text = "PAGE Validator"
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents ConvertButton As System.Windows.Forms.Button
    Friend WithEvents OpenFolderButton As System.Windows.Forms.Button
    Friend WithEvents FolderBrowserDialog As System.Windows.Forms.FolderBrowserDialog
    Friend WithEvents OpenFileDialog As System.Windows.Forms.OpenFileDialog
    Friend WithEvents OpenFilesButton As System.Windows.Forms.Button
    Friend WithEvents ClearButton As System.Windows.Forms.Button
    Friend WithEvents JobListBox As System.Windows.Forms.ListBox
    Friend WithEvents LogRichTextBox As System.Windows.Forms.RichTextBox

End Class
