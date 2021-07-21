#Use this command to install the MSOnline module 
Install-Module MSOnline

#Use this command to connect and auth MSonline to Azure AD
Connect-MsolService

#Use this command to get a list of Domains configured in Azure 
Get-MsolDomain

#Use this command to set a domain as the default domain for a tenant (replace the domain with a domain in your tenant)
Set-MsolDomain -Name "dtnbtech.onmicrosoft.com" -IsDefault

#Use this command to verify federation settings for a domain (replace the domain with a domain in your tenant)
Get-MsolDomainFederationSettings -DomainName dtnb.tech

#Use this command to reset the federation settings for a domain in the event your SSO connection is invalid (replace the domain with a domain in your tenant)
Set-MsolDomainAuthentication -DomainName dtnb.tech -Authentication Managed
