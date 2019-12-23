# Creating Virtual Machine
# This Script create virtual network with name Prod_Vnet and subnet with name Healthcare and banking

# Create Subnet With name Healthcare
$subnet1 = New-AzureRmVirtualNetworkSubnetConfig -Name Healthcare -AddressPrefix '192.168.1.0/24'

# Create Subnet With name Banking
$subnet2 = New-AzureRmVirtualNetworkSubnetConfig -Name Banking -AddressPrefix '192.168.2.0/24'

# Create VirtualNetwork With name Prod_Vnet
New-AzureRmVirtualNetwork -Name Prod_Vnet -ResourceGroupName prod -Location 'East US' `
-AddressPrefix '192.168.0.0/16' -Subnet $subnet1 , $subnet2


# Get All VirtualNetwork Info
Get-AzureRmVirtualNetwork
