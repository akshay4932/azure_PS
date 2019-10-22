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


$vnetname = "vnet-ps-2210"
$vnetAddressSpace = "10.0.0.0/24"

$VNET = Get-AzVirtualNetwork -Name $vnetname -ResourceGroupName $RG.ResourceGroupName -ErrorAction SilentlyContinue

if(!$VNET)
{
$VNET=New-AzVirtualNetwork -Name $vnetname -ResourceGroupName $RG.ResourceGroupName -Location $RG.Location -AddressPrefix $vnetAddressSpace
Write-Host "***********************************"
Write-Host "New VNET Created"
Write-Host "***********************************"
}
else
{
Write-Host "***********************************"
Write-Host "VNET Already Exists"
Write-Host "***********************************"
}
