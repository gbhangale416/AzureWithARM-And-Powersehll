### Enable ExecutionPolicy
```powershell Set-ExecutionPolicy RemoteSigned```

### Check the Powershell Version (should be above 5.0)
```$PSVersionTable```

### Install AzureRM module using powershell
```Install-Module azurerm```

### Login into Azure with powershell 
```Login-AzureRmAccount```

### Get Logined account info
```Get-AzureRmSubscription```

### Create Resource Group
``New-AzureRmResourceGroup -Name <Resource Group Name> -Location <Location>``

    For Example:-  New-AzureRmResourceGroup -Name prod -Location 'East US'

### Get all resources Group
```Get-AzureRmResourceGroup```

### Create Subnet
```New-AzureRmVirtualNetworkSubnetConfig -Name <Subnet Name> -AddressPrefix <AddressRange>```

    For Example:- New-AzureRmVirtualNetworkSubnetConfig -Name Healthcare -AddressPrefix '192.168.1.0/24'

### Create VirtualNetwork 
```New-AzureRmVirtualNetwork -Name <VirtualNetwork Name> -ResourceGroupName <ResourceGrpoup Name> -Location <Location> -AddressPrefix <AddressRange> -Subnet <subnet,subnet>```

    For Example:- 

    ## Create Subnet and store it in $subnet Vaiable    
    $subnet1 = New-AzureRmVirtualNetworkSubnetConfig -Name Healthcare -AddressPrefix '192.168.1.0/24'
    
    ## Create Virtual Network 
    New-AzureRmVirtualNetwork -Name Prod_Vnet -ResourceGroupName prod -Location 'East US' -AddressPrefix '192.168.0.0/16' -Subnet $subnet1

### Get All VirtualNetwork Information
```Get-AzureRmVirtualNetwork```

