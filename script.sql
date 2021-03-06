CREATE DATABASE WebTraiCay
Go
USE [WebTraiCay]
GO
/****** Object:  Table [dbo].[category]    Script Date: 11/29/2021 9:59:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[slug] [varchar](255) NOT NULL,
	[parentid] [int] NOT NULL,
	[orders] [int] NOT NULL,
	[metakey] [nvarchar](150) NULL,
	[metadesc] [nvarchar](150) NULL,
	[created_at] [smalldatetime] NULL DEFAULT ('0000-00-00 00:00:00'),
	[created_by] [int] NULL DEFAULT ((1)),
	[updated_at] [smalldatetime] NULL DEFAULT ('0000-00-00 00:00:00'),
	[updated_by] [int] NULL DEFAULT ((1)),
	[status] [int] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contact]    Script Date: 11/29/2021 9:59:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [varchar](100) NULL,
	[phone] [varchar](15) NULL,
	[title] [nvarchar](255) NULL,
	[detail] [ntext] NULL,
	[created_at] [smalldatetime] NULL DEFAULT ('0000-00-00 00:00:00'),
	[created_by] [int] NULL DEFAULT ((1)),
	[updated_at] [smalldatetime] NULL DEFAULT ('0000-00-00 00:00:00'),
	[updated_by] [int] NULL DEFAULT ((1)),
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[link]    Script Date: 11/29/2021 9:59:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[link](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[slug] [varchar](max) NULL,
	[tableId] [int] NULL,
	[type] [varchar](200) NULL,
	[parentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[menu]    Script Date: 11/29/2021 9:59:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[type] [varchar](255) NOT NULL,
	[link] [varchar](255) NULL DEFAULT (NULL),
	[tableid] [int] NULL DEFAULT (NULL),
	[parentid] [int] NOT NULL,
	[orders] [int] NOT NULL,
	[position] [varchar](255) NOT NULL,
	[created_at] [smalldatetime] NOT NULL DEFAULT ('0000-00-00 00:00:00'),
	[created_by] [int] NULL DEFAULT (NULL),
	[updated_at] [smalldatetime] NOT NULL DEFAULT ('0000-00-00 00:00:00'),
	[updated_by] [int] NULL DEFAULT (NULL),
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[order]    Script Date: 11/29/2021 9:59:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[userid] [int] NOT NULL,
	[created_ate] [smalldatetime] NOT NULL,
	[exportdate] [smalldatetime] NULL,
	[deliveryaddress] [nvarchar](255) NOT NULL,
	[deliveryname] [nvarchar](100) NOT NULL,
	[deliveryphone] [varchar](255) NOT NULL,
	[deliveryemail] [varchar](255) NOT NULL,
	[deliveryPaymentMethod] [nvarchar](255) NOT NULL,
	[StatusPayment] [int] NOT NULL,
	[updated_at] [smalldatetime] NOT NULL,
	[updated_by] [int] NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ordersdetail]    Script Date: 11/29/2021 9:59:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordersdetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[priceSale] [int] NOT NULL DEFAULT ((1)),
	[amount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[post]    Script Date: 11/29/2021 9:59:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[post](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[topid] [int] NULL DEFAULT (NULL),
	[title] [nvarchar](max) NOT NULL,
	[slug] [varchar](255) NOT NULL,
	[detail] [ntext] NULL DEFAULT (NULL),
	[img] [varchar](255) NULL DEFAULT (NULL),
	[type] [varchar](50) NULL DEFAULT ('post'),
	[metakey] [nvarchar](150) NOT NULL,
	[metadesc] [nvarchar](150) NOT NULL,
	[created_at] [smalldatetime] NOT NULL DEFAULT ('0000-00-00 00:00:00'),
	[created_by] [int] NOT NULL DEFAULT ((1)),
	[updated_at] [smalldatetime] NOT NULL DEFAULT ('0000-00-00 00:00:00'),
	[updated_by] [int] NOT NULL DEFAULT ((1)),
	[status] [int] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/29/2021 9:59:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[catid] [int] NOT NULL,
	[Submenu] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[slug] [nvarchar](255) NOT NULL,
	[img] [varchar](100) NOT NULL,
	[detail] [ntext] NOT NULL,
	[number] [int] NOT NULL,
	[price] [float] NOT NULL,
	[pricesale] [float] NOT NULL,
	[metakey] [nvarchar](150) NULL,
	[metadesc] [nvarchar](max) NULL,
	[created_at] [smalldatetime] NOT NULL DEFAULT ('0000-00-00 00:00:00'),
	[created_by] [int] NOT NULL DEFAULT ((1)),
	[updated_at] [smalldatetime] NOT NULL DEFAULT ('0000-00-00 00:00:00'),
	[updated_by] [int] NOT NULL DEFAULT ((1)),
	[status] [int] NOT NULL DEFAULT ((1)),
	[sold] [int] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[role]    Script Date: 11/29/2021 9:59:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[accessName] [varchar](255) NOT NULL,
	[description] [nvarchar](225) NULL,
	[GropID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[slider]    Script Date: 11/29/2021 9:59:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[slider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[url] [varchar](255) NOT NULL,
	[position] [varchar](100) NOT NULL,
	[img] [varchar](100) NOT NULL,
	[orders] [int] NULL DEFAULT ((1)),
	[created_at] [smalldatetime] NOT NULL DEFAULT ('0000-00-00 00:00:00'),
	[created_by] [int] NULL DEFAULT ((1)),
	[updated_at] [smalldatetime] NOT NULL DEFAULT ('0000-00-00 00:00:00'),
	[updated_by] [int] NULL DEFAULT (NULL),
	[status] [int] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[topic]    Script Date: 11/29/2021 9:59:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[topic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[slug] [varchar](255) NOT NULL,
	[parentid] [int] NOT NULL,
	[orders] [int] NOT NULL,
	[metakey] [varchar](150) NULL,
	[metadesc] [nvarchar](max) NULL,
	[created_at] [smalldatetime] NOT NULL DEFAULT ('0000-00-00 00:00:00'),
	[created_by] [int] NOT NULL DEFAULT ((1)),
	[updated_at] [smalldatetime] NOT NULL DEFAULT ('0000-00-00 00:00:00'),
	[updated_by] [int] NOT NULL DEFAULT ((1)),
	[status] [int] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user]    Script Date: 11/29/2021 9:59:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[username] [varchar](225) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[gender] [nvarchar](5) NULL DEFAULT ('Nam'),
	[phone] [varchar](20) NULL DEFAULT (NULL),
	[img] [varchar](100) NULL DEFAULT (NULL),
	[access] [int] NOT NULL,
	[created_at] [smalldatetime] NOT NULL DEFAULT ('0000-00-00 00:00:00'),
	[created_by] [int] NOT NULL DEFAULT ((1)),
	[updated_at] [smalldatetime] NOT NULL DEFAULT ('0000-00-00 00:00:00'),
	[updated_by] [int] NOT NULL DEFAULT ((1)),
	[status] [int] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (19, N'TRÁI CÂY KHÔ', N'trai-cay-kho', 0, 0, N'THỰC PHẨM SẠCH', N'THỰC PHẨM SẠCH', CAST(N'2020-10-31 12:51:00' AS SmallDateTime), 1, CAST(N'2021-11-28 11:54:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (20, N'TRÁI CÂY TƯƠI', N'trai-cay-tuoi', 0, 0, N'da vị', N'da vị', CAST(N'2020-10-31 12:51:00' AS SmallDateTime), 1, CAST(N'2021-11-28 11:54:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (23, N'Táo', N'tao', 20, 0, N'Táo', N'Táo', CAST(N'2021-11-28 11:58:00' AS SmallDateTime), 1, CAST(N'2021-11-28 11:58:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (24, N'Trái Kiwi', N'trai-kiwi', 20, 0, N'Trái Kiwi', N'Trái Kiwi', CAST(N'2021-11-28 12:00:00' AS SmallDateTime), 1, CAST(N'2021-11-28 12:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (25, N'Dưa', N'dua', 20, 0, N'Dưa', N'Dưa', CAST(N'2021-11-28 12:00:00' AS SmallDateTime), 1, CAST(N'2021-11-28 12:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (26, N'Lê', N'le', 20, 0, N'Lê', N'Lê', CAST(N'2021-11-28 12:00:00' AS SmallDateTime), 1, CAST(N'2021-11-28 12:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (27, N'Nho', N'nho', 20, 0, N'Nho', N'Nho', CAST(N'2021-11-28 12:00:00' AS SmallDateTime), 1, CAST(N'2021-11-28 12:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[category] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (28, N'TRÁI CÂY ĐÔNG LẠNH', N'trai-cay-dong-lanh', 0, 0, N'TRÁI CÂY ĐÔNG LẠNH', N'TRÁI CÂY ĐÔNG LẠNH', CAST(N'2021-11-28 13:03:00' AS SmallDateTime), 1, CAST(N'2021-11-28 13:04:00' AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[contact] ON 

INSERT [dbo].[contact] ([ID], [fullname], [email], [phone], [title], [detail], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (2, N'nguyen van hung', N'vanhung3339@gmail.com', N'0975271384', N'Làm thế nào để có nó?', N'Có rất nhiều biến thể của Lorem Ipsum mà bạn có thể tìm thấy, nhưng đa số được biến đổi bằng cách thêm các yếu tố hài hước, các từ ngẫu nhiên có khi không có vẻ gì là có ý nghĩa. Nếu bạn định sử dụng một đoạn Lorem Ipsum, bạn nên kiểm tra kĩ để chắn chắn là không có gì nhạy cảm được giấu ở giữa đoạn văn bản. Tất cả các công cụ sản xuất văn bản mẫu Lorem Ipsum đều được làm theo cách lặp đi lặp lại các đoạn chữ cho tới đủ thì thôi, khiến cho lipsum.com trở thành công cụ sản xuất Lorem Ipsum đáng giá nhất trên mạng. Trang web này sử dụng hơn 200 từ la-tinh, kết hợp thuần thục nhiều cấu trúc câu để tạo ra văn bản Lorem Ipsum trông có vẻ thật sự hợp lí. Nhờ thế, văn bản Lorem Ipsum được tạo ra mà không cần một sự lặp lại nào, cũng không cần chèn thêm các từ ngữ hóm hỉnh hay thiếu trật tự.', CAST(N'2019-11-26 11:44:00' AS SmallDateTime), NULL, CAST(N'2019-11-26 12:15:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[contact] ([ID], [fullname], [email], [phone], [title], [detail], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (5, N'ád', N'ád', N'12312312', N'tôi muôn mua @@2', N'nhưng tui k có tiền', CAST(N'2019-11-26 00:00:00' AS SmallDateTime), 1, CAST(N'2019-11-26 00:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[contact] ([ID], [fullname], [email], [phone], [title], [detail], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (6, N'nguyen van hhhh', N'anh4docganh@gmail.com', N'09747328372', N'0650320203205', N'fSSSSSSSSSSSSSSSSSSSSSSSSSS', CAST(N'2020-04-11 09:43:00' AS SmallDateTime), NULL, CAST(N'2020-07-10 17:44:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[contact] ([ID], [fullname], [email], [phone], [title], [detail], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (7, N'nguyen van hhhh', N'vanhung3339@gmail.com', N'09747328372', N'0650320203205', N'dddddddddddddddddddddddddddddddd', CAST(N'2020-04-29 23:31:00' AS SmallDateTime), NULL, CAST(N'2020-05-07 08:51:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[contact] ([ID], [fullname], [email], [phone], [title], [detail], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (8, N'nguyen van hhhh', N'vanhung3339@gmail.com', N'09747328372', N'0650320203205', N'?dasdasdadddddddddddddddddddddddddddddddddddddddddddd', CAST(N'2020-04-29 23:34:00' AS SmallDateTime), NULL, CAST(N'2020-05-07 08:51:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[contact] ([ID], [fullname], [email], [phone], [title], [detail], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (9, N'nhat', N'minhat@gmail.com', N'054353523', N'ko co gi', N'ko co gi', CAST(N'2021-11-29 21:46:00' AS SmallDateTime), NULL, CAST(N'2021-11-29 21:46:00' AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[contact] OFF
SET IDENTITY_INSERT [dbo].[link] ON 

INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (256, N'ca-rot-da-lat', 1, N'ProductDetail', 25)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (257, N'ca-chua-da-lat', 1, N'ProductDetail', 27)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (258, N'qua-su-su', 1, N'ProductDetail', 26)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (259, N'bap-cai-moc-chau', 1, N'ProductDetail', 24)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (260, N'sup-lo', 1, N'ProductDetail', 23)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (261, N'rau-muong', 1, N'ProductDetail', 21)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (262, N'thit-be', 1, N'ProductDetail', 20)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (263, N'thit-bo', 1, N'ProductDetail', 19)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (264, N'-ga-lang-son-leo-nui-', 1, N'ProductDetail', 18)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (265, N'ca-chao', 1, N'ProductDetail', 17)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (266, N'qua-mac-mat', 1, N'ProductDetail', 16)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (267, N'cham-cheo', 1, N'ProductDetail', 14)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (268, N'tuong-ot-muong-khuong', 1, N'ProductDetail', 13)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (269, N'trai-cay-tuoi', 2, N'category', 20)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (270, N'rau-cu-tuoi', 2, N'category', 21)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (271, N'thit-cac-loai', 2, N'category', 18)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (272, N'thuc-pham-sach', 2, N'category', 19)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (273, N'dac-san-vung-mien', 2, N'category', 22)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (274, N'huong-dan-cach-lam-nem-chua-thanh-hoa-cong-thuc-chuan', 4, N'PostDetail', 26)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (275, N'gioi-thieu', 4, N'PostDetail', 29)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (277, N'gioi-thieu1', 4, N'PostDetail', 30)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (278, N'nem-chua-thanh-hoa', 1, N'ProductDetail', 28)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (279, N'trai-cay-tuoi', 2, N'category', 20)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (280, N'trai-cay-kho', 2, N'category', 19)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (281, N'tao', 2, N'category', 23)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (282, N'trai-kiwi', 2, N'category', 24)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (283, N'dua', 2, N'category', 25)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (284, N'le', 2, N'category', 26)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (285, N'nho', 2, N'category', 27)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (286, N'tao-xanh-1kg', 1, N'ProductDetail', 29)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (287, N'tao-rockit-size-s', 1, N'ProductDetail', 30)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (288, N'tao-ambrosia-500g', 1, N'ProductDetail', 31)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (289, N'tao-rockit', 1, N'ProductDetail', 32)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (290, N'trai-cay-dong-lanh', 2, N'category', 28)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (291, N'ad', 2, N'category', 29)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (292, N'kiwi-xanh-500g', 1, N'ProductDetail', 33)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (293, N'kiwi-xanh-xanh-500g', 1, N'ProductDetail', 34)
INSERT [dbo].[link] ([ID], [slug], [tableId], [type], [parentId]) VALUES (294, N'cam', 1, N'ProductDetail', 35)
SET IDENTITY_INSERT [dbo].[link] OFF
SET IDENTITY_INSERT [dbo].[menu] ON 

INSERT [dbo].[menu] ([ID], [name], [type], [link], [tableid], [parentid], [orders], [position], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (1, N'Trang Chủ', N'menu', N'', 2, 0, 1, N'mainmenu', CAST(N'2019-03-15 00:00:00' AS SmallDateTime), 1, CAST(N'2019-12-05 13:03:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[menu] ([ID], [name], [type], [link], [tableid], [parentid], [orders], [position], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (3, N'Liên Hệ', N'page', N'lien-he', 2, 0, 3, N'mainmenu', CAST(N'2019-03-15 00:00:00' AS SmallDateTime), 1, CAST(N'2019-03-15 00:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[menu] ([ID], [name], [type], [link], [tableid], [parentid], [orders], [position], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (4, N'Sản Phẩm', N'menu', N'san-pham', 2, 0, 4, N'mainmenu', CAST(N'2019-03-15 00:00:00' AS SmallDateTime), 1, CAST(N'2019-03-15 00:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[menu] ([ID], [name], [type], [link], [tableid], [parentid], [orders], [position], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (5, N'Bài Viết', N'menu', N'bai-viet', 2, 0, 5, N'mainmenu', CAST(N'2019-03-15 00:00:00' AS SmallDateTime), 1, CAST(N'2020-05-06 23:02:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[menu] ([ID], [name], [type], [link], [tableid], [parentid], [orders], [position], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (6, N'Tất Cả Sản Phẩm', N'menu', N'sanpham', 2, 4, 10, N'mainmenu', CAST(N'2019-03-15 00:00:00' AS SmallDateTime), 1, CAST(N'2019-12-03 22:32:00' AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[menu] OFF
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (31, N'736511/28/2021 9:06:13 PM', 6, CAST(N'2021-11-28 21:06:00' AS SmallDateTime), CAST(N'2021-11-28 21:06:00' AS SmallDateTime), N'Cát mình pc -bd', N'Nguyễn Văn Hưng', N'0377377794', N'Vanhung3339@gmail.com', N'Cổng thanh toán Paypal', 2, CAST(N'2021-11-28 21:10:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (32, N'2945011/28/2021 9:06:28 PM', 6, CAST(N'2021-11-28 21:06:00' AS SmallDateTime), CAST(N'2021-11-28 21:06:00' AS SmallDateTime), N'Cát mình pc -bd', N'Nguyễn Văn Hưng', N'0377377794', N'Vanhung3339@gmail.com', N'ATM Online qua ngân lượng', 2, CAST(N'2021-11-28 21:06:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (33, N'5670711/28/2021 9:08:01 PM', 6, CAST(N'2021-11-28 21:08:00' AS SmallDateTime), CAST(N'2021-11-28 21:08:00' AS SmallDateTime), N'Cát mình pc -bd', N'Nguyễn Văn Hưng', N'0377377794', N'Vanhung3339@gmail.com', N'ATM Online qua ngân lượng', 2, CAST(N'2021-11-28 21:08:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (34, N'6377011/28/2021 9:08:02 PM', 6, CAST(N'2021-11-28 21:08:00' AS SmallDateTime), CAST(N'2021-11-28 21:08:00' AS SmallDateTime), N'Cát mình pc -bd', N'Nguyễn Văn Hưng', N'0377377794', N'Vanhung3339@gmail.com', N'ATM Online qua ngân lượng', 2, CAST(N'2021-11-28 21:08:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (35, N'4984511/28/2021 9:08:11 PM', 6, CAST(N'2021-11-28 21:08:00' AS SmallDateTime), CAST(N'2021-11-28 21:08:00' AS SmallDateTime), N'Cát mình pc -bd', N'Nguyễn Văn Hưng', N'0377377794', N'Vanhung3339@gmail.com', N'Cổng thanh toán Paypal', 1, CAST(N'2021-11-28 21:08:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (36, N'3800511/28/2021 9:23:41 PM', 6, CAST(N'2021-11-28 21:24:00' AS SmallDateTime), CAST(N'2021-11-28 21:24:00' AS SmallDateTime), N'Cát mình pc -bd', N'Nguyễn Văn Hưng', N'0377377794', N'Vanhung3339@gmail.com', N'Cổng thanh toán Paypal', 2, CAST(N'2021-11-28 21:24:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (37, N'4331511/28/2021 9:24:38 PM', 6, CAST(N'2021-11-28 21:25:00' AS SmallDateTime), CAST(N'2021-11-28 21:25:00' AS SmallDateTime), N'Cát mình pc -bd', N'Nguyễn Văn Hưng', N'0377377794', N'Vanhung3339@gmail.com', N'Cổng thanh toán Paypal', 2, CAST(N'2021-11-28 21:25:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (38, N'4319111/28/2021 9:29:05 PM', 6, CAST(N'2021-11-28 21:29:00' AS SmallDateTime), CAST(N'2021-11-28 21:29:00' AS SmallDateTime), N'Cát mình pc -bd', N'Nguyễn Văn Hưng', N'0377377794', N'Vanhung3339@gmail.com', N'Cổng thanh toán Paypal', 2, CAST(N'2021-11-28 21:29:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (39, N'7988911/28/2021 9:30:06 PM', 6, CAST(N'2021-11-28 21:30:00' AS SmallDateTime), CAST(N'2021-11-28 21:30:00' AS SmallDateTime), N'Cát mình pc -bd', N'Nguyễn Văn Hưng', N'0377377794', N'Vanhung3339@gmail.com', N'Cổng thanh toán Paypal', 2, CAST(N'2021-11-28 21:30:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (40, N'6469811/28/2021 9:30:45 PM', 6, CAST(N'2021-11-28 21:31:00' AS SmallDateTime), CAST(N'2021-11-28 21:31:00' AS SmallDateTime), N'Cát mình pc -bd', N'Nguyễn Văn Hưng', N'0377377794', N'Vanhung3339@gmail.com', N'Cổng thanh toán Paypal', 1, CAST(N'2021-11-28 21:31:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (41, N'7915611/29/2021 9:35:56 PM', 16, CAST(N'2021-11-29 21:36:00' AS SmallDateTime), CAST(N'2021-11-29 21:36:00' AS SmallDateTime), N'hcm', N'Minh Nhat', N'0329328923', N'minhnhat12@gmail.com', N'COD', 2, CAST(N'2021-11-29 21:47:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (42, N'8331411/29/2021 9:37:02 PM', 16, CAST(N'2021-11-29 21:37:00' AS SmallDateTime), CAST(N'2021-11-29 21:37:00' AS SmallDateTime), N'hcm', N'Minh Nhat', N'0377377794', N'Vanhung3339@gmail.com', N'Cổng thanh toán Paypal', 1, CAST(N'2021-11-29 21:47:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (43, N'1544111/29/2021 9:39:57 PM', 16, CAST(N'2021-11-29 21:40:00' AS SmallDateTime), CAST(N'2021-11-29 21:40:00' AS SmallDateTime), N'hcm', N'Minh Nhat', N'0377377794', N'Vanhung3339@gmail.com', N'Cổng thanh toán Ngân Lượng', 2, CAST(N'2021-11-29 21:47:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[order] ([ID], [code], [userid], [created_ate], [exportdate], [deliveryaddress], [deliveryname], [deliveryphone], [deliveryemail], [deliveryPaymentMethod], [StatusPayment], [updated_at], [updated_by], [status]) VALUES (44, N'9816711/29/2021 9:41:40 PM', 16, CAST(N'2021-11-29 21:42:00' AS SmallDateTime), CAST(N'2021-11-29 21:42:00' AS SmallDateTime), N'ád', N'Minh Nhat', N'0377377794', N'Vanhung3339@gmail.com', N'ATM Online qua ngân lượng', 1, CAST(N'2021-11-29 21:42:00' AS SmallDateTime), 1, 2)
SET IDENTITY_INSERT [dbo].[order] OFF
SET IDENTITY_INSERT [dbo].[ordersdetail] ON 

INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (156, 31, 32, 150000, 1, 10, 135000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (157, 32, 32, 150000, 1, 10, 135000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (158, 33, 32, 150000, 1, 10, 135000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (159, 34, 32, 150000, 1, 10, 135000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (160, 35, 32, 150000, 1, 10, 135000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (161, 36, 33, 750000, 1, 10, 675000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (162, 36, 32, 150000, 1, 10, 135000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (163, 36, 31, 50000, 1, 0, 50000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (164, 37, 33, 750000, 1, 10, 675000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (165, 37, 32, 150000, 1, 10, 135000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (166, 37, 31, 50000, 1, 0, 50000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (167, 38, 33, 750000, 1, 10, 675000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (168, 38, 32, 150000, 1, 10, 135000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (169, 38, 31, 50000, 1, 0, 50000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (170, 39, 33, 750000, 2, 10, 600000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (171, 40, 33, 750000, 6, 10, 300000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (172, 40, 32, 150000, 3, 10, 105000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (173, 40, 31, 50000, 1, 0, 50000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (174, 40, 30, 100000, 1, 0, 100000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (175, 41, 29, 199000, 1, 0, 199000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (176, 41, 32, 150000, 2, 10, 120000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (177, 42, 33, 750000, 1, 10, 675000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (178, 43, 30, 100000, 1, 0, 100000)
INSERT [dbo].[ordersdetail] ([ID], [orderid], [productid], [price], [quantity], [priceSale], [amount]) VALUES (179, 44, 30, 100000, 1, 0, 100000)
SET IDENTITY_INSERT [dbo].[ordersdetail] OFF
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([ID], [topid], [title], [slug], [detail], [img], [type], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (26, 16, N'Hướng dẫn cách làm nem chua Thanh Hóa công thức chuẩn', N'huong-dan-cach-lam-nem-chua-thanh-hoa-cong-thuc-chuan', N'<div data-v-bfbcefa4="" class="top-img" style="outline: none; word-break: break-word; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, &quot;Droid Sans&quot;, Arial, sans-serif; font-size: 15px;"><h2 style="color: rgb(10, 10, 10); width: 779.1px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Roboto, sans-serif;"><p style="margin-bottom: 1.3em; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;">Hướng dẫn cách làm Nem chua Thanh Hóa chuẩn công thức người Thanh Hóa chia sẻ.</p></h2><h2 style="color: rgb(85, 85, 85); width: 772.5px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 700; text-align: center;"><span style="font-weight: bolder;">CÔNG THỨC, CÁCH LÀM NEM CHUA THANH HÓA</span></h2><h2 style="color: rgb(10, 10, 10); width: 779.1px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Roboto, sans-serif;"><p style="margin-bottom: 1.3em; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px; text-align: justify;">Nem chua Thanh Hóa là món ăn được nhiều người yêu thích.</p></h2></div>', N'tintuc/huong-dan-cach-lam-nem-chua-thanh-hoa-cong-thuc-chuan.jpg', NULL, N'metakey', N'metadesc', CAST(N'2019-02-15 00:00:00' AS SmallDateTime), 1, CAST(N'2021-04-01 21:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[post] ([ID], [topid], [title], [slug], [detail], [img], [type], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (29, 1, N'Giới thiệu1', N'gioi-thieu1', N'<header class="entry-header" style="color: rgb(40, 40, 40); font-family: Roboto, sans-serif;"><div class="entry-header-text entry-header-text-top text-left" style="padding: 0px 0px 1.5em;"><h6 class="entry-category is-xsmall" style="color: rgb(10, 10, 10); width: 786px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 0.7em; opacity: 0.8; line-height: 1.05; letter-spacing: 0.05em; text-transform: uppercase; font-family: Roboto, sans-serif;"><p class="lead text-center" style="margin-bottom: 1.3em; text-align: justify; font-size: 1.3em; font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: normal; text-transform: none;"><span style="font-weight: bolder;">Cửa hàng nông sản sạch shopnongsansach.com</span>&nbsp;là một website cung cấp thực phẩm an toàn, nông sản sạch cho người dân. Với mong muốn mang tới mọi&nbsp;gia đình những thực phẩm an toàn nhất trước mối lo ngại về thực phẩm bẩn tại Việt Nam.</p><p class="lead text-center" style="margin-bottom: 1.3em; text-align: justify; font-size: 1.3em; font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: normal; text-transform: none;">Cùng chung tay xây dựng một cuộc sống an toàn và chất lượng cho người dân Việt Nam</p></h6></div></header>', N'gioithieu/gioi-thieu.jpg', NULL, N'a', N'a', CAST(N'2020-10-31 13:59:00' AS SmallDateTime), 1, CAST(N'2021-04-01 21:02:00' AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[post] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (29, 23, 19, N'TÁO XANH 1KG', N'tao-xanh-1kg', N'tao/tao-xanh-1kg.jpg', N'Đang cập nhật', 97, 199000, 0, N'TÁO XANH', N'TÁO XANH', CAST(N'2021-11-28 12:49:00' AS SmallDateTime), 1, CAST(N'2021-11-28 12:49:00' AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (30, 23, 0, N'TÁO ROCKIT SIZE S', N'tao-rockit-size-s', N'tao/tao-rockit-size-s.jpeg', N'<br>', 96, 100000, 0, N'TÁO ROCKIT SIZE S', N'TÁO ROCKIT SIZE S', CAST(N'2021-11-28 12:53:00' AS SmallDateTime), 1, CAST(N'2021-11-28 12:56:00' AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (31, 23, 0, N'TÁO AMBROSIA 500G', N'tao-ambrosia-500g', N'tao/tao-ambrosia-500g.jpg', N'<br>', 94, 50000, 0, N'TÁO AMBROSIA 500G', N'TÁO AMBROSIA 500G', CAST(N'2021-11-28 12:55:00' AS SmallDateTime), 8, CAST(N'2021-11-28 12:56:00' AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (32, 23, 0, N'TÁO ROCKIT', N'tao-rockit', N'tao/tao-rockit.jpg', N'<h1 class="headTitle" id="text-ten" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.25em; font-family: &quot;Open Sans&quot;, sans-serif; line-height: 1.1; color: rgb(26, 66, 0); text-transform: capitalize; border-bottom: 1px solid rgb(218, 226, 217); padding-bottom: 10px;">TÁO ROCKIT</h1>', 78, 150000, 10, N'TÁO ROCKIT', N'TÁO ROCKIT', CAST(N'2021-11-28 13:02:00' AS SmallDateTime), 1, CAST(N'2021-11-28 20:42:00' AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (33, 19, 0, N'KIWI XANH 500G', N'kiwi-xanh-500g', N'traicaykho/kiwi-xanh-500g.jpg', N'<h1 class="headTitle" id="text-ten" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.25em; font-family: &quot;Open Sans&quot;, sans-serif; line-height: 1.1; color: rgb(26, 66, 0); text-transform: capitalize; border-bottom: 1px solid rgb(218, 226, 217); padding-bottom: 10px;">KIWI XANH 500G</h1>', 88, 750000, 10, N'KIWI XANH 500G', N'KIWI XANH 500G', CAST(N'2021-11-28 21:12:00' AS SmallDateTime), 1, CAST(N'2021-11-28 21:12:00' AS SmallDateTime), 1, 1, 0)
INSERT [dbo].[product] ([ID], [catid], [Submenu], [name], [slug], [img], [detail], [number], [price], [pricesale], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status], [sold]) VALUES (35, 20, 0, N'Cam', N'cam', N'traicaytuoi/cam.', N'<p>cam ngọt</p>', 100, 150000, 2, NULL, NULL, CAST(N'2021-11-29 21:44:00' AS SmallDateTime), 1, CAST(N'2021-11-29 21:44:00' AS SmallDateTime), 1, 1, 0)
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([ID], [parentId], [accessName], [description], [GropID]) VALUES (1, 0, N'ADMIN', N'Quản trị viên Full quyền', N'ADMIN')
INSERT [dbo].[role] ([ID], [parentId], [accessName], [description], [GropID]) VALUES (2, 1, N'CUSTOMER', N'Khách hàng', N'CUSTOMER')
INSERT [dbo].[role] ([ID], [parentId], [accessName], [description], [GropID]) VALUES (3, 2, N'ACCOUNTANT', N'Kế toán, thống kê', N'ACCOUNTANT')
INSERT [dbo].[role] ([ID], [parentId], [accessName], [description], [GropID]) VALUES (7, 3, N'SALESMAN', N'Nhân viên bán hàng', N'SALESMAN')
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[slider] ON 

INSERT [dbo].[slider] ([ID], [name], [url], [position], [img], [orders], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (3, N'Slider3333', N'slider3333', N'SliderShow', N'slider3333.jpg', 1, CAST(N'2019-03-15 00:00:00' AS SmallDateTime), 1, CAST(N'2021-11-28 13:04:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[slider] ([ID], [name], [url], [position], [img], [orders], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (8, N'dddddd', N'dddddd', N'SliderShow', N'dddddd.jpg', 1, CAST(N'2020-10-31 13:49:00' AS SmallDateTime), 1, CAST(N'2021-11-28 13:05:00' AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[slider] OFF
SET IDENTITY_INSERT [dbo].[topic] ON 

INSERT [dbo].[topic] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (1, N'Giới Thiệu', N'gioi-thieu', 0, 1, N'metakey', N'metadesc', CAST(N'2019-03-15 00:00:00' AS SmallDateTime), 9, CAST(N'2019-11-26 13:12:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[topic] ([ID], [name], [slug], [parentid], [orders], [metakey], [metadesc], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (16, N'Tin Tức', N'tin-tuc', 0, 1, N'a', N'a', CAST(N'2020-10-31 13:57:00' AS SmallDateTime), 1, CAST(N'2020-10-31 13:57:00' AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[topic] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([ID], [fullname], [username], [password], [email], [gender], [phone], [img], [access], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (1, N'Nguyễn Văn A', N'admin', N'4QrcOUm6Wau+VuBX8g+IPg==', N'abc@gmail.com', N'Nam', N'0975271384', N'ádasd', 0, CAST(N'2021-04-01 21:11:00' AS SmallDateTime), 1, CAST(N'2021-04-01 21:11:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[user] ([ID], [fullname], [username], [password], [email], [gender], [phone], [img], [access], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (6, N'Nguyễn Văn A', N'khachhang1', N'4QrcOUm6Wau+VuBX8g+IPg==', N'abc@gmail.com', N'Nam', N'333333333333333', N'ádasd', 1, CAST(N'2021-11-28 21:09:00' AS SmallDateTime), 6, CAST(N'2021-11-28 21:09:00' AS SmallDateTime), 6, 1)
INSERT [dbo].[user] ([ID], [fullname], [username], [password], [email], [gender], [phone], [img], [access], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (8, N'Nguyễn Văn A', N'khachhang2', N'4QrcOUm6Wau+VuBX8g+IPg==', N'abc@gmail.com', N'Nam', N'1231231231', N'ádasd', 1, CAST(N'2020-05-08 16:43:00' AS SmallDateTime), 1, CAST(N'2020-08-20 11:25:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[user] ([ID], [fullname], [username], [password], [email], [gender], [phone], [img], [access], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (11, N'Nguyễn Văn A', N'Accountant', N'4QrcOUm6Wau+VuBX8g+IPg==', N'abc@gmail.com', N'nu', N'13212123', N'132121', 2, CAST(N'2020-05-07 00:00:00' AS SmallDateTime), 1, CAST(N'2020-08-20 11:16:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[user] ([ID], [fullname], [username], [password], [email], [gender], [phone], [img], [access], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (13, N'Nguyễn Văn A', N'Salesman', N'4QrcOUm6Wau+VuBX8g+IPg==', N'abc@gmail.com', N'Nam', N'13212123', N'ádasd', 3, CAST(N'2020-05-07 00:00:00' AS SmallDateTime), 1, CAST(N'2020-08-20 11:20:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[user] ([ID], [fullname], [username], [password], [email], [gender], [phone], [img], [access], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (14, N'Nguyễn Văn A', N'khachhang123', N'4QrcOUm6Wau+VuBX8g+IPg==', N'abc@gmail.com', N'Nam', N'0975271384', N'ádasd', 1, CAST(N'2020-05-08 16:49:00' AS SmallDateTime), 1, CAST(N'2020-05-08 16:49:00' AS SmallDateTime), 1, 0)
INSERT [dbo].[user] ([ID], [fullname], [username], [password], [email], [gender], [phone], [img], [access], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (15, N'Nguyễn Văn A', N'khachhang112', N'i5YoL5fbmnteeBT/9l4G1A==', N'abc@gmail.com', N'nam', N'0975271384', N'defalt.png', 1, CAST(N'2020-06-12 09:45:00' AS SmallDateTime), 1, CAST(N'2020-08-20 11:20:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[user] ([ID], [fullname], [username], [password], [email], [gender], [phone], [img], [access], [created_at], [created_by], [updated_at], [updated_by], [status]) VALUES (16, N'Huynh Minh Nhat', N'minhnhat123', N'JfnnlDI7RTiF9RgfG2JNCw==', N'minhnhat12@gmail.com', N'nam', N'092399322', N'defalt.png', 1, CAST(N'2021-11-29 21:33:00' AS SmallDateTime), 1, CAST(N'2021-11-29 21:33:00' AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [FK_slidqa111] FOREIGN KEY([created_by])
REFERENCES [dbo].[user] ([ID])
GO
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [FK_slidqa111]
GO
ALTER TABLE [dbo].[contact]  WITH CHECK ADD  CONSTRAINT [FK_contact_userId] FOREIGN KEY([created_by])
REFERENCES [dbo].[user] ([ID])
GO
ALTER TABLE [dbo].[contact] CHECK CONSTRAINT [FK_contact_userId]
GO
ALTER TABLE [dbo].[menu]  WITH CHECK ADD  CONSTRAINT [FK_menu_to_userId] FOREIGN KEY([created_by])
REFERENCES [dbo].[user] ([ID])
GO
ALTER TABLE [dbo].[menu] CHECK CONSTRAINT [FK_menu_to_userId]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_to_user] FOREIGN KEY([userid])
REFERENCES [dbo].[user] ([ID])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_to_user]
GO
ALTER TABLE [dbo].[ordersdetail]  WITH CHECK ADD  CONSTRAINT [FK_orderDetailToProduct] FOREIGN KEY([orderid])
REFERENCES [dbo].[order] ([ID])
GO
ALTER TABLE [dbo].[ordersdetail] CHECK CONSTRAINT [FK_orderDetailToProduct]
GO
ALTER TABLE [dbo].[ordersdetail]  WITH CHECK ADD  CONSTRAINT [FK_prd_prd] FOREIGN KEY([productid])
REFERENCES [dbo].[product] ([ID])
GO
ALTER TABLE [dbo].[ordersdetail] CHECK CONSTRAINT [FK_prd_prd]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_to_topic] FOREIGN KEY([topid])
REFERENCES [dbo].[topic] ([ID])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_to_topic]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_slidqa] FOREIGN KEY([created_by])
REFERENCES [dbo].[user] ([ID])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_slidqa]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_to_catId] FOREIGN KEY([catid])
REFERENCES [dbo].[category] ([ID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_to_catId]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_slider_2] FOREIGN KEY([created_by])
REFERENCES [dbo].[user] ([ID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_slider_2]
GO
ALTER TABLE [dbo].[slider]  WITH CHECK ADD  CONSTRAINT [FK_slider_userId] FOREIGN KEY([created_by])
REFERENCES [dbo].[user] ([ID])
GO
ALTER TABLE [dbo].[slider] CHECK CONSTRAINT [FK_slider_userId]
GO
