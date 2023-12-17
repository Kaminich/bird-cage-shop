USE [master]
GO
/****** Object:  Database [BCS_SWP391]    Script Date: 12/13/2023 8:42:19 PM ******/
CREATE DATABASE [BCS_SWP391]
GO
ALTER DATABASE [BCS_SWP391] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BCS_SWP391].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BCS_SWP391] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BCS_SWP391] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BCS_SWP391] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BCS_SWP391] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BCS_SWP391] SET ARITHABORT OFF 
GO
ALTER DATABASE [BCS_SWP391] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BCS_SWP391] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BCS_SWP391] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BCS_SWP391] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BCS_SWP391] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BCS_SWP391] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BCS_SWP391] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BCS_SWP391] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BCS_SWP391] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BCS_SWP391] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BCS_SWP391] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BCS_SWP391] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BCS_SWP391] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BCS_SWP391] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BCS_SWP391] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BCS_SWP391] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BCS_SWP391] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BCS_SWP391] SET RECOVERY FULL 
GO
ALTER DATABASE [BCS_SWP391] SET  MULTI_USER 
GO
ALTER DATABASE [BCS_SWP391] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BCS_SWP391] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BCS_SWP391] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BCS_SWP391] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BCS_SWP391] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BCS_SWP391] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BCS_SWP391] SET QUERY_STORE = ON
GO
ALTER DATABASE [BCS_SWP391] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BCS_SWP391]
GO
/****** Object:  Table [dbo].[Bird]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bird](
	[BirdID] [nvarchar](10) NOT NULL,
	[BirdSize] [nvarchar](10) NOT NULL,
	[BirdType] [nvarchar](10) NOT NULL,
	[BirdName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Bird] PRIMARY KEY CLUSTERED 
(
	[BirdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BirdProduct]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BirdProduct](
	[BirdID] [nvarchar](10) NOT NULL,
	[ProductID] [nvarchar](10) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_BirdProduct] PRIMARY KEY CLUSTERED 
(
	[BirdID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BirdType]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BirdType](
	[BirdTypeID] [nvarchar](10) NOT NULL,
	[BirdTypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_BirdType] PRIMARY KEY CLUSTERED 
(
	[BirdTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [nvarchar](10) NOT NULL,
	[UserID] [nvarchar](10) NOT NULL,
	[BlogTitle] [nvarchar](100) NOT NULL,
	[BlogSummary] [nvarchar](200) NOT NULL,
	[BlogContent] [nvarchar](max) NOT NULL,
	[BlogType] [nvarchar](50) NOT NULL,
	[CreateAt] [date] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [nvarchar](10) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryProduct]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryProduct](
	[CategoryID] [nvarchar](10) NOT NULL,
	[ProductID] [nvarchar](10) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_CategoryProduct] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ColorID] [nvarchar](10) NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[ColorName] [nvarchar](30) NOT NULL,
	[MaterialID] [nvarchar](10) NULL,
	[IsCustom] [bit] NOT NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ColorProduct]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColorProduct](
	[ProductID] [nvarchar](10) NOT NULL,
	[ColorID] [nvarchar](10) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ColorProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[FeedbackID] [nvarchar](10) NOT NULL,
	[UserID] [nvarchar](10) NOT NULL,
	[ProductID] [nvarchar](10) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[FeedbackContent] [nvarchar](max) NULL,
	[Rating] [nchar](1) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ImageID] [nvarchar](10) NOT NULL,
	[BlogID] [nvarchar](10) NULL,
	[ProductID] [nvarchar](10) NULL,
	[StyleID] [nvarchar](10) NULL,
	[SizeID] [nvarchar](10) NULL,
	[MaterialID] [nvarchar](10) NULL,
	[BirdID] [nvarchar](10) NULL,
	[ImageURL] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[MaterialID] [nvarchar](10) NOT NULL,
	[MaterialName] [nvarchar](50) NOT NULL,
	[SizeID] [nvarchar](10) NULL,
	[IsCustom] [bit] NOT NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialProduct]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialProduct](
	[ProductID] [nvarchar](10) NOT NULL,
	[MaterialID] [nvarchar](10) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_MaterialProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
	
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [nvarchar](10) NOT NULL,
	[UserID] [nvarchar](10) NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[total] [decimal](18, 0) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [nvarchar](10) NOT NULL,
	[ProductID] [nvarchar](10) NOT NULL,
	[FeedbackID] [nvarchar](10) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Status] [bit] NOT NULL,
	[IsCustom] [bit] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [nvarchar](50) NOT NULL,
	[OrderID] [nvarchar](10) NOT NULL,
	[DateTime] [date] NULL,
	[amout] [decimal](18, 0) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Status] [bit] NOT NULL,
	[TransactionCode] [nvarchar](max) NULL,
	[vnp_TransDate] [nvarchar](max) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [nvarchar](10) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Discount] [int] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCustom]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCustom](
	[ProductCustomID] [nvarchar](10) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProductSize] [nvarchar](10) NULL,
	[ProductColor] [nvarchar](10) NULL,
	[ProductMaterial] [nvarchar](10) NULL,
	[ProductStyle] [nvarchar](10) NULL,
	[UserID] [nvarchar](10) NOT NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ProductCustom] PRIMARY KEY CLUSTERED 
(
	[ProductCustomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [nvarchar](10) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeID] [nvarchar](10) NOT NULL,
	[Size] [nvarchar](50) NOT NULL,
	[SizeDescription] [nvarchar](50) NULL,
	[StyleID] [nvarchar](10) NULL,
	[IsCustom] [bit] NOT NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SizeProduct]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SizeProduct](
	[ProductID] [nvarchar](10) NOT NULL,
	[SizeID] [nvarchar](10) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_SizeProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Style]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Style](
	[StyleID] [nvarchar](10) NOT NULL,
	[StyleName] [nvarchar](30) NOT NULL,
	[StyleDescription] [nvarchar](200) NULL,
	[Status] [bit] NOT NULL,
	[IsCustom] [bit] NOT NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Style] PRIMARY KEY CLUSTERED 
(
	[StyleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StyleProduct]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StyleProduct](
	[StyleID] [nvarchar](10) NOT NULL,
	[ProductID] [nvarchar](10) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_StyleProduct] PRIMARY KEY CLUSTERED 
(
	[StyleID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [nvarchar](10) NOT NULL,
	[RoleID] [nvarchar](10) NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[DateOfBird] [date] NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[Email] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[VoucherID] [nvarchar](10) NOT NULL,
	[VoucherName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Discount] [nvarchar](50) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CreateAt] [date] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoucherUserOrder]    Script Date: 12/13/2023 8:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoucherUserOrder](
	[VoucherID] [nvarchar](10) NOT NULL,
	[OrderID] [nvarchar](10) NOT NULL,
	[UserID] [nvarchar](10) NOT NULL,
	[UseDate] [date] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_VoucherUserOrder] PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC,
	[OrderID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0001', N'Si0001', N'BT0005', N'Chào Mào', 
N'Chào mào là một loài chim thuộc bộ Sẻ phân bố ở châu Á. 
Nó là một thành viên của họ Chào mào. 
Nó là một loài động vật ăn quả thường trú được tìm thấy chủ yếu ở châu Á nhiệt đới. 
Nó đã được đưa bởi con người vào nhiều khu vực nhiệt đới trên thế giới, nơi các quần thể đã tự hình thành. 
Nó ăn trái cây và côn trùng nhỏ.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0002', N'SiB0002', N'BT0001', N'Vẹt Quaker', 
N'Vẹt Quaker (hay còn gọi là vẹt thầy tu) là một loài chim nhỏ có màu chủ đạo là xanh lá tươi, phía ngoài của cánh có màu lam, 
ngực được phủ lông màu xám trắng và bụng màu vàng xanh. Chúng có kích thước trưởng thành khoảng 30cm từ mỏ đến đuôi, nặng từ 110-150gram. 
Vẹt Quaker được biết đến với tính cách quyến rũ, hài hước và sẵn sàng học cách nói của con người. 
Chúng là một sự lựa chọn tuyệt vời cho những người yêu chim, những người muốn có tất cả niềm vui của một con vẹt lớn trong một chú vẹt nhỏ hơn.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0003', N'SiB0001', N'BT0001', N'Vẹt Parrotlet', 
N'Vẹt Parrotlet là một loài chim nhỏ nhất trong họ vẹt, có chiều dài khoảng 10-12 cm và nặng từ 18 - 30g. 
Chúng có màu sắc xanh nước biển, xanh lá cây hoặc vàng, thân hình cân đối, đầu to, lông ngắn và cụt. 
Mắt có màu đen, xung quanh viền có màu trắng đục. Chúng là loài chim nhiệt đới, sinh sống chủ yếu từ những cánh rừng rậm tại Equateur, Bresil, Perou hay Islands, Mexico, South America. 
Vẹt Parrotlet có khả năng nói và ghi nhớ từ ngữ rất tốt, chúng có thể học được khoảng 100 từ khi được huấn luyện thuần thục.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0004', N'SiB0002', N'BT0001', N'Vẹt Mini Macaw', 
N'Vẹt Mini Macaw là một loài chim thuộc họ Nam Mỹ Macaw, có tên khoa học là Hahn’s Macaw. 
Chúng có chiều dài khoảng 30 - 35 cm, nặng khoảng 165 - 175g và tuổi thọ trung bình từ 30 - 50 năm. 
Vẹt Mini Macaw có màu lông xanh lá và đỏ, chân đen và mỏ đen. 
Chúng rất thông minh và nổi bật với khả năng nói rất tốt nên vẫn là một lựa chọn tốt cho những người yêu chim muốn có vẹt đuôi dài nhưng chưa sẵn sàng đón tiếp một thành viên quá to lớn.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0005', N'SiB0001', N'BT0001', N'Vẹt Lovebird', 
N'Vẹt Lovebird là một loài chim nhỏ, có chiều dài khoảng 14 cm và nặng từ 35 - 58g. 
Chúng có màu sắc đa dạng, thân hình cân đối, đầu nhỏ, lông dày và dài. Mắt có màu đen, xung quanh viền có màu trắng đục. 
Chúng là loài chim nhiệt đới, sinh sống chủ yếu tại châu Phi, bao gồm Ethiopia, Kenya, Tanzania, Nam Phi và Angola. 
Vẹt Lovebird có khả năng học được một số từ khi được huấn luyện thuần thục.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0006', N'SiB0002', N'BT0001', N'Vẹt Jardine', 
N'Vẹt Jardine là một giống vẹt thông minh và thân thiện, được nuôi như một loại thú cưng tuyệt vời. 
Chúng có bản tính hoang dã mà không phải động vật được thuần hóa (như chó mèo), do đó chúng vẫn giữ nhiều hành vi và bản năng giống như họ hàng hoang dã của chúng. 
Vẹt Jardine có thể học nói và học các hành vi mới rất nhanh. 
Chúng có thể sống đến 60-80 năm.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0007', N'SiB0002', N'BT0002', N'Bồ Câu', 
N'Bồ Câu là một loài chim mập mạp có cổ ngắn và mỏ dài mảnh khảnh, là loài có bộ lông màu trắng tinh khôi, thường được biểu tượng hóa về tình yêu.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0008', N'SiB0003', N'BT0001', N'Vẹt Cockatoo', 
N'Vẹt mào Cockatoo, còn được gọi tắt là vẹt Cockatoo, là loài vẹt nổi bật nhất trong họ nhà Cockatoo1. 
Vẹt Cockatoo có kích thước từ trung bình đến lớn, chiều cao trung bình của một con vẹt Cockatoo là 40 – 50cm. 
Bên ngoài của vẹt được phủ một lớp lông màu trắng, xung quanh mắt có lớp da mắt màu xanh, đôi mắt nâu đen, mỏ có màu xám đen hoặc màu sẫm. 
Vẹt Cockatoo được mô tả là loài chim thông minh, tình cảm nhưng hay bị nhạy cảm. 
Chúng là loài có phần quấn quýt, âu yếm và gắn bó chặt chẽ với chủ nhân của họ. 
Vẹt Cockatoo là dạng vẹt khó nuôi hơn một chút so với những loài như vẹt Macaw, vẹt xám Châu Phi, hay vẹt cockatiel.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0009', N'SiB0002', N'BT0001', N'Vẹt Cockatiel', 
N'Vẹt Cockatiel là một loài chim vẹt được nhiều người yêu thích trên thế giới và cả Việt Nam. 
Chúng có bộ lông màu xám đặc trưng, nhúm lông màu vàng nhạt giống như một chiếc mào trên đỉnh đầu và hai nhúm lông đỏ ở hai bên má. 
Vẹt Cockatiel có chiều dài trung bình khoảng 30cm và có thể sống khoảng 25 năm đến 50 năm trong điều kiện nuôi nhốt tốt,
là loài chim thông minh và tinh nghịch. Chúng có khả năng bắt chước giọng nói tốt và thường thích được tương tác với chủ nhân của mình.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0010', N'SiB0002', N'BT0001', N'Vẹt Caique', 
N'Vẹt Caique là là một trong những loài vẹt năng động nhất, khá tò mò và tinh nghịch, cũng như một loài chim nhỏ sinh động và rất thú vị. 
Chúng được biết đến là những chú hề của thế giới loài chim. 
Caiques đã dễ dàng tạo được chỗ đứng cho mình trong ngôi nhà và trái tim của vô số những người đam mê chim.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0011', N'SiB0003', N'BT0001', N'Vẹt Amazon', 
N'Vẹt Amazon là một loài chim tương đối lớn, có kích thước từ 9 – 18 inch. 
Màu lông của chúng chủ yếu là xanh lá cây, xen kẽ với các màu như đốm đỏ, xanh lam, tím hoặc vàng. 
Chúng có cái đuôi tròn và đôi cánh khá ngắn so với nhiều loài vẹt khác. 
Vẹt Amazon có cái mỏ tròn, cứng cáp để có thể nghiền nát các loại hạt cứng. 
Vẹt Amazon sống thành đàn và cùng làm tổ trong một khu vực. Mục đích của hành vi này là bảo vệ nhau khỏi những kẻ săn mồi. 
Giọng của vẹt Amazon khá đa dạng và có thể khá lớn. Chúng thường la hét, rít, gầm gừ, kêu lạch cạch và kêu ken két. 
Tuổi thọ của vẹt Amazon có thể dài tới hàng thế kỷ.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0012', N'SiB0002', N'BT0001', N'Vẹt Senegal', 
N'Vẹt Senegal là một loài vẹt cỡ nhỏ có màu sắc rực rỡ và được ưa chuộng tại Việt Nam nhờ trí thông minh cao và tính cách hiền lành, yên tĩnh. 
Chúng thích hợp làm thú cưng trong nhà và có kích thước nhỏ, không cần một chiếc lồng quá lớn. 
Vẹt Senegal có thể ăn nhiều loại thức ăn khác nhau, trong đó bao gồm các loại quả, hạt cây, mầm cây và các loại hạt khô tổng hợp.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0013', N'SiB0002', N'BT0001', N'Vẹt Pionus', 
N'Vẹt Pionus là một loài vẹt cỡ nhỏ đến trung bình có nguồn gốc từ Trung và Nam Mỹ. 
Chúng có chiều dài từ 8 đến 12 inch (thường không lớn hơn 10 inch), có nhiều màu sắc đẹp mắt. 
Có nhiều loài vẹt Pionus khác nhau, bao gồm Vẹt đuôi dài đầu xanh, Vẹt xanh, Vẹt trán trắng, Vẹt đốm, Vẹt ngực đỏ và Vẹt bụng xanh. 
Chúng là những con vẹt thông minh, thân thiện và dễ nuôi.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0014', N'SiB0002', N'BT0001', N'Vẹt Parakeet', 
N'Vẹt Parakeet là một loài chim nhỏ đến vừa, có lông đuôi dài và sống ở nhiều khu vực trên thế giới. 
Vẹt Parakeet được biết đến với tính cách thân thiện, hòa đồng và sẵn sàng học cách nói của con người. 
Chúng có màu sắc đa dạng, từ xanh lá cây đến vàng, đỏ và cam. Một trong những loài vẹt Parakeet phổ biến nhất là Monk Parakeet. 
Monk Parakeet là một loài vẹt nhỏ có màu chủ đạo là xanh lá tươi, phía ngoài của cánh có màu lam, ngực được phủ lông màu xám trắng và bụng màu vàng xanh. 
Chúng là loài vẹt duy nhất làm tổ bên ngoài cây thay vì khoét 1 lỗ hốc cây như các loài khác2. Tính cách của Monk Parakeet rất tự tin và thân thiện. 
Chúng có một tâm hồn lớn trong một cơ thể bé nhỏ nên được biết đến là một trong những loài vẹt tuyệt vời để nuôi.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0015', N'SiB0003', N'BT0001', N'Vẹt Macaw', 
N'Vẹt Macaw (phát âm tiếng Việt như là Vẹt Mắc-ca) là một tập hợp đa dạng các loài vẹt có đuôi dài, từ nhỏ đến lớn, thường sặc sỡ màu sắc và thuộc về phân họ Vẹt Tân thế giới Arinae phân bố phần lớn ở Nam Mỹ. 
Vẹt Macaw có mỏ lớn, lông sáng, đuôi dài và các đốm sáng hoặc trắng trên mặt. 
Các loài vẹt này thường to lớn, tối màu (thường là màu đen), đôi khi có các bản vá trên khuôn mặt nhỏ trong một số loài.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0016', N'SiB0002', N'BT0001', N'Vẹt Lorikeet', 
N'Vẹt Lorikeet, còn được gọi là vẹt Lory, là một loài chim sặc sỡ với bộ lông rực rỡ màu sắc. 
Chúng có chiếc mỏ to, sắc nhọn và có cấu trúc hơi hẹp hơn so với hầu hết các loài vẹt. 
Kích thước của chúng rất đa dạng, tùy theo loài mà Lorikeet dài từ 5 – 13 inch (tính từ đầu đến đuôi). 
Vẹt Lorikeet sống trong các khu rừng ngập mặn và rừng bạch đàn trên khắp nước Úc và một số khu vực Đông Nam Á. 
Chúng thích nghi tốt ở cả nhiệt độ nóng và lạnh. 
Vẹt Lorikeet không thường ăn hạt, thay vào đó chúng thích ăn hoa, quả, mật hoa và phấn hoa.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0017', N'SiB0001', N'BT0007', N'Chích Chòe', 
N'Chích chòe là tên gọi chung để chỉ một số loài chim kích thước trung bình, ăn sâu bọ (một số loài còn ăn cả các loại quả mọng và các loại quả khác) trong các chi Copsychus sensu lato và Enicurus. 
Trước đây chúng được phân loại trong họ Hoét (Turdidae), nhưng hiện nay thông thường hay được coi là một phần của họ Đớp ruồi (Muscicapidae). 
Các loài chim này sinh sống trong các cánh rừng và vườn ở châu Phi và châu Á.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0018', N'SiB0002', N'BT0001', N'Vẹt Sun Connure', 
N'Vẹt Sun Conure là một loài vẹt có nguồn gốc từ phía Đông Bắc của Nam Mỹ, ví dụ như các nước Venezuela, bắc Brazil và Guyana. 
Vẹt Sun Conure có kích thước khá nhỏ, chỉ khoảng 5 – 10cm, và được yêu thích bởi ngoại hình nổi bật, lông sáng và sặc sỡ. 
Màu lông của đạo của chúng là vàng sáng, đỏ cam, cùng màu xanh lục ở phần lưng và cánh. 
Còn xung quanh phần mắt của vẹt thì bao trọn bởi một màu trắng rất ấn tượng. Chiếc mỏ của vẹt Sun Conure có màu đen và quặp. 
Tính cách của vẹt Sun Conure rất năng động, nó có thể bắt chước được tiếng động xung quanh rất giỏi. 
Những tiếng kêu rít, the thé nhưng không quá chói tai. Nếu nuôi lâu, vẹt Sun Conure còn có thể tương tác với chủ nhân của nó rất tình cảm. 
Vậy nên, vẹt Sun Conure xứng đáng là một trong những loài chim cảnh được săn đón nhiều.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0019', N'SiB0001', N'BT0001', N'Vẹt Cockatoo nhỏ', 
N'Vẹt Cockatoo là một loài chim thông minh, tình cảm và dễ nuôi. 
Chúng có kích thước từ trung bình đến lớn, chiều cao trung bình của một con vẹt Cockatoo là 40 – 50cm. 
Vẹt Cockatoo được mô tả là loài chim có phần quấn quýt, âu yếm và gắn bó chặt chẽ với chủ nhân của chúng.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0020', N'SiB0001', N'BT0006', N'Họa Mi', 
N' Họa mi là một loài chim trong họ Leiothrichidae. 
Tên gọi họa mi nghĩa là "được vẽ lên mi mắt" để chỉ quầng lông sáng màu quanh mắt đặc trưng của loài. 
Họa mi có phân bố rộng khắp và không được coi là một loài bị đe dọa.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0021', N'SiB0001', N'BT0001', N'Vẹt Budgie', 
N'Vẹt Budgie, hay còn được gọi là yến phụng, là một loài chim nhỏ được nuôi làm thú cưng trên khắp thế giới. 
Chúng có màu sắc tươi sáng như xanh lá cây, vàng và xanh lam trên lông của chúng. Vẹt Budgie là loài duy nhất trong chi Melopsittacus.
Chúng là loài vẹt đuôi dài, ăn hạt thường có biệt danh là budgie, hay trong tiếng Anh Mỹ là parakeet. 
Về mặt tự nhiên, chúng có màu xanh lục và vàng với các mảng màu đen, hình vỏ sò ở gáy, lưng và cánh. 
Những con vẹt Budgie được lai tạo trong điều kiện nuôi nhốt có màu xanh lam, trắng, vàng, xám và thậm chí có cả mào nhỏ. 
Con non và con tuổi thành niên dị hình giới tính, trong khi con trưởng thành được phân biệt bởi màu sắc và hành vi của chúng.', 1)
INSERT [dbo].[Bird] ([BirdID], [BirdSize], [BirdType], [BirdName], [Description], [Status]) VALUES 
(N'B0022', N'SiB0003', N'BT0001', N'Vẹt Afican Grey', 
N'Vẹt Xám Châu Phi là một trong những loài chim thông minh và đáng yêu nhất trên thế giới. 
Chúng có khả năng nói trọn vẹn và hiểu những gì mình nói ra. 
Vẹt Xám Châu Phi có chiều dài trung bình từ 30 đến 35 cm và nặng khoảng 460 đến 500g. 
Vẹt Xám Châu Phi có bộ lông xám với màu đậm lợt xen kẽ khác nhau, phần cánh thì màu sẽ đậm hơn. 
Phần vòng mắt lông sẽ có màu trắng kèm theo phần đuôi đỏ có chiều dài vài cm.', 1)
GO
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0001', N'PDT001', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0001', N'PDT026', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0001', N'PDT027', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0001', N'PDT028', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0001', N'PDT004', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0001', N'PDT006', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0002', N'PDT001', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0002', N'PDT019', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0002', N'PDT020', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0002', N'PDT021', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0002', N'PDT004', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0002', N'PDT006', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0003', N'PDT001', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0003', N'PDT026', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0003', N'PDT027', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0003', N'PDT028', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0003', N'PDT004', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0003', N'PDT006', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0004', N'PDT001', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0004', N'PDT026', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0004', N'PDT027', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0004', N'PDT028', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0004', N'PDT004', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0004', N'PDT006', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0005', N'PDT001', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0005', N'PDT026', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0005', N'PDT027', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0005', N'PDT028', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0005', N'PDT004', 1)
INSERT [dbo].[BirdProduct] ([BirdID], [ProductID], [Status]) VALUES (N'B0005', N'PDT006', 1)
GO
INSERT [dbo].[BirdType] ([BirdTypeID], [BirdTypeName], [Description], [Status]) VALUES (N'BT0001', N'Vẹt', N'Vẹt', 1)
INSERT [dbo].[BirdType] ([BirdTypeID], [BirdTypeName], [Description], [Status]) VALUES (N'BT0002', N'Chim Bồ Câu', N'Chim Bồ Câu', 1)
INSERT [dbo].[BirdType] ([BirdTypeID], [BirdTypeName], [Description], [Status]) VALUES (N'BT0003', N'Chim sẻ', N'Chim sẻ', 1)
INSERT [dbo].[BirdType] ([BirdTypeID], [BirdTypeName], [Description], [Status]) VALUES (N'BT0004', N'Chim yến', N'Chim yến', 1)
INSERT [dbo].[BirdType] ([BirdTypeID], [BirdTypeName], [Description], [Status]) VALUES (N'BT0005', N'Chim Chào Mào', N'Chim Chào Mào', 1)
INSERT [dbo].[BirdType] ([BirdTypeID], [BirdTypeName], [Description], [Status]) VALUES (N'BT0006', N'Chim Họa Mi', N'Chim Họa Mi', 1)
INSERT [dbo].[BirdType] ([BirdTypeID], [BirdTypeName], [Description], [Status]) VALUES (N'BT0007', N'Chim Chích Choè', N'Chim Chích Choè', 1)
GO
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES (N'BO0001', N'US5b93e35', N'Suggestions for buy ornamental parrots for beginners', N'The hobby of pet birds is very popular today, it is not difficult to find an address to buy young…', N'To buy the right parrot for the player is really not easy, you need to research all the information related to it before making a decision to buy ornamental parrots. This article will suggest to help you choose which species to buy ornamental parrots for easy raising. This article will be quite helpful for beginners, please join Pet Me shop to learn more!

Suggestions for buy ornamental parrots that are easy to raise for beginners:

	New to learning and raising parrots, you should choose species that are easy to raise, easy to adapt to tropical habitats, and not too difficult to train. Should buy ornamental parrots according to the suggestions below will be suitable for newbies.

	Lovebird Parrot: This parrot is quite small, with a cheerful, energetic, agile personality that is very cute. Especially, they are suitable for keeping in pairs, happy herds. If raised from a young age, they will be quite loyal to their owners. The parrot has striking, beautiful colors. However, they are not good at imitating voices, are quite noisy, boisterous, so they will only suit those with a lively personality.

	Hong Kong Yen Phung Parrot: Another small sized parrot you can refer to. The advantage of this parrot line is that they have a lot of different colors, looking very pleasing to the eyes. The price of Yen Phung parrot is cheap, easy to raise, and very healthy. It is not difficult for you to choose a healthy parrot to raise. This breed is very friendly, however difficult to train.

	Cockatoo Parrot: This parrot breed is the friendliest, also very intelligent. With beautiful appearance, wide sides, good speech ability, lively, love to dance to music, Cockatoo parrots make anyone enjoy playing with them. Cockatoo parrots are expensive, so not everyone can afford such a parrot.

	African Gray Parrot: This parrot breed is very intelligent, although its appearance is not impressive, but they have the ability to learn to speak well, very suitable for those who love to raise talking parrots. The longer they keep them, the more they will wrap their owners, suitable as pets in the house.

	Blue and Gold Macaw parrots: Blue and Gold Macaw parrots have a large body size, long body, bright, outstanding colors, very eye-catching. They are also extremely friendly, have the ability to learn to speak very well, are an intelligent species, loved by many owners. Like the Cockatoo, the Blue and Gold Macaw is also an expensive parrot.

	In addition to these popular breeds, you can learn to buying ornamental parrots some other lines such as: Yellow-cheeked parrots, pink-breasted parrots, Malayan parrots, Sun Conure parrots. These are easy to raise, healthy strains, suitable for those who are new to raising parrots.

General characteristics of healthy parrots

	When buy ornamental parrots, the first thing you need to consider is the age of the parrot. If the parrot is young and has just grown its feathers, the ability to train and get along with the parrot will be more effective than that of an adult.

	Whether young or adult parrots, they will all have common signs to identify health. A healthy parrot will be agile, alert, steady, straight, and bright eyes. Their coat is smooth, shiny, not tangled, no signs of lint, fighting, or wounds. In addition, you need to pay attention to the parrot’s anus, a healthy parrot’s anus will be clean, without sticky stools, and no mucus.', N'Buy', CAST(N'2023-10-28' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES (N'BO068ea9', N'US0002', N'abcabcabcabcabcabcabcabcabcabcabc', N'abcabcabcabcabcabcabcabcabcabcabcabcabca...', N'abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc', N'', CAST(N'2023-11-04' AS Date), 0)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES (N'BO292205', N'US0002', N'abc', N'{"errors":{"":["JsonToken EndArray is no...', N'{"errors":{"":["JsonToken EndArray is not valid for closing JsonType Object. Path '''', line 1, position 2704."],"request":["The request field is required."],"imageUrl":["Unexpected character encountered while parsing value: [. Path ''imageUrl'', line 1, position 2703."]},"type":"https://tools.ietf.org/html/rfc7231#section-6.5.1","title":"One or more validation errors occurred.","status":400,"traceId":"00-b30a308e669e8dc19ce7f408fbe2d5b9-7dd001b7dcfd1f99-00"}{"errors":{"":["JsonToken EndArray is not valid for closing JsonType Object. Path '''', line 1, position 2704."],"request":["The request field is required."],"imageUrl":["Unexpected character encountered while parsing value: [. Path ''imageUrl'', line 1, position 2703."]},"type":"https://tools.ietf.org/html/rfc7231#section-6.5.1","title":"One or more validation errors occurred.","status":400,"traceId":"00-b30a308e669e8dc19ce7f408fbe2d5b9-7dd001b7dcfd1f99-00"}{"errors":{"":["JsonToken EndArray is not valid for closing JsonType Object. Path '''', line 1, position 2704."],"request":["The request field is required."],"imageUrl":["Unexpected character encountered while parsing value: [. Path ''imageUrl'', line 1, position 2703."]},"type":"https://tools.ietf.org/html/rfc7231#section-6.5.1","title":"One or more validation errors occurred.","status":400,"traceId":"00-b30a308e669e8dc19ce7f408fbe2d5b9-7dd001b7dcfd1f99-00"}', N'post', CAST(N'2023-11-09' AS Date), 0)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES (N'BO3c1355', N'US0002', N'abc', N'{"errors":{"":["JsonToken EndArray is no...', N'{"errors":{"":["JsonToken EndArray is not valid for closing JsonType Object. Path '''', line 1, position 2704."],"request":["The request field is required."],"imageUrl":["Unexpected character encountered while parsing value: [. Path ''imageUrl'', line 1, position 2703."]},"type":"https://tools.ietf.org/html/rfc7231#section-6.5.1","title":"One or more validation errors occurred.","status":400,"traceId":"00-b30a308e669e8dc19ce7f408fbe2d5b9-7dd001b7dcfd1f99-00"}{"errors":{"":["JsonToken EndArray is not valid for closing JsonType Object. Path '''', line 1, position 2704."],"request":["The request field is required."],"imageUrl":["Unexpected character encountered while parsing value: [. Path ''imageUrl'', line 1, position 2703."]},"type":"https://tools.ietf.org/html/rfc7231#section-6.5.1","title":"One or more validation errors occurred.","status":400,"traceId":"00-b30a308e669e8dc19ce7f408fbe2d5b9-7dd001b7dcfd1f99-00"}{"errors":{"":["JsonToken EndArray is not valid for closing JsonType Object. Path '''', line 1, position 2704."],"request":["The request field is required."],"imageUrl":["Unexpected character encountered while parsing value: [. Path ''imageUrl'', line 1, position 2703."]},"type":"https://tools.ietf.org/html/rfc7231#section-6.5.1","title":"One or more validation errors occurred.","status":400,"traceId":"00-b30a308e669e8dc19ce7f408fbe2d5b9-7dd001b7dcfd1f99-00"}{"errors":{"":["JsonToken EndArray is not valid for closing JsonType Object. Path '''', line 1, position 2704."],"request":["The request field is required."],"imageUrl":["Unexpected character encountered while parsing value: [. Path ''imageUrl'', line 1, position 2703."]},"type":"https://tools.ietf.org/html/rfc7231#section-6.5.1","title":"One or more validation errors occurred.","status":400,"traceId":"00-b30a308e669e8dc19ce7f408fbe2d5b9-7dd001b7dcfd1f99-00"}{"errors":{"":["JsonToken EndArray is not valid for closing JsonType Object. Path '''', line 1, position 2704."],"request":["The request field is required."],"imageUrl":["Unexpected character encountered while parsing value: [. Path ''imageUrl'', line 1, position 2703."]},"type":"https://tools.ietf.org/html/rfc7231#section-6.5.1","title":"One or more validation errors occurred.","status":400,"traceId":"00-b30a308e669e8dc19ce7f408fbe2d5b9-7dd001b7dcfd1f99-00"}', N'post', CAST(N'2023-11-09' AS Date), 0)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES (N'BO99b7f9', N'US5b93e35', N'string', N'abcabcabcabcabcabcabcabcabcabcabcabcabca...', N'abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc', N'string', CAST(N'2023-11-09' AS Date), 0)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES (N'BOa45479', N'US0002', N'abc', N'abcabcabcabcabcabcabcabcabcabcabcabcabca...', N'abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc', N'', CAST(N'2023-11-06' AS Date), 0)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES (N'BOb8a5e5', N'US0002', N'Test', N'wqeqeqwewqewqwqeqwewqeqwewqeqeqweqweasda...', N'wqeqeqwewqewqwqeqwewqeqwewqeqeqweqweasdadasfasdfsdaasdfasdfasdfasfasfdasasdfasfdsafasfdasafsdfffadsfadsfasfasfasfasfafadsfsafasdfdsafasdfdasfadsfdfa', N'', CAST(N'2023-11-03' AS Date), 0)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES (N'BOd6d8d6', N'US0002', N'dasdasdsasaasada', N'dasdsasadasasdassaasdasdaddasdsasadasasd...', N'dasdsasadasasdassaasdasdaddasdsasadasasdassaasdasdaddasdsasadasasdassaasdasdaddasdsasadasasdassaasdasdaddasdsasadasasdassaasdasdaddasdsasadasasdassaasdasdaddasdsasadasasdassaasdasdaddasdsasadasasdassaasdasdaddasdsasadasasdassaasdasdaddasdsasadasasdassaasdasdaddasdsasadasasdassaasdasdaddasdsasadasasdassaasdasdad', N'', CAST(N'2023-11-03' AS Date), 0)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES (N'BOf00bd2', N'US0002', N'abca', N'abcabcabcabcabcabcabcabcabcabcabcabcabca...', N'abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc', N'', CAST(N'2023-11-06' AS Date), 0)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES (N'BOf2501e', N'US0002', N'abc', N'abcabcabcabcabcabcabcabcabcabcabcabcabca...', N'abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcvvvvabcabcabcabcabcabcabcabcabcabcabcvabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcv', N'', CAST(N'2023-11-04' AS Date), 0)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Type], [Description]) VALUES (N'Cate90fb2', N'Cage', N'Cage', N'Cage category')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Type], [Description]) VALUES (N'Cate7646a', N'Food', N'Food', N'Food category')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Type], [Description]) VALUES (N'Catef5d6d', N'Toy', N'Toy', N'Toy category')
GO
--cage
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT001', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT002', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT003', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT004', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT005', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT006', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT007', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT008', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT009', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT010', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT012', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT013', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT014', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT015', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT016', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT017', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT018', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT019', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT020', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT021', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT022', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT023', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT024', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT025', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT026', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT027', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT028', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT029', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT030', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT031', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT032', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT033', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT034', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT035', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT036', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT037', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT038', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT039', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT040', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT041', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT042', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT043', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT044', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT045', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT046', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT047', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate90fb2', N'PDT048', 1)
																								
--food																							
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT049', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT050', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT051', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT052', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT053', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT054', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT055', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT056', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT057', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT058', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT059', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT060', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT061', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT062', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT063', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT064', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT065', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT066', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT067', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT068', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT069', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT070', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT071', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT072', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT073', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT074', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT075', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT076', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT077', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT078', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT079', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT080', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT081', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT082', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT083', 1)
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Cate7646a', N'PDT084', 1)
																								
--a&t																							
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT085', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT086', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT087', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT088', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT089', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT090', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT091', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT092', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT093', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT094', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT095', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT096', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT097', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT098', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT099', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT100', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT101', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT102', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT103', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT104', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT105', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT106', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT107', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT108', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT109', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT110', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT111', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT112', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT113', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT114', 1);
INSERT [dbo].[CategoryProduct] ([CategoryID], [ProductID], [Status]) VALUES (N'Catef5d6d', N'PDT115', 1);
GO
INSERT [dbo].[Color] ([ColorID], [ImageURL], [ColorName], [MaterialID], [IsCustom], [Price]) VALUES (N'CO128973d', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/black-bird-cage.jpg?alt=media&token=64f970a4-a9b1-44b1-b915-5fde630bf2ca', N'Đen', NULL, 1, CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[Color] ([ColorID], [ImageURL], [ColorName], [MaterialID], [IsCustom], [Price]) VALUES (N'CO138993a', NULL, N'White', NULL, 1, CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[Color] ([ColorID], [ImageURL], [ColorName], [MaterialID], [IsCustom], [Price]) VALUES (N'CO27ecf0f', NULL, N'Iron', NULL, 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Color] ([ColorID], [ImageURL], [ColorName], [MaterialID], [IsCustom], [Price]) VALUES (N'CO342345s', NULL, N'Blue', NULL, 1, CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[Color] ([ColorID], [ImageURL], [ColorName], [MaterialID], [IsCustom], [Price]) VALUES (N'COccaff63', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/white-bird-cage.webp?alt=media&token=27dcc187-a6f9-4340-b3d0-4723b8feacb2', N'Trắng', NULL, 1, CAST(100 AS Decimal(18, 0)))
GO
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT001', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT002', N'CO342345s', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT003', N'CO128973d', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT004', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT005', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT006', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT007', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT008', N'CO342345s', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT009', N'CO128973d', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT010', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT011', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT012', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT013', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT014', N'CO342345s', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT015', N'CO128973d', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT016', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT017', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT018', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT019', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT020', N'CO342345s', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT021', N'CO128973d', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT022', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT023', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT024', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT025', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT026', N'CO342345s', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT027', N'CO128973d', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT028', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT029', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT030', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT031', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT032', N'CO342345s', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT033', N'CO128973d', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT034', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT035', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT036', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT037', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT038', N'CO342345s', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT039', N'CO128973d', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT040', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT041', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT042', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT043', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT044', N'CO342345s', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT045', N'CO128973d', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT046', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT047', N'CO138993a', 1)
INSERT [dbo].[ColorProduct] ([ProductID], [ColorID], [Status]) VALUES (N'PDT048', N'CO138993a', 1)
GO
INSERT [dbo].[FeedBack] ([FeedbackID], [UserID], [ProductID], [DateTime], [FeedbackContent], [Rating], [Status]) VALUES (N'FB1', N'USce97c75', N'PDT1', CAST(N'2023-11-27T11:00:00.000' AS DateTime), N'Rất hài lòng với thức ăn cho chim chích chòe.', N'5', 1)
INSERT [dbo].[FeedBack] ([FeedbackID], [UserID], [ProductID], [DateTime], [FeedbackContent], [Rating], [Status]) VALUES (N'FB10', N'USce97c75', N'PDT10', CAST(N'2023-04-02T10:30:00.000' AS DateTime), N'Aviary Base có kích thước phù hợp và rất tiện lợi.', N'5', 1)
INSERT [dbo].[FeedBack] ([FeedbackID], [UserID], [ProductID], [DateTime], [FeedbackContent], [Rating], [Status]) VALUES (N'FB2', N'US5b93e35', N'PDT2', CAST(N'2023-02-28T15:00:00.000' AS DateTime), N'Thức ăn cho chim họa mi rất tốt, chúng tôi rất hài lòng.', N'5', 1)
INSERT [dbo].[FeedBack] ([FeedbackID], [UserID], [ProductID], [DateTime], [FeedbackContent], [Rating], [Status]) VALUES (N'FB3', N'US0003', N'PDT3', CAST(N'2023-01-29T13:30:00.000' AS DateTime), N'Aviary Base rất chất lượng và đúng như mô tả.', N'5', 1)
INSERT [dbo].[FeedBack] ([FeedbackID], [UserID], [ProductID], [DateTime], [FeedbackContent], [Rating], [Status]) VALUES (N'FB4', N'US0002', N'PDT4', CAST(N'2023-03-04T08:30:00.000' AS DateTime), N'Lồng chim Forte Flight chất lượng cao, đáng giá tiền.', N'5', 1)
INSERT [dbo].[FeedBack] ([FeedbackID], [UserID], [ProductID], [DateTime], [FeedbackContent], [Rating], [Status]) VALUES (N'FB5', N'US0003', N'PDT5', CAST(N'2023-03-08T17:00:00.000' AS DateTime), N'Retreat Dome Top Bird Cage đẹp và chất lượng tốt.', N'5', 1)
INSERT [dbo].[FeedBack] ([FeedbackID], [UserID], [ProductID], [DateTime], [FeedbackContent], [Rating], [Status]) VALUES (N'FB6', N'US115a83c', N'PDT6', CAST(N'2023-03-13T12:30:00.000' AS DateTime), N'Aviary Base lại một lần nữa là một lựa chọn xuất sắc.', N'5', 1)
INSERT [dbo].[FeedBack] ([FeedbackID], [UserID], [ProductID], [DateTime], [FeedbackContent], [Rating], [Status]) VALUES (N'FB7', N'US15bdd56', N'PDT7', CAST(N'2023-03-18T10:15:00.000' AS DateTime), N'Elegant Flight Cage with Opening Top đẹp và tiện lợi.', N'5', 1)
INSERT [dbo].[FeedBack] ([FeedbackID], [UserID], [ProductID], [DateTime], [FeedbackContent], [Rating], [Status]) VALUES (N'FB8', N'US5b93e35', N'PDT8', CAST(N'2023-03-23T14:45:00.000' AS DateTime), N'Large Java Wood Tree Floor Play Stand rất phù hợp cho chim.', N'5', 1)
INSERT [dbo].[FeedBack] ([FeedbackID], [UserID], [ProductID], [DateTime], [FeedbackContent], [Rating], [Status]) VALUES (N'FB9', N'USb51d98b', N'PDT9', CAST(N'2023-03-28T11:30:00.000' AS DateTime), N'Thức ăn cho chim chích chòe Anh Thông Bot rất ngon.', N'5', 1)
GO
--bird
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0001', NULL, NULL, NULL, NULL, NULL, N'B0001', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Black-Crested_Bulbul.jpg?alt=media&token=084e6fa2-175a-4d53-b86c-a2b52b8361c6')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0002', NULL, NULL, NULL, NULL, NULL, N'B0002', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Quaker.png?alt=media&token=8a40794c-0445-48a9-b6e9-dbfa042bf0d6&_gl=1*on9gpw*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0MjM3Ni4zLjEuMTY5NzU0Mzg2OC42MC4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0003', NULL, NULL, NULL, NULL, NULL, N'B0003', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Parrotlet.png?alt=media&token=be31e3fe-12b7-4529-83de-9bcb9edc0c83&_gl=1*ab4e2i*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0MjM3Ni4zLjEuMTY5NzU0Mzg5NC4zNC4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0004', NULL, NULL, NULL, NULL, NULL, N'B0004', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Mini%20Macaw.png?alt=media&token=218f56e0-9f8c-4dd4-997a-17431f4236cf&_gl=1*p8iyw6*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0MjM3Ni4zLjEuMTY5NzU0MzkxNi4xMi4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0005', NULL, NULL, NULL, NULL, NULL, N'B0005', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Lovebird.png?alt=media&token=a69eac53-e912-4954-a05f-fe00d323fdc3&_gl=1*eeyi21*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0MjM3Ni4zLjEuMTY5NzU0Mzk0NS42MC4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0006', NULL, NULL, NULL, NULL, NULL, N'B0006', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Jardine.png?alt=media&token=2b63a728-e406-4a5d-9856-7e16470e4d88&_gl=1*ysadr8*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0MjM3Ni4zLjEuMTY5NzU0Mzk2NS40MC4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0007', NULL, NULL, NULL, NULL, NULL, N'B0007', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Dove.png?alt=media&token=cf853860-cf4d-4b71-a79c-35932b3f2345&_gl=1*shk6fb*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0MjM3Ni4zLjEuMTY5NzU0NDA1OS42MC4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0008', NULL, NULL, NULL, NULL, NULL, N'B0008', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Cockatoo.png?alt=media&token=59b64785-5936-4d46-a9c5-ec6df353b1c7&_gl=1*1fsmxrn*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0MjM3Ni4zLjEuMTY5NzU0NDA4Mi4zNy4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0009', NULL, NULL, NULL, NULL, NULL, N'B0009', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Best%20Cockatiel.png?alt=media&token=38206daa-4715-4d45-bfbf-e816046c98a9&_gl=1*1n8cx0s*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0MjM3Ni4zLjEuMTY5NzU0NDExOC4xLjAuMA..')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0010', NULL, NULL, NULL, NULL, NULL, N'B0010', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Caique%20.png?alt=media&token=5498f7e7-57e8-4199-8a96-742212b6218a&_gl=1*4z61ka*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0OTcwOS40LjAuMTY5NzU0OTcwOS42MC4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0011', NULL, NULL, NULL, NULL, NULL, N'B0011', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Amazon%20Parrot.png?alt=media&token=ad1e5fb3-26c3-4169-88f3-647b1df7a335&_gl=1*1fzozkg*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0OTcwOS40LjEuMTY5NzU0OTc3Ni42MC4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0012', NULL, NULL, NULL, NULL, NULL, N'B0012', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Senegal%20Parrot.png?alt=media&token=e529a82c-8df4-42d4-9389-7be044f9e6e3&_gl=1*v0k7pq*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0OTcwOS40LjEuMTY5NzU0OTgwMy4zMy4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0013', NULL, NULL, NULL, NULL, NULL, N'B0013', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Pionus.png?alt=media&token=f10d37c7-9877-44b6-8dfc-c0f1b0e678af&_gl=1*1hz684*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0OTcwOS40LjEuMTY5NzU0OTgyNC4xMi4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0014', NULL, NULL, NULL, NULL, NULL, N'B0014', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Best%20Parakeet.png?alt=media&token=a83f2017-4a12-4199-b844-605c22a4d7ab&_gl=1*br6h9k*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0OTcwOS40LjEuMTY5NzU0OTg0OS42MC4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0015', NULL, NULL, NULL, NULL, NULL, N'B0015', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Macaw.png?alt=media&token=3cc148cf-a686-4c2b-b257-e6291e213456&_gl=1*o2hjgh*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0OTcwOS40LjEuMTY5NzU0OTg3Mi4zNy4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0016', NULL, NULL, NULL, NULL, NULL, N'B0016', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Lorikeet.png?alt=media&token=bcf7eba2-298a-4a5f-ab1d-70fb533e4292&_gl=1*1lrcoou*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0OTcwOS40LjEuMTY5NzU0OTg5NC4xNS4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0017', NULL, NULL, NULL, NULL, NULL, N'B0017', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Finch.png?alt=media&token=6a5b10f5-0b02-46ee-82ec-3bbaabbf91cb&_gl=1*1a6cmj0*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0OTcwOS40LjEuMTY5NzU0OTkyMS42MC4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0018', NULL, NULL, NULL, NULL, NULL, N'B0018', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Conure.png?alt=media&token=e816f734-25ce-4daa-96c4-2a747c1a8c59&_gl=1*vp0hwh*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0OTcwOS40LjEuMTY5NzU0OTk0Mi4zOS4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0019', NULL, NULL, NULL, NULL, NULL, N'B0019', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Small%20Cockatoo.png?alt=media&token=946ac642-7b14-4c9e-a7de-eb5f1d29729c&_gl=1*1r4omg4*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0OTcwOS40LjEuMTY5NzU1MDEzNC42MC4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0020', NULL, NULL, NULL, NULL, NULL, N'B0020', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Canary.png?alt=media&token=77be7543-041e-4fb8-ada5-238df8fbe54a&_gl=1*192j84t*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0OTcwOS40LjEuMTY5NzU1MDE1OC4zNi4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0021', NULL, NULL, NULL, NULL, NULL, N'B0021', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Budgie.png?alt=media&token=12ee95b2-a9bc-4467-a60a-533d104b2038&_gl=1*1y9dcng*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0OTcwOS40LjEuMTY5NzU1MDE3Mi4yMi4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0022', NULL, NULL, NULL, NULL, NULL, N'B0022', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/African%20Grey%20Parrot.png?alt=media&token=4457691f-b214-4e80-88f0-c55939676660&_gl=1*1ie4ga9*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzU0OTcwOS40LjEuMTY5NzU1MDE4Ny43LjAuMA..')

--blog
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I0023', N'BO0001', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Majestic%20Play%20Top%20Bird%20Cage-2.png?alt=media&token=6dc14cc4-f91a-4dd7-8748-5d1d4ce35798&_gl=1*18yz2hn*_ga*OTg1Mjk2NDM0LjE2OTc2OTgwNDU.*_ga_CW55HF8NVT*MTY5Nzk1MjU0NS4zLjEuMTY5Nzk1MjkwNy4yOC4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I16dfec98', N'BOa45479', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/lama%2FC%3A%5Cfakepath%5CScreenshot%202023-11-04%20135928.png?alt=media&token=dc12a6f8-776b-462a-93fd-0364d4ebe7f9')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I2f4e4bd6', N'BO292205', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/lama%2FC%3A%5Cfakepath%5Cz4727831290216_16adb535ce3d02f081b8552707ce375c.jpg?alt=media&token=e0caf849-298e-4cd7-951e-95e18ce97b31')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I4df93e60', N'BO99b7f9', NULL, NULL, NULL, NULL, NULL, N'string')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I7d42e577', N'BOf2501e', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/lama%2FC%3A%5Cfakepath%5C383464139_346624394358955_787064704516641970_n.jpg?alt=media&token=71212735-91ec-43b2-bc2c-36218db0bb78')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I8fa02420', N'BO068ea9', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/lama%2FC%3A%5Cfakepath%5C383464139_346624394358955_787064704516641970_n.jpg?alt=media&token=69d7a617-46b2-4182-8da8-74eb211bc311')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'Ic7e49673', N'BO3c1355', NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'Ie7a5a82d', N'BOf00bd2', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/lama%2FC%3A%5Cfakepath%5Cz4727831290216_16adb535ce3d02f081b8552707ce375c.jpg?alt=media&token=11e46911-a285-4b7c-a3a0-3bddc7739abc')


--cage
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC001', NULL, N'PDT001', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%20110x62%20Walk-In%20Aviary.webp?alt=media&token=b687eb50-595b-4b18-b391-357ef1d3cb94')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC002', NULL, N'PDT002', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2024x22%20Retreat%20Dome%20Top%20Bird%20Cage.webp?alt=media&token=6c798ea3-4791-44fa-a4a1-921421837636')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC003', NULL, N'PDT003', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2024x22%20Retreat%20Play%20Top%20Bird%20Cage.webp?alt=media&token=d925a2a6-9385-440b-840e-22e7699ff800')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC004', NULL, N'PDT004', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2024x22%20Stainless%20Steel%20Retreat%20Play%20Top%20Bird%20Cage.webp?alt=media&token=dc8fe4cf-a19d-47f9-9d42-9f6cf5c6cf93')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC005', NULL, N'PDT005', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2024x22%20Triple%20Stack%20Breeder%20Cage.webp?alt=media&token=fc310edb-d580-48da-ab39-752668e12484')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC006', NULL, N'PDT006', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2031x20%20Flight%20Cage%20%26%20Stand.webp?alt=media&token=72fc8251-403c-4752-897b-8f17654c3873')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC007', NULL, N'PDT007', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2032%20Large%20Corner%20Cage.jpg?alt=media&token=242bedaa-d39e-436e-8df5-1a21f9aefec8')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC008', NULL, N'PDT008', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2032x21%20Flight%20Cage%20%26%20Stand%20with%20Double%20Front%20Door.webp?alt=media&token=2e2d9bb6-995e-4486-81de-db3721a3461a')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC009', NULL, N'PDT009', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2032x21%20Forte%20Double%20Stack%20Bird%20Cage.webp?alt=media&token=e0e7876a-fd97-4f5a-84d4-e480719b52ae')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC010', NULL, N'PDT010', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2032x21%20Forte%20Flight%20Bird%20Cage.webp?alt=media&token=928ca1b6-e815-4d7f-a92b-7d55eb435448')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC011', NULL, N'PDT011', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2032x21x61%20Elegant%20Flight%20Cage%20with%20Opening%20Top.webp?alt=media&token=17e4c80a-7331-4cf7-aba0-f32b8e7659be')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC012', NULL, N'PDT012', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2032x23%20Refuge%20Dome%20Top%20Bird%20Cage.webp?alt=media&token=2ce85362-5c9e-4beb-86f9-b87685b1e491')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC013', NULL, N'PDT013', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2032x23%20Refuge%20Play%20Top%20Bird%20Cage.webp?alt=media&token=9e76983e-bceb-4b58-b277-7f207f813123')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC014', NULL, N'PDT014', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2032x23%20Stainless%20Steel%20Refuge%20Dome%20Top%20Bird%20Cage.webp?alt=media&token=de1f3a77-c106-4863-99d7-e217c7615b39')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC015', NULL, N'PDT015', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2032x23%20Stainless%20Steel%20Refuge%20Play%20Top%20Bird%20Cage.webp?alt=media&token=2b36ef30-2d09-4025-8c6e-40bd2102ef2d')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC016', NULL, N'PDT016', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2036x28%20Majestic%20Dome%20Top%20Bird%20Cage.webp?alt=media&token=128662ee-996b-46f5-9c9c-825340b7df8a')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC017', NULL, N'PDT017', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2036x28%20Majestic%20Play%20Top%20Bird%20Cage.webp?alt=media&token=4f33a2fe-5a47-4eef-b24c-b4214d37c65c')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC018', NULL, N'PDT018', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2036x28%20Stainless%20Steel%20Majestic%20Dome%20Top%20Bird%20Cage.webp?alt=media&token=855ca736-5424-456f-8068-053d02258ec7')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC019', NULL, N'PDT019', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2036x28%20Stainless%20Steel%20Majestic%20Play%20Top%20Bird%20Cage.webp?alt=media&token=baf76f03-c7c7-4566-89ec-0a2034482521')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC020', NULL, N'PDT020', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2040x30%20Classico%20Double%20Stack%20Bird%20Cage.webp?alt=media&token=a29d801c-c594-458d-ac67-95e40edb8cd3')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC021', NULL, N'PDT021', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2040x30%20Imperial%20Dome%20Top%20Bird%20Cage.webp?alt=media&token=eb12b2e8-4f57-484b-80dd-861056a830e9')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC022', NULL, N'PDT022', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2040x30%20Imperial%20Play%20Top%20Bird%20Cage.webp?alt=media&token=917ba5d3-ffce-44c3-85f5-9b671c417d3b')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC023', NULL, N'PDT023', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2040x30%20Stainless%20Steel%20Imperial%20Dome%20Top%20Bird%20Cage.jpg?alt=media&token=e83207e6-fdeb-4fdb-9a29-2b8bdacb82db')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC024', NULL, N'PDT024', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2040x30%20Stainless%20Steel%20Imperial%20Play%20Top%20Bird%20Cage.webp?alt=media&token=7540607a-1f2b-4520-af12-711a37bde5da')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC025', NULL, N'PDT025', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2040x40%20Macaw%20Flight%20Cage.webp?alt=media&token=f63faa47-df0b-4879-8736-c6c71413fe3d')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC026', NULL, N'PDT026', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2042%20XL%20Corner%20Cage.webp?alt=media&token=56d7d35e-6c61-45f1-966c-019df912b647')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC027', NULL, N'PDT027', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2048x36%20Mondo%20Dome%20Top%20Bird%20Cage.webp?alt=media&token=47a70116-cba6-4747-8641-6d83c0f21fc6')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC028', NULL, N'PDT028', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2048x36%20Mondo%20Play%20Top%20Bird%20Cage.webp?alt=media&token=3fe2e243-852f-4d95-85c7-3ed69e1f3a81')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC029', NULL, N'PDT029', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2048x36%20Stainless%20Steel%20Mondo%20Dome%20Top%20Bird%20Cage.jpg?alt=media&token=848aea73-f6cf-4940-b97c-27a6cb3e8beb')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC030', NULL, N'PDT030', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2062x62x79%20Walk%20In%20Aviary.webp?alt=media&token=b448e898-bb23-40f0-af12-8dcc2ef04796')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC031', NULL, N'PDT031', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2064x21%20Double%20Stack%20Flight%20Cage.webp?alt=media&token=a9ff8af1-f26b-468c-af48-eb536ca14bab')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC032', NULL, N'PDT032', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2085x61%20Walk%20In%20Aviary.webp?alt=media&token=670d3348-d1ed-4dcf-a84a-29fd542ea593')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC033', NULL, N'PDT033', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FA%26E%20Cage%20Co.%2086x62%20Walk-In%20Aviary.webp?alt=media&token=d8748c3f-ce5a-4987-95ab-b2fc588e8030')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC034', NULL, N'PDT034', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FAvian%20Adventures%20Grande%20Dometop%20Cage.webp?alt=media&token=715cbaee-642f-423f-8b90-805c07b914f5')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC035', NULL, N'PDT035', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FAvian%20Adventures%20Grande%20Playtop%20Bird%20Cage.webp?alt=media&token=4f0797f1-d223-49fd-bfce-39d1a6c59fb5')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC036', NULL, N'PDT036', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FAvian%20Adventures%20Hacienda%20Dometop%20Bird%20Cage.webp?alt=media&token=43bfcb15-c7ce-49e8-9030-2425a2370fd5')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC037', NULL, N'PDT037', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FAvian%20Adventures%20Loro%20Flight%20Cage.webp?alt=media&token=c0f220ef-4b4e-436e-b50a-d46f4e967ed2')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC038', NULL, N'PDT038', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FAvian%20Adventures%20Multi%20Vista%20Breeder%20Cage.webp?alt=media&token=eb9a424e-34ec-4f46-a751-a603d3d5cd22')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC039', NULL, N'PDT039', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FAvian%20Adventures%20Recreation%20Center.webp?alt=media&token=dfaafeae-bec8-4627-9d8c-c52c7a1e1d9d')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC040', NULL, N'PDT040', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FPrevue%20Hendryx%20Deluxe%20Parrot%20Bird%20Cage%20with%20Play%20Top.webp?alt=media&token=91024253-8635-4810-82de-f14815a9d918')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC041', NULL, N'PDT041', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FPrevue%20Hendryx%20Extra%20Large%20Flight%20Bird%20Cage.webp?alt=media&token=f900f7b1-1e75-453a-a99b-dfea763aa1c8')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC042', NULL, N'PDT042', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FPrevue%20Hendryx%20Flight%20Bird%20Cage%20with%20Storage%20Shelf.webp?alt=media&token=69ec3e76-5970-4c0b-80b0-2adee114419c')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC043', NULL, N'PDT043', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FPrevue%20Hendryx%20Large%20Bird%20Cage%20with%20Storage%20Shelf.webp?alt=media&token=e35546ed-e31d-44a6-b7e4-5a541e370b8a')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC044', NULL, N'PDT044', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FPrevue%20Hendryx%20Pagoda%20Cockatiel%20Bird%20Cage.webp?alt=media&token=f56906c9-c8ba-41a6-ad7f-c303eeabf4dd')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC045', NULL, N'PDT045', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FPrevue%20Hendryx%20Pointed%20Top%20Floor%20Bird%20Aviary.webp?alt=media&token=8fefbad6-c438-4c84-b94b-195c9b46f5ca')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC046', NULL, N'PDT046', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FPrevue%20Hendryx%20Signature%20Series%20Playtop%20Large%20Bird%20Cage.webp?alt=media&token=37483b10-921e-491e-bee6-bc60c0ae3923')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC047', NULL, N'PDT047', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FPrevue%20Hendryx%20Signature%20Series%20Playtop%20X-Large%20Bird%20Cage.webp?alt=media&token=c65009eb-5a70-458a-b978-dcd1e17afc62')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IC048', NULL, N'PDT048', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/cage%2FPrevue%20Hendryx%20Silverado%20Macaw%20Bird%20Cage.webp?alt=media&token=6c02efe5-691f-48e0-bbad-af23a3c09fcd')

--food
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF001', NULL, N'PDT049', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FB%E1%BB%99t%20NutriBird%20A19%203KG.jpg?alt=media&token=5829f5bb-1daa-4a30-b728-4203bd82d3eb')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF002', NULL, N'PDT050', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FB%E1%BB%99t%20NutriBird%20A21%203KG.jpg?alt=media&token=e4522c2d-a006-443a-9021-58c2abe31f71')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF003', NULL, N'PDT051', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FH%E1%BA%A1t%20Tr%E1%BB%99n%20H%E1%BB%97n%20H%E1%BB%A3p%20V%E1%BA%B9t%20Prestige%20Amazon%20Parrot%20Mix%20Versele%20Laga%201kg.jpeg?alt=media&token=5e66b8db-131f-4207-9720-22fa926207da')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF004', NULL, N'PDT052', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FNutribird%20G14%20Original%201kg.jpg?alt=media&token=276d7b32-d0d0-409d-91f9-ef234ddf3a6f')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF005', NULL, N'PDT053', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FNutribird%20G14%20Tropical%201kg.jpg?alt=media&token=d956e0d6-996d-4542-8f45-7153303bcf2c')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF006', NULL, N'PDT054', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FNutribird%20G14%20Tropical%20200gram.jpeg?alt=media&token=d586092e-b128-4251-ac7e-a4b544fd2a14')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF007', NULL, N'PDT055', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FNutribird%20G14%20Tropical%203kg.jpeg?alt=media&token=f967b73b-4b80-4b74-91e5-6cfee9e9a606')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF008', NULL, N'PDT056', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FNutribird%20G14%20Tropical%20500gram.jpeg?alt=media&token=8baf1992-7130-4a36-aaba-c71df169a865')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF009', NULL, N'PDT057', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FNutribird%20P15%20Original%201kg.jpg?alt=media&token=a4faffc4-23a2-4c36-8b68-42b0195c0b99')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF010', NULL, N'PDT058', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FNutribird%20P15%20Tropical%201kg.jpg?alt=media&token=31ab9092-5c7e-4379-bf2d-a8055391af53')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF011', NULL, N'PDT059', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FPlp%20African%20Parakeet%20Mix%201kg.jpg?alt=media&token=7520e6b5-4c9b-4764-aa57-9bbe02fad4d7')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF012', NULL, N'PDT060', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FPlp%20African%20Parrot%20Mix%201kg.jpg?alt=media&token=2cde412b-63c4-48f6-8c4c-f4b11d2e79eb')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF013', NULL, N'PDT061', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FPlp%20Ara%20Parrot%20Mix%202kg.jpg?alt=media&token=b07935e0-498a-4758-b9a6-5dc2320226f4')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF014', NULL, N'PDT062', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FPlp%20Australian%20Parakeet%20Mix%201kg.jpg?alt=media&token=e87dfd98-7d0c-4690-bdb3-1ffd4f388f40')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF015', NULL, N'PDT063', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FPlp%20Australian%20Parrot%20Mix%201kg.jpg?alt=media&token=6847e383-acb4-4be9-9965-71e996e7d6ec')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF016', NULL, N'PDT064', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FStick%20Parrots%20Nuts%26Honey%20140g.jpg?alt=media&token=3275f1a4-ac92-4528-a1a2-53160b16bb7f')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF017', NULL, N'PDT065', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FTh%E1%BB%A9c%20%C4%82n%20Dinh%20D%C6%B0%E1%BB%A1ng%20D%C3%A0nh%20Cho%20Chim%20Nh%E1%BB%8F%20D%E1%BA%A1ng%20B%E1%BB%99t%20NutriBird%20A19%20100g.jpg?alt=media&token=c8f533b0-e57a-459c-be25-3fccc9da978c')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF018', NULL, N'PDT066', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FTh%E1%BB%A9c%20%C4%82n%20Dinh%20D%C6%B0%E1%BB%A1ng%20D%C3%A0nh%20Cho%20Chim%20Nh%E1%BB%8F%20D%E1%BA%A1ng%20B%E1%BB%99t%20NutriBird%20A21%20100g.jpg?alt=media&token=78b7eff8-ebc3-45d4-bb86-51002000b420')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF019', NULL, N'PDT067', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FTh%E1%BB%A9c%20%C4%82n%20Th%C6%B0%E1%BB%9Fng%20Cho%20V%E1%BA%B9t%20Stick%20Big%20Parakeets%20Exotic%20Fruit%20(140g).jpeg?alt=media&token=54443dbe-5bec-4098-93ce-e71bca90fee6')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF020', NULL, N'PDT068', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20FruitBlend%20Flavor%20Size%20L%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20L%E1%BB%9Bn.jpg?alt=media&token=8e1f2634-6713-4582-896b-139687690f1c')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF021', NULL, N'PDT069', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20FruitBlend%20Flavor%20Size%20M%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20V%E1%BB%ABa%20%C4%90%E1%BA%BFn%20L%E1%BB%9Bn.jpg?alt=media&token=2881bc5c-5f4b-4f1f-829d-1d72e835657f')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF022', NULL, N'PDT070', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20FruitBlend%20Flavor%20Size%20S%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20C%E1%BB%A1%20V%E1%BB%ABa%20(200gr).jpg?alt=media&token=dec3af94-2b14-4407-89ea-56e9e5b184e2')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF023', NULL, N'PDT071', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20FruitBlend%20Flavor%20Size%20S%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20C%E1%BB%A1%20V%E1%BB%ABa%20(500gr).jpg?alt=media&token=1709f745-3770-4a2d-b249-a460c9ca8bb6')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF024', NULL, N'PDT072', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20FruitBlend%20Flavor%20Size%20S%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20C%E1%BB%A1%20V%E1%BB%ABa.jpg?alt=media&token=5d807cfd-ec9e-40f0-bc8a-0f0241cc298b')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF025', NULL, N'PDT073', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20Natural%20Size%20L%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20C%E1%BB%A1%20L%E1%BB%9Bn.jpg?alt=media&token=a5b83d6e-fc2d-4adc-b6c8-0470213cdcef')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF026', NULL, N'PDT074', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20Natural%20Size%20M%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20C%E1%BB%A1%20V%E1%BB%ABa%20%C4%90%E1%BA%BFn%20L%E1%BB%9Bn.jpg?alt=media&token=086fe82d-1ef7-4b7c-a63a-b500197a9780')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF027', NULL, N'PDT075', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20NuBlend%20Size%20M%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20L%E1%BB%9Bn.jpg?alt=media&token=dd9897ce-87b7-4870-bccf-e32b6ebe0266')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF028', NULL, N'PDT076', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20NuBlend%20Size%20S%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20Nh%E1%BB%8F.jpg?alt=media&token=433a17e2-22d8-43a1-8688-a1a845b38b46')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF029', NULL, N'PDT077', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20PastaBlend%20Size%20L%20Th%E1%BB%A9c%20%C4%82n%20D%C3%A0nh%20Cho%20Chim%20C%E1%BB%A1%20L%E1%BB%9Bn.jpg?alt=media&token=c222d819-bad5-4acc-b37a-48f664aee3b8')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF030', NULL, N'PDT078', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20PastaBlend%20Size%20M%20Th%E1%BB%A9c%20%C4%82n%20D%C3%A0nh%20Cho%20Chim%20C%E1%BB%A1%20Trung.jpg?alt=media&token=df66b7d4-718e-4819-ae78-cce08facbc7f')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF031', NULL, N'PDT079', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20PastaBlend%20Size%20S%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20D%E1%BA%A1ng%20V%E1%BB%ABa.jpg?alt=media&token=f64e4a7b-928a-4496-ba9c-006d3b48d674')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF032', NULL, N'PDT080', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20Pure%20Fun%20Size%20L%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20C%E1%BB%A1%20L%E1%BB%9Bn.jpg?alt=media&token=c05ab025-e4f0-441e-9b71-2bba5427148f')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF033', NULL, N'PDT081', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20Pure%20Fun%20Size%20M%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20C%E1%BB%A1%20v%E1%BB%ABa.jpg?alt=media&token=c0747868-e069-43f5-a0db-84ad956c8281')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF034', NULL, N'PDT082', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20Pure%20Fun%20Size%20S%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20C%E1%BB%A1%20V%E1%BB%ABa.jpg?alt=media&token=df0133f5-52c9-487f-8391-93a4308d9c42')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF035', NULL, N'PDT083', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20Veggie%20Blend%20Size%20L%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20C%E1%BB%A1%20L%E1%BB%9Bn.jpg?alt=media&token=af08a43d-6c6b-41ab-9476-30ebe4f68388')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IF036', NULL, N'PDT084', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/food%2FZupreem%20Veggie%20Blend%20Size%20S%20Th%E1%BB%A9c%20%C4%82n%20Cho%20Chim%20V%E1%BA%B9t%20C%E1%BB%A1%20V%E1%BB%ABa.jpg?alt=media&token=8f5e7506-d9ac-485e-8d3a-3f6aae6ce885')


--a&t
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT001', NULL, N'PDT085', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2F2018PT%20-%2018-20%20(Width)%20x%2016-18%20(Depth)%20Playtop%20Cage%20Cover.webp?alt=media&token=d444fb10-01c8-4095-bc74-2e6e6be9147c')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT002', NULL, N'PDT086', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2F2220DT%20-%2020-22%20(Width)%20x%2016-20%20(Depth)%20Dometop%20Cage%20Cover.webp?alt=media&token=a3e895f3-07e5-488d-ae4d-655bb9c54136')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT003', NULL, N'PDT087', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2F3221FT%20-%2032%20(Width)%20x%2021%20(Depth)%20Flat%20Top%20Cage%20Cover.webp?alt=media&token=a0bed6cb-6076-455e-bad6-6ca838b4f4af')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT004', NULL, N'PDT088', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2F6432MD%20-%2064%20(Width)%20x%2032%20(Depth)%20Macaw%20Double%20Cage%20Cover.webp?alt=media&token=4c46fb7b-b8c8-410a-93c9-6ee4db978647')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT005', NULL, N'PDT089', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co%20110x62%20Walk-In%20Aviary%20Base.webp?alt=media&token=b318a237-32ea-4836-9422-bbb305008f73')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT006', NULL, N'PDT090', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co%2062x62%20Walk-In%20Aviary%20Base.webp?alt=media&token=7a7182c3-d28e-420e-af8e-ca425ce2d868')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT007', NULL, N'PDT091', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co%2085x61%20Walk-In%20Aviary%20Base.jpg?alt=media&token=b290222e-30d1-4718-85ce-8f61906d0246')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT008', NULL, N'PDT092', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co%2086x62%20Walk-In%20Aviary%20Base.jpg?alt=media&token=99947523-faa5-4826-8a32-55cd993d29c2')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT009', NULL, N'PDT093', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co%20Side%20Door%20for%2085x61%20Walk-In%20Aviary.webp?alt=media&token=20cf75b2-b674-42ac-8f2f-88da06dd3191')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT010', NULL, N'PDT094', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co%20Side%20Door%20for%2086x62%20Walk-In%20Aviary.webp?alt=media&token=20237c90-db6d-4cd6-93fe-807effb5972b')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT011', NULL, N'PDT095', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co.%2026x25%20Parrot%20Play%20Stand%20with%20Ladders%20and%20Toy%20Hooks.webp?alt=media&token=d490c385-6abb-4177-8b3b-383c364c30d6')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT012', NULL, N'PDT096', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co.%20Large%20Java%20Wood%20Table%20Top%20Play%20Stand.webp?alt=media&token=35ebf11e-bf65-45d6-a9b6-c5595ecd8165')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT013', NULL, N'PDT097', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co.%20Large%20Java%20Wood%20Tree%20Floor%20Play%20Stand.webp?alt=media&token=5f1587fb-c806-4622-b3ce-16ac23273487')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT014', NULL, N'PDT098', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co.%20Large%20Table%20Top%20Play%20Station.webp?alt=media&token=a79e975f-4e99-4e63-95cd-7be8a38082de')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT015', NULL, N'PDT099', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co.%20Large%20Wood%20Table%20Top%20Play%20Station.webp?alt=media&token=0161cfbe-1c07-4f55-9d7f-ebf29c458311')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT016', NULL, N'PDT100', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co.%20Medium%20Java%20Wood%20Table%20Top%20Play%20Stand.webp?alt=media&token=e3b2a0d8-5ab7-45f8-8b82-9dce4bfb71cc')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT017', NULL, N'PDT101', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co.%20Medium%20Java%20Wood%20Tree%20Floor%20Play%20Stand.webp?alt=media&token=3ea133c4-8fda-4637-bde5-49a857c84d74')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT018', NULL, N'PDT102', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co.%20Medium%20Table%20Top%20Play%20Station.webp?alt=media&token=b3948f7c-54c6-4099-9196-1804f38bac0b')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT019', NULL, N'PDT103', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co.%20Small%20Java%20Wood%20Table%20Top%20Play%20Stand.webp?alt=media&token=85a0087b-96f9-433a-a475-19e77040776d')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT020', NULL, N'PDT104', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Cage%20Co.%20Small%20Java%20Wood%20Tree%20Floor%20Play%20Stand.webp?alt=media&token=a90733f7-0e86-40cf-8c47-a4be307ccec8')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT021', NULL, N'PDT105', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Feeder%20Bird%20Cage%20Door%20Lock.webp?alt=media&token=c0b7e944-fbf5-4edf-8c16-0cb3195369de')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT022', NULL, N'PDT106', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Half%20Circle%20Powder%20Coated%20Bird%20Cage%20Door%20Lock.webp?alt=media&token=46062752-3c05-407a-8199-d94ae77433f6')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT023', NULL, N'PDT107', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FA%26E%20Stainless%20Steel%20Bird%20Cage%20Door%20Slide%20Lock.webp?alt=media&token=f27dec59-0cbe-446d-baa3-4f94aee2bb13')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT024', NULL, N'PDT108', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FAvian%20Adventures%20Parrot%20Playstand.webp?alt=media&token=3220887a-ae9c-4f80-b0b8-d5ed5df17369')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT025', NULL, N'PDT109', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FAvian%20Adventures%20Recreation%20Center.webp?alt=media&token=d0198baf-821f-4322-9f94-16b535f515f9')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT026', NULL, N'PDT110', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FHappy%20Beaks%20Extra%20Large%20Rainbow%20Cotton%20Rope%20Boing%20with%20Bell.webp?alt=media&token=1baa5228-2ab0-4c04-85c8-f13bd701f5a9')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT027', NULL, N'PDT111', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FHappy%20Beaks%20Large%20Rainbow%20Cotton%20Rope%20Boing%20with%20Bell.webp?alt=media&token=0f7ce054-55a9-4856-a7ef-70eff00ea630')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT028', NULL, N'PDT112', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FHappy%20Beaks%20Medium%20Ball%20Thing%20Java%20Wood%20Toy.webp?alt=media&token=1f216b5d-a1fc-43ec-9c0a-d3ffde014bfc')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT029', NULL, N'PDT113', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FHappy%20Beaks%20Medium%20Rainbow%20Cotton%20Rope%20Boing%20with%20Bell.webp?alt=media&token=0393be42-268c-478d-af8f-c2779eb15a1b')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT030', NULL, N'PDT114', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FHappy%20Beaks%20Small%20Rainbow%20Cotton%20Rope%20Boing%20with%20Bell.webp?alt=media&token=9aa41f93-13d9-42a9-885c-1ce96e40a03b')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'IT031', NULL, N'PDT115', NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/a%26t%2FHappy%20Beaks%20Space%20Ball%20on%20a%20Chain%20Bird%20Toy.webp?alt=media&token=33f8efef-3cfe-4749-960f-58432179c10c')
																																		   
--style
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES 
(N'I00002', NULL, NULL, N'S831874f7', NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/rectangle-bird.jpg?alt=media&token=419044fa-d79f-4710-bbb5-93f4f06fe77c')

GO
INSERT [dbo].[Material] ([MaterialID], [MaterialName], [SizeID], [IsCustom], [Price]) VALUES (N'M00001', N'Wood', NULL, 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Material] ([MaterialID], [MaterialName], [SizeID], [IsCustom], [Price]) VALUES (N'Ma2b54e5d', N'Aluminum', NULL, 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Material] ([MaterialID], [MaterialName], [SizeID], [IsCustom], [Price]) VALUES (N'Md12f6cf4', N'string', N'Sif4a814d', 1, CAST(1000 AS Decimal(18, 0)))
GO
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT001', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT002', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT003', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT004', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT005', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT006', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT007', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT008', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT009', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT010', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT011', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT012', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT013', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT014', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT015', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT016', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT017', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT018', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT019', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT020', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT021', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT022', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT023', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT024', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT025', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT026', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT027', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT028', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT029', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT030', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT031', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT032', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT033', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT034', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT035', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT036', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT037', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT038', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT039', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT040', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT041', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT042', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT043', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT044', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT045', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT046', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT047', N'Ma2b54e5d', 1)
INSERT [dbo].[MaterialProduct] ([ProductID], [MaterialID], [Status]) VALUES (N'PDT048', N'Ma2b54e5d', 1)
GO
INSERT [dbo].[Order] ([OrderID], [UserID], [Note], [CreateDate], [total], [Status]) VALUES (N'O34666460', N'USce97c75', N'Lam Do 0911861612 S7.03 Vinhomes Grand Park, Đường Nguyễn Xiển, Phường Long Thạnh Mỹ, Thành Phố Thủ Đức, TP. Hồ Chí Minh', CAST(N'2023-11-15T00:00:00.000' AS DateTime), CAST(200000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [Note], [CreateDate], [total], [Status]) VALUES (N'Oc4047795', N'USce97c75', N'string', CAST(N'2023-11-27T00:00:00.000' AS DateTime), CAST(200000 AS Decimal(18, 0)), 0)
INSERT [dbo].[Order] ([OrderID], [UserID], [Note], [CreateDate], [total], [Status]) VALUES (N'OCT60c6d4', N'USce97c75', N'string', CAST(N'2023-11-27T00:00:00.000' AS DateTime), CAST(3600 AS Decimal(18, 0)), 0)
INSERT [dbo].[Order] ([OrderID], [UserID], [Note], [CreateDate], [total], [Status]) VALUES (N'Order1', N'USce97c75', N'Lam Do 0911861612 S7.03 Vinhomes Grand Park, Đường Nguyễn Xiển, Phường Long Thạnh Mỹ, Thành Phố Thủ Đức, TP. Hồ Chí Minh', CAST(N'2023-11-24T10:30:00.000' AS DateTime), CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [Note], [CreateDate], [total], [Status]) VALUES (N'Order10', N'USce97c75', N'A&E Cage Co. 62"x62" Walk-In Aviary Base', CAST(N'2023-03-30T10:00:00.000' AS DateTime), CAST(1380 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [Note], [CreateDate], [total], [Status]) VALUES (N'Order2', N'US5b93e35', N'Thuc An Chim Hoa Mi', CAST(N'2023-02-25T14:15:00.000' AS DateTime), CAST(32000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [Note], [CreateDate], [total], [Status]) VALUES (N'Order3', N'US0003', N'A&E Cage Co. 86"x62" Walk-In Aviary Base', CAST(N'2023-01-26T12:45:00.000' AS DateTime), CAST(1680 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [Note], [CreateDate], [total], [Status]) VALUES (N'Order4', N'US0002', N' Forte Flight Bird Cage', CAST(N'2023-03-01T08:00:00.000' AS DateTime), CAST(32999 AS Decimal(18, 0)), 0)
INSERT [dbo].[Order] ([OrderID], [UserID], [Note], [CreateDate], [total], [Status]) VALUES (N'Order5', N'US0003', N' Retreat Dome Top Bird Cage', CAST(N'2023-03-05T16:30:00.000' AS DateTime), CAST(52999 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [Note], [CreateDate], [total], [Status]) VALUES (N'Order6', N'US115a83c', N'A&E Cage Co. 86"x62" Walk-In Aviary Base', CAST(N'2023-03-10T12:00:00.000' AS DateTime), CAST(1680 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [Note], [CreateDate], [total], [Status]) VALUES (N'Order7', N'US15bdd56', N' Elegant Flight Cage with Opening Top', CAST(N'2023-03-15T09:45:00.000' AS DateTime), CAST(46999 AS Decimal(18, 0)), 0)
INSERT [dbo].[Order] ([OrderID], [UserID], [Note], [CreateDate], [total], [Status]) VALUES (N'Order8', N'US5b93e35', N'Large Java Wood Tree Floor Play Stand', CAST(N'2023-03-20T14:20:00.000' AS DateTime), CAST(67999 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [Note], [CreateDate], [total], [Status]) VALUES (N'Order9', N'USb51d98b', N'Thuc An Chim Chich Choe Anh Thong (Bot) 150g ', CAST(N'2023-03-25T11:10:00.000' AS DateTime), CAST(10000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [FeedbackID], [Quantity], [Price], [Status], [IsCustom]) VALUES (N'Order1', N'PDT013', NULL, 1, CAST(32000 AS Decimal(18, 0)), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [FeedbackID], [Quantity], [Price], [Status], [IsCustom]) VALUES (N'Order10', N'PDT002', NULL, 1, CAST(1380 AS Decimal(18, 0)), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [FeedbackID], [Quantity], [Price], [Status], [IsCustom]) VALUES (N'Order2', N'PDT012', NULL, 1, CAST(32000 AS Decimal(18, 0)), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [FeedbackID], [Quantity], [Price], [Status], [IsCustom]) VALUES (N'Order3', N'PDT001', NULL, 1, CAST(1680 AS Decimal(18, 0)), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [FeedbackID], [Quantity], [Price], [Status], [IsCustom]) VALUES (N'Order4', N'PDT017', NULL, 1, CAST(32999 AS Decimal(18, 0)), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [FeedbackID], [Quantity], [Price], [Status], [IsCustom]) VALUES (N'Order5', N'PDT018', NULL, 1, CAST(52999 AS Decimal(18, 0)), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [FeedbackID], [Quantity], [Price], [Status], [IsCustom]) VALUES (N'Order6', N'PDT001', NULL, 1, CAST(1680 AS Decimal(18, 0)), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [FeedbackID], [Quantity], [Price], [Status], [IsCustom]) VALUES (N'Order7', N'PDT027', NULL, 1, CAST(46999 AS Decimal(18, 0)), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [FeedbackID], [Quantity], [Price], [Status], [IsCustom]) VALUES (N'Order8', N'PDT037', NULL, 1, CAST(67999 AS Decimal(18, 0)), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [FeedbackID], [Quantity], [Price], [Status], [IsCustom]) VALUES (N'Order9', N'PDT009', NULL, 1, CAST(10000 AS Decimal(18, 0)), 1, 0)
GO
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [DateTime], [amout], [CreateDate], [Status], [TransactionCode], [vnp_TransDate]) VALUES (N'p8f0fa0ba', N'O34666460', NULL, CAST(0 AS Decimal(18, 0)), CAST(N'2023-11-26' AS Date), 0, N'638366118157954719', NULL)
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [DateTime], [amout], [CreateDate], [Status], [TransactionCode], [vnp_TransDate]) VALUES (N'pddcafd28', N'O34666460', NULL, CAST(0 AS Decimal(18, 0)), CAST(N'2023-11-26' AS Date), 0, N'638366118158213580', NULL)
GO
--Cage
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT001', N'A&E Cage Co. 110"x62" Walk-In Aviary', 20, NULL, CAST(200000 AS Decimal(18, 0)), 20, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT002', N'A&E Cage Co. 24"x22" Retreat Dome Top Bird Cage', 15, NULL, CAST(200000 AS Decimal(18, 0)), 10, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT003', N'A&E Cage Co. 24"x22" Retreat Play Top Bird Cage', 0, NULL, CAST(200000 AS Decimal(18, 0)), 10, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT004', N'A&E Cage Co. 24"x22" Stainless Steel Retreat Play Top Bird Cage', 25, NULL, CAST(119990 AS Decimal(18, 0)), 10, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT005', N'A&E Cage Co. 24"x22" Triple Stack Breeder Cage', 30, NULL, CAST(730000 AS Decimal(18, 0)), 10, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT006', N'A&E Cage Co. 31"x20" Flight Cage & Stand', 0, NULL, CAST(440000 AS Decimal(18, 0)), 9, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT007', N'A&E Cage Co. 32" Large Corner Cage', 20, NULL, CAST(900000 AS Decimal(18, 0)), 0, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT008', N'A&E Cage Co. 32"x21" Flight Cage & Stand with Double Front Door', 24, NULL, CAST(220000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT009', N'A&E Cage Co. 32"x21" Forte Double Stack Bird Cage', 30, NULL, CAST(100000 AS Decimal(18, 0)), 0, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT010', N'A&E Cage Co. 32"x21" Forte Flight Bird Cage', 10, NULL, CAST(200000 AS Decimal(18, 0)), 0, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT011', N'A&E Cage Co. 32"x21"x61" Elegant Flight Cage with Opening Top', 11, NULL, CAST(200000 AS Decimal(18, 0)), 0, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT012', N'A&E Cage Co. 32"x23" Refuge Dome Top Bird Cage', 12, NULL, CAST(200000 AS Decimal(18, 0)), 20, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT013', N'A&E Cage Co. 32"x23" Refuge Play Top Bird Cage', 15, NULL, CAST(200000 AS Decimal(18, 0)), 10, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT014', N'A&E Cage Co. 32"x23" Stainless Steel Refuge Dome Top Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), 0, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT015', N'A&E Cage Co. 32"x23" Stainless Steel Refuge Play Top Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT016', N'A&E Cage Co. 36"x28" Majestic Dome Top Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT017', N'A&E Cage Co. 36"x28" Majestic Play Top Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT018', N'A&E Cage Co. 36"x28" Stainless Steel Majestic Dome Top Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT019', N'A&E Cage Co. 36"x28" Stainless Steel Majestic Play Top Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT020', N'A&E Cage Co. 40"x30" Classico Double Stack Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT021', N'A&E Cage Co. 40"x30" Imperial Dome Top Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT022', N'A&E Cage Co. 40"x30" Imperial Play Top Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT023', N'A&E Cage Co. 40"x30" Stainless Steel Imperial Dome Top Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT024', N'A&E Cage Co. 40"x30" Stainless Steel Imperial Play Top Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT025', N'A&E Cage Co. 40"x40" Macaw Flight Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT026', N'A&E Cage Co. 42" XL Corner Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT027', N'A&E Cage Co. 48"x36" Mondo Dome Top Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT028', N'A&E Cage Co. 48"x36" Mondo Play Top Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT029', N'A&E Cage Co. 48"x36" Stainless Steel Mondo Dome Top Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT030', N'A&E Cage Co. 62"x62"x79" Walk In Aviary', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT031', N'A&E Cage Co. 64"x21" Double Stack Flight Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT032', N'A&E Cage Co. 85"x61" Walk In Aviary', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT033', N'A&E Cage Co. 86"x62" Walk-In Aviary', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT034', N'Avian Adventures Grande Dometop Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT035', N'Avian Adventures Grande Playtop Bird Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT036', N'Avian Adventures Hacienda Dometop Bird Cage', 8, NULL, CAST(200000 AS Decimal(18, 0)), 25, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT037', N'Avian Adventures Loro Flight Cage', 16, NULL, CAST(200000 AS Decimal(18, 0)), 0, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT038', N'Avian Adventures Multi Vista Breeder Cage', 10, NULL, CAST(200000 AS Decimal(18, 0)), 0, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT039', N'Avian Adventures Recreation Center', 3, NULL, CAST(200000 AS Decimal(18, 0)), 5, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT040', N'Prevue Hendryx Deluxe Parrot Bird Cage with Play Top', 5, NULL, CAST(119990 AS Decimal(18, 0)), 0, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT041', N'Prevue Hendryx Extra Large Flight Bird Cage', 5, NULL, CAST(469900 AS Decimal(18, 0)), 10, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT042', N'Prevue Hendryx Flight Bird Cage with Storage Shelf', 22, NULL, CAST(419900 AS Decimal(18, 0)), 10, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT043', N'Prevue Hendryx Large Bird Cage with Storage Shelf', 16, NULL, CAST(219900 AS Decimal(18, 0)), 0, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT044', N'Prevue Hendryx Pagoda Cockatiel Bird Cage', 12, NULL, CAST(339900 AS Decimal(18, 0)), 15, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT045', N'Prevue Hendryx Pointed Top Floor Bird Aviary', 19, NULL, CAST(100000 AS Decimal(18, 0)), 3, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT046', N'Prevue Hendryx Signature Series Playtop Large Bird Cage', 20, NULL, CAST(199900 AS Decimal(18, 0)), 7, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT047', N'Prevue Hendryx Signature Series Playtop X-Large Bird Cage', 21, NULL, CAST(49000 AS Decimal(18, 0)), 18, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT048', N'Prevue Hendryx Silverado Macaw Bird Cage', 15, NULL, CAST(49000 AS Decimal(18, 0)), 18, 1)
																														   
--Food																													   
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT049', N'Bột NutriBird A19 3KG', 13, NULL, CAST(60000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT050', N'Bột NutriBird A21 3KG', 12, NULL, CAST(150000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT051', N'Hạt Trộn Hỗn Hợp Vẹt Prestige Amazon Parrot Mix Versele Laga 1kg', 13, NULL, CAST(200000 AS Decimal(18, 0)), 9, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT052', N'Nutribird G14 Original 1kg', 1, NULL, CAST(200000 AS Decimal(18, 0)), 9, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT053', N'Nutribird G14 Tropical 1kg', 16, NULL, CAST(270000 AS Decimal(18, 0)), 10, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT054', N'Nutribird G14 Tropical 200gram', 17, NULL, CAST(270000 AS Decimal(18, 0)), 10, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT055', N'Nutribird G14 Tropical 3kg', 18, NULL, CAST(280000 AS Decimal(18, 0)), 7, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT056', N'Nutribird G14 Tropical 500gram', 19, NULL, CAST(280000 AS Decimal(18, 0)), 7, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT057', N'Nutribird P15 Original 1kg', 1, NULL, CAST(280000 AS Decimal(18, 0)), 7, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT058', N'Nutribird P15 Tropical 1kg', 21, NULL, CAST(350000 AS Decimal(18, 0)), 8, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT059', N'Plp African Parakeet Mix 1kg', 31, NULL, CAST(350000 AS Decimal(18, 0)), 8, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT060', N'Plp African Parrot Mix 1kg', 10, NULL, CAST(370000 AS Decimal(18, 0)), 3, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT061', N'Plp Ara Parrot Mix 2kg', 11, NULL, CAST(370000 AS Decimal(18, 0)), 3, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT062', N'Plp Australian Parakeet Mix 1kg', 11, NULL, CAST(550000 AS Decimal(18, 0)), 15, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT063', N'Plp Australian Parrot Mix 1kg', 11, NULL, CAST(1000000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT064', N'Stick Parrots Nuts&Honey 140g', 11, NULL, CAST(1490000 AS Decimal(18, 0)), 10, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT065', N'Thức Ăn Dinh Dưỡng Dành Cho Chim Nhỏ Dạng Bột NutriBird A19 100g', 11, NULL, CAST(1490000 AS Decimal(18, 0)), 10, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT066', N'Thức Ăn Dinh Dưỡng Dành Cho Chim Nhỏ Dạng Bột NutriBird A21 100g', 1, NULL, CAST(60000 AS Decimal(18, 0)), 25, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT067', N'Thức Ăn Thưởng Cho Vẹt Stick Big Parakeets Exotic Fruit (140g)', 12, NULL, CAST(130000 AS Decimal(18, 0)), 19, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT068', N'Zupreem FruitBlend Flavor Size L Thức Ăn Cho Chim Vẹt Lớn', 1, NULL, CAST(265000 AS Decimal(18, 0)), 12, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT069', N'Zupreem FruitBlend Flavor Size M Thức Ăn Cho Chim Vẹt Vừa Đến Lớn', 13, NULL, CAST(265000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT070', N'Zupreem FruitBlend Flavor Size S Thức Ăn Cho Chim Vẹt Cỡ Vừa', 10, NULL, CAST(265000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT071', N'Zupreem FruitBlend Flavor Size S Thức Ăn Cho Chim Vẹt Cỡ Vừa', 1, NULL, CAST(270000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT072', N'Zupreem FruitBlend Flavor Size S Thức Ăn Cho Chim Vẹt Cỡ Vừa', 18, NULL, CAST(270000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT073', N'Zupreem Natural Size L Thức Ăn Cho Chim Vẹt Cỡ Lớn', 17, NULL, CAST(270000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT074', N'Zupreem Natural Size M Thức Ăn Cho Chim Vẹt Cỡ Vừa Đến Lớn', 15, NULL, CAST(350000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT075', N'Zupreem NuBlend Size M Thức Ăn Cho Chim Vẹt Lớn', 17, NULL, CAST(365000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT076', N'Zupreem NuBlend Size S Thức Ăn Cho Chim Vẹt Nhỏ', 21, NULL, CAST(365000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT077', N'Zupreem PastaBlend Size L Thức Ăn Dành Cho Chim Cỡ Lớn', 19, NULL, CAST(420000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT078', N'Zupreem PastaBlend Size M Thức Ăn Dành Cho Chim Cỡ Trung', 12, NULL, CAST(420000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT079', N'Zupreem PastaBlend Size S Thức Ăn Cho Chim Vẹt Dạng Vừa', 14, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT080', N'Zupreem Pure Fun Size L Thức Ăn Cho Chim Vẹt Cỡ Lớn', 13, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT081', N'Zupreem Pure Fun Size M Thức Ăn Cho Chim Vẹt Cỡ vừa', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT082', N'Zupreem Pure Fun Size S Thức Ăn Cho Chim Vẹt Cỡ Vừa', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT083', N'Zupreem Veggie Blend Size L Thức Ăn Cho Chim Vẹt Cỡ Lớn', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT084', N'Zupreem Veggie Blend Size S Thức Ăn Cho Chim Vẹt Cỡ Vừa', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
																														   
--a&t																													   
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT085', N'2018PT - 18"-20" (Rộng) x 16"-18" (Sâu) Bạt che lồng có khu vực trò chơi trên đỉnh', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT086', N'2220DT - 20"-22" (Rộng) x 16"-20" (Sâu) Bạt che lồng mái vòm', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT087', N'3221FT - 32" (Rộng) x 21" (Sâu) Bạt che lồng phẳng', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT088', N'6432MD - 64" (Rộng) x 32" (Sâu) Bạt che lồng đôi Macaw', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT089', N'Cơ sở chuồng chim đi bộ A&E Cage Co 110"x62"', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT090', N'Cơ sở chuồng chim đi bộ A&E Cage Co 62"x62"', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT091', N'Cơ sở chuồng chim đi bộ A&E Cage Co 85"x61"', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT092', N'Cơ sở chuồng chim đi bộ A&E Cage Co 86"x62"', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT093', N'Cửa phụ A&E Cage Co cho chuồng chim đi bộ 85"x61"', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT094', N'Cửa phụ A&E Cage Co cho chuồng chim đi bộ 86"x62"', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT095', N'Giá đỡ vẹt A&E Cage Co. 26x25 với thang và móc đồ chơi', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT096', N'Chân đế chơi bằng gỗ Java lớn của A&E Cage Co', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT097', N'Sàn chơi bằng gỗ Java lớn của A&E Cage Co', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT098', N'Chân đế chơi bằng gỗ Java lớn của A&E Cage Co', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT099', N'Trạm chơi trên bàn lớn của A&E Cage Co', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT100', N'Trạm chơi trên bàn trung bình của A&E Cage Co', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT101', N'Chân đế chơi bằng gỗ Java trung bình của A&E Cage Co', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT102', N'Chân đế chơi bằng gỗ Java trung bình của A&E Cage Co', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT103', N'Trạm chơi trên bàn nhỏ của A&E Cage Co', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT104', N'Chân đế chơi bằng gỗ Java nhỏ của A&E Cage Co', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT105', N'Khóa cửa lồng chim A&E Feeder', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT106', N'Khóa cửa lồng chim hình nửa vòng tròn sơn tĩnh điện của A&E', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT107', N'Khóa trượt cửa lồng chim bằng thép không gỉ của A&E', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT108', N'Chân đế chơi của vẹt Avian Adventures', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT109', N'Mô hình giải trí vẹt Avian Adventures', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT110', N'Dây bông cầu vồng cực lớn Happy Beaks có chuông', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT111', N'Dây bông cầu vồng lớn Happy Beaks có chuông', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT112', N'Đồ chơi chim nhỏ Ball Thing bằng gỗ Java của Happy Beaks', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT113', N'Dây bông cầu vồng trung bình Happy Beaks có chuông', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT114', N'Dây bông cầu vồng nhỏ Happy Beaks có chuông', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Quantity], [Description], [Price], [Discount], [Status]) VALUES (N'PDT115', N'Quả cầu không gian Happy Beaks trên dây chuyền đồ chơi chim', 11, NULL, CAST(490000 AS Decimal(18, 0)), NULL, 1)
GO
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTC00001', N'test', N'Sib1563e5', N'COccaff63', N'Ma2b54e5d', N'S831874f7', N'USce97c75', CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTC22198', N'huybonn', N'Sif4a814d', NULL, NULL, N'S831874f7', N'USce97c75', CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTC2fe55', N'sss', N'Si987f6b9', NULL, N'M0002', N'S831874f7', N'USce97c75', CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTC302bf', N'Gia Huy Nguyen', NULL, NULL, NULL, NULL, N'USce97c75', CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTC57981', N'wq', N'Si987f6b9', N'CO342345s', N'M0002', N'S831874f7', N'USce97c75', CAST(3600 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTC58b63', N'test', NULL, NULL, NULL, N'S831874f7', N'USce97c75', CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTC75fee', N'test', NULL, NULL, NULL, N'S831874f7', N'USce97c75', CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTC7679a', N'huybonn', NULL, NULL, NULL, N'S831874f7', N'USce97c75', CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTC9347c', N'ss', NULL, NULL, NULL, NULL, N'USce97c75', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTC94386', N'Gia Huy Nguyen', NULL, NULL, NULL, NULL, N'USce97c75', CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTCab6d5', N's', NULL, NULL, NULL, NULL, N'USce97c75', CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTCb795c', N'á', N'Si987f6b9', NULL, NULL, N'S831874f7', N'USce97c75', CAST(1500 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTCc94eb', N'a', NULL, NULL, NULL, N'S831874f7', N'USce97c75', CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTCe2442', N'string', N'Sib1563e5', NULL, NULL, N'S831874f7', N'USce97c75', CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTCfb6b7', N'ss', NULL, NULL, NULL, N'S831874f7', N'USce97c75', CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[ProductCustom] ([ProductCustomID], [ProductName], [ProductSize], [ProductColor], [ProductMaterial], [ProductStyle], [UserID], [Price]) VALUES (N'PDTCfd6ee', N'ss', NULL, NULL, NULL, NULL, N'USce97c75', CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (N'1', N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (N'2', N'Manager')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (N'3', N'Staff')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (N'4', N'Customer')
GO
INSERT [dbo].[Size] ([SizeID], [Size], [SizeDescription], [StyleID], [IsCustom], [Price]) VALUES (N'Si0001', N'23x35     ', N'small', NULL, 0, CAST(22220 AS Decimal(18, 0)))
INSERT [dbo].[Size] ([SizeID], [Size], [SizeDescription], [StyleID], [IsCustom], [Price]) VALUES (N'Si096b0dc', N'string', N'string', NULL, 0, CAST(22220 AS Decimal(18, 0)))
INSERT [dbo].[Size] ([SizeID], [Size], [SizeDescription], [StyleID], [IsCustom], [Price]) VALUES (N'Si1bbbc4e', N'35x35     ', N'medium', NULL, 0, CAST(22220 AS Decimal(18, 0)))
INSERT [dbo].[Size] ([SizeID], [Size], [SizeDescription], [StyleID], [IsCustom], [Price]) VALUES (N'Si987f6b9', N'Bát giác', N'200x200cm', N'S831874f7', 1, CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[Size] ([SizeID], [Size], [SizeDescription], [StyleID], [IsCustom], [Price]) VALUES (N'SiB0001', N'Nhỏ', N'nhỏ', NULL, 0, CAST(22220 AS Decimal(18, 0)))
INSERT [dbo].[Size] ([SizeID], [Size], [SizeDescription], [StyleID], [IsCustom], [Price]) VALUES (N'SiB0002', N'Trung bình', N'trung bình', NULL, 0, CAST(22220 AS Decimal(18, 0)))
INSERT [dbo].[Size] ([SizeID], [Size], [SizeDescription], [StyleID], [IsCustom], [Price]) VALUES (N'SiB0003', N'Lớn', N'lớn', NULL, 0, CAST(22220 AS Decimal(18, 0)))
INSERT [dbo].[Size] ([SizeID], [Size], [SizeDescription], [StyleID], [IsCustom], [Price]) VALUES (N'Sib1563e5', N'Bát giác', N'100x100cm', N'S831874f7', 1, CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[Size] ([SizeID], [Size], [SizeDescription], [StyleID], [IsCustom], [Price]) VALUES (N'Sif4a814d', N'Lục giác', N'100x100cm', N'S831874f7', 1, CAST(22220 AS Decimal(18, 0)))
GO
INSERT [dbo].[Style] ([StyleID], [StyleName], [StyleDescription], [Status], [IsCustom], [Price]) VALUES (N'S00007', N'Corner', N'lồng việt nam', 1, 0, NULL)
INSERT [dbo].[Style] ([StyleID], [StyleName], [StyleDescription], [Status], [IsCustom], [Price]) VALUES (N'S831874f7', N'suncatcher', N'for custom', 1, 1, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Style] ([StyleID], [StyleName], [StyleDescription], [Status], [IsCustom], [Price]) VALUES (N'Sab934562', N'Aviaries', N'for big', 1, 0, NULL)
INSERT [dbo].[Style] ([StyleID], [StyleName], [StyleDescription], [Status], [IsCustom], [Price]) VALUES (N'Sc6dd1118', N'Breeder', N'for bread', 1, 0, NULL)
GO
INSERT [dbo].[User] ([UserID], [RoleID], [ImageURL], [UserName], [PassWord], [FullName], [Gender], [DateOfBird], [Address], [PhoneNumber], [Email], [Status]) VALUES (N'US0002', N'3', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/default-non-user-no-photo-1.jpg?alt=media&token=64d98533-d6cc-4560-a48e-d2e75686045c', N'staff', N'$2a$12$V4E0jobxNZlIKxRPDFGIneLCDMW5rD.4.3gbWtN0UK7XJ1HRmpSNO', N'staff', 1, CAST(N'2023-10-29' AS Date), N'string', N'1234', N'user@example.com', 1)
INSERT [dbo].[User] ([UserID], [RoleID], [ImageURL], [UserName], [PassWord], [FullName], [Gender], [DateOfBird], [Address], [PhoneNumber], [Email], [Status]) VALUES (N'US0003', N'2', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/default-non-user-no-photo-1.jpg?alt=media&token=64d98533-d6cc-4560-a48e-d2e75686045c', N'manager', N'$2a$12$QnkvN6I3wGbrx4RnbV5C7uVoq.y9ppQ.iVyEjY1JPZUZzceoFLR16', N'manager', 0, CAST(N'2023-10-11' AS Date), N'string', N'1234', N'user@example.com', 1)
INSERT [dbo].[User] ([UserID], [RoleID], [ImageURL], [UserName], [PassWord], [FullName], [Gender], [DateOfBird], [Address], [PhoneNumber], [Email], [Status]) VALUES (N'US115a83c', N'4', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/default-non-user-no-photo-1.jpg?alt=media&token=64d98533-d6cc-4560-a48e-d2e75686045c', N'lmao', N'$2a$11$2cXjLbrAmTyBRPNYGoaxL.uMVZAZqcK6T2mKViJj7BGGmRyoZK7AW', NULL, NULL, NULL, NULL, NULL, N'dotranlam2003@gmail.com', 1)
INSERT [dbo].[User] ([UserID], [RoleID], [ImageURL], [UserName], [PassWord], [FullName], [Gender], [DateOfBird], [Address], [PhoneNumber], [Email], [Status]) VALUES (N'US15bdd56', N'2', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/default-non-user-no-photo-1.jpg?alt=media&token=64d98533-d6cc-4560-a48e-d2e75686045c', N'sa', N'$2a$11$7yo8GdnQHfA.dvzl4GfAjuBYFt3YP2b4tbyYJThYedO87ROLumSKa', N'sa', 1, CAST(N'2023-09-25' AS Date), N'S7.03 Vinhomes Grand Park, Đường Nguyễn Xiển, Phường Long Thạnh Mỹ, Thành Phố Thủ Đức, TP. Hồ Chí Minh', N'0911861612', NULL, 1)
INSERT [dbo].[User] ([UserID], [RoleID], [ImageURL], [UserName], [PassWord], [FullName], [Gender], [DateOfBird], [Address], [PhoneNumber], [Email], [Status]) VALUES (N'US5b93e35', N'1', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/default-non-user-no-photo-1.jpg?alt=media&token=64d98533-d6cc-4560-a48e-d2e75686045c', N'admin', N'$2a$11$p0jnls0vuZxUm7/nI5lkG.azyVe/vCbGzgKOD9oLKSyyEuAvP/nky', N'string', 1, CAST(N'2023-10-15' AS Date), N'string', N'1234', N'user@example.com', 1)
INSERT [dbo].[User] ([UserID], [RoleID], [ImageURL], [UserName], [PassWord], [FullName], [Gender], [DateOfBird], [Address], [PhoneNumber], [Email], [Status]) VALUES (N'USb51d98b', N'3', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/default-non-user-no-photo-1.jpg?alt=media&token=64d98533-d6cc-4560-a48e-d2e75686045c', N'Lmao', N'$2a$11$USxq0n989tlzF.a2lsZWU.4fwsn9oIzIeqrW5suLpWJoxzojPkJCm', N'Lam Do', 1, CAST(N'2023-10-30' AS Date), NULL, NULL, N'dotranlam2003@gmail.com', 1)
INSERT [dbo].[User] ([UserID], [RoleID], [ImageURL], [UserName], [PassWord], [FullName], [Gender], [DateOfBird], [Address], [PhoneNumber], [Email], [Status]) VALUES (N'USce97c75', N'4', N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/default-non-user-no-photo-1.jpg?alt=media&token=64d98533-d6cc-4560-a48e-d2e75686045c&_gl=1*9fxttw*_ga*MTQ3ODExNzM0NS4xNjk3NDkzNDAz*_ga_CW55HF8NVT*MTY5NzcwMDQ5Mi42LjEuMTY5NzcwMDY4NS4zMi4wLjA.', N'string', N'$2a$11$eOnbawJk55WQFLc2VyH0AupwpsIx2/7/45jgg884l6DLk9JlCzrkO', N'Lam Do', 1, CAST(N'2003-08-04' AS Date), N'S7.03 Vinhomes Grand Park, Đường Nguyễn Xiển, Phường Long Thạnh Mỹ, Thành Phố Thủ Đức, TP. Hồ Chí Minh', N'0911861612', N'user@example.com', 1)
GO
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [Description], [Discount], [StartDate], [EndDate], [CreateAt], [Status]) VALUES (N'V0001', N'Discount', N'Test', N'10%', CAST(N'2023-10-31' AS Date), CAST(N'2023-11-10' AS Date), CAST(N'2023-10-31' AS Date), 1)
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [Description], [Discount], [StartDate], [EndDate], [CreateAt], [Status]) VALUES (N'V0002', N'Voucher', N'voucher', N'0%', CAST(N'2023-10-31' AS Date), CAST(N'2023-11-01' AS Date), CAST(N'2023-10-31' AS Date), 0)
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [Description], [Discount], [StartDate], [EndDate], [CreateAt], [Status]) VALUES (N'V24b100df', N'VoucherTest2', N'test voucher add after fix', N'10', CAST(N'2023-11-08' AS Date), CAST(N'2023-12-10' AS Date), CAST(N'2023-11-08' AS Date), 0)
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [Description], [Discount], [StartDate], [EndDate], [CreateAt], [Status]) VALUES (N'V33477f13', N'VoucherTest', N'test voucher add', N'10', CAST(N'2023-11-08' AS Date), CAST(N'2023-12-10' AS Date), CAST(N'2023-11-08' AS Date), 0)
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [Description], [Discount], [StartDate], [EndDate], [CreateAt], [Status]) VALUES (N'V3cc36126', N'abc', N'aaaa', N'10', CAST(N'2003-02-01' AS Date), CAST(N'2005-02-01' AS Date), CAST(N'2023-11-08' AS Date), 0)
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [Description], [Discount], [StartDate], [EndDate], [CreateAt], [Status]) VALUES (N'V56ee71d2', N'a', N'a', N'10', CAST(N'2003-02-01' AS Date), CAST(N'2005-02-01' AS Date), CAST(N'2023-11-08' AS Date), 0)
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [Description], [Discount], [StartDate], [EndDate], [CreateAt], [Status]) VALUES (N'V6d26d7ce', N'VoucherTest', N'test voucher add after fix', N'10', CAST(N'2023-11-08' AS Date), CAST(N'2023-12-10' AS Date), CAST(N'2023-11-08' AS Date), 0)
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [Description], [Discount], [StartDate], [EndDate], [CreateAt], [Status]) VALUES (N'V8d40e65d', N'abc', N'a', N'10', CAST(N'2023-11-08' AS Date), CAST(N'2023-12-10' AS Date), CAST(N'2023-11-08' AS Date), 0)
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [Description], [Discount], [StartDate], [EndDate], [CreateAt], [Status]) VALUES (N'V90b68268', N'abc', N'abc', N'-19', CAST(N'2023-10-31' AS Date), CAST(N'2023-12-10' AS Date), CAST(N'2023-11-10' AS Date), 0)
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [Description], [Discount], [StartDate], [EndDate], [CreateAt], [Status]) VALUES (N'Vbc54f806', N'abc', N'aaa', N'10', CAST(N'2023-11-08' AS Date), CAST(N'2023-11-08' AS Date), CAST(N'2023-11-08' AS Date), 0)
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [Description], [Discount], [StartDate], [EndDate], [CreateAt], [Status]) VALUES (N'Vc9393c29', N'abc', N'a', N'10', CAST(N'2023-11-08' AS Date), CAST(N'2023-12-10' AS Date), CAST(N'2023-11-08' AS Date), 0)
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [Description], [Discount], [StartDate], [EndDate], [CreateAt], [Status]) VALUES (N'Vdc0e7fa3', N'bca', N'qqq', N'20', CAST(N'2023-11-08' AS Date), CAST(N'2023-11-08' AS Date), CAST(N'2023-11-08' AS Date), 0)
INSERT [dbo].[Voucher] ([VoucherID], [VoucherName], [Description], [Discount], [StartDate], [EndDate], [CreateAt], [Status]) VALUES (N'Vebfa6ff3', N'a', N'abc', N'10', CAST(N'2023-11-08' AS Date), CAST(N'2023-11-08' AS Date), CAST(N'2023-11-08' AS Date), 0)
GO

ALTER TABLE [dbo].[Bird]  WITH CHECK ADD  CONSTRAINT [FK_Bird_BirdType] FOREIGN KEY([BirdType])
REFERENCES [dbo].[BirdType] ([BirdTypeID])
GO
ALTER TABLE [dbo].[Bird] CHECK CONSTRAINT [FK_Bird_BirdType]
GO
ALTER TABLE [dbo].[Bird]  WITH CHECK ADD  CONSTRAINT [FK_Bird_Size] FOREIGN KEY([BirdSize])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[Bird] CHECK CONSTRAINT [FK_Bird_Size]
GO
ALTER TABLE [dbo].[BirdProduct]  WITH CHECK ADD  CONSTRAINT [FK_BirdProduct_Bird] FOREIGN KEY([BirdID])
REFERENCES [dbo].[Bird] ([BirdID])
GO
ALTER TABLE [dbo].[BirdProduct] CHECK CONSTRAINT [FK_BirdProduct_Bird]
GO
ALTER TABLE [dbo].[BirdProduct]  WITH CHECK ADD  CONSTRAINT [FK_BirdProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[BirdProduct] CHECK CONSTRAINT [FK_BirdProduct_Product]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_User]
GO
ALTER TABLE [dbo].[CategoryProduct]  WITH CHECK ADD  CONSTRAINT [FK_CategoryProduct_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[CategoryProduct] CHECK CONSTRAINT [FK_CategoryProduct_Category]
GO
ALTER TABLE [dbo].[CategoryProduct]  WITH CHECK ADD  CONSTRAINT [FK_CategoryProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[CategoryProduct] CHECK CONSTRAINT [FK_CategoryProduct_Product]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_FeedBack] FOREIGN KEY([FeedbackID])
REFERENCES [dbo].[FeedBack] ([FeedbackID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_FeedBack]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Color]  WITH CHECK ADD  CONSTRAINT [FK_Color_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([MaterialID])
GO
ALTER TABLE [dbo].[Color] CHECK CONSTRAINT [FK_Color_Material]
GO
ALTER TABLE [dbo].[ColorProduct]  WITH CHECK ADD  CONSTRAINT [FK_ColorProduct_Color] FOREIGN KEY([ColorID])
REFERENCES [dbo].[Color] ([ColorID])
GO
ALTER TABLE [dbo].[ColorProduct] CHECK CONSTRAINT [FK_ColorProduct_Color]
GO
ALTER TABLE [dbo].[ColorProduct]  WITH CHECK ADD  CONSTRAINT [FK_ColorProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ColorProduct] CHECK CONSTRAINT [FK_ColorProduct_Product]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Bird] FOREIGN KEY([BirdID])
REFERENCES [dbo].[Bird] ([BirdID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Bird]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Blog] FOREIGN KEY([BlogID])
REFERENCES [dbo].[Blog] ([BlogID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Blog]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([MaterialID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Material]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Product]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Size]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Style] FOREIGN KEY([StyleID])
REFERENCES [dbo].[Style] ([StyleID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Style]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Size]
GO
ALTER TABLE [dbo].[MaterialProduct]  WITH CHECK ADD  CONSTRAINT [FK_MaterialProduct_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([MaterialID])
GO
ALTER TABLE [dbo].[MaterialProduct] CHECK CONSTRAINT [FK_MaterialProduct_Material]
GO
ALTER TABLE [dbo].[MaterialProduct]  WITH CHECK ADD  CONSTRAINT [FK_MaterialProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[MaterialProduct] CHECK CONSTRAINT [FK_MaterialProduct_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Order]
GO
ALTER TABLE [dbo].[ProductCustom]  WITH CHECK ADD  CONSTRAINT [FK_ProductCustom_Color] FOREIGN KEY([ProductColor])
REFERENCES [dbo].[Color] ([ColorID])
GO
ALTER TABLE [dbo].[ProductCustom] CHECK CONSTRAINT [FK_ProductCustom_Color]
GO
ALTER TABLE [dbo].[ProductCustom]  WITH CHECK ADD  CONSTRAINT [FK_ProductCustom_Material] FOREIGN KEY([ProductMaterial])
REFERENCES [dbo].[Material] ([MaterialID])
GO
ALTER TABLE [dbo].[ProductCustom] CHECK CONSTRAINT [FK_ProductCustom_Material]
GO
ALTER TABLE [dbo].[ProductCustom]  WITH CHECK ADD  CONSTRAINT [FK_ProductCustom_Size] FOREIGN KEY([ProductSize])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[ProductCustom] CHECK CONSTRAINT [FK_ProductCustom_Size]
GO
ALTER TABLE [dbo].[ProductCustom]  WITH CHECK ADD  CONSTRAINT [FK_ProductCustom_Style] FOREIGN KEY([ProductStyle])
REFERENCES [dbo].[Style] ([StyleID])
GO
ALTER TABLE [dbo].[ProductCustom] CHECK CONSTRAINT [FK_ProductCustom_Style]
GO
ALTER TABLE [dbo].[ProductCustom]  WITH CHECK ADD  CONSTRAINT [FK_ProductCustom_User1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ProductCustom] CHECK CONSTRAINT [FK_ProductCustom_User1]
GO
ALTER TABLE [dbo].[Size]  WITH CHECK ADD  CONSTRAINT [FK_Size_Style] FOREIGN KEY([StyleID])
REFERENCES [dbo].[Style] ([StyleID])
GO
ALTER TABLE [dbo].[Size] CHECK CONSTRAINT [FK_Size_Style]
GO
ALTER TABLE [dbo].[SizeProduct]  WITH CHECK ADD  CONSTRAINT [FK_SizeProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[SizeProduct] CHECK CONSTRAINT [FK_SizeProduct_Product]
GO
ALTER TABLE [dbo].[SizeProduct]  WITH CHECK ADD  CONSTRAINT [FK_SizeProduct_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[SizeProduct] CHECK CONSTRAINT [FK_SizeProduct_Size]
GO
ALTER TABLE [dbo].[StyleProduct]  WITH CHECK ADD  CONSTRAINT [FK_StyleProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[StyleProduct] CHECK CONSTRAINT [FK_StyleProduct_Product]
GO
ALTER TABLE [dbo].[StyleProduct]  WITH CHECK ADD  CONSTRAINT [FK_StyleProduct_Style] FOREIGN KEY([StyleID])
REFERENCES [dbo].[Style] ([StyleID])
GO
ALTER TABLE [dbo].[StyleProduct] CHECK CONSTRAINT [FK_StyleProduct_Style]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role1] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role1]
GO
ALTER TABLE [dbo].[VoucherUserOrder]  WITH CHECK ADD  CONSTRAINT [FK_VoucherUserOrder_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[VoucherUserOrder] CHECK CONSTRAINT [FK_VoucherUserOrder_Order]
GO
ALTER TABLE [dbo].[VoucherUserOrder]  WITH CHECK ADD  CONSTRAINT [FK_VoucherUserOrder_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[VoucherUserOrder] CHECK CONSTRAINT [FK_VoucherUserOrder_User]
GO
ALTER TABLE [dbo].[VoucherUserOrder]  WITH CHECK ADD  CONSTRAINT [FK_VoucherUserOrder_Voucher] FOREIGN KEY([VoucherID])
REFERENCES [dbo].[Voucher] ([VoucherID])
GO
ALTER TABLE [dbo].[VoucherUserOrder] CHECK CONSTRAINT [FK_VoucherUserOrder_Voucher]
GO
USE [master]
GO
ALTER DATABASE [BCS_SWP391] SET  READ_WRITE 
GO
