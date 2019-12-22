# This will set ExecutionPolicy
powershell Set-ExecutionPolicy RemoteSigned

#This Will install AzureRM Module
Install-Module azurerm

#This Will get all avilable modules in the device
get-module -ListAvailable

#This will login into Azure 
Login-AzureRmAccount

#This will Get all Vm in the Subscration
Get-AzureRmVM

# this Will display Logined account info
Get-AzureRmSubscription

# Creating VM
# Creating N/W
# Create Storage Account