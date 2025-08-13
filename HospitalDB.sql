/*
 Navicat Premium Dump SQL

 Source Server         : sql serever
 Source Server Type    : SQL Server
 Source Server Version : 16001140 (16.00.1140)
 Source Catalog        : HospitalDB
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 16001140 (16.00.1140)
 File Encoding         : 65001

 Date: 13/08/2025 17:04:39
*/


-- ----------------------------
-- Table structure for Bumen
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Bumen]') AND type IN ('U'))
	DROP TABLE [dbo].[Bumen]
GO

CREATE TABLE [dbo].[Bumen] (
  [Bid] int  IDENTITY(1,1) NOT NULL,
  [Bname] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Bmiaoshu] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[Bumen] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Bumen
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Bumen] ON
GO

INSERT INTO [dbo].[Bumen] ([Bid], [Bname], [Bmiaoshu]) VALUES (N'1', N'外科', N'外科门诊 ')
GO

INSERT INTO [dbo].[Bumen] ([Bid], [Bname], [Bmiaoshu]) VALUES (N'2', N'内科', N'内科门诊')
GO

INSERT INTO [dbo].[Bumen] ([Bid], [Bname], [Bmiaoshu]) VALUES (N'4', N'骨科', N'骨科门诊')
GO

INSERT INTO [dbo].[Bumen] ([Bid], [Bname], [Bmiaoshu]) VALUES (N'5', N'儿科', N'儿科门诊')
GO

INSERT INTO [dbo].[Bumen] ([Bid], [Bname], [Bmiaoshu]) VALUES (N'9', N'五官科', N'耳鼻喉科门诊')
GO

INSERT INTO [dbo].[Bumen] ([Bid], [Bname], [Bmiaoshu]) VALUES (N'10', N'皮肤科', N'皮肤科门诊')
GO

INSERT INTO [dbo].[Bumen] ([Bid], [Bname], [Bmiaoshu]) VALUES (N'11', N'药房', N'中药及西药取药处')
GO

SET IDENTITY_INSERT [dbo].[Bumen] OFF
GO


-- ----------------------------
-- Table structure for Doctor
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctor]') AND type IN ('U'))
	DROP TABLE [dbo].[Doctor]
GO

CREATE TABLE [dbo].[Doctor] (
  [YsID] int  IDENTITY(200,1) NOT NULL,
  [Yname] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Yphone] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Yzhuzhi] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Yjianjie] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Yzhicheng] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Ysex] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Yold] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Yphoto] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Bid] int  NULL,
  [Ystate] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Doctor] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Doctor
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Doctor] ON
GO

INSERT INTO [dbo].[Doctor] ([YsID], [Yname], [Yphone], [Yzhuzhi], [Yjianjie], [Yzhicheng], [Ysex], [Yold], [Yphoto], [Bid], [Ystate]) VALUES (N'100', N'张院长', N'15251637949', N'江苏', N'博士', N'主治医生', N'男', N'25', N'640 (1).png', N'1', N'在职')
GO

INSERT INTO [dbo].[Doctor] ([YsID], [Yname], [Yphone], [Yzhuzhi], [Yjianjie], [Yzhicheng], [Ysex], [Yold], [Yphoto], [Bid], [Ystate]) VALUES (N'101', N'金医生', N'19892170356', N'江苏', N'硕士', N'副主治医生', N'女', N'20', N'富冈永义.png', N'2', N'在职')
GO

INSERT INTO [dbo].[Doctor] ([YsID], [Yname], [Yphone], [Yzhuzhi], [Yjianjie], [Yzhicheng], [Ysex], [Yold], [Yphoto], [Bid], [Ystate]) VALUES (N'102', N'钟医生', N'19595475352', N'湖北', N'硕士', N'普通医生', N'女', N'21', N'640(1).jpg', N'5', N'在职')
GO

INSERT INTO [dbo].[Doctor] ([YsID], [Yname], [Yphone], [Yzhuzhi], [Yjianjie], [Yzhicheng], [Ysex], [Yold], [Yphoto], [Bid], [Ystate]) VALUES (N'103', N'胡大夫', N'888888888', N'江苏', N'本科', N'实习医生', N'女', N'20', N'图片2.png', N'9', N'在职')
GO

