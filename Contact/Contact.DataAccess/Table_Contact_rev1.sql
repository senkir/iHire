/*
   Friday, November 26, 20103:13:50 PM
   User: 
   Server: .\SQLEXPRESS
   Database: 
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Contact
	(
	ContactNumber nvarchar(50) NOT NULL,
	FirstName nvarchar(50) NULL,
	LastName nvarchar(50) NULL,
	Nickname nvarchar(50) NULL,
	Address nvarchar(50) NULL,
	City nvarchar(50) NULL,
	State nvarchar(2) NULL,
	Zip nvarchar(50) NULL,
	HomePhone nvarchar(50) NULL,
	CellPhone nvarchar(50) NULL,
	WorkPhone nvarchar(50) NULL,
	Email nvarchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Contact ADD CONSTRAINT
	PK_Contact PRIMARY KEY CLUSTERED 
	(
	ContactNumber
	) WITH( PAD_INDEX = OFF, FILLFACTOR = 1, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Contact SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Contact', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Contact', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Contact', 'Object', 'CONTROL') as Contr_Per 