param
(
    [string]$domainName = "example.local",
    [string]$domainNetbiosName = "EXAMPLE",
    [string]$safeModePass = "Admin123#"
)

Install-ADDSForest `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "7" `
-DomainName "$domainName" `
-DomainNetbiosName "$domainNetbiosName" `
-ForestMode "7" `
-InstallDns `
-LogPath "C:\Windows\NTDS" `
-SysvolPath "C:\Windows\SYSVOL" `
-SafeModeAdministratorPassword (ConvertTo-SecureString "$safeModePass" -AsPlainText -Force) `
-Force