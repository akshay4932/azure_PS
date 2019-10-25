#Connect-AzAccount
#Select-AzSubscription -Subscription "Visual Studio Enterprise"
Get-AzSubscription
$RGName = "RG-Stor-Demo-PS"
$RGLocation = "West Europe"

$RG = Get-AzResourceGroup -Name $RGName -ErrorAction SilentlyContinue

if(!$RG)
{
$RG = New-AzResourceGroup -Name $RGName -Location $RGLocation
Write-Host "*************************************************"
Write-Host "New Resource Group Created"
Write-Host "*************************************************"
}
else
{
Write-Host "*************************************************"
Write-Host "Resource Group Already Exists"
Write-Host "*************************************************"
}

$storageAccountName = "storakshayps"


$SA = Get-AzStorageAccount -ResourceGroupName $RG.ResourceGroupName -Name $storageAccountName -ErrorAction SilentlyContinue

if(!$SA)
{
$SA = New-AzStorageAccount -ResourceGroupName $RG.ResourceGroupName -Name $storageAccountName -Location $RG.Location -SkuName Standard_LRS -Kind StorageV2 -AccessTier Hot
Write-Host "*************************************************"
Write-Host "New Storage Account Created"
Write-Host "*************************************************"
}
else
{
Write-Host "*************************************************"
Write-Host "Storage Account Already Exists"
Write-Host "*************************************************"
}