# Run this in a PowerShell session where you have previously established a connection using Connect-MsolService  

#Set this value to your domain name intended for federation
$domain = "dtnb.tech"


$users=Get-MsolUser -Domain $domain

foreach ($user in $users)

{
$upn=$user.UserPrincipalName
if ($upn) {
echo "Seting ImmutibleID on $upn"
try {
Set-MsolUser -UserPrincipalName $upn -ImmutableId $upn
} catch {
$failures += $upn
Write-Warning "$upn user found, but FAILED to update."
echo "Failed to set immutible id on $upn"
}
}
}

$failures
