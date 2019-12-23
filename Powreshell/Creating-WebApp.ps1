# Building a PaaS (Web app) Application in Azure with PS

# Pre-requisites
# 1. Create Resource Group
# 2. Create app service plan
# 3. Create a web app that connect to appservice plan and the resource group

#Create New Resource Group
$resgroup = New-AzureRmResourceGroup -Name prod -Location 'East US'

# Store Resource Group Name 
$rgName = $resgroup.ResourceGroupName

 
# Create app service plan with above resource group
$appserviceplan = New-AzureRmAppServicePlan -Location 'East US' -Tier Standard -ResourceGroupName $rgName -Name businessappserver

$appplanname = $appserviceplan.Name

# Create Web App with above resource group and AppServicePlan
New-AzureRmWebApp -ResourceGroupName $rgName -Name ednwebapp -Location 'East US' -AppServicePlan $appplanname


# This will Display all resources Group
Get-AzureRmResourceGroup

# Tis will Display all Web App with all info
Get-AzureRmWebApp

# Tis will Display all Web App
Get-AzureRmWebApp | Select-Object ResourceGroup , RepositorySiteName , HostNames , Location | Export-Csv -Path C:/output.csv
