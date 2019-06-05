ALTER DATABASE [model] MODIFY FILE (NAME = modeldev, SIZE = 100MB, MAXSIZE = UNLIMITED) 
ALTER DATABASE [model] MODIFY FILE (NAME = modellog, SIZE = 100MB, MAXSIZE = UNLIMITED) 

sp_configure 'show advanced options', 1; 

GO 
RECONFIGURE WITH OVERRIDE; 
GO 
sp_configure 'max degree of parallelism', 1; 
GO 
RECONFIGURE WITH OVERRIDE; 
GO 