INSERT INTO [dbo].[Doctor] ([YsID], [Yname], [Yphone], [Yzhuzhi], [Yjianjie], [Yzhicheng], [Ysex], [Yold], [Yphoto], [Bid], [Ystate]) VALUES (N'213', N'杨医生', N'13789524697', N'江苏', N'博士', N'实习医生', N'男', N'25', N'图片2.png', N'10', N'休假')
GO

INSERT INTO [dbo].[Doctor] ([YsID], [Yname], [Yphone], [Yzhuzhi], [Yjianjie], [Yzhicheng], [Ysex], [Yold], [Yphoto], [Bid], [Ystate]) VALUES (N'217', N'薛医生', N'888888888', N'浙江', N'硕士', N'副主治医生', N'女', N'21', N'图片2.png', N'2', N'休假')
GO

SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO


-- ----------------------------
-- Table structure for Guahao
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Guahao]') AND type IN ('U'))
	DROP TABLE [dbo].[Guahao]
GO

CREATE TABLE [dbo].[Guahao] (
  [Gid] int  IDENTITY(1,1) NOT NULL,
  [Gname] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [GPhone] nvarchar(11) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Gshenfenzheng] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [GSex] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Gbingli] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [YsID] int  NULL,
  [Gstate] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Pid] int  NOT NULL,
  [Gtime] datetime  NOT NULL
)
GO

ALTER TABLE [dbo].[Guahao] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Guahao
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Guahao] ON
GO

INSERT INTO [dbo].[Guahao] ([Gid], [Gname], [GPhone], [Gshenfenzheng], [GSex], [Gbingli], [YsID], [Gstate], [Pid], [Gtime]) VALUES (N'1', N'张三', N'19892170350', N'430426200411389897', N'女', N'555', NULL, N'1', N'201', N'2021-11-11 10:08:14.333')
GO

INSERT INTO [dbo].[Guahao] ([Gid], [Gname], [GPhone], [Gshenfenzheng], [GSex], [Gbingli], [YsID], [Gstate], [Pid], [Gtime]) VALUES (N'2', N'李四', N'19892170350', N'430426200411389893', N'女', N'需要住院治疗', NULL, N'1', N'200', N'2021-11-11 10:42:53.180')
GO

INSERT INTO [dbo].[Guahao] ([Gid], [Gname], [GPhone], [Gshenfenzheng], [GSex], [Gbingli], [YsID], [Gstate], [Pid], [Gtime]) VALUES (N'3', N'王五', N'19892170358', N'462145988877539098', N'女', N'哈哈哈哈', NULL, N'1', N'200', N'2021-11-13 01:30:39.980')
GO

INSERT INTO [dbo].[Guahao] ([Gid], [Gname], [GPhone], [Gshenfenzheng], [GSex], [Gbingli], [YsID], [Gstate], [Pid], [Gtime]) VALUES (N'4', N'赵六', N'19892170357', N'462145988877539099', N'女', N'头疼', NULL, N'1', N'203', N'2021-11-13 03:16:51.260')
GO

INSERT INTO [dbo].[Guahao] ([Gid], [Gname], [GPhone], [Gshenfenzheng], [GSex], [Gbingli], [YsID], [Gstate], [Pid], [Gtime]) VALUES (N'5', N'虾仁', N'17894568523', N'462145988877539095', N'女', N'头疼', NULL, N'1', N'213', N'2021-11-18 15:17:32.830')
GO

INSERT INTO [dbo].[Guahao] ([Gid], [Gname], [GPhone], [Gshenfenzheng], [GSex], [Gbingli], [YsID], [Gstate], [Pid], [Gtime]) VALUES (N'6', N'孙七', N'19892170357', N'462145988877539093', N'男', N'头疼', NULL, N'1', N'211', N'2021-11-20 07:25:50.080')
GO

