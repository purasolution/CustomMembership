/* Users - to hold the users */
CREATE TABLE [dbo].[Users](
    [UserId] [int] IDENTITY(1,1) NOT NULL,
    [UserName] [varchar](50) NOT NULL,
    [Password] [varchar](50) NOT NULL,
    [UserEmailAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
    [UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, 
    IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/* Roles - to hold the roles valid for this application */

CREATE TABLE [dbo].[Roles](
    [RoleId] [smallint] NOT NULL,
    [RoleName] [varchar](50) NOT NULL,
    [RoleDescription] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
    [RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, 
  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/* Roles table entries */
INSERT INTO dbo.Roles VALUES(0,'SuperAdmin','Super Admin');
INSERT INTO dbo.Roles VALUES(1, 'Admin', 'Administrator');
INSERT INTO dbo.Roles VALUES(2, 'Author', 'Blog Author');

/* UserRoles - to hold the roles associated to a user */
CREATE TABLE [dbo].[UserRoles](
    [UserRoleId] [int] IDENTITY(1,1) NOT NULL,
    [UserId] [int] NOT NULL,
    [RoleId] [smallint] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
    [UserRoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, 
  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[UserRoles]  
   WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO

ALTER TABLE [dbo].[UserRoles]  
     WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
