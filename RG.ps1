Install-Module Az
Import-Module Az

Connect-AzAccount
Select-AzSubscription -Subscription "Visual Studio Enterprise"

$rgname = "rg-ps-2210-1"
$rglocation = "westeurope"

$RG = Get-AzResourceGroup -Name $rgname -ErrorAction SilentlyContinue

if(!$RG)
{
$RG = New-AzResourceGroup -Name $rgname -Location $rglocation
Write-Host "***********************************"
Write-Host "New Resource Group Created"
Write-Host "***********************************"
}
else
{
Write-Host "***********************************"
Write-Host "Resource Group Already Exists"
Write-Host "***********************************"
}
