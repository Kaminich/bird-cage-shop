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
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0002', N'US0002', N'Mua bán chim vẹt cần lưu ý những gì?', N'Vẹt là loài chim rất thông minh, có thể nuôi như một loại thú cưng tuyệt vời, nhưng có một…', N'Vẹt là loài chim rất thông minh, có thể nuôi như một loại thú cưng tuyệt vời, nhưng có một số điều bạn cần biết về vẹt và những yêu cầu trong việc mua bán chim vẹt trước khi quyết định mua và nuôi chúng. Bài viết sau đây của Pet Me Shop sẽ giúp bạn có thêm một số kỹ năng mua bán chim vẹt để có được sự lựa chọn ưng ý nhất.\n\nNhững lưu ý khi mua bán chim vẹt\n\nVẹt có nhiều loại và nhiều giá khác nhau. Mắc nhất là vẹt Macaw, loại vẹt này là loại to nhất trong tất cả các loại. Chúng nặng từ 900 grams cho đến 1 ký 5 và có thể dài tới 86 cm. Giá bán từ 100 triệu một con trở lên, tùy màu sắc. Thứ nhì là vẹt ngực hồng, loại vẹt này chỉ nặng khoảng 200 grams và dài từ 12 đến 15 cm. Giá thì rất bèo, trung bình một con chỉ vài trăm ngàn tiền Việt Nam. Nhưng vẹt ngực hồng rất ít nói hoặc không có khả năng nói tiếng người. Nếu bạn chỉ cần ngắm chúng thì chúng là sự lựa chọn đúng, mong chúng nói thì bạn sẽ bị thất vọng nhiều hơn.\n\nBạn bỏ ra bao nhiêu tiền để mua không quan trọng bằng biết cách kiểm tra xem con vẹt mà bạn sắp mua xem có khỏe mạnh hay mang những mầm bệnh trong mình không? Và còn rất nhiều bộ phận khác cần kiểm tra. Nếu không biết xem xét kỹ thì coi chừng tiền mất, tật mang đấy bạn nhé vì giá thành của một con vẹt ngày càng cao có thể lên tới vài chục triệu đồng.\n\nSau đây là cách kiểm tra trước khi mua bán chim vẹt\n\n– Mắt của vẹt phải trong, không có gì chảy ra và mũi phải khô ráo.\n\n– Lông không bị rụng nhiều, nếu bị rụng là vì con vẹt đó đang bị stress nên tự nhổ lông. Ngoại trừ khi vẹt đang thay lông nếu trên 18 tháng tuổi.\n\n– Lật ngửa vẹt lên xem chỗ đi vệ sinh có dính phân và ướt không? Nếu có thì con vẹt đó đang bị bệnh.\n\n– Xem khi vẹt đi phân ra có màu sắc không bình thường và có mùi hôi không? Phân của vẹt thường không hôi và xung quanh phải màu xanh, ở giữa màu trắng.\n\n– Khi vẹt đứng trên cây hay trong chuồng, đầu có úp dưới cánh không? Nếu giấu đầu dưới cánh là vẹt bệnh. Thường thì khi vẹt ngủ, chúng xoay đầu hẳn ra sau và gác lên lưng thôi.\n\n– Kiểm tra nơi ăn uống, nơi sinh hoạt của vẹt để biết xem người chủ có chăm sóc và vệ sinh kỹ không? Nếu quá dơ bẩn thì vẹt có thể phát sinh bệnh sau này bạn nên lưu tâm và bỏ qua shop đó vì vấn đề ưu tiên vấn là sạch sẽ.\n\n– Bạn thử nhấc cánh của vẹt xem có bị xệ xuống không? Vẹt có ngủ nhiều hơn bình thường không hay chúng la hét hay nói, giọng có bị thay đổi không? Nếu có những biểu hiện trên thì rất có thể vẹt đã bị bệnh.\n\n– Cầm thức ăn hay đồ chơi gì đó và đưa đến cho vẹt. Nếu nó không quan tâm thì có thể bị bệnh. Bởi con vẹt nào cũng ham ăn và hiếu kỳ khi đưa bất cứ vật gì đến miệng chúng.\n\nMong rằng những lưu ý trên đây về việc mua bán chim vẹt sẽ giúp bạn chọn được chú vẹt ưng ý và khỏe mạnh!'
, N'Buy', CAST(N'2023-12-04' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0003', N'US0002', N'Chim vẹt giá bao nhiêu? Những rắc rối có thể gặp phải khi nuôi vẹt', N'Chim vẹt là một loại chim được rất nhiều nghệ nhân ở việt nam yêu quý và nuôi chúng, bởi…', N'Chim vẹt là một loại chim được rất nhiều nghệ nhân ở việt nam yêu quý và nuôi chúng, bởi vì chúng không chỉ hót hay mà còn có khả năng bắt chước nói tiếng người rất giỏi. Đối với ai thích vẹt thì việc khám phá thắc mắc chim vẹt giá bao nhiêu là điều cực kỳ cần thiết. Và đặc biệt hơn, bạn đang muốn mua một chú vẹt kiểng nhưng lại không biết cách nuôi loại thú cưng này như thế nào? Theo dõi bài viết để Pet me Shop giải đáp giúp bạn.\n\nLàm sao biết chim vẹt giá bao nhiêu?\n\nĐể tìm hiểu chim vet gia bao nhieu chúng ta cần phân tích, nhận xét kỹ càng khi mà loài vẹt ngày càng được nhiều người nuôi nấng như ᴠật cưng để làm bầu bạn, giải trí của con người. Vậy nên, hiện nay giá bán một chú vẹt sẽ có sự chênh lệch khác nhau, và chim vet gia bao nhieu còn tùy thuộc vào nhiều yếu tố như kích thước, độ tuổi, nguồn gốc, màu sắc hay bộ lông.\n\n>>> Có thể bạn quan tâm: Giá mua chim két (vẹt) tại thị trường Việt Nam?\n\nNhững vấn đề và phương pháp giải quyết khi nuôi vẹt \nTiếng hót làm ồn\n\nTrước tiên là tiếng kêu của chúng. Tuy chúng không kêu cả ngày, nhưng mỗi khi kêu lên chúng có thể khiến người chủ giật mình. Âm thanh của một con vẹt kích thước trung bình có thể lớn bằng tiếng chó sủa. Vẹt kích thước lớn thì âm thanh chúng gây ra sẽ rất khủng khiếp.\n\nCách giải quyết là huấn luyện vẹt im lặng. Nếu kêu quá to hoặc kêu vô cớ thì vả miệng hoặc giữ chặt mỏ. Nhưng không được đánh quá mạnh. Chim có bộ xương rỗng, rất dễ bị đánh chết hoặc bị thương.\n\nPhá hoại đồ đạc\n\nNgoài ra, chúng có khả năng phá hoại đồ nội thất hoặc quần áo rất mạnh do tính tò mò của chúng. Chỉ cần nhìn thấy bất cứ thứ gì lạ, chúng sẽ cắn thử xem sao. Hơn nữa lực cắn của vẹt rất mạnh, nhất là các giống vẹt lớn. Đồ nhựa, gỗ, vải loại nào thì loài vẹt cũng sẽ cắn được.\n\nChủ nhân phải chú ý để ngăn chặn kịp thời. Nhưng việc cắn rỉa đồ đạc cũng có tác dụng giúp chúng mài mỏ. Nếu không thì mỏ sẽ mọc liên tục, gây cản trở việc ăn uống và sinh hoạt bình thường. Cách tốt nhất là chuồng nuôi vẹt có nhiều loại đồ chơi để chúng gặm cắn giết thời gian. Ví dụ như vòng, xích đu, dây thừng hoặc mai mực để cung cấp canxi cho vẹt.\n\nĐi vệ sinh bừa bãi\n\nVẹt đi vệ sinh khắp nơi, gần như không thể huấn luyện một con chim biết cách đi vệ sinh đúng chỗ giống như chó mèo. Thông thường sau khi ăn no, thời gian vẹt đi vệ sinh chỉ trong vòng mấy phút sau vẹt sẽ đi một lần. Bất luận là bản thân đang ở đâu.\n\nĐể phòng tránh việc đi vệ sinh bừa bãi, người nuôi nên quan sát chúng. Khi thấy con vẹt muốn đi vệ sinh thì di chuyển đến chỗ cố định. Thực ra cũng không cần lo lắng quá, vì lượng chất thải mỗi lần của vẹt không nhiều. Cho dù là vẹt kích thước lớn thì mỗi lần cũng chỉ bằng một đồng tiền xu. Dùng giấy vệ sinh lau sạch rồi vứt đi.\n\nVẹt bị thương\n\nCuối cùng, nếu vẹt bị thương hoặc mắc bệnh thì rất rắc rối. Bởi tại Việt Nam có rất ít bệnh viện và bác sĩ thú y chuyên khoa có thể điều trị bệnh cho vẹt. Hơn nữa thuốc của chim cũng thường đắt hơn các loại thuốc thú ý khác. Chi phí phẫu thuật cho vẹt cũng không rẻ và độ khó khi phẫu thuật lớn hơn nhiều so với chó mèo. Mức độ nguy hiểm cũng cao hơn.\n\nĐể nuôi vẹt khỏe mạnh, hãy chú ý đến thú cưng nhiều hơn. Phòng tránh những tai nạn có thể xảy ra. Chú ý vấn đề vệ sinh nơi ở, đồ dùng, đồ chơi. Chú ý ăn uống và rèn luyện, giữ an toàn cho vẹt.\n\nTrên đây là nội dung bài chia sẻ giải đáp thắc mắc chim vẹt giá bao nhiêu và những rắc rối người chủ thường xuyên gặp phải khi nuôi vẹt. Bởi có rất nhiều người thắc mắc yếu tố vùng miền có ảnh hưởng đến giá vẹt như khi đến Pet Me Shop khách hàng thường hỏi ở miền Nam chim vet gia bao nhieu, ở miền Bắc chim vet gia bao nhieu? Chúng không chỉ phụ thuộc vào yếu tố vùng miền phân phối mà còn rất nhiều yếu tố khác. Hy vọng bài viết của chúng tôi đã mang tới cho bạn những thông tin bổ ích giúp bạn có được chú vẹt ưng ý nhất.'
, N'Buy', CAST(N'2023-12-18' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0004', N'US0002', N'Mua bán vẹt non giá rẻ, uy tín chất lượng tại Pet Me Shop', N'Vẹt là loài động vật hiếm hoi trong số loài chim có thể bắt chước được tiếng người. Chính vì…', N'Vẹt là loài động vật hiếm hoi trong số loài chim có thể bắt chước được tiếng người. Chính vì thế, loài vẹt rất được ưa chuộng, nhiều người ưa thích lựa chọn làm chim cảnh nuôi trong nhà. Những người luyện chim cảnh rất thích nuôi vẹt và tập luyện chúng nói, tạo cảm giác có một người bầu bạn với mình. Nhưng muốn thực sự hiệu quả, bạn nên đến những địa điểm mua bán vẹt non để tìm mua vẹt chưa trưởng thành, như vậy sẽ dễ dàng hơn trong việc huấn luyện chúng bắt nước nói tiếng người, không mất thời gian thay đổi thói quen của vẹt con.\n\nĐể chọn đúng địa điểm mua bán vẹt non được ưng ý trước hết phải hiểu về loài chim này, nắm bắt được các giống vẹt khác nhau như thế nào để từ đó chọn mua ban vet non phù hợp với nhu cầu và túi tiền của bạn nhất. Tại Pet Me Shop, bạn sẽ được thoải mái tìm kiếm chú vẹt non mà mình mong muốn cùng với sự tư vấn nhiệt tình, hiệu quả mà đội ngũ bán hàng ở đây gợi ý. Chúng tôi có mua bán vẹt non các loại có nguồn gốc, xuất xứ rõ ràng, đạt tiêu chuẩn với mức giá hợp lý cho cả người mua và người bán.\n\nCách chọn mua bán vẹt non\nLựa chọn vẹt con có lứa tuổi phù hợp\n\nBạn đừng nghĩ vẹt càng nhỏ càng dễ huấn luyện và dễ nuôi, cũng là con non nhưng ở một giai đoạn nhất định, chúng mới trở nên cứng cáp và đủ xa vòng tay mẹ. Chọn những bé vẹt còn quá nhỏ sẽ chỉ khiến bạn mất nhiều thời gian chăm chút hơn, cực kỳ khéo léo mới khiến chúng lớn nhanh, khỏe mạnh.\n\nLựa chọn vẹt con có lứa tuổi phù hợp\n\nNhững chú vẹt non đã biết chập chững học bay, mọc đủ lông sẽ khiến bạn dễ dàng chăm nom và an toàn hơn trong quá trình nuôi dưỡng. Lúc này cơ thể chúng cũng tăng cường hơn về sức đề kháng vì vậy có thể chống chịu tốt hơn với môi trường bên ngoài, vi khuẩn, giúp giảm rủi ro của bạn khi nuôi pet.\n\nBạn cũng đừng lo lắng về rằng chúng sẽ không biết nghe lời như những chú vẹt non được nuôi từ khi chưa mọc đủ lông, vì đây đều là những giai đoạn còn chưa có một kĩ năng gì trong cuộc sống, dễ gần gũi hơn. Đối với việc chúng dễ huấn luyện, dạy bảo hơn hay không còn tùy thuộc vào thái độ, cách dạy của người nuôi.\n\nNhiệt độ chăm sóc\n\nVẹt non trong giai đoạn mới tiếp xúc bên ngoài, chưa thể thích ứng ngay với nhiệt độ tự nhiên, vì thế đảm bảo đủ ấm cho cơ thể của vẹt non là điều rất quan trọng trong thời gian đầu đời của chúng. 37 độ C  sẽ là nhiệt độ lý tưởng nhất để vẹt con cảm thấy thư thái. Nếu vào mùa đông, bạn sưởi ấm vẹt bằng cách sử dụng lồng úp, đèn sưởi để không gian thú cưng ở. Tuy nhiên, dù mùa nào, bạn cũng cần che chắn gió nhưng vẫn đảm bảo độ thoáng trong không gian của vẹt con.\n\nNgoài ra, bạn nên đề phòng các động vật khác cho thú cưng của bạn. Hãy bảo vệ cho chú vẹt con bằng nhiệt độ ổn định và tránh xa sự nguy hại về những chú chó, mèo, chuột xung quanh. Những bạn nhỏ cũng đừng vì yêu thích chú pet của bạn quá mà bế lên cưng nựng vì lúc này, vẹt con còn quá nhỏ, dễ sợ hãi, yếu ớt. Nếu bị di chuyển quá nhiều, cơ thể sẽ kiệt sức dẫn đến chết.\n\nChế độ ăn uống\n\nHệ tiêu hóa, đường ruột của vẹt nhỏ chưa được hoàn thiện, còn khá non yếu vì vậy, chế độ ăn uống là rất quan trọng. Chúng cần một loại bột ăn dặm dành riêng cho thú cưng, tuy nhiên giá thành của các sản phẩm cũng không hề đắt đỏ. Tiếp theo đó, bạn nên chuẩn bị thêm một dụng cụ cho vẹt ăn, có thể là bơm tiêm cho ăn chuyên dụng với các kích cỡ khác nhau, phù hợp với khuôn miệng của pet nhà bạn.\n\nKhâu pha bột cần được kiểm tra nhiệt độ nước một cách khéo léo, nước nóng quá hay lạnh quá sẽ làm chết các men vi sinh có lợi trong thức ăn cũng như trong hệ đường ruột của cơ thể vẹt cưng. Bạn chỉ cần pha bột và cho vào xi-lanh chuyên dụng, cho pet ăn một cách từ từ. Nếu chưa biết về kĩ thuật cho ăn, khi đến mua ban vet con, bạn hãy trao đổi trực tiếp với người nuôi trước đó về điều này để tránh bỡ ngỡ trong những lần cho ăn tiếp theo.\n\nĐừng cho ăn quá nhiều trong một bữa, điều này sẽ ảnh hưởng xấu tới cơ thể vẹt, thức ăn chưa tiêu hóa ở trong diều nguy cơ nhiễm khuẩn cao, hơn nữa ăn no khiến vẹt khó hấp thu, khó tiêu dẫn tới tình trạng lờ đờ chết dần.\n\nThời gian ngủ nghỉ\n\nThực ra, bất kỳ vật nuôi nào, khi còn bé cũng chẳng khác gì những đứa trẻ, thích ngủ và cần có giấc ngủ để phát triển trí não, cơ thể. Hãy phân bổ thời gian hợp lý để giúp pet yêu ngủ nghỉ đúng giờ. Trước giờ ngủ đừng bắt chúng ăn quá no sẽ khiến cơ thể ỳ ạch, khó chịu, không thể ngủ ngon. Hơn nữa điều này còn kéo theo việc ảnh hưởng tới thể trạng pet.\n\nCách vệ sinh\n\nDùng khăn mềm làm ẩm với nước ấm và thấm nhẹ trên cơ thể vẹt cưng để giúp cơ thể chúng sạch sẽ, loại bỏ vi khuẩn. Thường xuyên thay lót ổ của chúng để vẹt cảm thấy dễ chịu hơn.\n\nTrên đây là một số cách chăm sóc chúng tôi gửi tới những người nuôi vẹt trong giai đoạn chưa trưởng thành. Hãy thực hành từng bước, chắc chắn chú vẹt con của bạn sẽ lớn lên một cách khỏe mạnh.\n\n>>> Xem thêm: Hướng Dẫn Cách Chọn Mua Và Nuôi Vẹt Non Chi Tiết Nhất\n\nTại Pet Me Shop khi bạn đến mua bán vẹt non có gì nổi bật:\nVẹt non được chúng tôi chăm sóc chu đáo, thường xuyên theo dõi tình trạng sức khỏe định kỳ, được tiêm phòng vacxin ngăn ngừa bệnh đầy đủ.\nTất cả chú vẹt non ở đây đều được Pet Me Shop đảm bảo sinh ra có nguồn gốc xuất xứ khỏe mạnh, rõ ràng, có chứng nhận tại địa điểm bán.\nBạn sẽ không cần phải mất thời gian bắt đầu hay huấn luyện vẹt non vì chúng đều được huấn luyện từ khi còn nhỏ, tạo thói quen ngay từ lúc mới mua về.\nVới những kỹ thuật chăm sóc chuyên nghiệp của đội ngũ nhân viên nhiệt tình, dày dặn kinh nghiệm, am hiểu về loài chim vẹt, khách hàng hoàn toàn yên tâm khi đến mua bán vẹt non tại đây.\nVẹt được vệ sinh sạch sẽ, thường xuyên nên đảm bảo sức đề kháng, chống được nhiều loại bệnh thường gặp.\nCác giống vẹt non đa dạng chủng loại, phù hợp với nhu cầu của nhiều khách hàng.\nVẹt non ở đây luôn được giao lưu, luyện tập để có thể bắt chước nói tiếng người một cách thuần thục nhất.'
, N'Buy', CAST(N'2023-12-18' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0005', N'US0002', N'Giá mua chim két (vẹt) tại thị trường Việt Nam?', N'Két (vẹt) chắc chắn là một loài chim vô cùng quen thuộc đối với những ai có sở thích nuôi…', N'Két (vẹt) chắc chắn là một loài chim vô cùng quen thuộc đối với những ai có sở thích nuôi chim cảnh ở nước ta. Sở hữu ngoại hình bắt mắt, đặc biệt là trí thông minh, khả năng bắt chước tiếng người rất thú vị, đây là loại thú cưng đang rất được ưa chuộng và có rất nhiều người muốn tìm mua chim két cảnh. Tất nhiên, đối với ai muốn mua chim két thì việc tìm hiểu két (vẹt) giá bao nhiêu trên thị trường là điều rất quan trọng.\n\nNhững người luyện chim cảnh rất thích nuôi vẹt và tập luyện chúng nói, tạo cảm giác có một người bầu bạn với mình. Để hiểu rõ hơn về loài chim két (vẹt) này, hãy cùng Pet Me Shop khám quá qua bài viết sau đây nhé.\n\nHướng dẫn chăm sóc chim vẹt\nChuồng nuôi vẹt\n\nChuồng nuôi vẹt kiểng không cần quá rộng và trang trí lộng lẫy. Các bạn chỉ cần đảm bảo chuồng nuôi phải có đủ không gian cho chúng bay nhảy.\n\nBên trong chuồng nuôi phải có đủ cóng thức ăn và nước uống. Đặc biệt, các bạn phải trang bị cần đứng bằng gỗ cho chim đậu vào.\n\nĐối với loài vẹt, các bạn nên lựa chọn chuồng nuôi làm bằng kim loại song gang (không nên dùng lồng bằng sắt). Lồng chim nên đặt ở những nơi thoáng mát, chỗ đi lại để cho chim có thể tiếp xúc được với nhiều người.\n\nKét (vẹt) cảnh ăn gì?\n\nBên cạnh những loại hạt mà chúng yêu thích, các bạn nên bổ sung loại thức ăn dành riêng cho vẹt. Điều này giúp cung cấp đầy đủ chất dinh dưỡng và khoáng chất dành cho chúng.\n\nThời gian cho ăn: các bạn nên cho vẹt ăn vào buổi sáng sớm và buổi tối muộn. Kết hợp ăn cả hạt thực vật, trái cây và thức ăn khô dành cho chúng.\n\nThời gian tắm cho vẹt cảnh bao lâu?\n\nVẹt cảnh rất thích tắm nước, cho nên các bạn hãy thường xuyên tắm cho chúng để loại bỏ hết bụi bẩn và vi khuẩn trong cơ thể của chúng nhé.\n\nMùa hè nên 2 ngày tắm 1 lần, mùa đông chỉ những ngày nắng ấm mới cho vẹt tắm. Sau khi tắm xong các bạn nên lau khô lông cho chúng điều này để tránh những chú vẹt bị cảm lạnh và hắt hơi.\n\nMua chim két có giá bao nhiêu?\n\nỞ Việt Nam chúng ta, loài chim két (vẹt) này khá phổ biến trên thị trường, và bạn có thể tìm thấy chúng ở bất kỳ nơi đâu. Mức giá trung bình của một con vẹt mà bạn muốn sở hữu dao động từ 150.000 nghìn đến 3.000.000 triệu /con. Có rất nhiều yếu tố tác động đến giá vẹt hiện nay, trong đó những yếu tố then chốt nhất phải kể đến là độ tuổi và giống loài.\n\nVới mức giá trên, khi dựa vào kích thước và màu sắc của loài vẹt thì loài có mức giá rẻ nhất hiện nay chính là loài két Yến Phụng (Hongkong), còn loại giống Việt có mức giá cao nhất hiện nay mà các dân chơi đang ưa chuộng nhất chính là vẹt Sun conure châu Mỹ.\n\nBài viết trên đây là toàn bộ thông tin về chim két (vẹt). Hy vọng bài viết này, giúp bạn mua chim ket (vẹt) phù hợp nhất cho mình để làm thú cưng trong nhà. Đây là loài chim cảnh rất thích hợp để làm thú cưng vì chúng có chỉ số IQ cao và khả năng bắt chước rất tốt.'
, N'Buy', CAST(N'2023-12-10' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0006', N'US0002', N'Mua vẹt biết nói giá rẻ, chất lượng tại TP.HCM', N'Chim Vẹt từ lâu đã đi vào đời sống như một người bạn thân thiện và thông minh. Mọi người…', N'Chim Vẹt từ lâu đã đi vào đời sống như một người bạn thân thiện và thông minh. Mọi người nuôi vẹt như một món ăn tinh thần. Nếu bé biết nói thì còn gì tuyệt bằng. Đó là lý do mà nhiều bạn muốn tìm mua loài động vật đáng yêu này. Nhiều bạn đặt câu hỏi khi tới cửa hàng thú cưng Pet Me Shop mua vẹt biết nói ở đâu? Có nhiều lứa tuổi không? Mua vẹt biết nói có mắc không? Hôm nay chúng tôi xin gửi tới mọi người các loại vẹt đang bán tại cửa hàng.\n\nMột số dòng vẹt đang được bán tại cửa hàng\nYến Phụng Vẹt Hồng Kông\n\nƯu điểm:\n\nDòng vẹt này có rất nhiều màu, giá thành rẻ, sức khỏe tốt ít bệnh, kích thước nhỏ nhắn nên khá nhanh, nói nhiều và tương đối tốt (điều kiện phải nuôi và dạy từ con non) xinh xắn, ngộ nghĩnh, tính thân thiện cao. Đặc biệt Yến Phụng rất dễ bắt cặp sinh sản.\n\nNhược điểm:\n\nKích thước khá nhỏ gần như nhỏ nhất so với các loại vẹt khác, IQ chỉ ở mức trung bình nên khá vất vả khi huấn luyện nhất là đối với các trò khó yêu cầu kỹ năng quan sát và lắng nghe.\n\nCockatiels – Vẹt Mã Lai\n\nLông mềm mượt nữ tính, có khả năng hót theo nhạc cũng như bắt chước giọng các loài chim khác rất tốt. Tính thân thiện cao, giá thành khá rẻ, rất dễ bắt cặp sinh sản.\n\nDo các thế hệ trước bị lỗi gen nên hầu hết Cockatiels có sức khỏe khá yếu, nói rất kém. IQ ở mức trung bình.\n\nVẹt Ngực Hồng\n\nVẹt Ngực Hồng có màu sắc sặc sỡ, khả năng nói ở mức trung bình, giá thành rẻ, sức khỏe tốt ít bệnh, IQ ở mức trung bình.\n\nỞ giai đoạn vẹt mới lớn rất xấu. Đặc tính bảo vệ lãnh thổ cao nên nếu thả chung lồng rất dễ cắn nhau. Khá cộc tính, kỹ thuật bay rất kém nên không phải dòng vẹt lý tưởng để thả bay.\n\nVẹt Má Vàng – các chú vẹt Việt Nam\n\nVẹt Má Vàng và Ringneck có lớp lông dạng sợi nhỏ nên rất mượt, đây là 1 dòng vẹt đuôi dài đẹp, có khả năng nói ở mức khá, giá tầm trung không quá đắt.\n\nCục tính và tính lãnh thổ cao chúng nên thường cắn nhau khi nhốt chung lồng. Kỹ thuật bay kém.\n\nVẹt Xám Châu Phi\n\nVẹt Xám Châu Phi sẽ là một trong những lựa chọn tốt để bạn mua vietj biết nói bởi chúng nằm trong nhóm cao vẹt có IQ cao nhất, đứng ở đầu về khả năng nói. Tuy kỹ thuật bay trung bình. Dòng vẹt nuôi lâu sẽ rất tình cảm và quấn chủ.\n\nVẹt Xám Châu Phi không có màu sặc sỡ như các dòng vẹt khác. Toàn thân hầu như toàn màu xám nên kén người thích. Lông nhiều bụi phấn. Tuy thả bay được nhưng do tập tính độc lập nên việc dạy bay tương đối khó khăn.\n\nHướng dẫn bạn mua vẹt biết nói tại Pet Me Shop\n\nBạn đang muốn mua vẹt biết nói giá rẻ nhưng không biết chỗ bán uy tín và để có nhiều sự lựa chọn? Pẻ Me Shop là một trong những địa chỉ uy tín và tin cậy cho bạn. Tại đây bạn sẽ có cho mình nhiều lựa chọn hơn về chủng loại, độ tuổi, kích thước, màu lông, giới tính và giá cả phong phú về các loài vẹt cảnh. Bạn còn được người bán cung cấp địa chỉ rõ ràng để bạn có thể dễ dàng đến xem trực tiếp.'
, N'Buy', CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0007', N'US0002', N'Bảng giá mua chim vẹt tại thị trường Việt Nam', N'Vẹt hẳn nhiên là một giống chim siêu thân thuộc đối với các ai có sở thích chăm sóc chim…', N'Vẹt hẳn nhiên là một giống chim siêu thân thuộc đối với các ai có sở thích chăm sóc chim cảnh ở Việt Nam. Đối với ai muốn mua chim vẹt thì việc khám phá vẹt giá sản phẩm trên khu vực kinh doanh là điều cực kỳ mấu chốt. Và đặc biệt hơn, bạn đang muốn mua chim vẹt kiểng nhưng lại không biết bảng giá chim vẹt bao nhiêu tại thị trường Việt Nam hiện nay. Có bản quyền vẻ ngoài đẹp mắt, nổi bật là trí khôn ngoan, năng lực học theo tiếng người rất hay ho, đây chính là loại vật nuôi đang rất được ưa thích và có cực kỳ nhiều người muốn lùng mua vẹt cảnh.\n\nCó rất nhiều yếu tố tác động đến giá vẹt hiện nay, trong đó những yếu tố then chốt nhất phải kể đến là độ tuổi và giống loài. Vì thế dưới đây Pet Me Shop sẽ cùng bạn tìm hiểu về giá của một số loài vẹt đang được ưa chuộng nhất.\n\nBảng giá mua chim vẹt tốt nhất hiện nay tại Việt Nam\n\nTheo như những nhu cầu hiện tại về chim vẹt nói riêng hay thú cảnh nói chung. Thì mức giá của loài thú cảnh chim vẹt đang có xu hướng tăng dần. Cụ thể sau đây là bảng giá chi tiết và tốt nhất hiện nay mà chúng tôi tổng hợp dành cho bạn tham khảo. Bảng này sẽ giúp bạn biết được giá mua chim vet bao nhiêu?\n\n\nCòn khá nhiều các loài vẹt khác nhau, nhưng mức giá sẽ tùy thuộc vào người bán hoặc màu sắc hay những đặc điểm đặc biệt của chú chim. Có bảng giá vẹt cảnh rồi, thì nên mua chim vet ở đâu? Dưới đây sẽ là một số thông tin của một số loài vẹt đang được ưa chuộng nhất.\n\nMột số loài vẹt phổ biến tại Việt Nam\nVẹt Mã Lai\n\nVẹt Mã Lai nổi tiếng là giống vẹt đẹp, có khả năng bắt chước tiếng người rất giỏi, chúng có thể đậu trên vai của chủ nhân và đi khắp muôn nơi.\n\nVẹt Mã Lai có thể dễ dàng phân biệt với nhiều giống vẹt khác bởi bộ lông màu xám rất đặc trưng của chúng. Ngoài ra, ở trên đỉnh đầu của vẹt Mã Lai có một nhúm lông nhỏ màu vàng nhạt, giống như một chiếc mào trông rất đặc trưng. Ngoài ra, hai bên má của vẹt có hai nhúm lông đỏ. Kích thước chiều dài trung bình của chúng khoảng 30cm.\n\nTuổi thọ trung bình của vẹt Mã Lai là khoảng từ 25 đến 50 năm trong điều kiện nuôi tốt và trở thành người bạn thân thiết của con người.\n\nVẹt Yến Phụng\n\nVẹt Hồng Kông hay còn gọi là vẹt yến phụng. Dòng chim này khá phổ biến và được rất nhiều người yêu thích. Dòng chim này tại Việt Nam hiện có 50 loài, chúng có sức đề kháng rất tốt – có thể thích ứng được với mọi loại thời tiết.\n\nLoài chim này thường nói rất nhiều, tuy nhiên chỉ số IQ của chúng khá thấp – điều này khiến người nuôi phải thật kiên nhẫn để huấn luyện chúng.\n\n>>> Xem thêm: Những lưu ý khi nuôi chim Yến Phụng dành cho người mới tập chơi chim cảnh\n\nVẹt lovebird – vẹt uyên ương\n\nVẹt Lovebird là giống vẹt nhỏ khá dễ thương, chúng thu hút ánh nhìn bởi màu sắc sặc sỡ. Loài chim này có tính trung thành với chủ rất cao.\n\n \n\nHơn nữa, chúng còn là một trong những dòng vẹt có bản tính thân thiện và hòa đồng nhất. Nhược điểm của dòng này chính là chỉ số IQ không cao, khả năng bắt chước và nói tiếng người khá kém.'
, N'Buy', CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0008', N'US0002', N'Cách chăm sóc hiệu quả cho Vẹt đuôi dài Nam Mỹ', N'Tìm hiểu về Vẹt đuôi dài Nam Mỹ: Vẹt đuôi dài Nam Mỹ xuất hiện đầu tiên ở những nước…', N'Tìm hiểu về Vẹt đuôi dài Nam Mỹ:\n\nVẹt đuôi dài Nam Mỹ xuất hiện đầu tiên ở những nước Châu Âu. Đặc điểm ngoại hình của loài vẹt này là có màu đỏ chủ đạo phủ ở phần lông bên ngoài. Phần đuôi của chúng khá dài, chúng có phần đầu tròn; phần mỏ to và cụp vào bên trong. Đôi mắt của vẹt đuôi dài Nam Mỹ có thể màu đen hoặc đỏ, tùy từng khu vực sinh sống. Thân bên ngoài khá to, ngực nở, lưng cong và bụng rộng.\n\nVẹt đuôi dài Nam Mỹ có biết nói không?\n\nVẹt đuôi dài Nam Mỹ được biết đến là loài vẹt có tính cách vui tươi và hoạt bát, khá ồn ào. Vì là loài vẹt thông minh, chúng có thể bắt chước giọng nói của bạn. Tuy không rõ ràng như một số loài chim khác nhưng cũng khá thú vị.\n\nĐể dạy vẹt nói, ngay từ nhỏ bạn hãy dành thời gian huấn luyện chúng. Bạn hãy dạy vẹt nói và hát. Ban đầu chỉ là những từ đơn giản, từ đơn, sau đó mới dạy những từ ghép.\n\nCách chăm sóc Vẹt hàng ngày:\nCho chim ăn với thực đơn chủ yếu là thức ăn viên:\n\nMặc dù các loại hạt là món ăn rất phổ biến của vẹt đuôi dài trong tự nhiên, nhưng loại thức ăn này cũng là nguồn nhiễm vi khuẩn và có thể gây hại cho sức khỏe và giảm tuổi thọ của chim. Vi khuẩn có thể tích tụ lại và dần dần sẽ khiến chim bị bệnh. Bạn nên cân nhắc chuyển chế độ ăn của chim với 60-70% lượng thức ăn viên. Chim thích nghi với các mức độ khác nhau với thức ăn viên, và thoạt đầu có thể quyết liệt từ chối. Tuy nhiên, khoảng 90% vẹt đuôi dài sẽ thích nghi được trong vòng 2 tuần khi bạn làm theo cách sau:\n\nChỉ cho vẹt ăn hạt trong vòng 1 tiếng đồng hồ vào buổi sáng và 1 tiếng ban đêm.\nThời gian còn lại cho vẹt ăn thức ăn viên.\nNói chung, 10% số vẹt không chuyển đổi được chế độ ăn trong vòng 2 tuần sẽ chuyển đổi sau một thời gian ngắn quay lại với chế độ ăn hạt.\n\nCho vẹt ăn bổ sung hỗn hợp các loại hạt, hoa quả tươi và rau:\n\nNgoài các loại hạt, cho vẹt ăn nhiều loại hoa quả tươi và rau như cải xoăn, củ cải đường, đậu, cà rốt, rau mùi tây, khoai lang nấu chín, táo cắt lát, cam, quýt và các loại quả họ cam quýt. Nếu cho vẹt ăn nhiều loại thức ăn thì bạn đừng bao giờ cho vẹt ăn hai ngày liên tiếp cùng một món. Việc này là để tránh vẹt tiêu thụ quá nhiều một chất nào đó qua một loại thức ăn.\n\nThử gắn các miếng táo hoặc cà rốt vào các thanh chấn song của lồng để cho chim mổ. Đối với các loại hoa quả và rau lớn hơn, bạn có thể băm nhỏ và bỏ vào bát đựng thức ăn của chim.\nHầu hết các loại rau và hoa quả tươi đều an toàn cho vẹt đuôi dài, NGOẠI TRỪ quả bơ, cà tím, hạt táo, cây đại hoàng, lá cà chua, lá khoai tây. Bạn cũng không bao giờ nên cho vẹt ăn các thức ăn có caffeine, chocolate hoặc alcohol.\nThay bát thức ăn và nước uống mỗi ngày:\n\nĐể cho vẹt quen với bạn và với môi trường xung quanh, bạn không nên làm gì khác ngoài việc chăm sóc thức ăn nước uống và dọn vệ sinh lồng chim trước khi huấn luyện cho chim đậu lên ngón tay.\n\nThiết đãi vẹt:\n\nNhánh hạt kê là món khoái khẩu của vẹt, nhưng bạn không nên cho ăn quá nhiều (chỉ cho ăn khoảng 1,3cm mỗi ngày), vì nó gây béo như các loại thức ăn nhanh. Tránh các thức ăn ngọt hoặc quá nhiều yến mạch, cả hai thức đó đều gây béo.\n\nNhánh hạt kê cũng là một trong những cách hiệu quả nhất để huấn luyện cho vẹt đuôi dài Nam Mỹ đậu lên ngón tay bạn.\nGiao tiếp với vẹt:\nVẹt đuôi dài Nam Mỹ cần bầu bạn, vì vậy bạn nên sẵn sàng mỗi ngày dành ít nhất 90 phút để trò chuyện hoặc giao tiếp với chim – tuy không cần liên tục. Bạn cũng có thể huấn luyện vẹt đuôi dài Nam Mỹ với dụng cụ clicker, đó là một cách thú vị để kích thích tinh thần của chim và khuyến khích chim gắn bó với bạn.\nThỉnh thoảng cho vẹt ra khỏi lồng:\n\nMặc dù chim có thể bay trong lồng, nhưng nếu mỗi ngày cho vẹt ra ngoài một lần để bay thoải mái hơn cũng là ý tốt. Tất nhiên bạn phải đề phòng những thứ gây tổn hại cho chim, đóng cửa sổ và cửa ra vào, tắt nến và các thứ tương tự. Huấn luyện bằng clicker là một phương pháp tốt để vẹt nghe hiệu lệnh khi đến giờ quay trở về lồng.\n\nTạo điều kiện cho chim có giấc ngủ tốt:\nVẹt đuôi dài Nam Mỹ ngủ khoảng 10 tiếng một ngày, phần lớn là ban đêm, nhưng chúng có thể thỉnh thoảng chợp mắt vào ban ngày. Khi chú vẹt của bạn đang ngủ, bạn cố gắng đừng làm ồn, tuy nhiên tiếng nhạc hoặc tiếng ti vi vặn nhỏ cũng không sao.\nGiữ nhiệt độ thích hợp:\nVẹt đuôi dài Nam Mỹ nhạy cảm với sự thay đổi lớn của nhiệt độ. Chúng sinh trưởng tốt ở nhiệt độ trung bình trong nhà, nhưng bạn nên chú ý cho lồng chim có một chỗ khuất để chúng có thể rút lui vào và cố gắng không để nhiệt độ vượt quá 27°C. Không đặt lồng nơi có ánh nắng mặt trời chiếu thẳng vào.\nTận tâm với vẹt:\n Chăm sóc vẹt đuôi dài Nam Mỹ đòi hỏi nhiều công sức, nhưng bạn sẽ thấy chúng là người bạn trìu mến và thú vị. Hầu hết chúng đều biết nói, và chúng học được nhiều hay ít thì thực sự phụ thuộc vào bạn. Bạn phải sẵn sàng chăm sóc, dạy dỗ chúng, dành cho chúng sự quan tâm và vui chơi, nếu không thì có lẽ bạn nên tìm thú tiêu khiển khác.'
, N'Care', CAST(N'2023-11-28' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0009', N'US0002', N'5 Shop bán vẹt biết nói uy tín, giả rẻ tại thành phố Hồ Chí Minh', N'Nếu bạn là dân chơi chim lâu năm thì ắt hẳn không còn xa lạ với những địa điểm bán…', N'Nếu bạn là dân chơi chim lâu năm thì ắt hẳn không còn xa lạ với những địa điểm bán vẹt cảnh nổi tiếng ở thành phố Hồ Chí Minh. Cùng Pet Me shop điểm qua những shop bán vẹt giá rẻ trong bài viết sau nhé! Những bạn mới tập chơi chim cảnh cũng đừng nên bỏ qua bài viết này! Có thể nó sẽ giúp bạn tìm được shop bán vẹt biết nói uy tín giá tốt.\n\nTop 1 – Vương Quốc Vẹt, địa điểm bán vẹt giá tốt:\n\nVương Quốc Vẹt không còn là cái tên xa lạ đối với giới chơi chim cảnh ở TP HCM. Nếu bạn muốn mua vẹt biết nói thì đây là một địa điểm bạn nên ghé. Ngoài bán vẹt ra thì tại shop Vương Quốc Vẹt còn cung cấp thức ăn cho vẹt, lồng và đồ chơi cho chim.\n\nNgoài bán vẹt và phụ kiện dành cho chim cảnh thì shop còn có bán các loại vitamin dành cho thú cưng, thức ăn và vật dụng dành cho chó mèo. Ngoài ra còn có thức ăn cho thỏ và Hamster. Nói chung dịch vụ kinh doanh của shop khá đa dạng, đủ để đáp ứng các nhu cầu cho thú cưng nhà bạn.\n\nThông tin liên hệ:\n\nĐịa chỉ: 63F Phạm Văn Sáng, Xuân Thới Thượng, Hóc Môn, TP.HCM\nĐịa chỉ: 51 đường Tám Danh, Phường 4, Quận 8, HCM\nEmail: vuongquocvet@gmail.com\nTop 2 shop bán vẹt uy tín – Pet Me shop:\n\nThêm một địa điểm bán vẹt biết nói HCM mà bạn không nên bỏ qua đó là Pet Me shop. Với nhiều năm kinh nghiệm trong lĩnh vực kinh doanh thú cưng chắc chắn sẽ khiến bạn hài lòng khi ghé thăm shop. Ngoài bán vẹt ra thì shop còn kinh doanh khá nhiều mặt hàng dành cho mèo và chó.\n\nPet Me shop giống như một siêu thị thu nhỏ cho thú cưng nhà bạn. Shop chuyên cung cấp các sản phẩm như: chuồng nuôi, thức ăn, vật dụng chăm sóc, mỹ phẩm làm đẹp, quần áo và phụ kiện dành cho thú cưng. Ngoài ra shop còn cung cấp thiết bị y tế, thuốc cho thú cưng.\n\nThông tin liên hệ:\n\nĐịa chỉ: 21 đường số 6, phường Linh Chiểu, TP. Thủ Đức, TP Hồ Chí Minh\nĐiện thoại: 091 709 6677 – 091 707 6677\nWebsite: petmeshop.com\nFacebook: facebook.com/PetMeVN\nEmail: petmeshop@gmail.com\nTop 3: Pet xinh.net:\n\nĐa dạng hơn so với 1 số shop bán vẹt và chim cảnh khác. Pet xinh vừa có vẹt vừa có các loại thú cưng khác khá đa dạng như: chó, mèo, hamster, nhím, thỏ, bọ ú và động vật bò sát, v.v… Ngoài ra shop còn kinh doanh các mặt hàng thiết yếu dành cho thú cưng: thức ăn, đồ chơi, phụ kiện, thiết bị y tế, quần áo cho thú cưng…\n\nNếu không chơi chim cảnh thì bạn có thể ghé shop để tìm hiểu và được tư vấn cụ thể hơn về loại thú cưng bạn muốn mua nhé! Giá cả cũng không quá chát nếu tài chính bạn có hạn.\n\nThông tin liên hệ:\n\nĐịa chỉ: 98 Ba Vân, P14 Tân Bình, Tp.HCM\nĐịa chỉ: 730 Lê Đức Thọ, P15 Gò Vấp, Tp.HCM\nĐiện thoại: 078 468 1010 – 034 456 6869\nTop 4: Hệ thống PetMart\n\nVới chuỗi hệ thống trải dài khắp cả nước thì PetMart là cái tên không thể không nhắc đến. Ngoài bán vẹt thì PetMart còn chuyên kinh doanh các loại thú cưng như: cá cảnh, bò sát, chuột cảnh, chim cảnh, mèo cảnh và chó cảnh…\n\nDịch vụ thú cưng của shop cũng khá đa dạng: cắt tỉa lông cho chó mèo, spa cho chó mèo, khách sạn cho chó mèo. Ngoài ra shop còn có dịch vụ tư vấn sức khỏe thú cưng miễn phí!\n\nVì hệ thống shop trải dài khắp Bắc Nam nên bạn có thể tìm được địa chỉ mua vẹt dễ dàng.\n\nThông tin liên hệ:\n\nĐiện thoại: 028 7106 9906\nEmail: contact@petmart.vn\nTop 5 – Pet School shop:\n\nPet school shop là một trong những shop ở Tp HCM được nhiều người biết đến và lựa chọn mua vẹt ở đây. Khác những shop bán vẹt vừa được giới thiệu ở trên, Pet School shop chỉ tập trung và chuyên kinh doanh vẹt, shop không kinh doanh đa chủng loại các mặt hàng, phụ kiện dành cho các loại thú cưng khác, tuy nhiên độ nổi tiếng của shop cũng không kém cạnh gì so với các shop còn lại.\n\nHãy thử trải nghiệm dịch vụ tại đây nếu bạn có nhu cầu tìm hiểu và chơi vẹt cảnh nhé!\n\nThông tin liên hệ:\n\nĐịa chỉ: AA5 Thất Sơn, Phường 15, Quận 10\nĐiện thoại: 0708 67 99 67\n\nTrên đây là những địa điểm bán vẹt nổi tiếng được nhiều người biết đến ở khu vực Thành phố Hồ Chí Minh, hy vọng bài viết sẽ mang đến cho bạn đọc những thông tin hữu ích!'
, N'Place', CAST(N'2023-11-25' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0010', N'US0002', N'Mua vẹt Nam Mỹ ở đâu uy tín tại Thành phố Hồ Chí Minh?', N'Trước khi ra quyết định mua vẹt Nam Mỹ để thỏa mãn đam mê thú chơi chim cảnh thì bạn…', N'Trước khi ra quyết định mua vẹt Nam Mỹ để thỏa mãn đam mê thú chơi chim cảnh thì bạn nên trang bị cho mình những kiến thức liên quan đến việc nuôi dưỡng và chăm sóc vẹt Nam Mỹ. Mua vẹt Nam Mỹ không khó, nhưng thật khó chăm sóc những anh bạn này nếu bạn chưa có kinh nghiệm và kiến thức nuôi dưỡng chúng.\n\nNhững thông tin cần lưu ý khi nuôi và mua vẹt Nam Mỹ:\n\nMôi trường sống của Vẹt Nam Mỹ:\n\nVẹt Nam Mỹ thường sinh sống thành bầy đàn trong tự nhiên để cùng nhau kiếm ăn. Loài chim này rất nhanh nhẹn và rất khó bắt. Những vùng nhiệt đới và nơi có khí hậu ấm áp là môi trường sống thích hợp nhất của chúng.\n\nKinh nghiệm chăm nuôi Vẹt Nam Mỹ ở Việt Nam:\n\nVẹt Nam Mỹ rất nhanh thích nghi với các điều kiện sống khác nhau. Tuy nhiên, người nuôi vẫn cần chú ý nhiều điều khi chăm sóc loài chim này bởi chúng vô cùng nhạy cảm.\n\nChuồng nuôi\n\nYêu cầu về chuồng nuôi vẹt Nam Mỹ không quá khắt khe. Người chăm chỉ cần chuẩn bị cho vẹt một chiếc chuồng đủ rộng rãi với không gian thông thoáng. Bên trong chuồng cần chuẩn bị đầy đủ thức ăn và nước uống để cung cấp cho vẹt môi trường sống tốt nhất. Điều nhất định phải có trong chuồng chính là chiếc cần đứng bằng gỗ hoặc bằng cành cây chắc chắn để chim có thể bậu vào đó.\n\nLồng chim được làm bằng kim loại sẽ thuận tiện và thoải mái hơn cho vẹt Nam Mỹ. Đồng thời vị trí đặt lồng cũng cần là ở nơi thông thoáng, nhiều người qua lại để vẹt có thể làm quen với người và học nói. Việc thường xuyên nghe và trò chuyện với con người sẽ giúp vẹt Nam Mỹ trở nên linh hoạt và năng động hơn. Từ đó, việc học nói của chúng và huấn luyện cũng sẽ diễn ra nhanh hơn rất nhiều.\n\nThức ăn cho vẹt Nam Mỹ\n\nThức ăn của vẹt Nam Mỹ khá đa dạng, chúng có thể ăn bất kỳ loại thực phẩm nào. Tuy nhiên, cần lưu ý rằng không cho chim ăn sôcôla, bơ, thực phẩm chứa caffeine, nhiều muối, đường…\n\nTuy nhiên, người nuôi cần xây dựng chế độ dinh dưỡng hợp lý cho vẹt Nam Mỹ để đảm bảo sức khỏe tốt nhất cho chim. Nên bổ sung vào chế độ dinh dưỡng hàng ngày của chị những thực phẩm tươi, nhiều dinh dưỡng như: ngũ cốc, rau, trái cây…\n\nTỉ lệ phần trăm các nhóm thực phẩm nên là: 25% – 50% thức ăn dạng viên, dưới 10% các loại hạt và phần còn lại là những loại thực phẩm tươi tốt.\n\nChăm sóc sức khỏe\n\nNgười nuôi vẹt cần chú ý chăm sóc cả sức khoẻ thể chất và sức khỏe tinh thần cho vẹt. Việc bị gò bó về mặt tinh thần có thể dẫn đến những nét tính cách xấu và ảnh hưởng tới sức khỏe thể chất của vẹt. Hãy cố gắng dành nhiều thời gian trò chuyện và chăm sóc chúng. Như vậy chim sẽ cảm nhận được tình thương từ chủ của mình và thoải mái về tinh thần. Bên cạnh đó, cũng hãy giúp chim được thoải mái bằng cách cho chúng có không gian đủ rộng để sải cánh và được bay nhảy. Khi xảy ra vấn đề về tâm lý, vẹt Nam Mỹ có thể xuất hiện tình trạng tự nhổ lông và tự làm tổn thương bản thân.\n\nVẹt Nam Mỹ là loài chim khỏe mạnh và sống lâu. Tuy nhiên, cũng như nhiều loài chim khác, vẹt Nam Mỹ có thể mắc phải một số bệnh như:\n\nBệnh phồng dạ dày tuyến.\nBệnh nhiễm khuẩn Psittacine ở mỏ và lông.\nBệnh sốt ở vẹt và có thể truyền sang con người.\nBệnh lệch khớp mỏ nguyên nhân bởi sự rối loạn thẳng hàng của mỏ.\n\nKhi thấy sức khoẻ của chúng không ổn định, hãy đưa đến bác sĩ thú y để được thăm khám và điều trị kịp thời, tránh vấn đề xấu xảy ra.\n\nKhi chăm sóc sức khỏe cho vẹt Nam Mỹ, người nuôi cần chú ý làm vệ sinh cho vẹt. Loài vẹt này khá thích nước và thích việc nước chảy dọc bộ lông của mình. Bởi vậy đừng ngần ngại làm sạch cơ thể cho vẹt bằng nước. Sau khi tắm cho vẹt xong cần chú ý lau khô bộ lông cho chúng. Việc bị ướt, lông dính nước trong thời gian dài có thể gây ra tình trạng ho, hắt hơi, cảm lạnh ở vẹt.\n\nChỉ cần nắm được các kiến thức chăm sóc cơ bản thì bạn đã có thể mạnh dạn mua vẹt Nam Mỹ về nuôi rồi nhé!\n\nMua vẹt Nam Mỹ ở đâu?\n\nVới khả năng bắt chước giọng nói đặc biệt của mình chi phí khi mua vẹt Nam Mỹ không hề thấp. Đối với từng kích thước cũng như độ tuổi hoặc nơi xuất xứ, bạn sẽ mua vẹt Nam Mỹ với nhiều mức giá khác nhau. Tùy theo nguồn gốc, mua Vẹt Nam Mỹ có giá khoảng vài triệu và lên tới vài chục triệu là chuyện bình thường. Đối với các dân chơi, có nhiều loại vẹt được mua với giá hàng trăm triệu.\n\nĐể mua vẹt Nam Mỹ uy tín và chất lượng tốt, bạn nên tham khảo kỹ về nơi bán. Ở các thành phố lớn như Hà Nội và thành phố Hồ Chí Minh là những trung tâm bán vẹt tốt. Bạn có thể tìm hiểu ở những cửa hàng vật nuôi, chim cảnh. Nơi đó sẽ cho bạn nhiều sự lựa chọn phù hợp.\n\nTrên đây là một số cách để chăm sóc vẹt Nam Mỹ đúng kỹ thuật cùng thông tin về giá cả, nơi bán uy tín. Hy vọng rằng qua bài viết trên bạn sẽ có những thông tin hữu ích về vẹt Nam Mỹ.'
, N'Place', CAST(N'2023-11-25' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0011', N'US0002', N'Vẹt trắng – Những vấn đề cần lưu ý khi chăm nuôi', N'Giới thiệu về giống vẹt trắng: Vẹt trắng có tên khoa học là Cacatua Galerita. Loài vẹt này được gọi với nhiều…', N'Giới thiệu về giống vẹt trắng:\n\nVẹt trắng có tên khoa học là Cacatua Galerita. Loài vẹt này được gọi với nhiều tên khác nhau như: vẹt Cockatoo, vẹt trắng màu vàng hay vẹt trắng Úc do phân bố nhiều và chủ yếu ở phía Bắc của Châu Úc.\n\nChiều cao trung bình của một con vẹt trắng ở độ tuổi trưởng thành là khoảng 40 – 50cm. Trong tự nhiên tuổi thọ của chúng có thể kéo dài từ 40 – 60 năm.\n\nVẹt trắng được biết đến là một họ vẹt lớn. Màu sắc trên bộ lông của chúng bao phủ là màu trắng, mào màu vàng. Dáng vẻ bên ngoài của chúng khá hút mắt, đặc biệt còn rất thân thiện. Do đó, giống vẹt này được nuôi ở nhà khá nhiều.\n\nSo với nhiều giống vẹt khác, vẹt trắng khá quấn chủ, chúng rất thích tương tác với chủ nhân của mình. Chiếc mào của vẹt thường dựng lên khi nó bị kích thích hoặc muốn bày tỏ cảm xúc nào đó. Nhiều người nuôi loài vẹt này còn nói rằng chúng có tình cảm gần gũi như loài chó và mèo.\n\nVẹt trắng có biết nói không?\n\nVẹt trắng nổi tiếng là giống vẹt gần gũi và thông minh nên chúng có khả năng học nói nếu như được dạy bảo đúng cách. Loài vẹt này có thể nói được nhiều từ, phát âm được nhiều tiếng.\n\nLuyện nói cho vẹt trắng cũng không quá phức tạp vì đây là giống vẹt quấn chủ, rất thích tương tác với chủ nhân. Chúng giống như một đứa trẻ, nếu bạn dành thời gian dạy bảo chúng sẽ rất thích.\n\nKinh nghiệm dạy nói cho vẹt trắng bạn cần dạy chúng những từ ngữ đơn giản trước, dần dần tăng độ khó.\n\nNuôi vẹt trắng cần chú ý những gì?\nThức ăn:\n\nThức ăn chính của vẹt trắng là hạt hướng dương, hạt ngô, bo bo, lúa. Trong quá trình nuôi dưỡng tại nhà, bạn cần phải cung cấp đầy đủ vitamin và khoáng chất cho chúng. Mỗi ngày bạn cần phải cung cấp một lượng hoa quả và rau xanh. Nếu trường hợp không có hạt thức ăn tươi, có thể thay thế bằng thức ăn cho vẹt đóng gói sẵn.\n\nLồng nuôi\n\nVì là loài vẹt có kích thước khá lớn nên bạn hãy ưu tiên chọn những chiếc lồng có hình vuông hoặc hình chữ nhật. Như thế sẽ giúp quá trình di chuyển của vẹt được thoải mái, dễ leo trèo, đùa nghịch.\n\nBên trong lồng cần trang bị đầy đủ các vật dụng như cành cây để vẹt đậu, đồ chơi cho vẹt, bát đựng nước và thức ăn.\n\nVẹt trắng là loài vẹt mang đặc tính xã hội nên bạn cần đặt lồng chim ở những nơi mà bạn dễ tương tác và tiếp xúc với chúng. Đồng thời cũng cần phải canh chừng những động vật nguy hiểm như chó, mèo…\n\nNhiệt độ\n\nCân bằng nhiệt độ cũng là yếu tố quan trọng mà bạn cần quan tâm khi nuôi một chú vẹt trắng tại nhà. Vào mùa đông bạn nên che chắn cẩn thận, không nên để vẹt bị rét. Còn mùa hè nên để lồng chim ở những nơi có bóng cây, thoáng mát. Nếu để vẹt ở trong tình trạng quá nóng hoặc quá lạnh sẽ khiến chúng cảm thấy mệt mỏi, stress, sức khỏe suy giảm.\n\nChăm sóc sức khỏe\n\nNgoài cân bằng dinh dưỡng, môi trường sống, bạn cũng nên định kỳ cho vẹt trắng đi theo dõi sức khỏe định kỳ.\n\nTrong trường hợp thấy chúng có biểu hiện lạ như chán ăn, phân lỏng, tự nhổ lông… thì cần đưa tới bác sĩ ngay.\n\nĐể ngăn chặn sự xâm nhập của vi khuẩn, virus, bạn nên cho vẹt tiêm phòng đầy đủ các mũi cơ bản như tiêu chảy, cúm…\n\nLuôn yêu thương chúng\n\nLoài vẹt này rất thông minh, chúng được gần gũi và quan tâm mỗi ngày. Do đó, nếu bạn đã quyết định nuôi tại nhà thì hãy cố gắng dành thời gian tương tác với chúng thường xuyên. Bạn có thể tương tác với chúng lúc cho ăn, lúc dạy nói… Nếu như bạn thờ ơ, không quan tâm rất có thể chúng sẽ bị trầm cảm, stress.\n\nChỉ cần bạn quan tâm và yêu thương chúng, thì chúng cũng sẽ đối tốt và yêu quý bạn.\n\nQua bài viết giới thiệu về vẹt trắng ở trên chắc hẳn bạn sẽ thấy loài vẹt này vô cùng thú vị và ấn tượng phải không? Hy vọng rằng, những chia sẻ ở trên của Pet Me Shop sẽ giúp bạn hiểu rõ hơn được về loài chim này.\n\nCảm ơn bạn đã theo dõi bài viết, hãy thường xuyên truy cập vào website để khám phá thêm được nhiều nội dung hữu ích khác nhé.'
, N'Care', CAST(N'2023-11-25' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0012', N'US0002', N'Vẹt Cockatoo và những điều kỳ thú mà bạn chưa biết', N'Tìm hiểu về loài vẹt Cockatoo: Vẹt Cockatoo có tên khoa học là Cacatua Galerita. Phân bố chủ yếu ở phía…', N'Tìm hiểu về loài vẹt Cockatoo:\n\nVẹt Cockatoo có tên khoa học là Cacatua Galerita. Phân bố chủ yếu ở phía Bắc Australia. Chiều cao trung bình của loài chim vẹt này là 40 – 50cm, tuổi thọ sống ngoài thiên nhiên là 40 – 60 năm.\n\nBên ngoài của vẹt phủ lớp lông màu trắng, mắt được bao quanh bởi lớp da mắt màu xanh, mỏ có màu xám đen. Với những con trống sẽ có mắt màu nâu đen, còn với những con mái sẽ có mắt màu nâu đỏ.\n\nMào ở phía trên đỉnh có khoảng 3 – 6 chiếc lông màu vàng. Những chiếc lông này sẽ dựng lên nếu như bị kích thích.\n\nVẹt Cockatoo chủ yếu được tìm thấy ở những khu rừng có độ cao 1000m, chúng thường sinh sống một mình hoặc theo cặp. Đôi khi chúng cũng sẽ tập hợp thành những nhóm nhỏ từ 10 – 20 cá thể. Trong môi trường tự nhiên loài chim vẹt này sinh sống khá ồn ào, do đó rất dễ phát hiện nếu như chúng xuất hiện.\n\nVẹt Cockatoo ăn gì?\n\nChế độ dinh dưỡng cho vẹt Cockatoo cần có sự kết hợp đa dạng nhiều loại thức ăn khác nhau. Chúng có thể ăn được các loại hạt, giá đỗ, các loại trái cây rau củ quả.\n\nBên cạnh đó, người nuôi loài chim vẹt này cũng cần bổ sung thêm cho chúng các loại trái cây như táo, lê, mận, nho khô, cam, đào, cà rốt, rau diếp và cả bông cải xanh…\n\nCũng giống như một số loài vẹt khác, vẹt Cockatoo không ăn được quả bơ. Do đó, trong quá trình chăm sóc và nuôi dưỡng bạn cần phải lưu ý tránh.\n\nThi thoảng vẹt cũng cần bổ sung thêm protein với từ một số thực phẩm như: Trứng luộc, phô mai, xúc xích, thịt nấu chín… Tuy nhiên những thức ăn đó cần phải là nhạt, không chứa dầu mỡ.\n\nCùng với đó, vẹt Cockatoo cũng cần uống nước sạch mỗi ngày. Nước sạch phải được thay hằng ngày, khay đựng nước phải đường vệ sinh thường xuyên, tránh vi khuẩn.\n\nCách nuôi Vẹt Cockatoo:\n\nVẹt Cockatoo là loài chim thông minh, có thể nuôi như một chú thú cưng, chúng có thể trò chuyện và chơi đùa với bạn. Để có được một chú chim vẹt khỏe mạnh, trong quá trình chăm sóc bạn cần phải nắm được những kỹ thuật nuôi cơ bản.\n\nLồng nuôi\n\nKhi chọn lồng nuôi bạn nên chọn những chiếc lồng hình vuông hoặc hình chữ nhật. Đảm bảo độ rộng thích hợp để vẹt có thể leo trèo, chuyển động thoải mái. Trong lồng cần phải chuẩn bị những cành cây để cho vẹt đậu, chỗ để đồ chơi, bát đựng thức ăn, nước uống. Thường xuyên dọn dẹp lồng chim sạch sẽ.\n\nVẹt Cockatoo là loài có bản tính xã hội, do đó, bạn nên đặt lồng vị trí có thể tường xuyên tương tác với chúng. Canh chừng những con vật khác để không làm hại tới vẹt.\n\nGiữ nhiệt độ ổn định\n\nBạn nên tránh để vẹt ở môi trường quá lạnh, vào mùa đông nên che chắn cẩn thận, còn mùa hè nên để lồng vẹt ở những nơi thoáng mát. Khi ở trong nhiệt độ nóng, rất có thể khiến vẹt Cockatoo bị stress, mệt mỏi và căng thẳng.\n\nCho vẹt Cockatoo đến bác sĩ thú y định kỳ\n\nTrong quá trình nuôi dưỡng vẹt Cockatoo bạn phải thường xuyên theo dõi sức khỏe của chúng. Nếu thấy có biểu hiện lạ cần phải cho đi khám bác sĩ ngay. Các căn bệnh vẹt Cockatoo thường gặp như tiêu chảy, cảm cúm… Tốt nhất là bạn nên cho chúng tiêm phòng đầy đủ hằng năm.\n\nYêu thương và chăm sóc tốt\n\nVì là giống vẹt thông minh nên bạn cần phải thường xuyên tương tác và trò chuyện với chúng. Nếu không quan tâm chúng rất dễ bị trầm cảm, stress tự nhổ lông của mình. Mỗi ngày khi bạn cho chúng ăn hãy trò chuyện và dạy chúng nói. Như vậy vẹt sẽ có cảm giác được quan tâm, sẽ yêu quý bạn nhiều hơn.\n\nTrên đây là nội dung bài chia sẻ về giống vẹt Cockatoo. Hy vọng đây sẽ là thông tin hữu ích tới bạn đọc. Giúp bạn hiểu rõ về loài vẹt này cũng như cách chăm sóc sao cho tốt nhất.'
, N'Care', CAST(N'2023-11-20' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0013', N'US0002', N'Shop bán vẹt Nam Mỹ giá rẻ tại Thành phố Hồ Chí Minh', N'Pet Me Shop có bán vẹt Nam Mỹ giá rẻ không? Câu trả lời là “có” bạn nhé! Tùy độ…', N'Pet Me Shop có bán vẹt Nam Mỹ giá rẻ không?\n\nCâu trả lời là “có” bạn nhé! Tùy độ tuổi và ngoại hình của vẹt mà giá bán Vẹt Nam Mỹ sẽ dao động từ vài triệu đến vài chục triệu.\n\nNếu bạn là người mới tập chơi chim và tài chính bị giới hạn thì việc tìm nơi bán vẹt Nam Mỹ giá rẻ sẽ là vấn đề được bạn quan tâm. Mời bạn ghé Pet Me Shop để tìm hiểu và được tư vấn mua bán vẹt Nam Mỹ giá rẻ nhé!\n\nPet Me Shop là một trong những shop chuyên cung cấp mua bán vẹt Nam Mỹ, các loài vẹt khác và các thú cưng như: mèo, chó, v.v…\n\nVẹt Nam Mỹ có những đặc điểm gì nổi bật?\n\nVẹt Nam Mỹ là một trong những loài chim thông minh nhất thế giới. Vẹt Nam Mỹ không chỉ rất giỏi trong việc bắt chước tiếng người mà còn có tiếng hót líu lo, vui tai. Vẻ ngoài sặc sỡ của loài chim này cũng là điểm thu hút khiến mọi người yêu thích và ưa chuộng chúng.\n\nVẹt Nam Mỹ (Scarlet Macaw) có kích thước phụ thuộc vào loài và là dòng chim có kích thước trung bình. Có những loài có thể nặng từ 2 – 4kg, có loài khi trưởng thành chỉ nặng 1,2 – 1,7kg. Chiều dài cơ thể dao động từ 8,6 – 100cm.\n\nCon Vẹt có phần đầu khá to và tròn. Chiếc mỏ rất to chính là điểm nổi bật nhất trên khuôn mặt của chúng. Chiếc mỏ của chúng vô cùng chắc khỏe và được cấu tạo bởi lớp sừng cứng. So với mỏ dưới thì mỏ trên dài hơn rất nhiều, có xu hướng quặp vào. Đôi mắt tròn, thường có màu đen hoặc màu đỏ. Ở một số dòng, còn có chiếc mào cấu tạo bằng lông rất to trên đỉnh đầu của chúng.\n\nNgực nở, lưng hơi cong và bụng khá to. Chiếc cổ của chúng khá to và hơi ngắn. Đôi chân ngắn, to và vô cùng chắc khỏe. Các ngón chân của chúng có móng vuốt rất cứng và sắc nhọn, thường chân của chúng khá lớn, xù xì, điều này giúp chúng có thể dễ dàng đu, bám, leo trèo trên các cành cây. Cánh và đuôi được bao phủ bởi lớp lông dày và cứng, thường khá dài.\n\nBộ lông dày rất mượt bao phủ toàn bộ cơ thể của chim. Lớp lông vũ gần sát phần da của chúng rất mềm. Lớp lông bên ngoài có màu sắc vô cùng sặc sỡ nhưng lại cứng. Màu sắc của chúng phụ thuộc vào từng loài nhưng chủ yếu là màu xanh dương và xanh lá cây.\n\nCách chăm sóc Vẹt Nam Mỹ\nChuồng nuôi\n\nChuồng nuôi Vẹt kiểng không cần trang trí lộng lẫy và quá rộng. Để cho chúng bay nhảy, các bạn chỉ cần đảm bảo chuồng nuôi phải có đủ không gian. Bên trong chuồng nuôi phải có đủ thức ăn và nước uống. Đặc biệt, để cho chim đậu vào các bạn phải trang bị cần đứng bằng gỗ.\n\nCác bạn nên lựa chọn chuồng nuôi làm bằng kim loại – song ngang đối với loài Vẹt, không nên dùng lồng bằng sắt. Để cho chim có thể tiếp xúc được với nhiều người, lồng chim nên đặt ở những nơi thoáng mát, chỗ đi lại.\n\nThức ăn cho vẹt Nam Mỹ:\n\nCác bạn nên bổ sung loại thức ăn dành riêng cho Vẹt bên cạnh những loại hạt mà chúng yêu thích. Điều này giúp cung cấp đầy đủ khoáng chất và dinh dưỡng dành cho vet Nam Mỹ.\n\nThời gian cho ăn: Kết hợp ăn cả hạt thực vật, trái cây và thức ăn khô dành cho chim. Các bạn nên cho Vẹt Nam Mỹ ăn vào buổi sáng sớm và buổi tối muộn.\n\nChăm sóc sức khỏe\n\nCác bạn hãy thường xuyên tắm cho chúng vì Vẹt cảnh rất thích tắm nước, để loại bỏ hết bụi bẩn và vi khuẩn trong cơ thể của chúng.\n\nMùa đông chỉ những ngày nắng ấm mới cho chim tắm còn mùa hè nên 2 ngày tắm 1 lần. Các bạn nên lau khô lông cho chúng sau khi tắm xong, điều này để tránh chim bị cảm lạnh và hắt hơi.'
, N'Place', CAST(N'2023-11-15' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0014', N'US0002', N'Giá vẹt Nam Mỹ non hiện nay trên thị trường khoảng bao nhiêu?', N'Giá vẹt Nam Mỹ non có gì khác so với các loài vẹt khác? Trên thực tế việc chơi chim…', N'Giá vẹt Nam Mỹ non có gì khác so với các loài vẹt khác?\n\nTrên thực tế việc chơi chim cảnh là thú vui xa xỉ của người giàu đặc biệt là loài vẹt Nam Mỹ. Giá vẹt Nam Mỹ từng thời điểm và độ tuổi sẽ có sự biến động. Đối với những chú vẹt đã trưởng thành và nói tốt thì giá vẹt Nam Mỹ không hề rẻ. Vậy nên giá vẹt Nam Mỹ được nhiều người quan tâm đặc biệt là người mới tập chơi chim cảnh!\n\nĐể trả lời câu hỏi giá Vẹt Nam Mỹ bao nhiêu tiền thì cần phụ thuộc vào nhiều yếu tố: tuổi vẹt, chiều cao, cân nặng và độ trưởng thành của chúng.\n\nGiá vẹt Nam Mỹ non sẽ phụ thuộc vào kích thước, độ tuổi, giới tính và cả độ đẹp, chuẩn của bộ lông vẹt. Có những chú vẹt hiếm có giá lên đến hớn 100 triệu đồng.\n\nGiá vẹt Nam Mỹ phụ thuộc vào nhiều yếu tố có thể lên đến hàng trăm triệu đồng\n\nVẹt Nam Mỹ được coi là một trong những giống vẹt cảnh đẹp và thông minh nhất hiện nay. Do đó giá của chúng không hề rẻ. Hơn nữa, tại Việt Nam dòng vẹt này còn khá hiếm và không dễ tìm mua! Thường phải đặt hàng qua các địa chỉ, cửa hàng nhận mua vẹt.\n\nMôi trường sống của Vẹt Nam Mỹ:\n\nVẹt Nam Mỹ thường sinh sống thành bầy đàn trong tự nhiên để cùng nhau kiếm ăn. Loài chim này rất nhanh nhẹn và rất khó bắt. Những vùng nhiệt đới và nơi có khí hậu ấm áp là môi trường sống thích hợp nhất của chúng.\n\nKinh nghiệm chăm nuôi Vẹt Nam Mỹ ở Việt Nam:\n\nVẹt Nam Mỹ rất nhanh thích nghi với các điều kiện sống khác nhau. Tuy nhiên, người nuôi vẫn cần chú ý nhiều điều khi chăm sóc loài chim này bởi chúng vô cùng nhạy cảm.\n\nChuồng nuôi\n\nYêu cầu về chuồng nuôi vẹt Nam Mỹ không quá khắt khe. Người chăm chỉ cần chuẩn bị cho vẹt một chiếc chuồng đủ rộng rãi với không gian thông thoáng. Bên trong chuồng cần chuẩn bị đầy đủ thức ăn và nước uống để cung cấp cho vẹt môi trường sống tốt nhất. Điều nhất định phải có trong chuồng chính là chiếc cần đứng bằng gỗ hoặc bằng cành cây chắc chắn để chim có thể bậu vào đó.\n\nGiá vẹt Nam Mỹ và lồng nuôi có giá khác nhau theo từng độ tuổi vẹt và kích thước lồng\n\nLồng chim được làm bằng kim loại sẽ thuận tiện và thoải mái hơn cho vẹt Nam Mỹ. Đồng thời vị trí đặt lồng cũng cần là ở nơi thông thoáng, nhiều người qua lại để vẹt có thể làm quen với người và học nói. Việc thường xuyên nghe và trò chuyện với con người sẽ giúp vẹt Nam Mỹ trở nên linh hoạt và năng động hơn. Từ đó, việc học nói của chúng và huấn luyện cũng sẽ diễn ra nhanh hơn rất nhiều.\n\nThức ăn cho vẹt Nam Mỹ\n\nThức ăn của vẹt Nam Mỹ khá đa dạng, chúng có thể ăn bất kỳ loại thực phẩm nào. Tuy nhiên, cần lưu ý rằng không cho chim ăn sôcôla, bơ, thực phẩm chứa caffeine, nhiều muối, đường…\n\nTuy nhiên, người nuôi cần xây dựng chế độ dinh dưỡng hợp lý cho vẹt Nam Mỹ để đảm bảo sức khỏe tốt nhất cho chim. Nên bổ sung vào chế độ dinh dưỡng hàng ngày của chị những thực phẩm tươi, nhiều dinh dưỡng như: ngũ cốc, rau, trái cây…\n\nTỉ lệ phần trăm các nhóm thực phẩm nên là: 25% – 50% thức ăn dạng viên, dưới 10% các loại hạt và phần còn lại là những loại thực phẩm tươi tốt.\n\nHướng dẫn chăm sóc sức khỏe\n\nNgười nuôi vẹt cần chú ý chăm sóc cả sức khoẻ thể chất và sức khỏe tinh thần cho vẹt. Việc bị gò bó về mặt tinh thần có thể dẫn đến những nét tính cách xấu và ảnh hưởng tới sức khỏe thể chất của vẹt. Hãy cố gắng dành nhiều thời gian trò chuyện và chăm sóc chúng. Như vậy chim sẽ cảm nhận được tình thương từ chủ của mình và thoải mái về tinh thần. Bên cạnh đó, cũng hãy giúp chim được thoải mái bằng cách cho chúng có không gian đủ rộng để sải cánh và được bay nhảy. Khi xảy ra vấn đề về tâm lý, vẹt Nam Mỹ có thể xuất hiện tình trạng tự nhổ lông và tự làm tổn thương bản thân.\n\nVẹt Nam Mỹ là loài chim khỏe mạnh và sống lâu. Tuy nhiên, cũng như nhiều loài chim khác, vẹt Nam Mỹ có thể mắc phải một số bệnh như:\n\nBệnh phồng dạ dày tuyến (PDD – Pro Ventricular dilatation disease). Bệnh này là do một loại virus gây ra và không thể chữa được.\nBệnh nhiễm khuẩn Psittacine ở mỏ và lông. Đây là một loại bệnh truyền nhiễm và có thể gây tử vong ở vẹt\nBệnh sốt ở vẹt và có thể truyền sang con người.\nBệnh lệch khớp mỏ nguyên nhân bởi sự rối loạn thẳng hàng của mỏ.\n\nKhi thấy sức khoẻ của thú cưng không ổn định, hãy đưa vẹt Nam Mỹ đến bác sĩ thú y để được thăm khám và điều trị kịp thời, tránh vấn đề xấu xảy ra.\n\nKhi chăm sóc sức khỏe cho vẹt Nam Mỹ, người nuôi cần chú ý làm vệ sinh cho vẹt. Loài vẹt này khá thích nước và thích việc nước chảy dọc bộ lông của mình. Bởi vậy đừng ngần ngại làm sạch cơ thể cho vẹt bằng nước. Sau khi tắm cho vẹt xong cần chú ý lau khô bộ lông cho chúng. Việc bị ướt, lông dính nước trong thời gian dài có thể gây ra tình trạng ho, hắt hơi, cảm lạnh ở vẹt.\n\nCần thường xuyên loại bỏ những vết bẩn trên chân và bụi bám trên người để giữ vẹt luôn sạch sẽ. Việc chải lông cho vẹt cũng giúp loại bỏ những sinh vật ký sinh trên người chim.'
, N'Buy', CAST(N'2023-11-15' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0015', N'US0002', N'Cẩm nang chăm sóc sức khỏe cho vẹt Nam Mỹ bạn nên biết', N'Vẹt Nam Mỹ có những đặc điểm gì nổi bật? Vẹt Nam Mỹ là một trong những loài chim thông minh…', N'Vẹt Nam Mỹ có những đặc điểm gì nổi bật?\n\nVẹt Nam Mỹ là một trong những loài chim thông minh nhất thế giới. Vẹt Nam Mỹ không chỉ rất giỏi trong việc bắt chước tiếng người mà còn có tiếng hót líu lo, vui tai. Vẻ ngoài sặc sỡ của loài chim này cũng là điểm thu hút khiến mọi người yêu thích và ưa chuộng chúng.\n\nVẹt Nam Mỹ (Scarlet Macaw) có kích thước phụ thuộc vào loài và là dòng chim có kích thước trung bình. Có những loài có thể nặng từ 2 – 4kg, có loài khi trưởng thành chỉ nặng 1,2 – 1,7kg. Chiều dài cơ thể dao động từ 8,6 – 100cm.\n\nCon Vẹt có phần đầu khá to và tròn. Chiếc mỏ rất to chính là điểm nổi bật nhất trên khuôn mặt của chúng. Chiếc mỏ của chúng vô cùng chắc khỏe và được cấu tạo bởi lớp sừng cứng. So với mỏ dưới thì mỏ trên dài hơn rất nhiều, có xu hướng quặp vào. Đôi mắt tròn, thường có màu đen hoặc màu đỏ. Ở một số dòng, còn có chiếc mào cấu tạo bằng lông rất to trên đỉnh đầu của chúng.\n\nNgực nở, lưng hơi cong và bụng khá to. Chiếc cổ của chúng khá to và hơi ngắn. Đôi chân ngắn, to và vô cùng chắc khỏe. Các ngón chân của chúng có móng vuốt rất cứng và sắc nhọn, thường chân của chúng khá lớn, xù xì, điều này giúp chúng có thể dễ dàng đu, bám, leo trèo trên các cành cây. Cánh và đuôi được bao phủ bởi lớp lông dày và cứng, thường khá dài.\n\nBộ lông dày rất mượt bao phủ toàn bộ cơ thể của chim. Lớp lông vũ gần sát phần da của chúng rất mềm. Lớp lông bên ngoài có màu sắc vô cùng sặc sỡ nhưng lại cứng. Màu sắc của chúng phụ thuộc vào từng loài nhưng chủ yếu là màu xanh dương và xanh lá cây.\n\nVẹt Nam Mỹ có đặc tính sinh sản như thế nào?\n\nVẹt có thể sinh sản vào bất cứ mùa nào ở trong năm nhưng chủ yếu nhất vẫn là vào mùa hè, chúng sinh sản theo hình thức kết đôi và đẻ trứng.\n\nChim đực và chim cái khi đến kỳ sinh sản sẽ cùng nhau làm tổ trên các thân cây. Phía bên trong tổ lót các sợi rơm và cành cây nhỏ. Trung bình một lần sinh sản Vẹt Nam Mỹ có thể đẻ được từ 4 – 8 trứng.\n\nTrứng của Vẹt có màu trắng sữa và khá nhỏ. Trong khi ấp trứng, con đực sẽ có nhiệm vụ tìm kiếm và cung ứng thức ăn cho con cái, còn con cái dành phần lớn thời gian để ấp. Trứng Vẹt Nam Mỹ sẽ nở trong khoảng từ 17 – 35 ngày.\n\nCả chim bố và chim mẹ sẽ thay nhau đi kiếm thức ăn về mớm cho con non sau khi trứng nở thành con. Trong khoảng 2 – 3 tháng Vẹt Nam Mỹ non sẽ được chim bố mẹ nuôi, đến khi chúng đã mọc gần như hoàn thiện lông. Chim bố và chim mẹ sẽ dọn tổ khi chim non rời đi, để tiếp tục cho chu kỳ sinh sản tiếp theo.\n\nCách chăm sóc Vẹt Nam Mỹ\nChuồng nuôi\n\nChuồng nuôi Vẹt kiểng không cần trang trí lộng lẫy và quá rộng. Để cho chúng bay nhảy, các bạn chỉ cần đảm bảo chuồng nuôi phải có đủ không gian. Bên trong chuồng nuôi phải có đủ thức ăn và nước uống. Đặc biệt, để cho chim đậu vào các bạn phải trang bị cần đứng bằng gỗ.\n\nCác bạn nên lựa chọn chuồng nuôi làm bằng kim loại – song ngang đối với loài Vẹt, không nên dùng lồng bằng sắt. Để cho chim có thể tiếp xúc được với nhiều người, lồng chim nên đặt ở những nơi thoáng mát, chỗ đi lại.\n\nThức ăn của Vẹt Nam Mỹ?\n\nCác bạn nên bổ sung loại thức ăn dành riêng cho Vẹt bên cạnh những loại hạt mà chúng yêu thích. Điều này giúp cung cấp đầy đủ khoáng chất và dinh dưỡng dành cho vet Nam My.\n\nThời gian cho ăn: Kết hợp ăn cả hạt thực vật, trái cây và thức ăn khô dành cho chim. Các bạn nên cho Vẹt Nam Mỹ ăn vào buổi sáng sớm và buổi tối muộn.\n\nChăm sóc sức khỏe\n\nCác bạn hãy thường xuyên tắm cho chúng vì Vẹt cảnh rất thích tắm nước, để loại bỏ hết bụi bẩn và vi khuẩn trong cơ thể của chúng.\n\nMùa đông chỉ những ngày nắng ấm mới cho chim tắm còn mùa hè nên 2 ngày tắm 1 lần. Các bạn nên lau khô lông cho chúng sau khi tắm xong, điều này để tránh chim bị cảm lạnh và hắt hơi.'
, N'Care', CAST(N'2023-10-30' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0016', N'US0002', N'5 đặc tính nổi bật của vẹt Macaw và những lưu ý khi nuôi vẹt', N'Giới thiệu về Vẹt Macaw: Vẹt Macaw (phát âm tiếng Việt như là Vẹt Mắc-ca) hay còn gọi là Vẹt…', N'Giới thiệu về Vẹt Macaw:\n\nVẹt Macaw (phát âm tiếng Việt như là Vẹt Mắc-ca) hay còn gọi là Vẹt đuôi dài. Đây là tập hợp đa dạng các loài vẹt có đuôi dài, từ nhỏ đến lớn. Chúng thường sặc sỡ màu sắc và thuộc về phân họ Vẹt Tân thế giới Arinae phân bố phần lớn ở Nam Mỹ. Nhiều loài trong số chúng được ưa chuộng để nuôi làm chim cảnh.\n\nĐây là một giống vẹt thuộc họ Psittacidae. Là loài vẹt có kích thước to, hòa đồng và hết sức ồn ào. Chúng cần có rất nhiều không gian để có thể duy trì cuộc sống năng động và khỏe mạnh của mình.\nNhững chú vẹt này rất vui vẻ và hoạt bát. Chúng khá ồn ào, có khả năng bắt chước được lời nói của bạn. Tuy rằng sẽ không rành mạch như một số loài chim khác. Vì rất thông minh nên chúng khá dễ dàng huấn luyện. Bạn có thể bắt đầu nuôi vẹt từ khi chúng còn nhỏ, cho ăn bằng tay, dạy chúng nói hoặc hát…\n\nVẹt Macaw có mấy loại?\n\nCó 2 loại vẹt Macaw phổ biến được nhiều người nuôi làm cảnh, đó là:\n\n– Vẹt Macaw đỏ: Vẹt Macaw đỏ là loài vẹt đuôi dài ở Nam Mỹ. Hình dáng bên ngoài của loài vẹt này khá đặc trưng.\nChúng được bao phủ lên thân với màu đỏ là chủ đạo, xen vào đó là các màu vàng và xanh. Trong họ nhà vẹt Macaw đỏ là loài chim vẹt có kích thước bé nhất.\n– Vẹt Macaw xanh: Ngược lại với vẹt Macaw đỏ, vẹt Macaw xanh lại là giống chim vẹt có kích thước lớn nhất. Chúng có đuôi dài, thân hình khỏe mạnh, sải cánh rộng. Chúng có bộ lông màu xanh pha vàng rất nổi bật.\n\nBí kíp nuôi vẹt Macaw đúng chuẩn:\nChế độ ăn:\n\nTrong nuôi nhốt thì vẹt yêu cầu một chế độ dinh dưỡng cao. Do kích thước lớn của chúng nên điều quan trọng là phải luôn có thức ăn sẵn ở trong lồng của chúng. Trong hoang dã chúng ăn các loại quả hạch, hạt giống và thực vật. Thức ăn chứa 17-20% chất đạm để đảm bảo chúng có đủ sức khoẻ. Không cho ăn ở đáy lồng nên để ở khay cao ngang mặt ngay tầm với của chúng.\n\nRau quả được rửa sạch, không để thức ăn thừa quá lâu tránh tình trạng thiu thối. Để bổ sung chất béo cho chúng hàng ngày cho chúng ăn hạt hạnh nhân. Hoặc có thay thế bằng các loại hạt có độ béo tương đương. Ngoài ra các có thể băm nhỏ bông cải xanh, bí ngô, rau xanh các loại và trộn lẫn với Calci, vitamin, các chất khoáng rồi cho chúng ăn bổ sung.\n\nSinh tố A (là sinh tố quan trọng nhất cho chim về chức năng não, hệ thống miễn dịch và giúp cho mắt). Để bổ sung vitamin A, có thể cho vẹt macaw ăn khoai tây luộc chín. Đồng thời có thể cho ăn kết hợp các loại hoa quả như táo, lê. Nên cắt miếng nhỏ để tránh lãng phí và không cho ăn quá 2-3 lần/ tuần. Nếu con vẹt macaw dấu hiệu thiếu chất dinh dưỡng, cho ăn bổ sung hạt hướng dương vằn, hướng dương trắng, lạc, yến mạch nguyên vỏ, hạt ngô, hạnh nhân, kiều mạch, hạt gai dài.\n\nPhương pháp nuôi:\n\nKhi nuôi vẹt Macaw, bạn cần phải chuẩn bị một cái lồng lớn. Với những chú vẹt nhỏ, chiếc lồng phải có kích thước 61cm x 92cm x 122cm. Với những con vẹt lớn hơn, lồng nuôi phải đạt kích thước từ 92cm x 122cm x 152cm. Lồng chim phải làm từ chất liệu tốt. Vì như vậy mới chịu được sức “công phá” của vẹt Macaw. Vậy nên một chiếc lồng thép không gỉ sẽ là sự lựa chọn thích hợp. Trong lồng vẹt Macaw, bạn nên bố trí thêm một số các đồ chơi bằng gỗ hoặc các khối gỗ đơn giản. Đồ chơi chưa qua xử lý để vẹt có thể nhai, hoặc chơi đùa. Vì bản tính rất thích lộn xộn và phá hoại, nên bạn phải luôn cung cấp các loại đồ chơi hạng nặng để vẹt không thể tìm được thứ gì khác để nhai.\n\nCó khá nhiều người đã tự thiết kế đồ chơi cho chim vẹt của mình. Họ có sử dụng các vật liệu như hộp khăn giấy, thùng xốp… Mỗi ngày vẹt Macaw sẽ cần phải có một không gian rộng rãi hơn một cái lồng để chúng khám phá, dang rộng đôi cánh của mình. Điều này giúp chúng khỏe mạnh về thể chất cũng có được tinh thần ổn định. Bạn nên thường xuyên cho chúng ra ngoài lồng để được thư giãn. Bạn chỉ cần treo dây xích và cố định lại là được. Vẹt Macaw là loài chim vẹt sống theo đàn. Chúng cũng rất giàu tình cảm. Nên trong quá trình chăm sóc, bạn cần phải dành nhiều thời gian cho chúng. Vì trò chuyện để chúng cảm thấy hạnh phúc và được quan tâm.\n\nVẹt Macaw là loài chim vẹt sống khá lâu. Vấn đề sức khỏe mà bạn cần phải quan tâm nhất đối với loài vẹt này đó là tình cảm. Vì thông minh, nên vẹt Macaw rất dễ bị buồn chán và cô đơn. Một con vẹt Macaw bị trầm cảm chúng sẽ tự nhổ lông mình. Có hai giải pháp để khắc phục tình trạng này, một là bạn nuôi nhiều hơn một chú vẹt Macaw. Hai là bạn cần dành nhiều thời gian quan tâm tới chúng.\n\nVẹt Macaw giá bao nhiêu?\n\nĐể trả lời cho câu hỏi vẹt Macaw giá bao nhiêu cần phải phụ thuộc vào nhiều yếu tố liên quan. Trước khi quyết định mua bạn cần phải nghiên cứu lựa chọn loại thích hợp. Một chú chim vẹt nhỏ sẽ cần ít không gian hơn. Nếu có không gian bạn có thể chọn cho mình một chú chim lớn. Khi chọn vẹt Macaw bạn cần chọn những con có đôi mắt sáng, khỏe mạnh, bộ lông đầy đủ\n\nHiện nay giá bán một chú vẹt sẽ có sự chênh lệch khác nhau. Tùy thuộc vào kích thước, độ tuổi, nguồn gốc, màu sắc hay bộ lông. Trung bình giá bán một chú vẹt macaw sẽ có giá dao động từ 5 tới 30 triệu đồng. Với những con đẹp và thông minh có thể giá bán sẽ lên tới hàng trăm triệu.\n\nTrên đây là nội dung bài chia sẻ về vẹt Macaw. Hy vọng bài viết của Pet Me Shop sẽ mang tới cho bạn những thông tin bổ ích. Giúp bạn có được kinh nghiệm nuôi và chăm sóc loài vẹt này tốt nhất.'
, N'Care', CAST(N'2023-10-30' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0017', N'US0002', N'3 mẹo huấn luyện vẹt két nhanh biết nói và cách chăm sóc đúng chuẩn', N'Kỹ thuật chăm sóc và huấn luyện vẹt két luôn là vấn đề được nhiều người mới tập chơi chim…', N'Kỹ thuật chăm sóc và huấn luyện vẹt két luôn là vấn đề được nhiều người mới tập chơi chim cảnh quan tâm. Tại Việt Nam hiện nay có nhiều loại vẹt két biết nói, điển hình như: vẹt đầu xám, xít, vẹt mỏ vàng, yến phụng… Nếu đuôi dài thì có thể là vẹt đầu xám hoặc xít.\n\nVậy làm thế nào để huấn luyện và chăm sóc cho vẹt két đúng cách? Mời bạn cùng Pet Me Shop tìm hiểu qua bài viết dưới đây nhé!\n\nĐộ tuổi nào của chim vẹt thích hợp để nuôi?\n\nMuốn nuôi dạy vẹt két nói, điều quan trọng nhất là phải nuôi từ lúc nó mới nở. Đến mùa sinh nở của chúng bạn có thể ra các tiệm chim chuyên bán vẹt két sẽ có bán những con vẹt còn choác mỏ đòi ăn, bạn có thể lựa chọn cho mình một con vẹt két mà bạn thích. Nuôi vẹt ở thời điểm này thì những con vẹt này về sau sẽ rất thân với bạn và nghe lời, khỏi cần phải nhốt lồng hay cột xích.\n\nNuôi vẹt (két) từ lúc mới nở thì vẹt sẽ bắt đầu nói vào lúc gần được 1 năm tuổi. Thời gian vẹt tập nói bạn có thể nhắc đi nhắc lại những câu muốn dạy cho đến khi nó nhuần nhuyễn. Vẹt không cần phải lột lưỡi cũng như không cần cho ăn ớt như Nhồng. Vẹt két mái nói nhiều hơn vẹt trống.\n\nMục đích nuôi từ non nhằm để con vẹt lầm tưởng chúng ta là mẹ chúng.nên lựa chọn vẹt non nhưng non tầm tuổi nào cũng rất đáng chú ý. Chỉ chênh nhau vài ngày nhưng vấn đề sẽ khác thấy rõ rệt. \n\nTrong họ nhà vẹt két thì con xích là nói giỏi nhất, giá của 1 con vẹt xích non hơn 1 triệu , các loài khác giá rẻ hơn bù lại nói không giỏi bằng. Còn nếu muốn vừa nói tốt vừa đẹp mã bạn hãy lựa con vẹt đầu xám.\n\nNhững vấn đề cần lưu ý khi nuôi vẹt két còn nhỏ:\nChế độ ăn\n\nNhư đã giới thiệu ở trên, để nuôi vẹt két nói chuyện thì tốt nhất là nuôi chúng kể từ khi chúng còn nhỏ, tuy nhiên không phải ai cũng biết cách chăm sóc anh bạn nhỏ này và nếu không khéo bạn có thể làm cho các chú  không khỏe. Pet Me Shop lưu ý đến bạn các điều sau trong chế độ dinh dưỡng để chú vẹt nhà bạn có thể khỏe mạnh nhất đón nhận các khóa học giao tiếp:\n\nBắt chước vẹt mẹ khi cho vẹt con ăn, khi cho ăn bạn nên chia thành nhiều bữa ăn và mỗi bữa cách nhau khoảng 30 phút.\nNên chọn loại thức ăn dạng viên, dạng cục hay mảnh vụn được đóng gói sẵn vừa cung cấp đầy đủ các dưỡng chất và bạn không phải mất quá nhiều thời gian chuẩn bị thức ăn cho chúng.\nKhử nước là vấn đề quan trọng nên bạn cần thay nước uống cho vẹt từ 1 – 2 ngày\n\nVệ sinh\n\nNuôi vẹt nói chuyện bạn cần chú ý đến việc phòng bệnh cho chúng, nhất là vẹt non vì đề kháng của các bé thời kỳ này khá kém. Hãy luôn đảm bảo ổ nuôi chúng thật sạch sẽ và đĩa thức ăn nên được rửa sạch hằng ngày. Đặc biệt, không nên để bất cứ thức ăn nào trong chuồng vẹt quá 24 giờ vì kể cả phân chim hay thức ăn thừa sẽ gây ra nhiều vi khuẩn ảnh hưởng nghiêm trọng đến chú vẹt.\n\nKhung giờ vàng thích hợp để luyện cho vẹt (két) nói:\n\nThời điểm thích hợp để bắt đầu huấn luyện một chú vẹt nói là vào buổi sáng từ 6 – 7 giờ, khi mà sức khỏe và khả năng tập trung chú ý của vẹt vào bạn là cao nhất. Hãy nhớ rằng, nếu vẹt nhà bạn đang cảm thấy mệt hoặc không tập trung thì việc huấn luyện sẽ không mang lại hiệu quả đồng thời sẽ gây cho bé ác cảm với bạn.\n\nHơn nữa, cách dạy vẹt nói tốt nhất là hãy làm cho vẹt cảm thấy thoải mái với bạn bằng cách dành nhiều thời gian cho nó, nói với nó và giữ cho nó tinh thần thoải mái nhất có thể, đặc biệt không nên ép nó giao tiếp với bạn nếu nó chưa thật sự sẵn sàng.\n\nNhững bước cơ bản dạy vẹt (két) nói chuyện:\nBước 1: Dạy vẹt những cử chỉ đơn giản\n\nThân thiện với các con chim non thường xuyên cũng là một trong những cách dạy vẹt nói, điều này cho phép bạn trở nên thân thuộc với tính cách và sở thích của chúng, làm cho bạn dễ dàng tiếp cận và huấn luyện chúng, đầu tiên bằng những cử chỉ đơn giản như ra hiệu bằng tay hoặc đơn giản chỉ gọi chúng lại gần bạn. Các thao tác bạn cần làm quen với chúng như sau:\n\nĐặt tên cho vẹt con bằng một âm tiết để chúng dễ dàng ghi nhớ và bắt chước đây là tên bạn đặt cho chúng\nTạo cho chúng cảm giác thích vuốt ve dần dần trở nên quen thuộc với các hành động và sự chỉ huy của bạn\nBước 2: Dạy vẹt nhận biết các âm thanh đơn giản\n\nKhi vẹt đã bắt đầu chấp nhận những cử chỉ thân thiện như vuốt ve và biết nghe bạn gọi thì cũng là lúc bạn dạy cho bé cách nói những từ đơn giản.\n\nNói rõ, chậm và lặp đi lặp lại một từ đơn giản có nguyên âm là A, O\nKhông nên dạy vẹt két một câu quá dài và phức tạp. Bạn có thể dạy chúng từ “hello” hay tên của bạn vì đây là những âm thanh khá quen thuộc với chúng\nThưởng cho vẹt (két) bằng một vài mẫu thức ăn như nhánh cần tây, cà rốt … khi chúng nói được những từ bạn dạy\nĐừng quá cố khi dạy chúng nói chuyện, dạy vẹt khoảng nữa tiếng một ngày và vài phút một lần là cách tốt nhất.\n\nBạn lưu ý rằng điều quan trọng nhất trong cách dạy vẹt két nói chuyện là bạn cần phải có sự kiên nhẫn, một chú chim muốn hót hay phải mất từ 2 – 3 năm nên một chú vẹt muốn nói tốt cũng phải mất khoảng thời gian nhiêu đó. Kết hợp huấn luyện vẹt nói chuyện trên đầu ngón tay của bạn sẽ mang lại hiệu quả cao hơn.'
, N'Care', CAST(N'2023-10-30' AS Date), 1)
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitle], [BlogSummary], [BlogContent], [BlogType], [CreateAt], [Status]) VALUES 
(N'BO0018', N'US0002', N'Hotel For Parrots', N'Parrots are brightly colored birds, dignified like a queen with extremely skillful imitation skills. For those reasons, they are loved…', N'Parrots are brightly colored birds, dignified like a queen with extremely skillful imitation skills. For those reasons, they are loved and chosen by many aquarists. However, raising parrots is very difficult and teaching them to talk is even more difficult.\n\nTo take care of parrots when you are away, learn and experience our parrot hotel service below!\n\nDetails of hotel services for parrots\n\nPrice: 50.000 – 200.000đ/day (For Pet Me Customer Only)\n\nPet Me, with “Parrot Hotel Service”, specializes in looking after your parrots when you are away.\n\nYou can put your trust on our service when you are busy or away. The cage system is cool, clean; the standing trees for parrots are professionally designed; the atmosphere is cozy and friendly with several domesticated parrots. Therefore, you can be satisfied with our “Parrot Hotel Service” when you are away.\n\nHotel for parrots\n\nYour parrots are in an opening atmosphere, are nutritionally cared, cleaned and periodically sunbathed. Specially, their health is continuously checked during the day. Your darlings are arranged for their place to prevent them from fighting. If you have any special requirements about the nutrition for your parrots, you can ask us!\n\n“Parrot Hotel Service” always try to create a friendly environment for your darling parrots when you are away.\n\nPrice: 50.000 – 200.000đ/day (For Pet Me Customer Only)\n\nOne day parrot sent – small size: Ringneck, Sun … (deposit, disease prevention, beauty): 50,000 VND\nOne day parrot sent – medium size: Gray, Electus … (deposit, disease prevention, beauty): 100.000 VND\nOne day parrot sent – large size: Cockatoo, Macaw (deposit, prevent disease, beauty): 150,000 VND\nOne day parrot sent – value over 100 million (deposit, disease prevention, beauty): 200,000 VND'
, N'Place', CAST(N'2023-10-28' AS Date), 1)GO
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
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB001', N'BO0001', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/Majestic%20Play%20Top%20Bird%20Cage-2.png?alt=media&token=6dc14cc4-f91a-4dd7-8748-5d1d4ce35798&_gl=1*18yz2hn*_ga*OTg1Mjk2NDM0LjE2OTc2OTgwNDU.*_ga_CW55HF8NVT*MTY5Nzk1MjU0NS4zLjEuMTY5Nzk1MjkwNy4yOC4wLjA.')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB002', N'BO0002', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2FMua%20b%C3%A1n%20chim%20v%E1%BA%B9t%20c%E1%BA%A7n%20l%C6%B0u%20%C3%BD%20nh%E1%BB%AFng%20g%C3%AC.webp?alt=media&token=f11c7751-d0f0-412c-91ec-8dcdcce4c103')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB003', N'BO0003', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2FChim%20v%E1%BA%B9t%20gi%C3%A1%20bao%20nhi%C3%AAu.jpg?alt=media&token=2ac8dbeb-6a3a-487d-af71-402b2e0c69a5')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB004', N'BO0004', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2FMua%20b%C3%A1n%20v%E1%BA%B9t%20non%20gi%C3%A1%20r%E1%BA%BB%2C%20uy%20t%C3%ADn%20ch%E1%BA%A5t%20l%C6%B0%E1%BB%A3ng%20t%E1%BA%A1i%20Pet%20Me%20Shop.jpg?alt=media&token=9e8e4bcb-ad2e-463f-b189-8b42b47ca545')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB005', N'BO0005', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2FGi%C3%A1%20mua%20chim%20k%C3%A9t%20(v%E1%BA%B9t)%20t%E1%BA%A1i%20th%E1%BB%8B%20tr%C6%B0%E1%BB%9Dng%20Vi%E1%BB%87t%20Nam.jpg?alt=media&token=001195d2-655a-4720-a76f-af52af30708c')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB006', N'BO0006', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2FMua%20v%E1%BA%B9t%20bi%E1%BA%BFt%20n%C3%B3i%20gi%C3%A1%20r%E1%BA%BB%2C%20ch%E1%BA%A5t%20l%C6%B0%E1%BB%A3ng%20t%E1%BA%A1i%20TP.HCM.webp?alt=media&token=053a3ce1-7186-46ae-ad83-42b4f0dddf1b')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB007', N'BO0007', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2FB%E1%BA%A3ng%20gi%C3%A1%20mua%20chim%20v%E1%BA%B9t%20t%E1%BA%A1i%20th%E1%BB%8B%20tr%C6%B0%E1%BB%9Dng%20Vi%E1%BB%87t%20Nam.jpg?alt=media&token=c027bc25-9371-4712-ace5-97f924d555a4')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB008', N'BO0008', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2FC%C3%A1ch%20ch%C4%83m%20s%C3%B3c%20hi%E1%BB%87u%20qu%E1%BA%A3%20cho%20V%E1%BA%B9t%20%C4%91u%C3%B4i%20d%C3%A0i%20Nam%20M%E1%BB%B9.jpg?alt=media&token=6ba77a7a-7162-477b-93bc-970ae0ed16ed')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB009', N'BO0009', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2F5%20Shop%20b%C3%A1n%20v%E1%BA%B9t%20bi%E1%BA%BFt%20n%C3%B3i%20uy%20t%C3%ADn%2C%20gi%E1%BA%A3%20r%E1%BA%BB%20t%E1%BA%A1i%20th%C3%A0nh%20ph%E1%BB%91%20H%E1%BB%93%20Ch%C3%AD%20Minh.jpg?alt=media&token=f1739b12-c664-41cf-8e4f-7a342c170e65')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB010', N'BO0010', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2FMua%20v%E1%BA%B9t%20Nam%20M%E1%BB%B9%20%E1%BB%9F%20%C4%91%C3%A2u%20uy%20t%C3%ADn%20t%E1%BA%A1i%20Th%C3%A0nh%20ph%E1%BB%91%20H%E1%BB%93%20Ch%C3%AD%20Minh.jpg?alt=media&token=1946384b-7fa9-4485-ac75-2c4aefa0beda')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB011', N'BO0011', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2FV%E1%BA%B9t%20tr%E1%BA%AFng%20%E2%80%93%20Nh%E1%BB%AFng%20v%E1%BA%A5n%20%C4%91%E1%BB%81%20c%E1%BA%A7n%20l%C6%B0u%20%C3%BD%20khi%20ch%C4%83m%20nu%C3%B4i.webp?alt=media&token=caa41b5e-51f3-4120-95fa-b729e806c4d8')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB012', N'BO0012', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2FV%E1%BA%B9t%20Cockatoo%20v%C3%A0%20nh%E1%BB%AFng%20%C4%91i%E1%BB%81u%20k%E1%BB%B3%20th%C3%BA%20m%C3%A0%20b%E1%BA%A1n%20ch%C6%B0a%20bi%E1%BA%BFt.jpg?alt=media&token=800b705b-688e-4ca8-b762-bbbd1f750c50')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB013', N'BO0013', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2FShop%20b%C3%A1n%20v%E1%BA%B9t%20Nam%20M%E1%BB%B9%20gi%C3%A1%20r%E1%BA%BB%20t%E1%BA%A1i%20Th%C3%A0nh%20ph%E1%BB%91%20H%E1%BB%93%20Ch%C3%AD%20Minh.jpg?alt=media&token=e3b236ea-444c-4e0d-ae2e-5bd3c1e4460b')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB014', N'BO0014', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2FGi%C3%A1%20v%E1%BA%B9t%20Nam%20M%E1%BB%B9%20non%20hi%E1%BB%87n%20nay%20tr%C3%AAn%20th%E1%BB%8B%20tr%C6%B0%E1%BB%9Dng%20kho%E1%BA%A3ng%20bao%20nhi%C3%AAu.jpg?alt=media&token=ca7e6f3f-c907-4887-a53f-b55f00bdf3c6')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB015', N'BO0015', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2FC%E1%BA%A9m%20nang%20ch%C4%83m%20s%C3%B3c%20s%E1%BB%A9c%20kh%E1%BB%8Fe%20cho%20v%E1%BA%B9t%20Nam%20M%E1%BB%B9%20b%E1%BA%A1n%20n%C3%AAn%20bi%E1%BA%BFt.jpg?alt=media&token=de452323-a4e6-432b-b828-8dc88d293906')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB016', N'BO0016', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2F5%20%C4%91%E1%BA%B7c%20t%C3%ADnh%20n%E1%BB%95i%20b%E1%BA%ADt%20c%E1%BB%A7a%20v%E1%BA%B9t%20Macaw%20v%C3%A0%20nh%E1%BB%AFng%20l%C6%B0u%20%C3%BD%20khi%20nu%C3%B4i%20v%E1%BA%B9t.webp?alt=media&token=ec4f8101-0832-43fb-8e0e-84e273653f3b')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB017', N'BO0017', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2F3%20m%E1%BA%B9o%20hu%E1%BA%A5n%20luy%E1%BB%87n%20v%E1%BA%B9t%20k%C3%A9t%20nhanh%20bi%E1%BA%BFt%20n%C3%B3i%20v%C3%A0%20c%C3%A1ch%20ch%C4%83m%20s%C3%B3c%20%C4%91%C3%BAng%20chu%E1%BA%A9n.jpg?alt=media&token=5b027bdf-0de2-46b7-b784-8f2852f3b0da')
INSERT [dbo].[Image] ([ImageID], [BlogID], [ProductID], [StyleID], [SizeID], [MaterialID], [BirdID], [ImageURL]) VALUES (N'IB018', N'BO0018', NULL, NULL, NULL, NULL, NULL, N'https://firebasestorage.googleapis.com/v0/b/bscswp.appspot.com/o/blog%2FHotel%20For%20Parrots.jpg?alt=media&token=f1a23f11-a5bb-4b94-802f-b8fc22b0df0e')


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
