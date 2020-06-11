Login-AzAccount

Get-AzSubscription

Set-AzContext -SubscriptionName "Azure subscription 1"

$location = "westeurope"
$rgName = "Iaas-ps-rg"
$credentials = Get-Credential

New-AzResourceGroup -Name $rgName -Location $location

New-AzVM `
    -ResourceGroupName $rgName `
    -Name "Iaas-ps" `
    -Location $location `
    -VirtualNetworkName "Iaas-ps-vnet" `
    -SubnetName "Iaas-ps-subnet" `
    -PublicIpAddressName "Iaas-ps-ip" `
    -OpenPorts 80,3389 `
    -Credential $credentials

Get-AzPublicIpAddress -ResourceGroupName $rgName

Remove-AzResourceGroup -Name $rgName