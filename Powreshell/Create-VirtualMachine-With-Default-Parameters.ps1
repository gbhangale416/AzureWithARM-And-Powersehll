# Create Virtual Machine

New-AzureRmVM -ResourceGroupName prod -Name webserver -Location 'East US' `
-VirtualNetworkName vnet_prod -SubnetName Healthcare -SecurityGroupName rdpallow `
-PublicIpAddressName randompublicip -OpenPorts 80,3389
