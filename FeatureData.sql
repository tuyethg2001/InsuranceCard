USE [InsuranceCard]
GO
SET IDENTITY_INSERT [dbo].[RoleFeature] ON 

INSERT [dbo].[RoleFeature] ([ID], [RoleName], [isDelete]) VALUES (1, N'customer', 0)
INSERT [dbo].[RoleFeature] ([ID], [RoleName], [isDelete]) VALUES (2, N'staff', 0)
INSERT [dbo].[RoleFeature] ([ID], [RoleName], [isDelete]) VALUES (3, N'moderator', 0)
SET IDENTITY_INSERT [dbo].[RoleFeature] OFF
GO
SET IDENTITY_INSERT [dbo].[Feature] ON 

INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (1, 1, N'/customer/dashboard', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (2, 1, N'/customer/contract/create', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (3, 2, N'/staff/dashboard', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (4, 2, N'/staff/customer/view', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (5, 2, N'/staff/customer/detail', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (6, 2, N'/staff/customer/edit', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (7, 2, N'/staff/customer/create', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (8, 1, N'/customer/info', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (9, 1, N'/customer/info/update', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (10, 1, N'/customer/contract/view', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (11, 1, N'/customer/contract/detail', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (12, 1, N'/customer/contract/renew', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (13, 2, N'/staff/contract/detail', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (14, 2, N'/staff/contract/view', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (15, 2, N'/staff/contract/pay', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (16, 2, N'/staff/contract/renew', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (17, 2, N'/staff/contract/create', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (18, 1, N'/customer/history/payment', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (19, 1, N'/customer/history/compensation/request', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (20, 2, N'/staff/compensation/resolve-compensation', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (21, 1, N'/customer/history/compensation/detail', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (22, 1, N'/customer/history/compensation/cancel', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (23, 1, N'/customer/history/accident', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (24, 1, N'/customer/checkout', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (25, 1, N'/customer/history/compensation', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (26, 2, N'/staff/compensation', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (27, 1, N'/change-password', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (28, 2, N'/change-password', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (29, 1, N'/authorize_payment', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (30, 2, N'/authorize_payment', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (31, 1, N'/cancel-contract', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (32, 2, N'/cancel-contract', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (33, 1, N'/execute_payment', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (34, 2, N'/execute_payment', 0)
INSERT [dbo].[Feature] ([ID], [RoleID], [URL], [isDelete]) VALUES (35, 2, N'/staff/contract/update', 0)

SET IDENTITY_INSERT [dbo].[Feature] OFF
GO