INSERT INTO [dbo].[Guahao] ([Gid], [Gname], [GPhone], [Gshenfenzheng], [GSex], [Gbingli], [YsID], [Gstate], [Pid], [Gtime]) VALUES (N'7', N'周八', N'13789187003', N'462145988877539091', N'女', N'骨折', NULL, N'1', N'213', N'2021-11-20 07:36:48.790')
GO

INSERT INTO [dbo].[Guahao] ([Gid], [Gname], [GPhone], [Gshenfenzheng], [GSex], [Gbingli], [YsID], [Gstate], [Pid], [Gtime]) VALUES (N'8', N'吴九', N'19892170356', N'430426200011269092', N'女', N'骨折需住院', NULL, N'1', N'213', N'2021-11-20 09:40:11.060')
GO

INSERT INTO [dbo].[Guahao] ([Gid], [Gname], [GPhone], [Gshenfenzheng], [GSex], [Gbingli], [YsID], [Gstate], [Pid], [Gtime]) VALUES (N'9', N'郑十', N'19892170357', N'4621459888775390978', N'女', N'头疼', NULL, N'1', N'211', N'2021-11-20 11:29:10.393')
GO

SET IDENTITY_INSERT [dbo].[Guahao] OFF
GO


-- ----------------------------
-- Table structure for Login
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Login]') AND type IN ('U'))
	DROP TABLE [dbo].[Login]
GO

CREATE TABLE [dbo].[Login] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [Account] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Password] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Zhiwu] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [YsID] int  NOT NULL
)
GO

ALTER TABLE [dbo].[Login] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Login
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Login] ON
GO

INSERT INTO [dbo].[Login] ([ID], [Account], [Password], [Zhiwu], [YsID]) VALUES (N'1', N'admin', N'admin123', N'超级管理员', N'100')
GO

INSERT INTO [dbo].[Login] ([ID], [Account], [Password], [Zhiwu], [YsID]) VALUES (N'3', N'zjx', N'123456', N'医生职员', N'101')
GO

SET IDENTITY_INSERT [dbo].[Login] OFF
GO


-- ----------------------------
-- Table structure for Medicine
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Medicine]') AND type IN ('U'))
	DROP TABLE [dbo].[Medicine]
GO

CREATE TABLE [dbo].[Medicine] (
  [medicineID] int  IDENTITY(500,1) NOT NULL,
  [Mname] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Mshu] int  NOT NULL,
  [Mdanwei] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Mdizhi] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Mliaoxiao] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Mmoneyj] decimal(18,2)  NOT NULL,
  [Mmoneyc] decimal(18,2)  NOT NULL,
  [Mshengchan] datetime  NOT NULL,
  [Mguoqi] datetime  NOT NULL
)
GO

ALTER TABLE [dbo].[Medicine] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Medicine
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Medicine] ON
GO

INSERT INTO [dbo].[Medicine] ([medicineID], [Mname], [Mshu], [Mdanwei], [Mdizhi], [Mliaoxiao], [Mmoneyj], [Mmoneyc], [Mshengchan], [Mguoqi]) VALUES (N'500', N'板蓝根', N'16', N'袋', N'云南白药有限公司', N'咳嗽、感冒', N'3.50', N'5.00', N'2021-02-15 00:00:00.000', N'2022-12-15 00:00:00.000')
GO

INSERT INTO [dbo].[Medicine] ([medicineID], [Mname], [Mshu], [Mdanwei], [Mdizhi], [Mliaoxiao], [Mmoneyj], [Mmoneyc], [Mshengchan], [Mguoqi]) VALUES (N'501', N'999感冒灵', N'3', N'盒', N'昆明制药', N'感冒发热', N'15.00', N'25.00', N'2020-07-08 00:00:00.000', N'2023-07-08 00:00:00.000')
GO

INSERT INTO [dbo].[Medicine] ([medicineID], [Mname], [Mshu], [Mdanwei], [Mdizhi], [Mliaoxiao], [Mmoneyj], [Mmoneyc], [Mshengchan], [Mguoqi]) VALUES (N'502', N'感冒药', N'20', N'盒', N'湖南制药', N'感冒发烧', N'23.00', N'40.00', N'2021-01-20 00:00:00.000', N'2021-11-13 00:00:00.000')
GO

