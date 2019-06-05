Install-Module -Name AzureRM
Login-AzureRmAccount
$rg = New-AzureRmResourceGroup -Name 'SqlClusterWitness' -Location 'westus2'
$sa = New-AzureRmStorageAccount -ResourceGroupName $rg.ResourceGroupName -Name 'calspag' -Location 'westus2' -SkuName Standard_LRS