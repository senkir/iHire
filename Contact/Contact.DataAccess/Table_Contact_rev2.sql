/*
   Saturday, November 27, 201010:29:41 PM
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
CREATE TABLE dbo.Tmp_Contact
	(
	ContactID int NOT NULL IDENTITY (1, 1),
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
ALTER TABLE dbo.Tmp_Contact SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Contact ON
GO
IF EXISTS(SELECT * FROM dbo.Contact)
	 EXEC('INSERT INTO dbo.Tmp_Contact (ContactID, FirstName, LastName, Nickname, Address, City, State, Zip, HomePhone, CellPhone, WorkPhone, Email)
		SELECT CONVERT(int, ContactNumber), FirstName, LastName, Nickname, Address, City, State, Zip, HomePhone, CellPhone, WorkPhone, Email FROM dbo.Contact WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Contact OFF
GO
DROP TABLE dbo.Contact
GO
EXECUTE sp_rename N'dbo.Tmp_Contact', N'Contact', 'OBJECT' 
GO
ALTER TABLE dbo.Contact ADD CONSTRAINT
	PK_Contact PRIMARY KEY CLUSTERED 
	(
	ContactID
	) WITH( PAD_INDEX = OFF, FILLFACTOR = 1, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Contact', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Contact', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Contact', 'Object', 'CONTROL') as Contr_Per 