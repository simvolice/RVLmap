SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
    [UserId] [int] IDENTITY(1,1) NOT NULL,
    [Username] [nvarchar](250) NOT NULL,
    [Password] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
    [UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
    [CustomerId] [int] IDENTITY(1,1) NOT NULL,
    [CustomerName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
    [CustomerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
    [ProjectId] [int] IDENTITY(1,1) NOT NULL,
    [ProjectName] [nvarchar](250) NOT NULL,
    [Description] [nvarchar](max) NULL,
    [CustomerId] [int] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
    [ProjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
    [TaskId] [int] IDENTITY(1,1) NOT NULL,
    [TaskName] [nvarchar](250) NOT NULL,
    [Description] [nvarchar](max) NULL,
    [StartDate] [datetime] NULL,
    [EndDate] [datetime] NULL,
    [CustomerId] [int] NULL,
    [ProjectId] [int] NULL,
    [UserId] [int] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
    [TaskId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTasks](
    [TaskId] [int] NOT NULL,
    [UserId] [int] NOT NULL,
 CONSTRAINT [PK_UsersTasks] PRIMARY KEY CLUSTERED 
(
    [TaskId] ASC,
    [UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeEntry](
    [TimeEntryId] [int] IDENTITY(1,1) NOT NULL,
    [StartTime] [datetime] NOT NULL,
    [EndTime] [datetime] NOT NULL,
    [TaskId] [int] NOT NULL,
    [Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TimeEntry] PRIMARY KEY CLUSTERED 
(
    [TimeEntryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Customer]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Customer]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([ProjectId])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Project]
GO
ALTER TABLE [dbo].[UsersTasks]  WITH CHECK ADD  CONSTRAINT [FK_UsersTasks_Task] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([TaskId])
GO
ALTER TABLE [dbo].[UsersTasks] CHECK CONSTRAINT [FK_UsersTasks_Task]
GO
ALTER TABLE [dbo].[UsersTasks]  WITH CHECK ADD  CONSTRAINT [FK_UsersTasks_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UsersTasks] CHECK CONSTRAINT [FK_UsersTasks_User]
GO
ALTER TABLE [dbo].[TimeEntry]  WITH CHECK ADD  CONSTRAINT [FK_TimeEntry_Task] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([TaskId])
GO
ALTER TABLE [dbo].[TimeEntry] CHECK CONSTRAINT [FK_TimeEntry_Task]
GO

SET NUMERIC_ROUNDABORT OFF
GO
SET XACT_ABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/*Pointer used for text / image updates. This might not be needed, but is declared here just in case*/
DECLARE @pv binary(16)
BEGIN TRANSACTION
SET IDENTITY_INSERT [dbo].[Task] OFF
SET IDENTITY_INSERT [dbo].[Task] ON
INSERT INTO [dbo].[Task] ([TaskId], [TaskName], [Description], [StartDate], [EndDate], [CustomerId], [ProjectId]) VALUES (1, N'Create Project', N'Create a Silverlight Application project with a RIA Services link', '20100601 00:00:00.000', '20100602 00:00:00.000', NULL, NULL)
INSERT INTO [dbo].[Task] ([TaskId], [TaskName], [Description], [StartDate], [EndDate], [CustomerId], [ProjectId]) VALUES (2, N'Define Data Model', N'Create an Entity Framework model for the application data', '20100602 00:00:00.000', '20100603 00:00:00.000', NULL, NULL)
INSERT INTO [dbo].[Task] ([TaskId], [TaskName], [Description], [StartDate], [EndDate], [CustomerId], [ProjectId]) VALUES (3, N'Define domain service', N'Create a domain service to expose task data to the client', '20100603 00:00:00.000', '20100604 00:00:00.000', NULL, NULL)
INSERT INTO [dbo].[Task] ([TaskId], [TaskName], [Description], [StartDate], [EndDate], [CustomerId], [ProjectId]) VALUES (4, N'Use data in the Silverlight client', N'Use the DomainContext and DomainDataSource to access and manipulate the data in the client', '20100604 00:00:00.000', '20100605 00:00:00.000', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Task] OFF
COMMIT TRANSACTION