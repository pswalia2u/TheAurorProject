param
(
    [string]$Password = "pass123",
    [string]$user = "golu"
)
Write-Host -ForegroundColor Green "Adding_User..."
$pass=ConvertTo-SecureString $Password -AsPlainText -Force
New-ADUser -Name $user -AccountPassword $pass -Enabled $true