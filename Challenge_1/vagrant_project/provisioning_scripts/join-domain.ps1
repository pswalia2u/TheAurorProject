param
(
    [string][ValidateNotNullOrEmpty()]$Password = "pass123",
    [string]$user = "golu",
    [string]$domain = "example.local"
)
Write-Host -ForegroundColor Green "Installing Active Directory management tools. . ."

# Install the AD Domain Services features
Install-WindowsFeature RSAT-Ad-AdminCenter, RSAT-AdDs-Tools

# End user feedback
#Write-Host -ForegroundColor Green "Setting DNS server addresses. . ."

# Set DNS server addresses
#Set-DnsClientServerAddress -InterfaceAlias "Ethernet 2" -ServerAddresses 192.168.2.10

# Wait a few
#Start-Sleep -Seconds 300

# End user feedback
Write-Host -ForegroundColor Green "Joining Active Directory domain. . ."

# Create password as secure string
$pass=ConvertTo-SecureString $Password -AsPlainText -Force

# Create credential object
$Credential = New-Object System.Management.Automation.PSCredential ($user, $pass)

# Join domain
$Settings = @{
    DomainName       = $domain
    DomainCredential = $Credential
}
Add-Computer @Settings