INSERT INTO [dbo].[Medicine] ([medicineID], [Mname], [Mshu], [Mdanwei], [Mdizhi], [Mliaoxiao], [Mmoneyj], [Mmoneyc], [Mshengchan], [Mguoqi]) VALUES (N'505', N'云南白药', N'29', N'盒', N'北京', N'治感冒', N'12.00', N'4.50', N'2021-01-02 00:00:00.000', N'2022-02-01 00:00:00.000')
GO

INSERT INTO [dbo].[Medicine] ([medicineID], [Mname], [Mshu], [Mdanwei], [Mdizhi], [Mliaoxiao], [Mmoneyj], [Mmoneyc], [Mshengchan], [Mguoqi]) VALUES (N'506', N'止咳糖浆', N'433', N'瓶', N'北京生物', N'止咳', N'25.00', N'40.00', N'2021-01-25 00:00:00.000', N'2025-01-05 00:00:00.000')
GO

SET IDENTITY_INSERT [dbo].[Medicine] OFF
GO


-- ----------------------------
-- Table structure for Morder
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Morder]') AND type IN ('U'))
	DROP TABLE [dbo].[Morder]
GO

CREATE TABLE [dbo].[Morder] (
  [OrderIDm] int  IDENTITY(1,1) NOT NULL,
  [medicineID] int  NOT NULL,
  [Gid] int  NULL,
  [Mshu] int  NOT NULL,
  [state] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [miaoshu] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [zhifu] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [mhz] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Morder] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Morder
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Morder] ON
GO

INSERT INTO [dbo].[Morder] ([OrderIDm], [medicineID], [Gid], [Mshu], [state], [miaoshu], [zhifu], [mhz]) VALUES (N'61', N'500', N'2', N'1', N'药品', NULL, N'未支付', N'住院')
GO

INSERT INTO [dbo].[Morder] ([OrderIDm], [medicineID], [Gid], [Mshu], [state], [miaoshu], [zhifu], [mhz]) VALUES (N'62', N'501', N'2', N'1', N'药品', NULL, N'未支付', N'住院')
GO

INSERT INTO [dbo].[Morder] ([OrderIDm], [medicineID], [Gid], [Mshu], [state], [miaoshu], [zhifu], [mhz]) VALUES (N'67', N'500', N'6', N'1', N'药品', NULL, N'未支付', N'门诊')
GO

INSERT INTO [dbo].[Morder] ([OrderIDm], [medicineID], [Gid], [Mshu], [state], [miaoshu], [zhifu], [mhz]) VALUES (N'68', N'501', N'6', N'1', N'药品', NULL, N'未支付', N'门诊')
GO

INSERT INTO [dbo].[Morder] ([OrderIDm], [medicineID], [Gid], [Mshu], [state], [miaoshu], [zhifu], [mhz]) VALUES (N'71', N'505', N'9', N'1', N'药品', NULL, N'未支付', N'门诊')
GO

INSERT INTO [dbo].[Morder] ([OrderIDm], [medicineID], [Gid], [Mshu], [state], [miaoshu], [zhifu], [mhz]) VALUES (N'72', N'506', N'8', N'1', N'药品', NULL, N'未支付', N'住院')
GO

INSERT INTO [dbo].[Morder] ([OrderIDm], [medicineID], [Gid], [Mshu], [state], [miaoshu], [zhifu], [mhz]) VALUES (N'2004', N'500', N'1', N'1', N'药品', NULL, N'已支付', N'门诊')
GO

INSERT INTO [dbo].[Morder] ([OrderIDm], [medicineID], [Gid], [Mshu], [state], [miaoshu], [zhifu], [mhz]) VALUES (N'2006', N'501', N'1', N'2', N'药品', NULL, N'已支付', N'门诊')
GO

INSERT INTO [dbo].[Morder] ([OrderIDm], [medicineID], [Gid], [Mshu], [state], [miaoshu], [zhifu], [mhz]) VALUES (N'2007', N'500', N'4', N'1', N'药品', NULL, N'已支付', N'门诊')
GO

