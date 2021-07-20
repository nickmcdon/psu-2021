#Change this variable to your domain name
$DomainName = ""


#Change this variable to your SSO URL from Google Workspace
$ActiveLogOnUri = ""

#Change this variable to the location of the certificate file (.pem or .cer) from Google Workspace
$CertPath = ""

#Change this variable to the Entity ID from Google Workspace Admin
$IssuerUri = ""


## Dont Modify below this line ##
$cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2("$CertPath")
$SigningCertificate = [system.convert]::tobase64string($cert.rawdata)
$PassiveLogOnUri = "$ActiveLogOnUri"
$LogOffUri = "https://accounts.google.com/logout"
$PreferredAuthenticationProtocol = "SAMLP"
$FederationBrandName = "Google Workspace"
$Authentication = "Federated"

Set-MsolDomainAuthentication -DomainName $DomainName -FederationBrandName $FederationBrandName -Authentication $Authentication -SigningCertificate $SigningCertificate -IssuerUri $IssuerUri -ActiveLogOnUri $ActiveLogOnUri -PassiveLogOnUri $PassiveLogOnUri -LogOffUri $LogOffUri -PreferredAuthenticationProtocol $PreferredAuthenticationProtocol