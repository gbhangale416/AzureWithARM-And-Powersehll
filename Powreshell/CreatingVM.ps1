# Provision a VM in existing Vnet and deploysa Windows VM from the Marketplace
# This script can be used for automatic Provisioning because it uses the local `
# Virtual Machine admin credintial inline instade of calling Get-Credintial `
# which requires user intreaction

# Decleare Variables
$VMLocalAdminuser = "LocalAdminUser"
$VmLocalAdminSecurePassword = ConvertTo-SecureString Delta123456! -AsPlainText -Force
$LocationName = "eastus"
$ResourceGroupName ="prod"
$ComputerName ="webserver"
$VMName ="webserver"
$VMSize = "Standard_DS2_V2"
$NetworkName = "Prod_Vnet"
$NICName = "MyNIC"

# Feach Network Information
$vnet = Get-AzureRmVirtualNetwork -Name $NetworkName -ResourceGroupName $ResourceGroupName

# There may be multiple subnet in the network, however we would like to provide the VM in \
# a subnet called "HealthCare" . We are using arrays to retrive this information
$subnet = $vnet.Subnets[0].id

# Creating a network card in the subnet
$NIC = New-AzureRmNetworkInterface -Name $NICName -ResourceGroupName $ResourceGroupName -Location $LocationName -SubnetId $subnet

# Storing Credintial in $Credential variable so that it can be used later during the VM creation
$Credential = New-Object System.Management.Automation.PSCredential ($VMLocalAdminuser , $VmLocalAdminSecurePassword)

# Vm Provisioning Starts here by decrearing OS type, SKU etc.
$VirtualMachine = New-AzureRmVMConfig -VMName $VMName -VMSize $VMSize
$VirtualMachineOS = Set-AzureRmVMOperatingSystem -VM $VirtualMachine -windows -ComputerName $ComputerName -Credential $Credential

$VirtualMachineNIC = Add-AzureRmVMNetworkInterface -VM $VirtualMachine -Id $NIC.Id
$VirtualMachineImage = Set-AzureRmVMSourceImage -Vm $VirtualMachine -PublisherName 'MicrosoftWindowsServer' -Offer 'WindowsServer' -Skus '2012-R2-Datacenter' -Version latest

# Final Trigger to Call variable set up earlier in the script
New-AzureRmVM -ResourceGroupName $ResourceGroupName -Location $LocationName -VM $VirtualMachine -Verbose