SET IDENTITY_INSERT [dbo].[Morder] OFF
GO


-- ----------------------------
-- Table structure for Paiban
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Paiban]') AND type IN ('U'))
	DROP TABLE [dbo].[Paiban]
GO

CREATE TABLE [dbo].[Paiban] (
  [Pid] int  IDENTITY(200,1) NOT NULL,
  [Ptimek] time(7)  NOT NULL,
  [Ptimej] time(7)  NOT NULL,
  [YsID] int  NOT NULL,
  [Pmoney] decimal(18,2)  NOT NULL,
  [Pstate] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Paiban] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Paiban
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Paiban] ON
GO

INSERT INTO [dbo].[Paiban] ([Pid], [Ptimek], [Ptimej], [YsID], [Pmoney], [Pstate]) VALUES (N'200', N'08:30:00.0000000', N'11:30:00.0000000', N'100', N'20.00', N'0')
GO

INSERT INTO [dbo].[Paiban] ([Pid], [Ptimek], [Ptimej], [YsID], [Pmoney], [Pstate]) VALUES (N'201', N'08:30:00.0000000', N'08:30:00.0000000', N'101', N'15.00', N'0')
GO

INSERT INTO [dbo].[Paiban] ([Pid], [Ptimek], [Ptimej], [YsID], [Pmoney], [Pstate]) VALUES (N'203', N'09:00:00.0000000', N'12:00:00.0000000', N'101', N'100.00', N'0')
GO

INSERT INTO [dbo].[Paiban] ([Pid], [Ptimek], [Ptimej], [YsID], [Pmoney], [Pstate]) VALUES (N'204', N'09:00:00.0000000', N'12:00:00.0000000', N'103', N'52.00', N'0')
GO

INSERT INTO [dbo].[Paiban] ([Pid], [Ptimek], [Ptimej], [YsID], [Pmoney], [Pstate]) VALUES (N'210', N'09:00:00.0000000', N'12:00:00.0000000', N'103', N'25.00', N'0')
GO

INSERT INTO [dbo].[Paiban] ([Pid], [Ptimek], [Ptimej], [YsID], [Pmoney], [Pstate]) VALUES (N'211', N'09:25:00.0000000', N'12:00:00.0000000', N'103', N'25.00', N'1')
GO

INSERT INTO [dbo].[Paiban] ([Pid], [Ptimek], [Ptimej], [YsID], [Pmoney], [Pstate]) VALUES (N'212', N'09:30:00.0000000', N'12:00:00.0000000', N'101', N'25.00', N'0')
GO

INSERT INTO [dbo].[Paiban] ([Pid], [Ptimek], [Ptimej], [YsID], [Pmoney], [Pstate]) VALUES (N'213', N'13:35:00.0000000', N'19:41:00.0000000', N'102', N'25.00', N'1')
GO

INSERT INTO [dbo].[Paiban] ([Pid], [Ptimek], [Ptimej], [YsID], [Pmoney], [Pstate]) VALUES (N'214', N'01:00:00.0000000', N'04:00:00.0000000', N'102', N'25.00', N'0')
GO

INSERT INTO [dbo].[Paiban] ([Pid], [Ptimek], [Ptimej], [YsID], [Pmoney], [Pstate]) VALUES (N'215', N'13:39:00.0000000', N'17:43:00.0000000', N'103', N'77.00', N'0')
GO

INSERT INTO [dbo].[Paiban] ([Pid], [Ptimek], [Ptimej], [YsID], [Pmoney], [Pstate]) VALUES (N'217', N'08:30:00.0000000', N'12:30:00.0000000', N'103', N'25.00', N'0')
GO

INSERT INTO [dbo].[Paiban] ([Pid], [Ptimek], [Ptimej], [YsID], [Pmoney], [Pstate]) VALUES (N'1217', N'20:16:00.0000000', N'23:16:00.0000000', N'100', N'25.00', N'0')
GO

INSERT INTO [dbo].[Paiban] ([Pid], [Ptimek], [Ptimej], [YsID], [Pmoney], [Pstate]) VALUES (N'2217', N'15:41:00.0000000', N'15:47:00.0000000', N'100', N'14.00', N'1')
GO

