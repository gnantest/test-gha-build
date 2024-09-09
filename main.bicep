// targetScope = 'subscription'
@description('Deploy a storage account with cool access tier')
param storageAccountName string

@description('The location for all resources.')
param location string = 'australiaeast'

// @description('The resource group name')
// param resourceGroupName string

// resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
//   name: resourceGroupName
//   location: location

// }

resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Cool'
  }
}
