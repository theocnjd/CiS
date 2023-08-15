CREATE DATABASE [CiSDB]
GO

USE [CiSDB]
GO
/****** Object:  Table [dbo].[ErrorDetails]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorDetails](
	[PackageName] [varchar](10) NULL,
	[ProjectName] [varchar](10) NULL,
	[Description] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBulkUploadDonors]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBulkUploadDonors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrgId] [uniqueidentifier] NULL,
	[First Name] [varchar](72) NULL,
	[Last Name] [varchar](72) NULL,
	[AddressLine1] [varchar](150) NULL,
	[AddressLine2] [varchar](150) NULL,
	[City] [varchar](50) NULL,
	[PostCode] [varchar](10) NULL,
	[Telephone] [varchar](11) NULL,
	[Gender] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[MembershipExpire] [date] NULL,
	[IsTaxPayer] [varchar](5) NULL,
	[GiftAidConsentReceived] [varchar](5) NULL,
	[CreatedDate] [datetime] NULL,
	[Donor ID] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBulkUploadManualDonations]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBulkUploadManualDonations](
	[OrgId] [uniqueidentifier] NULL,
	[ID] [int] NULL,
	[First Name] [varchar](72) NULL,
	[Last Name] [varchar](72) NULL,
	[Offering] [money] NULL,
	[Tithe] [money] NULL,
	[Thanks Giving] [money] NULL,
	[Pledges] [money] NULL,
	[Building Fund] [money] NULL,
	[Others] [money] NULL,
	[Total] [money] NULL,
	[Date] [varchar](20) NULL,
	[CreatedDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUploadedBankStatements]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUploadedBankStatements](
	[Number] [varchar](50) NULL,
	[Date] [varchar](15) NULL,
	[Transaction date] [varchar](15) NULL,
	[Account] [varchar](50) NULL,
	[Amount] [varchar](20) NULL,
	[Subcategory] [varchar](100) NULL,
	[Memo] [varchar](max) NULL,
	[Transaction Type] [varchar](10) NULL,
	[Sort Code] [varchar](10) NULL,
	[Account Number] [varchar](20) NULL,
	[Transaction Description] [varchar](max) NULL,
	[Debit Amount] [varchar](25) NULL,
	[Credit Amount] [varchar](25) NULL,
	[Balance] [varchar](25) NULL,
	[Orgid] [uniqueidentifier] NULL,
	[CreatedDate] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcAddress]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcAddress](
	[Addressid] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [varchar](150) NULL,
	[AddressLine2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[PostCode] [varchar](10) NULL,
	[AddOrgid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Addressid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcDonationDetails]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcDonationDetails](
	[DonationDetailid] [int] IDENTITY(1,1) NOT NULL,
	[DonationHeadid] [int] NULL,
	[Memberid] [int] NULL,
	[DonationMethodid] [tinyint] NULL,
	[Offering] [money] NULL,
	[Tithe] [money] NULL,
	[ThxGiving] [money] NULL,
	[Pledges] [money] NULL,
	[BuildingFund] [money] NULL,
	[Others] [money] NULL,
	[Amount] [money] NULL,
	[CreatedDate] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[DDNoteid] [int] NULL,
	[DataSource] [tinyint] NULL,
	[DigitalDonationCDate] [date] NULL,
	[DDOrgId] [uniqueidentifier] NULL,
	[DigitalDonationDesc] [varchar](max) NULL,
 CONSTRAINT [PK_tcDonationDetails] PRIMARY KEY CLUSTERED 
(
	[DonationDetailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcDonationHead]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcDonationHead](
	[DonationHeadid] [int] IDENTITY(1,1) NOT NULL,
	[Total] [money] NULL,
	[CheckBy] [int] NULL,
	[xCheckBy] [int] NULL,
	[CheckedDate] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[DonHdOrgid] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[DigitalDonationTotal] [money] NULL,
 CONSTRAINT [PK_tcDonationHead] PRIMARY KEY CLUSTERED 
(
	[DonationHeadid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcExpenses]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcExpenses](
	[Expenseid] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseTypeid] [tinyint] NULL,
	[Voucherid] [int] NULL,
	[Amount] [money] NULL,
	[ExpenseDate] [date] NULL,
	[CreatedDate] [datetime] NULL,
	[ExpNoteid] [int] NULL,
	[ExpOrgid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tcExpenses] PRIMARY KEY CLUSTERED 
(
	[Expenseid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcMember]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcMember](
	[Memberid] [int] IDENTITY(1,1) NOT NULL,
	[MemOrgid] [uniqueidentifier] NULL,
	[MemAddressid] [int] NULL,
	[Fname] [varchar](50) NULL,
	[LName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[IsTaxPayer] [bit] NULL,
	[GiftAidConsentReceived] [bit] NULL,
	[Telephone] [varchar](11) NULL,
	[Gender] [varchar](15) NULL,
	[IsActive] [bit] NULL,
	[MembershipExpire] [date] NULL,
	[OrgDonorId] [varchar](30) NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[Memberid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcNotes]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcNotes](
	[Noteid] [int] IDENTITY(1,1) NOT NULL,
	[Body] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[LastupDated] [datetime] NULL,
	[NoteOrgid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tcNotes] PRIMARY KEY CLUSTERED 
(
	[Noteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcOrganisation]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcOrganisation](
	[Orgid] [uniqueidentifier] NOT NULL,
	[OrgName] [varchar](100) NOT NULL,
	[OrgUniqueNo] [varchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Telephone] [varchar](11) NULL,
	[Mobile] [varchar](11) NULL,
	[CreatedDate] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[OrgAbbName] [varchar](11) NULL,
	[OrgIdentity] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Organisation] PRIMARY KEY CLUSTERED 
(
	[Orgid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_Organisation_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_Organisation_OrgName] UNIQUE NONCLUSTERED 
(
	[OrgName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_Organisation_OrgUniqueNo] UNIQUE NONCLUSTERED 
(
	[OrgUniqueNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcUser]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcUser](
	[Userid] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeid] [tinyint] NULL,
	[UserOrgid] [uniqueidentifier] NULL,
	[Fname] [varchar](30) NULL,
	[Lname] [varchar](30) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcVouchers]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcVouchers](
	[Voucherid] [int] IDENTITY(1,1) NOT NULL,
	[VoucherDesc] [varchar](255) NOT NULL,
	[VoucherRaisedBy] [int] NOT NULL,
	[VoucherApprovedby] [int] NULL,
	[VoucherDate] [date] NOT NULL,
	[VchOrgid] [uniqueidentifier] NOT NULL,
	[IsVoucherApproved] [bit] NULL,
	[VoucherApprovedDate] [date] NULL,
 CONSTRAINT [PK_tcVouchers] PRIMARY KEY CLUSTERED 
(
	[Voucherid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trDataSource]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trDataSource](
	[DataSourceid] [tinyint] IDENTITY(1,1) NOT NULL,
	[DataSource] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[DataSourceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trDonationMethod]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trDonationMethod](
	[DonationMethodid] [tinyint] IDENTITY(1,1) NOT NULL,
	[DonationMethod] [varchar](50) NULL,
 CONSTRAINT [PK_DonationMethod] PRIMARY KEY CLUSTERED 
(
	[DonationMethodid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DonationMethod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trDonationType]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trDonationType](
	[DonationTypeid] [tinyint] IDENTITY(1,1) NOT NULL,
	[DonationType] [varchar](50) NULL,
 CONSTRAINT [PK_trDonationType] PRIMARY KEY CLUSTERED 
(
	[DonationTypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DonationType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trExpenseType]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trExpenseType](
	[ExpenseTypeid] [tinyint] IDENTITY(1,1) NOT NULL,
	[ExpenseTypeDesc] [varchar](50) NULL,
 CONSTRAINT [PK_trExpensetype] PRIMARY KEY CLUSTERED 
(
	[ExpenseTypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ExpenseTypeDesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trUserType]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trUserType](
	[UserTypeid] [tinyint] IDENTITY(1,1) NOT NULL,
	[UserTypeDesc] [varchar](30) NULL,
 CONSTRAINT [PK_trUserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_trUserType_UserTypeDesc] UNIQUE NONCLUSTERED 
(
	[UserTypeDesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBulkUploadDonors] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblBulkUploadManualDonations] ADD  DEFAULT (CONVERT([date],getdate())) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblUploadedBankStatements] ADD  DEFAULT (CONVERT([date],getdate())) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tcDonationDetails] ADD  CONSTRAINT [DF_tcDonationDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tcDonationDetails] ADD  CONSTRAINT [DF_DonationDetails_DataSource]  DEFAULT ((1)) FOR [DataSource]
GO
ALTER TABLE [dbo].[tcDonationHead] ADD  CONSTRAINT [DF_DonationHead_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tcExpenses] ADD  CONSTRAINT [DF_tcExpenses_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tcMember] ADD  CONSTRAINT [DF_tcMember_IsTaxPayer]  DEFAULT ((0)) FOR [IsTaxPayer]
GO
ALTER TABLE [dbo].[tcMember] ADD  CONSTRAINT [DF_tcMember_GetGiftAidConsent]  DEFAULT ((0)) FOR [GiftAidConsentReceived]
GO
ALTER TABLE [dbo].[tcMember] ADD  CONSTRAINT [DF_Member_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tcNotes] ADD  DEFAULT (' ') FOR [Body]
GO
ALTER TABLE [dbo].[tcNotes] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tcOrganisation] ADD  CONSTRAINT [DF_Organisation_Orgid]  DEFAULT (newid()) FOR [Orgid]
GO
ALTER TABLE [dbo].[tcOrganisation] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tcVouchers] ADD  CONSTRAINT [DF_Vouchers_IsVoucherApproved]  DEFAULT ((0)) FOR [IsVoucherApproved]
GO
ALTER TABLE [dbo].[tcAddress]  WITH CHECK ADD  CONSTRAINT [FK_Address_AddOrgid] FOREIGN KEY([AddOrgid])
REFERENCES [dbo].[tcOrganisation] ([Orgid])
GO
ALTER TABLE [dbo].[tcAddress] CHECK CONSTRAINT [FK_Address_AddOrgid]
GO
ALTER TABLE [dbo].[tcDonationDetails]  WITH CHECK ADD  CONSTRAINT [FK_DonationDetails_DataSource] FOREIGN KEY([DataSource])
REFERENCES [dbo].[trDataSource] ([DataSourceid])
GO
ALTER TABLE [dbo].[tcDonationDetails] CHECK CONSTRAINT [FK_DonationDetails_DataSource]
GO
ALTER TABLE [dbo].[tcDonationDetails]  WITH CHECK ADD  CONSTRAINT [FK_DonationDetails_DDNoteid] FOREIGN KEY([DDNoteid])
REFERENCES [dbo].[tcNotes] ([Noteid])
GO
ALTER TABLE [dbo].[tcDonationDetails] CHECK CONSTRAINT [FK_DonationDetails_DDNoteid]
GO
ALTER TABLE [dbo].[tcDonationDetails]  WITH CHECK ADD  CONSTRAINT [FK_DonationDetails_DDOrgId] FOREIGN KEY([DDOrgId])
REFERENCES [dbo].[tcOrganisation] ([Orgid])
GO
ALTER TABLE [dbo].[tcDonationDetails] CHECK CONSTRAINT [FK_DonationDetails_DDOrgId]
GO
ALTER TABLE [dbo].[tcDonationDetails]  WITH CHECK ADD  CONSTRAINT [FK_tcDonationDetails_DonationHeadid] FOREIGN KEY([DonationHeadid])
REFERENCES [dbo].[tcDonationHead] ([DonationHeadid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tcDonationDetails] CHECK CONSTRAINT [FK_tcDonationDetails_DonationHeadid]
GO
ALTER TABLE [dbo].[tcDonationDetails]  WITH CHECK ADD  CONSTRAINT [FK_tcDonationDetails_DonationMethodid] FOREIGN KEY([DonationMethodid])
REFERENCES [dbo].[trDonationMethod] ([DonationMethodid])
GO
ALTER TABLE [dbo].[tcDonationDetails] CHECK CONSTRAINT [FK_tcDonationDetails_DonationMethodid]
GO
ALTER TABLE [dbo].[tcDonationDetails]  WITH CHECK ADD  CONSTRAINT [FK_tcDonationDetails_Memberid] FOREIGN KEY([Memberid])
REFERENCES [dbo].[tcMember] ([Memberid])
GO
ALTER TABLE [dbo].[tcDonationDetails] CHECK CONSTRAINT [FK_tcDonationDetails_Memberid]
GO
ALTER TABLE [dbo].[tcDonationHead]  WITH CHECK ADD  CONSTRAINT [FK_DonationHead_DonHdOrgid] FOREIGN KEY([DonHdOrgid])
REFERENCES [dbo].[tcOrganisation] ([Orgid])
GO
ALTER TABLE [dbo].[tcDonationHead] CHECK CONSTRAINT [FK_DonationHead_DonHdOrgid]
GO
ALTER TABLE [dbo].[tcDonationHead]  WITH CHECK ADD  CONSTRAINT [FK_tcDonationHead_CheckBy] FOREIGN KEY([CheckBy])
REFERENCES [dbo].[tcUser] ([Userid])
GO
ALTER TABLE [dbo].[tcDonationHead] CHECK CONSTRAINT [FK_tcDonationHead_CheckBy]
GO
ALTER TABLE [dbo].[tcDonationHead]  WITH CHECK ADD  CONSTRAINT [FK_tcDonationHead_xCheckBy] FOREIGN KEY([xCheckBy])
REFERENCES [dbo].[tcUser] ([Userid])
GO
ALTER TABLE [dbo].[tcDonationHead] CHECK CONSTRAINT [FK_tcDonationHead_xCheckBy]
GO
ALTER TABLE [dbo].[tcExpenses]  WITH CHECK ADD  CONSTRAINT [FK_tcExpenses_ExpenseTypeid] FOREIGN KEY([ExpenseTypeid])
REFERENCES [dbo].[trExpenseType] ([ExpenseTypeid])
GO
ALTER TABLE [dbo].[tcExpenses] CHECK CONSTRAINT [FK_tcExpenses_ExpenseTypeid]
GO
ALTER TABLE [dbo].[tcExpenses]  WITH CHECK ADD  CONSTRAINT [FK_tcExpenses_ExpNoteid] FOREIGN KEY([ExpNoteid])
REFERENCES [dbo].[tcNotes] ([Noteid])
GO
ALTER TABLE [dbo].[tcExpenses] CHECK CONSTRAINT [FK_tcExpenses_ExpNoteid]
GO
ALTER TABLE [dbo].[tcExpenses]  WITH CHECK ADD  CONSTRAINT [FK_tcExpenses_ExpOrgid] FOREIGN KEY([ExpOrgid])
REFERENCES [dbo].[tcOrganisation] ([Orgid])
GO
ALTER TABLE [dbo].[tcExpenses] CHECK CONSTRAINT [FK_tcExpenses_ExpOrgid]
GO
ALTER TABLE [dbo].[tcExpenses]  WITH CHECK ADD  CONSTRAINT [FK_tcExpenses_Voucherid] FOREIGN KEY([Voucherid])
REFERENCES [dbo].[tcVouchers] ([Voucherid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tcExpenses] CHECK CONSTRAINT [FK_tcExpenses_Voucherid]
GO
ALTER TABLE [dbo].[tcMember]  WITH CHECK ADD  CONSTRAINT [FK_tcMember_Addressid] FOREIGN KEY([MemAddressid])
REFERENCES [dbo].[tcAddress] ([Addressid])
GO
ALTER TABLE [dbo].[tcMember] CHECK CONSTRAINT [FK_tcMember_Addressid]
GO
ALTER TABLE [dbo].[tcMember]  WITH CHECK ADD  CONSTRAINT [FK_tcMember_MemOrgid] FOREIGN KEY([MemOrgid])
REFERENCES [dbo].[tcOrganisation] ([Orgid])
GO
ALTER TABLE [dbo].[tcMember] CHECK CONSTRAINT [FK_tcMember_MemOrgid]
GO
ALTER TABLE [dbo].[tcNotes]  WITH CHECK ADD  CONSTRAINT [FK_DonationHead_NoteOrgid] FOREIGN KEY([NoteOrgid])
REFERENCES [dbo].[tcOrganisation] ([Orgid])
GO
ALTER TABLE [dbo].[tcNotes] CHECK CONSTRAINT [FK_DonationHead_NoteOrgid]
GO
ALTER TABLE [dbo].[tcUser]  WITH CHECK ADD  CONSTRAINT [FK_tcMember_UserOrgid] FOREIGN KEY([UserOrgid])
REFERENCES [dbo].[tcOrganisation] ([Orgid])
GO
ALTER TABLE [dbo].[tcUser] CHECK CONSTRAINT [FK_tcMember_UserOrgid]
GO
ALTER TABLE [dbo].[tcUser]  WITH CHECK ADD  CONSTRAINT [FK_tcUser_UserTypeid] FOREIGN KEY([UserTypeid])
REFERENCES [dbo].[trUserType] ([UserTypeid])
GO
ALTER TABLE [dbo].[tcUser] CHECK CONSTRAINT [FK_tcUser_UserTypeid]
GO
ALTER TABLE [dbo].[tcVouchers]  WITH CHECK ADD  CONSTRAINT [FK_DonationHead_VchOrgid] FOREIGN KEY([VchOrgid])
REFERENCES [dbo].[tcOrganisation] ([Orgid])
GO
ALTER TABLE [dbo].[tcVouchers] CHECK CONSTRAINT [FK_DonationHead_VchOrgid]
GO
ALTER TABLE [dbo].[tcVouchers]  WITH CHECK ADD  CONSTRAINT [FK_tcVouchers_VoucherApprovedby] FOREIGN KEY([VoucherApprovedby])
REFERENCES [dbo].[tcUser] ([Userid])
GO
ALTER TABLE [dbo].[tcVouchers] CHECK CONSTRAINT [FK_tcVouchers_VoucherApprovedby]
GO
ALTER TABLE [dbo].[tcVouchers]  WITH CHECK ADD  CONSTRAINT [KF_Vouchers_VoucherRaisedBy] FOREIGN KEY([VoucherRaisedBy])
REFERENCES [dbo].[tcUser] ([Userid])
GO
ALTER TABLE [dbo].[tcVouchers] CHECK CONSTRAINT [KF_Vouchers_VoucherRaisedBy]
GO
/****** Object:  StoredProcedure [dbo].[rptDonationDetails]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[rptDonationDetails]
@DonationHeadid INT

AS

SELECT [DonationDetailid]
      ,[Fname] 
	  ,[LName]
      ,[DonationMethodid]
      ,[Amount]
	  ,[Total]
	  ,[CheckBy]
	  ,[xCheckBy]
  FROM  [dbo].[tcMember] DD
  LEFT JOIN [dbo].[tcDonationDetails] MM ON MM.Memberid = DD.Memberid
  INNER JOIN [dbo].[tcDonationHead] DH ON DH.DonationHeadid = MM.DonationHeadid
WHERE DH.DonationHeadid = @DonationHeadid
  AND IsActive = 1
GO
/****** Object:  StoredProcedure [dbo].[rptGetActiveMembers]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--rptGetActiveMembers 1

CREATE PROC [dbo].[rptGetActiveMembers]

@OrgIdentity int = 1

AS 

 SELECT COUNT(*) TotalActiveMember
  FROM [dbo].[tcMember] MB
  JOIN tcOrganisation ORG ON ORG.Orgid = MB.MemOrgid
  WHERE IsActive = 1
  AND OrgIdentity = @OrgIdentity


	
GO
/****** Object:  StoredProcedure [dbo].[rptGetAnonymousDonorByDate]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--  EXEC rptGetAnonymousDonorByDate 1,'07/07/2023'

CREATE PROC [dbo].[rptGetAnonymousDonorByDate]
@OrgIdentity int = 1
,@transDate VARCHAR(10)

AS 

DECLARE @Date DATE = convert(date, @transDate, 103)

SELECT COUNT(DISTINCT DonationDetailid) AS CountOfAnonymousDonor
FROM   tcDonationDetails DD
LEFT JOIN tcMember mm On mm.Memberid = mm.Memberid
LEFT JOIN tcOrganisation ORG ON ORG.Orgid = MM.MemOrgid
WHERE (dd.Memberid IS NULL) 
 AND CONVERT(Date, DD.CreatedDate) = @Date
 AND (OrgIdentity = @OrgIdentity)
GO
/****** Object:  StoredProcedure [dbo].[rptGetDonationByPaymentType]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--  EXEC rptGetDonationByPaymentType 1,'13/07/2023 00:00:00'

CREATE PROC [dbo].[rptGetDonationByPaymentType]
@OrgIdentity int = 1
,@transDate VARCHAR(10)

AS 


--DECLARE @Date DATE = right(@transDate,4) + '-' + substring(@transDate, 4,2) + '-' + left(@transDate, 2)
DECLARE @Date DATE = convert(date, @transDate, 103)

SELECT IIF(DM.DonationMethod IN ('CASH','Cheque') , 'MANUAL', 'DIGITAL') AS PaymentMethod
       ,Count(ISNULL(dd.Memberid, 0)) AS CountOfDonors
       ,SUM(AMOUNT) AS TotalDonated
FROM [dbo].[tcDonationDetails] DD
LEFT JOIN tcMember MB ON MB.Memberid = DD.Memberid
INNER JOIN tcOrganisation ORG ON ORG.Orgid = Mb.MemOrgid
INNER JOIN [dbo].[trDonationMethod] DM ON DM.DonationMethodid = DD.DonationMethodid

WHERE CONVERT(Date, DD.CreatedDate) = @Date
AND OrgIdentity = @OrgIdentity
GROUP BY DonationMethod


GO
/****** Object:  StoredProcedure [dbo].[rptGetDonationCategoryByYear]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--  EXEC rptGetDonationCategoryByYear 1,'07/07/2023'

CREATE PROC [dbo].[rptGetDonationCategoryByYear]
@OrgIdentity int = 1
,@transDate varchar(10)

AS 

DECLARE @Date DATE = convert(date, @transDate, 103)
--DECLARE @Date DATE = right(@transDate,4) + '-' + substring(@transDate, 4,2) + '-' + left(@transDate, 2)

SELECT [MonthName]
       ,SUM(ISNULL([Offering],0) + 
			ISNULL([Tithe],0) + 
			ISNULL([ThxGiving],0) + 
			ISNULL([Pledges],0) + 
			ISNULL([BuildingFund],0) +
			ISNULL([Others],0)
			)AS TotalByMonth
  FROM (
SELECT CASE MONTH(dd.CreatedDate) 
			WHEN 1 THEN 'Jan'
			WHEN 2 THEN 'Feb'
			WHEN 3 THEN 'Mar'
			WHEN 4 THEN 'Apr'
			WHEN 5 THEN 'May'
			WHEN 6 THEN 'Jun'
			WHEN 7 THEN 'Jul'
			WHEN 8 THEN 'Aug'
			WHEN 9 THEN 'Sep'
			WHEN 10 THEN 'Oct'
			WHEN 11 THEN 'Nov'
			WHEN 12 THEN 'Dec'
			END as [MonthName]
      ,[Offering]
      ,[Tithe]
      ,[ThxGiving]
      ,[Pledges]
      ,[BuildingFund]
      ,[Others]
  FROM [CiSDB].[dbo].[tcDonationDetails] DD
  LEFT JOIN tcDonationHead DH ON DH.DonationHeadid = DD.DonationHeadid
  JOIN tcOrganisation org On org.Orgid = dh.DonHdOrgid
  WHERE YEAR(DD.[CreatedDate]) = YEAR(@Date)
    AND OrgIdentity = @OrgIdentity
	) tab
GROUP BY MonthName


	
GO
/****** Object:  StoredProcedure [dbo].[rptGetDonationYear]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[rptGetDonationYear]

AS 

SELECT DISTINCT
       Year(CreatedDate) as [Year]
  FROM [dbo].[tcDonationDetails] 
GO
/****** Object:  StoredProcedure [dbo].[rptGetTotalDonationByMonth]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--  EXEC rptGetMonthToDateTotal 1,'07/07/2023'

CREATE PROC [dbo].[rptGetTotalDonationByMonth]
@OrgIdentity int = 1
,@transDate varchar(10)

AS 

DECLARE @Date DATE = convert(date, @transDate, 103);

SELECT 
       SUM(ISNULL(Amount,0)) AS MonthTotalDonation
  FROM [CiSDB].[dbo].[tcDonationDetails] DD
  LEFT JOIN tcDonationHead DH ON DH.DonationHeadid = DD.DonationHeadid
  JOIN tcOrganisation org On org.Orgid = dh.DonHdOrgid
  WHERE EoMonth(dd.[CreatedDate]) = EoMonth(@Date)
    AND OrgIdentity = @OrgIdentity

GO
/****** Object:  StoredProcedure [dbo].[rptGetTotalDonationByType]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--  EXEC rptGetTotalDonationByType 1,'07/07/2023'

CREATE PROC [dbo].[rptGetTotalDonationByType]
@OrgIdentity int = 1
,@transDate varchar(10)

AS 

DECLARE @Date DATE = convert(date, @transDate, 103);

WITH cte

AS
(

SELECT 
       [Offering]
      ,[Tithe]
      ,[ThxGiving]
      ,[Pledges]
      ,[BuildingFund]
      ,[Others]
  FROM [CiSDB].[dbo].[tcDonationDetails] DD
  LEFT JOIN tcDonationHead DH ON DH.DonationHeadid = DD.DonationHeadid
  JOIN tcOrganisation org On org.Orgid = dh.DonHdOrgid
  WHERE Convert(date, DD.[CreatedDate]) = @Date
    AND OrgIdentity = @OrgIdentity
	)

SELECT 'Regular Offering' AS DonationType
       ,SUM(ISNULL(Offering,0)) AS TotalDonated
  FROM cte

  UNION ALL

SELECT 'Tithe'
       ,SUM(ISNULL(Tithe,0))
  FROM cte

  UNION ALL

SELECT 'Thanksgiving'
       ,SUM(ISNULL(ThxGiving,0))
  FROM cte

  UNION ALL

SELECT 'Pledges'
       ,SUM(ISNULL(Pledges,0))
  FROM cte

  UNION ALL

SELECT 'BuildingFund'
       ,SUM(ISNULL(BuildingFund,0))
  FROM cte

  UNION ALL

SELECT 'Others'
       ,SUM(ISNULL(Others, 0))
  FROM cte


	
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteDonationHead]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspDeleteDonationHead]
@DonationHeadid int

AS

DELETE [tcDonationHead]
WHERE DonationHeadid = @DonationHeadid
GO
/****** Object:  StoredProcedure [dbo].[uspExtractDDFromBankStatements]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---- uspExtractDDFromBankStatements '6504D4F1-0185-4CF2-9B2E-2DB49876BE89'
CREATE PROC [dbo].[uspExtractDDFromBankStatements]

@Orgid uniqueidentifier = '6504D4F1-0185-4CF2-9B2E-2DB49876BE89'

AS

DROP TABLE IF EXISTS #tblDonationDetail;

--DECLARE @Orgid uniqueidentifier = '6504D4F1-0185-4CF2-9B2E-2DB49876BE89'

;With cte
as(

---- Extract barclay digital donation details
  SELECT [Date] as PaymentDate
        ,LEFT(RTRIM([Account]),8) AS [sCode]
	    ,RIGHT(TRIM([Account]),8) as [AccNumber]
        ,TRY_CONVERT(MONEY, [Amount]) AS DonatedAmount
        ,[Subcategory] as [TransactionType]
        ,[Memo] as TransactionDesc
		,[Orgid]
        ,[CreatedDate]
   FROM [tblUploadedBankStatements]
   WHERE [Date] IS NOT NULL
   AND [Subcategory] IN ('Funds Transfer','Counter Credit')
   AND Orgid = @Orgid

    UNION ALL

---- Extract llyods digital donation details
SELECT [Transaction date]
        ,IIF(LEFT([Sort Code],1) = CHAR(39), REPLACE([Sort Code], CHAR(39), ''),[Sort Code]) AS [Sort Code]
        ,[Account Number]
		,TRY_CONVERT(MONEY, [Credit Amount])
        ,IIF([Transaction Type] = 'FPI', 'Funds Transfer', [Transaction Type]) AS [Transaction Type]
        ,[Transaction Description]
		,[Orgid]
        ,[CreatedDate]
   FROM [tblUploadedBankStatements]
   WHERE [Transaction date] IS NOT NULL
     AND [Credit Amount] IS NOT NULL
	 AND Orgid = @Orgid

),
cte_2
as(

SELECT DonatedAmount
       ,CASE WHEN (TransactionType = 'Counter Credit' OR TransactionType = 'Funds Transfer') THEN 1 END AS DonationMethodid
	   ,TransactionDesc
       ,CASE WHEN TransactionDesc LIKE '%BUILD%' THEN 'Building Fund'
			 WHEN TransactionDesc LIKE '%COINS%' THEN 'Other'
			 WHEN TransactionDesc LIKE '%PLEDGE%' THEN 'Pledges'
			 WHEN (TransactionDesc LIKE '%Offering%' OR TransactionDesc LIKE '%Offe%') THEN 'Regular Offering'
			 WHEN TransactionDesc LIKE '%Thank%' THEN 'Thanksgiving'
			 WHEN TransactionDesc LIKE '%Tithe%' THEN 'Tithe'
			 ELSE 'Regular Offering'
			 END AS DonationTypeid
		,CASE WHEN TransactionDesc LIKE '%ID 1%' THEN 1 
	          WHEN TransactionDesc LIKE '%ID 2%' THEN 2
			  --WHEN TransactionDesc LIKE '%SO + MA EWUL%' THEN 4
			  --WHEN TransactionDesc LIKE '%TA Foyoyin%' THEN 5
			 END AS Memberid 
	   --,PaymentDate
	   ,TRY_CONVERT(DATE, PaymentDate, 103) DonationDate
	   --,DATENAME(DW, TRY_CONVERT(DATE, PaymentDate, 103)) PP
	   ,DATEPART(WEEKDAY, TRY_CONVERT(DATE, PaymentDate, 103)) DonationDay
	   ,[Orgid]
       ,[CreatedDate]
  FROM cte 
),

cte_pivot
AS
(
	SELECT
		Memberid
		,DonationMethodid
		,[Regular Offering],[Tithe],[Thanksgiving],[Pledges],[Building Fund],[Other]
		,Orgid
		,DonationDay
		,DonationDate
		,TransactionDesc
	FROM
	(
	SELECT 
		 DonatedAmount
		 ,DonationMethodid
		 ,Memberid
		 ,DonationDate
		 ,DonationTypeid
		 ,Orgid
		 ,DonationDay
		 ,TransactionDesc
	FROM cte_2
	) AS SourceTable
	PIVOT
	( SUM(DonatedAmount)
	  FOR DonationTypeid IN ([Regular Offering],[Tithe],[Thanksgiving],[Pledges],[Building Fund],[Other])
	) AS PivotTable
)

SELECT Memberid
    ,DonationMethodid
    ,[Regular Offering],[Tithe],[Thanksgiving],[Pledges],[Building Fund],[Other]
	,ISNULL([Regular Offering],0) + ISNULL([Tithe],0) + ISNULL([Thanksgiving],0) + ISNULL([Pledges],0) + ISNULL([Building Fund],0) + ISNULL([Other],0) AS LineTotal     
	,3 AS DataSourceid
    ,Orgid
    ,DonationDate
	,DonationDay
	,TransactionDesc
	,CASE WHEN DonationDay BETWEEN 2 AND 5 THEN DATEADD(D, -(DonationDay-1), DonationDate)  -- Move date back to previous sunday
	      WHEN DonationDay BETWEEN 6 AND 7 THEN DATEADD(D, 8 - DonationDay, DonationDate)  -- Move date back to previous sunday
	   END TargetSunday
	   into #tblDonationDetail
FROM cte_pivot

DECLARE @ID UNIQUEIDENTIFIER
DECLARE @tSunday DATE
DECLARE @Total money
DECLARE @Donationheadid int



DECLARE cur_dd CURSOR FOR (
-- Update donation head 
SELECT Orgid
        ,TargetSunday
        ,SUM(LineTotal) ToTal
FROM #tblDonationDetail
GROUP BY Orgid
        ,TargetSunday
		)

OPEN cur_dd
FETCH NEXT FROM cur_dd INTO @ID, @tSunday, @Total
WHILE @@FETCH_STATUS = 0
BEGIN
	IF EXISTS (SELECT 1 FROM tcDonationHead WHERE [DonHdOrgid] = @ID AND CONVERT(DATE, CreatedDate) = @tSunday)
	BEGIN
       ---- update DigitalDonationTotal value for the respective Sunday
        UPDATE tcDonationHead
		   SET DigitalDonationTotal = @Total
		       ,LastUpdated = GETDATE()
		 WHERE [DonHdOrgid] = @ID 
		   AND CONVERT(DATE, CreatedDate) = @tSunday

	---- Retrieve donation head id
	     SELECT @Donationheadid = DonationHeadid 
		   FROM tcDonationHead 
		  WHERE [DonHdOrgid] = @ID 
		    AND CONVERT(DATE, CreatedDate) = @tSunday

	---- Insert donation details
INSERT [tcDonationDetails]
		 ( [DonationHeadid]
		  ,[Memberid]
		  ,[DonationMethodid]
		  ,[Offering]
		  ,[Tithe]
		  ,[ThxGiving]
		  ,[Pledges]
		  ,[BuildingFund]
		  ,[Others]
		  ,[Amount]
		  ,[CreatedDate]
		  ,[LastUpdated]
		  ,[DataSource]
		  ,[DigitalDonationCDate]
		  ,[DDOrgId]
		  ,DigitalDonationDesc
	  )

	SELECT @Donationheadid
		  ,Memberid
		  ,DonationMethodid
		  ,[Regular Offering]
		  ,[Tithe]
		  ,[Thanksgiving]
		  ,[Pledges]
		  ,[Building Fund]
		  ,[Other]
		  ,LineTotal
		  ,TargetSunday
		  ,GETDATE()
		  ,DataSourceid
		  ,DonationDate
		  ,Orgid
		  ,TransactionDesc
	  FROM #tblDonationDetail DD
	  WHERE Orgid = @ID 
		AND TargetSunday = @tSunday
		AND NOT EXISTS (SELECT 1 FROM tcDonationDetails TDD
		                WHERE DD.LineTotal = ISNULL(TDD.Amount,0)
						  AND DD.DonationDate = TDD.DigitalDonationCDate
						  AND DD.Orgid = TDD.DDOrgId AND TDD.DDOrgId IS NOT NULL
						  AND ISNULL(DD.Memberid,0) = ISNULL(TDD.Memberid,0)
						  )
   END
ELSE
	BEGIN
	INSERT [tcDonationHead]
	     ( [DigitalDonationTotal]
		   ,[CreatedDate]
		   ,[DonHdOrgid]
		 )
   VALUES
	    ( @Total
		 ,@tSunday
		 ,@ID
		)

	---- Get new identity
	SELECT @Donationheadid = SCOPE_IDENTITY()
	  
	  	---- Insert donation details
	INSERT [tcDonationDetails]
		 ( [DonationHeadid]
		  ,[Memberid]
		  ,[DonationMethodid]
		  ,[Offering]
		  ,[Tithe]
		  ,[ThxGiving]
		  ,[Pledges]
		  ,[BuildingFund]
		  ,[Others]
		  ,[Amount]
		  ,[CreatedDate]
		  ,[LastUpdated]
		  ,[DataSource]
		  ,[DigitalDonationCDate]
		  ,[DDOrgId]
		  ,DigitalDonationDesc
	  )

	SELECT @Donationheadid
		  ,Memberid
		  ,DonationMethodid
		  ,[Regular Offering]
		  ,[Tithe]
		  ,[Thanksgiving]
		  ,[Pledges]
		  ,[Building Fund]
		  ,[Other]
		  ,LineTotal
		  ,TargetSunday
		  ,GETDATE()
		  ,DataSourceid
		  ,DonationDate
		  ,Orgid
		  ,TransactionDesc
	  FROM #tblDonationDetail DD
	  WHERE Orgid = @ID 
		AND TargetSunday = @tSunday
		AND NOT EXISTS (SELECT 1 FROM tcDonationDetails TDD
		                WHERE DD.LineTotal = ISNULL(TDD.Amount,0)
						  AND DD.DonationDate = TDD.DigitalDonationCDate
						  AND DD.Orgid = TDD.DDOrgId AND TDD.DDOrgId IS NOT NULL
						  AND ISNULL(DD.Memberid,0) = ISNULL(TDD.Memberid,0)
						  )
	  END

FETCH NEXT FROM cur_dd INTO @ID, @tSunday, @Total
END
DEALLOCATE cur_dd
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateUploadTemplate]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspGenerateUploadTemplate]

AS

SELECT [ID]
      ,[First Name]
      ,[Last Name]
      ,[Offering]
      ,[Tithe]
      ,[Thanks Giving]
      ,[Pledges]
      ,[Building Fund]
      ,[Others]
      ,[Total]
      ,[Date]
  FROM [tblUploadedInhouseStatement]
  WHERE 0 = 1


GO
/****** Object:  StoredProcedure [dbo].[uspGetAddress]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetAddress]
@Orgid uniqueidentifier

AS

SELECT [Addressid]
      ,[AddressLine1]
      ,[AddressLine2]
      ,[City]
      ,[PostCode]
 FROM [CiSDB].[dbo].[tcAddress]
WHERE AddOrgid = @Orgid
GO
/****** Object:  StoredProcedure [dbo].[uspGetDonationDetails]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetDonationDetails]
@Memberid INT = 1
,@cDate varchar(10) = '19/06/2023'

AS


SELECT [DonationDetailid]
      --,[DonationTypeid]
      ,[DonationMethodid]
	  ,Memberid
      ,[Amount]
      ,[CreatedDate]
      --,[Createdby]
      ,[LastUpdated]
      --,[Updatedby]
  FROM [CiSDB].[dbo].[tcDonationDetails]
WHERE Memberid = @Memberid
  AND CONVERT(DATE, CreatedDate) = CONVERT(DATE, @cDate, 103)
GO
/****** Object:  StoredProcedure [dbo].[uspGetDonationHead]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetDonationHead]
@Orgid uniqueidentifier = '6504D4F1-0185-4CF2-9B2E-2DB49876BE89'
,@cDate date = NULL


AS

SELECT [DonationHeadid]
      ,[Total]
      ,[CheckBy]
      ,[xCheckBy]
      ,[CheckedDate]
      ,[LastUpdated]
FROM  tcDonationHead
WHERE DonHdOrgid = @Orgid
AND (CONVERT(DATE, CreatedDate) = @cDate OR @cDate IS NULL)
GO
/****** Object:  StoredProcedure [dbo].[uspGetDonationMethod]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetDonationMethod]

as 

SELECT [DonationMethodid]
      ,[DonationMethod]
  FROM [CiSDB].[dbo].[trDonationMethod]
GO
/****** Object:  StoredProcedure [dbo].[uspGetDonationType]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetDonationType]

as 

SELECT  [DonationTypeid]
      ,[DonationType]
  FROM [CiSDB].[dbo].[trDonationType]
GO
/****** Object:  StoredProcedure [dbo].[uspGetExpenseType]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetExpenseType]

as 

SELECT  [ExpenseTypeid]
      ,[ExpenseTypeDesc]
  FROM [CiSDB].[dbo].[trExpenseType]
GO
/****** Object:  StoredProcedure [dbo].[uspGetMember]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetMember]
@Orgid UNIQUEIDENTIFIER = '34DB231B-DC83-40FF-B455-7BA7BF25B725'

AS

SELECT [Memberid]
      ,[Fname]
      ,[LName]
	  ,Addressid
	  ,ad.AddressLine1
	  ,ad.AddressLine2
	  ,ad.City
	  ,ad.PostCode
	  ,Telephone
	  ,Gender
      ,[Email]
	  ,IsActive
	  ,MembershipExpire
      ,[IsTaxPayer]
      ,[GiftAidConsentReceived]
 FROM [CiSDB].[dbo].[tcMember] mb
 LEFT JOIN tcAddress ad ON mb.MemAddressid = ad.Addressid
  WHERE MemOrgid = @Orgid
  AND IsActive = 1
GO
/****** Object:  StoredProcedure [dbo].[uspGetOrganisation]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetOrganisation]
@Orgid uniqueidentifier = '34DB231B-DC83-40FF-B455-7BA7BF25B725'

AS

SELECT 
	 [Orgid], 
	 NULLIF([OrgName], ' ') as [OrgName], 
	 NULLIF([OrgUniqueNo],' ') AS [OrgUniqueNo],
	 [OrgAbbName],
	 [Email], 
	 [Telephone], 
	 [Mobile],
	 userid,
	 tcUser.Fname,
	 tcUser.Lname,
	 tcUser.UserTypeid,
	 Addressid,
	 ad.AddressLine1,
	 ad.AddressLine2,
	 ad.City,
	 ad.PostCode
FROM [dbo].[tcOrganisation] org
LEFT JOIN tcUser ON org.Orgid = tcUser.UserOrgid
LEFT JOIN tcAddress ad ON ad.AddOrgid = org.Orgid
WHERE Orgid = @Orgid
--AND tcUser.UserTypeid = 1
GO
/****** Object:  StoredProcedure [dbo].[uspGetUsers]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspGetUsers]

@orgid UNIQUEIDENTIFIER = '6504D4F1-0185-4CF2-9B2E-2DB49876BE89'

AS

SELECT [Userid]
      ,UserTypeid
      ,[Fname]
      ,[Lname]
	  ,Concat([Fname], ' ',[Lname]) FullName 
  FROM [CiSDB].[dbo].[tcUser]
  WHERE UserOrgid = @orgid


GO
/****** Object:  StoredProcedure [dbo].[uspGetUserType]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspGetUserType]


AS

SELECT [UserTypeid]
      ,[UserTypeDesc]
  FROM [CiSDB].[dbo].[trUserType]
GO
/****** Object:  StoredProcedure [dbo].[uspGetVouchers]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetVouchers]
@Orgid UNIQUEIDENTIFIER

AS

SELECT [Voucherid]
      ,[VoucherDesc]
	  ,[VoucherRaisedBy]
	  ,[IsVoucherApproved]
      ,[VoucherApprovedby]
      ,[VoucherDate]
	  ,VoucherApprovedDate
	  ,VchOrgid
 FROM [CiSDB].[dbo].[tcVouchers]
 WHERE VchOrgid = @Orgid
GO
/****** Object:  StoredProcedure [dbo].[uspInsertAddress]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertAddress]

 @AddressLine1 varchar(150)
,@AddressLine2 varchar(100)
,@City varchar(50)
,@PostCode varchar(10)
,@AddOrgid uniqueidentifier
,@Addressid int out


AS

-- Store the new address
INSERT [dbo].[tcAddress]
    ([AddressLine1]
    ,[AddressLine2]
    ,[City]
    ,[PostCode]
    ,[AddOrgid]
	)

VALUES
    ( @AddressLine1 
	 ,@AddressLine2  
	 ,@City
	 ,@PostCode
	 ,@AddOrgid
	 )

-- Return the new address id.
SELECT @Addressid = SCOPE_IDENTITY();
GO
/****** Object:  StoredProcedure [dbo].[uspInsertBaseOrganisation]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  --  uspInsertBaseOrganisation'admin@rccgpowerhouse.org.uk'

CREATE PROC [dbo].[uspInsertBaseOrganisation]

@Email varchar(50)

AS

DECLARE @Orgid uniqueidentifier

-- Check if this church exists in the database.
IF Exists (SELECT 1 
			 FROM tcOrganisation 
			 WHERE Email = @Email)
BEGIN
	PRINT ('An account for this church is already registered in the database.')
END
ELSE
	BEGIN
		DECLARE @tblOrg table
		(id uniqueidentifier)


INSERT dbo.tcOrganisation 
    (
	  OrgName, 
	  OrgUniqueNo, 
	  Email
    )

OUTPUT INSERTED.Orgid into @tblOrg

VALUES(
       ' '
	  ,' '
	  ,@Email
	  )
	END

-- Return the newly generated id
--SELECT ID FROM @tblOrg

GO
/****** Object:  StoredProcedure [dbo].[uspInsertDonationDetails]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspInsertDonationDetails]

@DonationHeadid int
,@Memberid int
,@DonationMethodid tinyint
,@Fname VARCHAR(75) = null
,@Lname VARCHAR(75) = null
,@Offering money
,@Tithe money
,@ThxGiving money
,@Pledges money
,@BuildingFund money
,@Others money
,@Total money
,@Remark VARCHAR(MAX) = null
,@orgid uniqueidentifier
,@DataSource tinyint = 1
,@DonationDetailid INT

AS

DECLARE @CreatedDate datetime = CONVERT(DATE, GETDATE())
DECLARE @Noteid int;

SET @Total = ISNULL(@Offering,0) + ISNULL(@Tithe,0) + ISNULL(@ThxGiving,0) + ISNULL(@Pledges,0) + ISNULL(@BuildingFund,0) + ISNULL(@Others,0)

--- insert remark if it is not empty
IF (@Remark is not null)
	BEGIN
		EXEC [dbo].[uspInsertNote] @Remark, @Orgid, @Noteid out
	END

--- Check if initial total for the transaction has been ingested
IF EXISTS (SELECT * FROM tcDonationHead 
            WHERE DonHdOrgid = @Orgid 
		     AND CONVERT(date, [LastUpdated]) = @CreatedDate)

 BEGIN

---- Retrieve donation head id for this donation details
	SELECT @DonationHeadid = DonationHeadid
	FROM tcDonationHead 
    WHERE DonHdOrgid = @Orgid 
	AND CONVERT(date, [LastUpdated]) = @CreatedDate

---- Update total donation for this current donation
	UPDATE tcDonationHead
	   SET [Total] = ISNULL([Total],0) + @Total
	       ,LastUpdated = GETDATE()
	 WHERE DonationHeadid = @DonationHeadid


INSERT INTO [dbo].[tcDonationDetails]
           ([DonationHeadid]
           ,[Memberid]
           ,[DonationMethodid]
           ,[Offering]
           ,[Tithe]
           ,[ThxGiving]
           ,[Pledges]
           ,[BuildingFund]
           ,[Others]
           ,[Amount]
           ,[CreatedDate]
           ,[LastUpdated]
		   ,DDNoteid
		   ,DataSource
		   )
     VALUES
           (@DonationHeadid
			,@Memberid
			,@DonationMethodid
			,@Offering
			,@Tithe
			,@ThxGiving
			,@Pledges
			,@BuildingFund
			,@Others
			,@Total
			,GETDATE()
			,GETDATE()
			,@Noteid
			,@DataSource
	       )
END
ELSE
  IF (@Total > 0)
  BEGIN
	---- Create the donation head for this donation period
	EXEC uspInsertDonationHead @Total, @Orgid,NULL ,NULL, @DonationHeadid OUT

	---- Create doation details for each member for this current donation period
  INSERT INTO [dbo].[tcDonationDetails]
           ([DonationHeadid]
           ,[Memberid]
           ,[DonationMethodid]
           ,[Offering]
           ,[Tithe]
           ,[ThxGiving]
           ,[Pledges]
           ,[BuildingFund]
           ,[Others]
           ,[Amount]
           ,[CreatedDate]
           ,[LastUpdated]
		   ,DDNoteid
		   ,DataSource
		   )
     VALUES
           (@DonationHeadid
			,@Memberid
			,@DonationMethodid
			,@Offering
			,@Tithe
			,@ThxGiving
			,@Pledges
			,@BuildingFund
			,@Others
			,@Total
			,GETDATE()
			,GETDATE()
			,@Noteid
			,@DataSource
	       )
END




GO
/****** Object:  StoredProcedure [dbo].[uspInsertDonationHead]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertDonationHead]

 @Total MONEY
,@DonHdOrgid uniqueidentifier
,@CheckBy INT
,@xCheckBy INT
,@DonationHeadid int out


AS

INSERT [dbo].[tcDonationHead]
      ([Total]
	  ,CheckBy
	  ,xCheckBy
	  ,LastUpdated
	  ,DonHdOrgid
	)

VALUES
    ( @Total
	 ,@CheckBy
	  ,@xCheckBy
	  ,GETDATE()
	  ,@DonHdOrgid 
	 )

-- Return the new Donation Head id.
SELECT @DonationHeadid = SCOPE_IDENTITY();
GO
/****** Object:  StoredProcedure [dbo].[uspInsertErrorDetails]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertErrorDetails]
@PackageName varchar(10)
,@ProjectName varchar(10)
,@Description varchar(max)


AS 

INSERT ErrorDetails
(PackageName
,ProjectName
,[Description]
,CreatedDate
)

VALUES
(@PackageName 
,@ProjectName 
,@Description 
,GETDATE()
)
GO
/****** Object:  StoredProcedure [dbo].[uspInsertMenber]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertMenber]

@Fname varchar(50)
,@LName varchar(50)
,@AddressLine1 varchar(150) = ' '
,@AddressLine2 varchar(100) = ' '
,@City varchar(50) = ' '
,@PostCode varchar(10) = ' '
,@Telephone varchar(11)
,@Gender varchar(15)
,@Email varchar(50)
,@IsActive bit
,@MembershipExpire date
,@IsTaxPayer bit
,@GiftAidConsentReceived bit NULL
,@Orgid UNIQUEIDENTIFIER
,@Memberid int out
,@Donorid varchar(30) = null


AS

DECLARE @Addressid int;

-- Check id address exists
IF EXISTS (SELECT 1 
           FROM tcAddress
		   WHERE ISNULL(AddressLine1, ' ') = ISNULL(@AddressLine1, ' ')
		     AND ISNULL(AddressLine2, ' ') = ISNULL(@AddressLine2, ' ')
			 AND ISNULL(City, ' ') = ISNULL(@City, ' ')
			 AND ISNULL(PostCode, ' ') = ISNULL(@PostCode, ' ')
			 AND [AddOrgid] = @Orgid
			 )
BEGIN
        SELECT @Addressid = Addressid
           FROM tcAddress
		   WHERE ISNULL(AddressLine1, ' ') = ISNULL(@AddressLine1, ' ')
		     AND ISNULL(AddressLine2, ' ') = ISNULL(@AddressLine2, ' ')
			 AND ISNULL(City, ' ') = ISNULL(@City, ' ')
			 AND ISNULL(PostCode, ' ') = ISNULL(@PostCode, ' ')
			 AND AddOrgid = @Orgid
	END

ELSE
  IF (NULLIF(@PostCode, ' ') IS NOT NULL)
		BEGIN
			EXEC uspInsertAddress @AddressLine1, @AddressLine2, @City, @PostCode, @Orgid, @Addressid OUT

		
--- Store new member personal deatil
INSERT INTO [dbo].[tcMember]
           ([MemOrgid]
           ,[MemAddressid]
           ,[Fname]
           ,[LName]
		   ,Telephone
		   ,Gender
           ,[Email]
		   ,IsActive
		   ,MembershipExpire
           ,[IsTaxPayer]
           ,[GiftAidConsentReceived]
		  )
     VALUES
           (@Orgid
			,@Addressid
			,@Fname
			,@LName
			,@Telephone
			,@Gender
			,@Email
			,@IsActive
		    ,@MembershipExpire
			,@IsTaxPayer
			,@GiftAidConsentReceived
			)

--- Return new mamber id
SELECT @Memberid = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[uspInsertNote]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[uspInsertNote]
@Body varchar(max)
,@NoteOrgid Uniqueidentifier
,@Noteid int out

as

Insert tcNotes
    ([Body]
	,[CreatedDate]
	,[NoteOrgid]
	)

VALUES(@Body, GETDATE(), @NoteOrgid)

SELECT @Noteid = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[uspInsertOrganisation]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertOrganisation]

@OrgName varchar(100)
,@OrgUniqueNo varchar(30)
,@Email varchar(50)
,@Telephone varchar(11)
,@Mobile varchar(11)
,@Fname varchar(50) = NULL
,@Lname varchar(50) = NULL
,@UserTypeid tinyint
,@AddressLine1 varchar(75)
,@AddressLine2 varchar(75)
,@City varchar(30)
,@PostCode varchar(15)
,@Orgid uniqueidentifier out
,@OrgAbbName varchar(11)

AS

-- Check if this church exists in the database.
IF Exists (SELECT 1 
			 FROM tcOrganisation 
			 WHERE OrgName = @OrgName
			   AND OrgUniqueNo = @OrgUniqueNo
			   AND Email = @Email)
BEGIN
	PRINT ('An account for this church is already registered in the database.')
END
ELSE
	BEGIN
		DECLARE @tblOrg table
		(id uniqueidentifier)


INSERT dbo.tcOrganisation 
    (
	  OrgName, 
	  OrgUniqueNo, 
	  Email, 
	  Telephone, 
	  Mobile,
	  OrgAbbName
    )

OUTPUT INSERTED.Orgid into @tblOrg

VALUES(
       @OrgName
	  ,@OrgUniqueNo
	  ,@Email
	  ,@Telephone
	  ,@Mobile
	  ,@OrgAbbName
	  )
	END

-- Return the newly generated id
SELECT @Orgid = ID FROM @tblOrg

DECLARE @Userid INT
DECLARE @addressid INT

-- Add users into the database
EXEC uspInsertUser @UserTypeid, @Orgid, @Fname, @Lname, @Userid OUT

-- Add new address
EXEC uspInsertAddress @AddressLine1, @AddressLine2, @City, @PostCode, @Orgid, @addressid
GO
/****** Object:  StoredProcedure [dbo].[uspInsertUser]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertUser]

@UserTypeid tinyint
,@UserOrgid UNIQUEIDENTIFIER
,@Fname varchar(50)
,@Lname varchar(50)
,@Userid int out


AS

INSERT [dbo].[tcUser]
       (
	    UserTypeid
	    ,UserOrgid
        ,[Fname]
        ,[Lname]
	   )

VALUES
      (
	   @UserTypeid
       ,@UserOrgid
       ,@Fname
       ,@Lname
      )

SELECT @Userid = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[uspInsertVoucher]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertVoucher]

@VoucherDesc varchar(255)
,@VoucherRaisedby int
,@VoucherApprovedby int
,@VoucherDate date
,@VoucherApprovedDate date
,@IsVoucherApproved bit = 0
,@VchOrgid UNIQUEIDENTIFIER
,@Voucherid int out


AS

INSERT INTO [dbo].[tcVouchers]
           ([VoucherDesc]
           ,[VoucherRaisedBy]
           ,[VoucherApprovedby]
           ,[VoucherDate]
		   ,VoucherApprovedDate
           ,[VchOrgid]
           ,[IsVoucherApproved])

     VALUES
           (@VoucherDesc
           ,@VoucherRaisedBy
           ,@VoucherApprovedby
           ,@VoucherDate
		   ,@VoucherApprovedDate
           ,@VchOrgid
           ,@IsVoucherApproved
          )

SELECT @Voucherid = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[uspPrepareDonationsForm]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspPrepareDonationsForm]
 @orgid uniqueidentifier = '6504D4F1-0185-4CF2-9B2E-2DB49876BE89'
,@Action bit = 0
,@cDate datetime = '2023-07-07'

AS

--- Remove unused row from the previous transaction
DELETE tcDonationDetails
WHERE NULLIF(Amount, 0) IS NULL
  AND Convert(date, CreatedDate) < Convert(date, @cDate)



---- Check if new donation datasets have been prepared
IF @Action = 1
   AND ( 
       NOT EXISTS (
       SELECT 1 
	   FROM tcMember mb
	   LEFT JOIN tcDonationDetails DD ON DD.Memberid = MB.Memberid
	   WHERE MB.MemOrgid = @Orgid
	   AND Convert(date, dd.CreatedDate) = Convert(date, @cDate)
	   AND IsActive = 1)
	OR EXISTS (
	   SELECT 1
	   FROM tcMember
	   WHERE MemOrgid = @Orgid
	   AND IsActive = 1
	   AND Memberid NOT IN (
							SELECT DD.Memberid 
							FROM tcDonationDetails DD
	                        JOIN tcMember MB  ON DD.Memberid = MB.Memberid
	                        WHERE MB.MemOrgid = @Orgid
						   ))
	)
	  

BEGIN
	INSERT tcDonationDetails
	     ( [Memberid]
           ,CreatedDate
	     )
	SELECT Memberid
	       ,GETDATE()
	  FROM tcMember
	 WHERE MemOrgid = @Orgid
	   AND IsActive = 1
  END


SELECT [DonationDetailid]
      ,dd.[DonationHeadid]
      ,DD.[Memberid]
	  ,[Fname]
      ,[LName]
      ,[DonationMethodid]
      ,[Offering]
      ,[Tithe]
      ,[ThxGiving]
      ,[Pledges]
      ,[BuildingFund]
      ,[Others]
      ,[Amount]
      ,CONVERT(VARCHAR(MAX), null) AS Remark
 FROM [CiSDB].[dbo].[tcDonationDetails] DD
 LEFT JOIN tcMember mb ON MB.Memberid = DD.Memberid
 WHERE Convert(date, dd.CreatedDate) = Convert(date, @cDate)
 AND mb.MemOrgid = @orgid

 UNION ALL

 SELECT [DonationDetailid]
      ,dd.[DonationHeadid]
      ,DD.[Memberid]
	  ,NULL
      ,NULL
      ,[DonationMethodid]
      ,[Offering]
      ,[Tithe]
      ,[ThxGiving]
      ,[Pledges]
      ,[BuildingFund]
      ,[Others]
      ,[Amount]
      ,CONVERT(VARCHAR(MAX), null) AS Remark
 FROM [CiSDB].[dbo].[tcDonationDetails] DD
 JOIN tcDonationHead DH ON DH.DonationHeadid = DD.DonationHeadid
 WHERE Convert(date, dd.CreatedDate) = Convert(date, @cDate)
 AND DH.DonHdOrgid = @orgid
 AND Memberid IS NULL


GO
/****** Object:  StoredProcedure [dbo].[uspProcessUploadedDonors]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspProcessUploadedDonors]

as

DECLARE @OrgId uniqueidentifier 
DECLARE @Firstame varchar(72)
DECLARE @LastName varchar(72)
DECLARE @AddressLine1 varchar(150) 
DECLARE @AddressLine2 varchar(150) 
DECLARE @City varchar(50)
DECLARE @PostCode varchar(10)
DECLARE @Telephone varchar(11)
DECLARE @Gender varchar(15)
DECLARE @Email varchar(50)
DECLARE @IsActive bit 
DECLARE @MembershipExpire DATE
DECLARE @IsTaxPayer bit
DECLARE @GiftAidConsentReceived bit
DECLARE @Memberid int
DECLARE @Donorid varchar(30) = null
DECLARE @Min int
DECLARE @Max int

IF EXISTS (SELECT 1 FROM tblBulkUploadDonors)
BEGIN
	SET @MIN = (SELECT MIN(ID) FROM tblBulkUploadDonors);
	SET @Max = (SELECT Max(ID) FROM tblBulkUploadDonors);

    WHILE @Min <= @max
		BEGIN
			SELECT @OrgId = [OrgId]
		           ,@Firstame = [First Name]
		           ,@LastName = [Last Name]
		           ,@AddressLine1 = [AddressLine1]
		           ,@AddressLine2 = [AddressLine2]
		           ,@City = [City]
		           ,@PostCode = [PostCode]
		           ,@Telephone = [Telephone]
		           ,@Gender = [Gender]
		           ,@Email = [Email]
		           ,@IsActive = 1
		           ,@MembershipExpire = null
		           ,@IsTaxPayer = IIF([IsTaxPayer] = 'YES', 1,0)
		           ,@GiftAidConsentReceived = IIF([GiftAidConsentReceived] = 'YES', 1,0)
				   ,@Donorid = [Donor ID]
	          FROM [dbo].[tblBulkUploadDonors]
			  WHERE ID = @Min

			  EXEC uspInsertMenber
		            @Firstame
				   ,@LastName
		           ,@AddressLine1
		           ,@AddressLine2
		           ,@City
		           ,@PostCode
		           ,@Telephone
		           ,@Gender
		           ,@Email
		           ,@IsActive
		           ,@MembershipExpire
		           ,@IsTaxPayer
		           ,@GiftAidConsentReceived
				   ,@OrgId
				   ,@Memberid
				   ,@Donorid
			  SET @Min += 1
		  END
END

GO
/****** Object:  StoredProcedure [dbo].[uspProcessUploadedManualDonations]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspProcessUploadedManualDonations]

AS

DECLARE @ID UNIQUEIDENTIFIER
,@tSunday DATE
,@Total MONEY
,@Donationheadid INT


--- Upfdate date to database date
UPDATE tblBulkUploadManualDonations
   SET [Date] = TRY_CONVERT(DATE, [Date], 103);

DECLARE cur_dd CURSOR FOR 
   (
	SELECT Orgid
		  ,[DATE]        
		  ,SUM(ISNULL(TRY_CONVERT(MONEY, Total),0)) ToTal
	 FROM tblBulkUploadManualDonations
 GROUP BY Orgid
		  ,[Date]
	)

OPEN cur_dd
FETCH NEXT FROM cur_dd INTO  @ID, @tSunday, @Total
WHILE @@FETCH_STATUS = 0
BEGIN
	IF EXISTS (SELECT 1 
	             FROM tcDonationHead 
	            WHERE [DonHdOrgid] = @ID 
				  AND CONVERT(DATE, CreatedDate) = @tSunday)
	BEGIN
	     ---Update existing total
		 UPDATE tcDonationHead 
		    SET Total = Total + @Total
		  WHERE [DonHdOrgid] = @ID 
		    AND CONVERT(DATE, CreatedDate) = @tSunday

	---- Retrieve donation head id
	     SELECT @Donationheadid = DonationHeadid 
		   FROM tcDonationHead 
		  WHERE [DonHdOrgid] = @ID 
		    AND CONVERT(DATE, CreatedDate) = @tSunday

	---- Insert into donation details
	INSERT [tcDonationDetails]
		 ( [DonationHeadid]
		  ,[Memberid]
		  ,[DonationMethodid]
		  ,[Offering]
		  ,[Tithe]
		  ,[ThxGiving]
		  ,[Pledges]
		  ,[BuildingFund]
		  ,[Others]
		  ,[Amount]
		  ,[CreatedDate]
		  ,[LastUpdated]
		  ,[DataSource]
		  ,[DDOrgId]
	  )

	 SELECT @Donationheadid
            ,Memberid
			,2
            ,[Offering]
            ,[Tithe]
            ,[Thanks Giving]
            ,[Pledges]
            ,[Building Fund]
            ,[Others]
            ,[Total]
            ,[Date]
			,GETDATE()
			,2
			,OrgId
      FROM [tblBulkUploadManualDonations] DD
	  LEFT JOIN tcMember MM ON MemOrgid = @ID AND MM.OrgDonorId = DD.ID
	  WHERE Orgid = @ID 
		AND dd.[Date] = @tSunday
		AND NOT EXISTS (SELECT 1 FROM tcDonationDetails TDD
		                WHERE DD.Total = ISNULL(TDD.Amount,0)
						  AND DD.[Date] = CONVERT(DATE, TDD.CreatedDate)
						  AND DD.Orgid = TDD.DDOrgId
						  AND ISNULL(MM.Memberid,0) = ISNULL(TDD.Memberid,0)
						  )
   END
ELSE
 BEGIN
	INSERT [tcDonationHead]
	     ( [Total]
		   ,[CreatedDate]
		   ,[DonHdOrgid]
		 )
   VALUES
	      ( @Total
		   ,@tSunday
		   ,@ID
		)

	---- Get new identity
	SELECT @Donationheadid = SCOPE_IDENTITY()
	  
	  	---- Insert donation details
    INSERT [tcDonationDetails]
		 ( [DonationHeadid]
		  ,[Memberid]
		  ,[DonationMethodid]
		  ,[Offering]
		  ,[Tithe]
		  ,[ThxGiving]
		  ,[Pledges]
		  ,[BuildingFund]
		  ,[Others]
		  ,[Amount]
		  ,[CreatedDate]
		  ,[LastUpdated]
		  ,[DataSource]
		  ,[DDOrgId]
	    )

	 SELECT @Donationheadid
            ,Memberid
			,2
            ,[Offering]
            ,[Tithe]
            ,[Thanks Giving]
            ,[Pledges]
            ,[Building Fund]
            ,[Others]
            ,[Total]
            ,[Date]
			,GETDATE()
			,2
			,OrgId
      FROM [tblBulkUploadManualDonations] DD
	  LEFT JOIN tcMember MM ON MemOrgid =  @ID AND MM.OrgDonorId = DD.ID
	  WHERE Orgid = @ID 
		AND dd.[Date] = @tSunday
		AND NOT EXISTS (SELECT 1 FROM tcDonationDetails TDD
		                WHERE DD.Total = ISNULL(TDD.Amount,0)
						  AND DD.[Date] = CONVERT(DATE, TDD.CreatedDate)
						  AND DD.Orgid = TDD.DDOrgId
						  AND ISNULL(MM.Memberid,0) = ISNULL(TDD.Memberid,0)
						  )

   END
   FETCH NEXT FROM cur_dd INTO @ID, @tSunday, @Total
END
DEALLOCATE cur_dd



GO
/****** Object:  StoredProcedure [dbo].[uspUpdateAddress]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC uspUpdateAddress 'Redcatch Road Knowle',NULL,'Bristol','BS4 2EP',1
CREATE PROC [dbo].[uspUpdateAddress]

 @AddressLine1 varchar(150)
,@AddressLine2 varchar(100)
,@City varchar(50)
,@PostCode varchar(10)
,@Addressid int


AS

-- Store the new address
UPDATE [dbo].[tcAddress]
   SET [AddressLine1] = @AddressLine1
      ,[AddressLine2] = @AddressLine2
      ,[City]		  = @City
      ,[PostCode]	  = @PostCode
WHERE Addressid = @Addressid
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateDonationDetails]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspUpdateDonationDetails]

@DonationHeadid int
,@Memberid int
,@DonationMethodid tinyint
,@Fname VARCHAR(75)
,@Lname VARCHAR(75)
,@Offering money
,@Tithe money
,@ThxGiving money
,@Pledges money
,@BuildingFund money
,@Others money
,@Total money
,@Remark VARCHAR(MAX)
,@orgid uniqueidentifier
,@DonationDetailid INT

AS

DECLARE @CreatedDate datetime = CONVERT(DATE, GETDATE())
DECLARE @Noteid int;

SET @Total = ISNULL(@Offering,0) + ISNULL(@Tithe,0) + ISNULL(@ThxGiving,0) + ISNULL(@Pledges,0) + ISNULL(@BuildingFund,0) + ISNULL(@Others,0)

--- insert remark if it is not empty
IF (NULLIF(@Remark,' ') IS NOT NULL)
	BEGIN
	    IF NOT EXISTS (SELECT Body 
		                 FROM tcNotes 
		                WHERE ISNULL(Body,' ') <> @Remark
					  ) 
		EXEC [dbo].[uspInsertNote] @Remark, @Orgid, @Noteid out
	END
	ELSE
	  BEGIN
	       SELECT @Noteid = Noteid 
		     FROM tcNotes 
			WHERE ISNULL(Body,' ') = @Remark
	    END


--- Check if initial total for the transaction has been ingested
IF EXISTS (SELECT * FROM tcDonationHead 
            WHERE DonHdOrgid = @Orgid 
		     AND CONVERT(date, [LastUpdated]) = @CreatedDate)

 BEGIN

---- Retrieve donation head id for this donation details
	SELECT @DonationHeadid = DonationHeadid
	FROM tcDonationHead 
    WHERE DonHdOrgid = @Orgid 
	AND CONVERT(date, [LastUpdated]) = @CreatedDate

---- Update total donation for this current donation
	UPDATE tcDonationHead
	   SET [Total] = ISNULL([Total],0) + @Total
	       ,LastUpdated = GETDATE()
	 WHERE DonationHeadid = @DonationHeadid

UPDATE [dbo].[tcDonationDetails]
   SET [DonationMethodid] = @DonationMethodid
       ,DonationHeadid = @DonationHeadid
       ,Offering = @Offering
	   ,Tithe = @Tithe
	   ,ThxGiving = @ThxGiving
	   ,Pledges = @Pledges
       ,BuildingFund = @BuildingFund
       ,Others = @Others
      ,[Amount] = @Total
      ,[LastUpdated] = GETDATE()
	  ,[DDNoteid] = @Noteid
WHERE DonationDetailid = @DonationDetailid
END
ELSE
---- Create the donation head for this donation period
	EXEC uspInsertDonationHead @Total, @Orgid,NULL ,NULL, @DonationHeadid OUT

  UPDATE [dbo].[tcDonationDetails]
   SET [DonationMethodid] = @DonationMethodid
       ,DonationHeadid = @DonationHeadid
       ,Offering = @Offering
	   ,Tithe = @Tithe
	   ,ThxGiving = @ThxGiving
	   ,Pledges = @Pledges
       ,BuildingFund = @BuildingFund
       ,Others = @Others
       ,[Amount] = @Total
       ,[LastUpdated] = GETDATE()
	   ,[DDNoteid] = @Noteid
 WHERE DonationDetailid = @DonationDetailid
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateDonationHead]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspUpdateDonationHead]

 @Total MONEY
,@CheckBy INT
,@XCheckBy INT
,@CheckedDate datetime
,@DonHdOrgid uniqueidentifier
,@DonationHeadid int 

AS

UPDATE [dbo].[tcDonationHead]
   SET [Total] = @Total
      ,[CheckBy] = @CheckBy
      ,[xCheckBy] = @XCheckBy
      ,[CheckedDate] = @CheckedDate
	  ,LastUpdated = GETDATE()
WHERE DonationHeadid = @DonationHeadid
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateMember]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspUpdateMember]

@Fname varchar(50)
,@LName varchar(50)
,@Addressid int
,@AddressLine1 varchar(150) = ' '
,@AddressLine2 varchar(100)
,@City varchar(50)
,@PostCode varchar(10)
,@Telephone varchar(11)
,@Gender varchar(15)
,@Email varchar(50)
,@IsActive bit
,@MembershipExpire date
,@IsTaxPayer bit
,@GiftAidConsentReceived bit NULL
,@Memberid int 

AS

-- update address
EXEC uspUpdateAddress @AddressLine1, @AddressLine2, @City, @PostCode, @Addressid


-- Update member details
UPDATE [dbo].[tcMember]
   SET [Fname] = @Fname
      ,[LName] = @LName
	  ,Telephone = @Telephone
	  ,Gender = @Gender
      ,[Email] = @Email
	  ,IsActive = @IsActive
	  ,MembershipExpire = @MembershipExpire
      ,[IsTaxPayer] = @IsTaxPayer
      ,[GiftAidConsentReceived] = @GiftAidConsentReceived
WHERE Memberid = @Memberid
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateNote]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[uspUpdateNote]
@Body varchar(max)
--,@NoteOrgid Uniqueidentifier
,@Noteid int out

as

UPDATE tcNotes
  SET [Body] = @Body
	,LastupDated = GETDATE()
WHERE Noteid = @Noteid

GO
/****** Object:  StoredProcedure [dbo].[uspUpdateOrganisation]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspUpdateOrganisation]

@OrgName varchar(100)
,@OrgUniqueNo varchar(30)
,@Email varchar(50)
,@Telephone varchar(11)
,@Mobile varchar(11)
,@Fname varchar(50) = NULL
,@Lname varchar(50) = NULL
,@UserTypeid tinyint
,@userid int = 0
,@Addressid int = 0
,@AddressLine1 varchar(75)
,@AddressLine2 varchar(75)
,@City varchar(30)
,@PostCode varchar(15)
,@OrgAbbName varchar(11)
,@Orgid uniqueidentifier

AS

--SET @UserTypeid = @UserTypeid + 1

if @userid = 0

-- Add new user
	EXEC uspInsertUser @UserTypeid, @Orgid, @Fname, @Lname, @Userid OUT
ELSE
--- Edit user's record for this church
	EXEC uspUpdateUser @userTypeid, @Fname, @Lname, @userid

if @Addressid = 0

-- Add new address
EXEC uspInsertAddress @AddressLine1, @AddressLine2, @City, @PostCode, @Orgid, @addressid

ELSE
-- Edit address
EXEC uspUpdateAddress @AddressLine1, @AddressLine2, @City, @PostCode, @Addressid


--- Edit the record of the church
UPDATE dbo.tcOrganisation 
   SET OrgName = @OrgName
       ,OrgAbbName = @OrgAbbName
	   ,OrgUniqueNo = @OrgUniqueNo
	   ,Telephone = @Telephone 
	   ,Mobile = @Mobile
	   ,LastUpdated = GETDATE()
 WHERE Orgid = @Orgid
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateUser]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspUpdateUser]

@UserTypeid tinyint
,@Fname varchar(50)
,@Lname varchar(50)
,@Userid int

AS



-- Update user details
UPDATE [dbo].[tcUser]
   SET UserTypeid = @UserTypeid
      ,[Fname] = @Fname
      ,[LName] = @LName
WHERE Userid = @Userid
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateVoucher]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspUpdateVoucher]

@VoucherDesc varchar(255)
,@VoucherRaisedby int
,@VoucherApprovedby int
,@VoucherDate date
,@VoucherApprovedDate date
,@IsVoucherApproved bit = 0
,@Voucherid int

AS

UPDATE [dbo].[tcVouchers]
   SET 
       [VoucherDesc]		= @VoucherDesc
	  ,[VoucherRaisedBy]	= @VoucherRaisedBy
	  ,[IsVoucherApproved]	= @IsVoucherApproved
      ,[VoucherApprovedby]	= @VoucherApprovedby
      ,[VoucherDate]		= @VoucherDate
	  ,VoucherApprovedDate	= @VoucherApprovedDate
 WHERE Voucherid = @Voucherid
GO
/****** Object:  StoredProcedure [dbo].[uspUpsertDonation]    Script Date: 15/08/2023 01:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspUpsertDonation]

@Memberid int
,@Fname VARCHAR(75)
,@Lname VARCHAR(75)
,@DonationMethodid tinyint
,@Offering money
,@Tithe money
,@ThxGiving money
,@Pledges money
,@BuildingFund money
,@Others money
,@Total money
,@Remark varchar(max)
,@CheckBy INT
,@xCheckBy INT
,@Orgid uniqueidentifier

AS

DECLARE @CreatedDate datetime = CONVERT(DATE, GETDATE())
DECLARE @Noteid int = NULL

DECLARE @DonationHeadid int

SET @Total = ISNULL(@Total,0)

--- insert remark if it is not empty
IF (@Remark is not null)
	BEGIN
		EXEC [dbo].[uspInsertNote] @Remark, @Orgid, @Noteid out
	END

IF EXISTS (SELECT * FROM tcDonationHead 
           WHERE DonHdOrgid = @Orgid AND CONVERT(date, [LastUpdated]) = @CreatedDate)
 BEGIN
	---- Retrieve donation head id for this donation details
	SELECT @DonationHeadid = DonationHeadid
	FROM tcDonationHead 
    WHERE DonHdOrgid = @Orgid 
	AND CONVERT(date, [LastUpdated]) = @CreatedDate

	---- Update total donation for this current donation
	UPDATE tcDonationHead
	   SET [Total] = [Total] + @Total
	       ,LastUpdated = GETDATE()
	 WHERE DonationHeadid = @DonationHeadid

	
	---- Create donation details for each member for this current donation period
	EXEC uspInsertDonationDetails 
	     @DonationHeadid
		,@Memberid
		,@DonationMethodid
		,@Offering
		,@Tithe
		,@ThxGiving
		,@Pledges
		,@BuildingFund
		,@Others
		,@Total
		,@Noteid

   END

ELSE
BEGIN
	---- Create the donation head for this donation period
	EXEC uspInsertDonationHead @Total, @Orgid,@CheckBy ,@CheckBy, @DonationHeadid OUT

	---- Create doation details for each member for this current donation period
	EXEC uspInsertDonationDetails 
	    @DonationHeadid
		,@Memberid
		,@DonationMethodid
		,@Offering
		,@Tithe
		,@ThxGiving
		,@Pledges
		,@BuildingFund
		,@Others
		,@Total
		,@Noteid


END

GO