SET IDENTITY_INSERT [dbo].[Paiban] OFF
GO


-- ----------------------------
-- Table structure for Wx
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Wx]') AND type IN ('U'))
	DROP TABLE [dbo].[Wx]
GO

CREATE TABLE [dbo].[Wx] (
  [PatientID] int  IDENTITY(1,1) NOT NULL,
  [Wxphone] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[Wx] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Wx
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Wx] ON
GO

SET IDENTITY_INSERT [dbo].[Wx] OFF
GO


-- ----------------------------
-- Table structure for Xiangmu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Xiangmu]') AND type IN ('U'))
	DROP TABLE [dbo].[Xiangmu]
GO

CREATE TABLE [dbo].[Xiangmu] (
  [Xid] int  IDENTITY(600,1) NOT NULL,
  [Xname] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Xmoney] decimal(7,2)  NOT NULL,
  [Xchenben] decimal(7,2)  NOT NULL,
  [Xstate] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[Xiangmu] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Xiangmu
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Xiangmu] ON
GO

INSERT INTO [dbo].[Xiangmu] ([Xid], [Xname], [Xmoney], [Xchenben], [Xstate]) VALUES (N'600', N'CT', N'400.00', N'300.00', N'需检查')
GO

INSERT INTO [dbo].[Xiangmu] ([Xid], [Xname], [Xmoney], [Xchenben], [Xstate]) VALUES (N'601', N'消炎针', N'50.00', N'25.00', N'非检查')
GO

SET IDENTITY_INSERT [dbo].[Xiangmu] OFF
GO


-- ----------------------------
-- Table structure for Zhuyuan
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Zhuyuan]') AND type IN ('U'))
	DROP TABLE [dbo].[Zhuyuan]
GO

CREATE TABLE [dbo].[Zhuyuan] (
  [Zhuid] int  IDENTITY(1,1) NOT NULL,
  [Gid] int  NOT NULL,
  [Ke] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Chuang] int  NULL,
  [state] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [money] decimal(18,2)  NULL,
  [riqi] date  NULL,
  [riqic] date  NULL,
  [moneyz] decimal(18,2)  NULL
)
GO

ALTER TABLE [dbo].[Zhuyuan] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Zhuyuan
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Zhuyuan] ON
GO

INSERT INTO [dbo].[Zhuyuan] ([Zhuid], [Gid], [Ke], [Chuang], [state], [money], [riqi], [riqic], [moneyz]) VALUES (N'1', N'2', N'外科', N'12', N'已出院', N'20.00', N'2021-11-18', N'2023-11-17', N'14580.00')
GO

INSERT INTO [dbo].[Zhuyuan] ([Zhuid], [Gid], [Ke], [Chuang], [state], [money], [riqi], [riqic], [moneyz]) VALUES (N'2', N'4', N'内科', N'1', N'已出院', N'20.00', N'2021-11-18', N'2021-11-18', N'20.00')
GO

INSERT INTO [dbo].[Zhuyuan] ([Zhuid], [Gid], [Ke], [Chuang], [state], [money], [riqi], [riqic], [moneyz]) VALUES (N'3', N'7', N'骨科', N'1', N'已出院', N'20.00', N'2021-11-20', N'2023-11-17', N'14540.00')
GO

INSERT INTO [dbo].[Zhuyuan] ([Zhuid], [Gid], [Ke], [Chuang], [state], [money], [riqi], [riqic], [moneyz]) VALUES (N'4', N'8', N'骨科', N'15', N'已出院', N'23.00', N'2021-11-20', N'2021-11-20', N'23.00')
GO

SET IDENTITY_INSERT [dbo].[Zhuyuan] OFF
GO


-- ----------------------------
-- Auto increment value for Bumen
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Bumen]', RESEED, 11)
GO


