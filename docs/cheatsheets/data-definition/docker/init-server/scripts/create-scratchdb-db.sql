IF DB_ID('ScratchDb') IS NOT NULL
   print 'db exists'
ELSE 
    create database ScratchDb
GO
