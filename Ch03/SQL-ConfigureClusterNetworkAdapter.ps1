Get-ClusterNetwork | fl * 
$clusadapt = Get-ClusterNetwork -Cluster LSSPSQLClus -Name "Cluster Network 1" 
$clusadapt.Name = "Intranet" 
$clusadapt = Get-ClusterNetwork -Cluster LSSPSQLClus -Name "Cluster Network 2" 
$clusadapt.Name = "Heartbeat" 