-- ----------------------------
-- Primary Key structure for table Bumen
-- ----------------------------
ALTER TABLE [dbo].[Bumen] ADD CONSTRAINT [PK_Bumen] PRIMARY KEY CLUSTERED ([Bid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Doctor
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Doctor]', RESEED, 217)
GO


-- ----------------------------
-- Primary Key structure for table Doctor
-- ----------------------------
ALTER TABLE [dbo].[Doctor] ADD CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED ([YsID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Guahao
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Guahao]', RESEED, 2006)
GO


-- ----------------------------
-- Primary Key structure for table Guahao
-- ----------------------------
ALTER TABLE [dbo].[Guahao] ADD CONSTRAINT [PK_Guahao] PRIMARY KEY CLUSTERED ([Gid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Login
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Login]', RESEED, 16)
GO


-- ----------------------------
-- Primary Key structure for table Login
-- ----------------------------
ALTER TABLE [dbo].[Login] ADD CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Medicine
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Medicine]', RESEED, 506)
GO


-- ----------------------------
-- Primary Key structure for table Medicine
-- ----------------------------
ALTER TABLE [dbo].[Medicine] ADD CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED ([medicineID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Morder
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Morder]', RESEED, 2007)
GO


-- ----------------------------
-- Primary Key structure for table Morder
-- ----------------------------
ALTER TABLE [dbo].[Morder] ADD CONSTRAINT [PK_Morder] PRIMARY KEY CLUSTERED ([OrderIDm])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Paiban
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Paiban]', RESEED, 2217)
GO


-- ----------------------------
-- Primary Key structure for table Paiban
-- ----------------------------
ALTER TABLE [dbo].[Paiban] ADD CONSTRAINT [PK_Paiban] PRIMARY KEY CLUSTERED ([Pid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Wx
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Wx]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table Wx
-- ----------------------------
ALTER TABLE [dbo].[Wx] ADD CONSTRAINT [PK_PatientID] PRIMARY KEY CLUSTERED ([PatientID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Xiangmu
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Xiangmu]', RESEED, 601)
GO


-- ----------------------------
-- Primary Key structure for table Xiangmu
-- ----------------------------
ALTER TABLE [dbo].[Xiangmu] ADD CONSTRAINT [PK_Xiangmu] PRIMARY KEY CLUSTERED ([Xid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Zhuyuan
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Zhuyuan]', RESEED, 4)
GO


-- ----------------------------
-- Primary Key structure for table Zhuyuan
-- ----------------------------
ALTER TABLE [dbo].[Zhuyuan] ADD CONSTRAINT [PK_Zhuyuan] PRIMARY KEY CLUSTERED ([Zhuid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table Doctor
-- ----------------------------
ALTER TABLE [dbo].[Doctor] ADD CONSTRAINT [FK_Doctor_Bumen] FOREIGN KEY ([Bid]) REFERENCES [dbo].[Bumen] ([Bid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Guahao
-- ----------------------------
ALTER TABLE [dbo].[Guahao] ADD CONSTRAINT [FK_Guahao_Paiban] FOREIGN KEY ([Pid]) REFERENCES [dbo].[Paiban] ([Pid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Login
-- ----------------------------
ALTER TABLE [dbo].[Login] ADD CONSTRAINT [FK_Login_Doctor] FOREIGN KEY ([YsID]) REFERENCES [dbo].[Doctor] ([YsID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Morder
-- ----------------------------
ALTER TABLE [dbo].[Morder] ADD CONSTRAINT [FK_Morder_Guahao] FOREIGN KEY ([Gid]) REFERENCES [dbo].[Guahao] ([Gid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Morder] ADD CONSTRAINT [FK_Morder_Medicine] FOREIGN KEY ([medicineID]) REFERENCES [dbo].[Medicine] ([medicineID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Paiban
-- ----------------------------
ALTER TABLE [dbo].[Paiban] ADD CONSTRAINT [FK_Paiban_Doctor] FOREIGN KEY ([YsID]) REFERENCES [dbo].[Doctor] ([YsID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Zhuyuan
-- ----------------------------
ALTER TABLE [dbo].[Zhuyuan] ADD CONSTRAINT [FK_Zhuyuan_Guahao] FOREIGN KEY ([Gid]) REFERENCES [dbo].[Guahao] ([Gid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

