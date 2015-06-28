[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

$objForm = New-Object System.Windows.Forms.Form 
$objForm.Text = "Server Disconnected"
$objForm.Size = New-Object System.Drawing.Size(300,250) 
$objForm.StartPosition = "CenterScreen"

$objForm.KeyPreview = $True
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Enter") 
    {$x=$objTextBox.Text;$objForm.Close()}})
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Escape") 
    {$objForm.Close()}})

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Size(75,150)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = "OK"
$OKButton.Add_Click({ $objForm.Close(); })
$objForm.Controls.Add($OKButton)
$objForm.AcceptButton = $OKButton

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Size(150,150)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = "Cancel"
$objForm.Controls.Add($CancelButton)
$objForm.CancelButton = $CancelButton

$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(10,20) 
$objLabel.Size = New-Object System.Drawing.Size(280,20) 
$objLabel.Text = "Authentication Required"
$objForm.Controls.Add($objLabel) 


$objLabelUser = New-Object System.Windows.Forms.Label
$objLabelUser.Location = New-Object System.Drawing.Size(10,40) 
$objLabelUser.Size = New-Object System.Drawing.Size(280,20) 
$objLabelUser.Text = "Username"
$objForm.Controls.Add($objLabelUser) 


$objLabelPass = New-Object System.Windows.Forms.Label
$objLabelPass.Location = New-Object System.Drawing.Size(10,90) 
$objLabelPass.Size = New-Object System.Drawing.Size(280,20) 
$objLabelPass.Text = "Password"
$objForm.Controls.Add($objLabelPass) 

$objTextBox = New-Object System.Windows.Forms.TextBox 
$objTextBox.Location = New-Object System.Drawing.Size(10,60) 
$objTextBox.Size = New-Object System.Drawing.Size(260,20) 
$objForm.Controls.Add($objTextBox) 

$objTextBox2 = New-Object System.Windows.Forms.MaskedTextBox
$objTextBox2.PasswordChar = '*'
$objTextBox2.Location = New-Object System.Drawing.Size(10,110) 
$objTextBox2.Size = New-Object System.Drawing.Size(260,20) 
$objForm.Controls.Add($objTextBox2) 


$objForm.Topmost = $True

$objForm.Add_Shown({$objForm.Activate()})
[Void] $objForm.ShowDialog()
echo $objTextBox.Text
echo $objTextBox2.Text
