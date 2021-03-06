USE [master]
GO
/****** Object:  Database [yemektarifleriDB]    Script Date: 25.01.2022 13:21:24 ******/
CREATE DATABASE [yemektarifleriDB]
GO
USE [yemektarifleriDB]
GO
/****** Object:  Table [dbo].[sayfalar]    Script Date: 25.01.2022 13:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sayfalar](
	[sayfa_id] [int] IDENTITY(1,1) NOT NULL,
	[sayfa_basligi] [nvarchar](50) NULL,
	[icerik] [ntext] NULL,
	[sira] [int] NULL,
	[silindi] [bit] NULL,
	[aktif] [bit] NULL,
 CONSTRAINT [PK_sayfalar] PRIMARY KEY CLUSTERED 
(
	[sayfa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uyeler]    Script Date: 25.01.2022 13:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uyeler](
	[uye_id] [int] IDENTITY(1,1) NOT NULL,
	[uye_adi] [nvarchar](100) NULL,
	[uye_soyadi] [nvarchar](100) NULL,
	[uyelik_tarihi] [datetime] NULL,
	[aktif] [bit] NULL,
	[silindi] [bit] NULL,
	[tel] [nvarchar](25) NULL,
	[ilce] [int] NULL,
	[adres] [ntext] NULL,
	[foto] [nvarchar](150) NULL,
	[eposta] [nvarchar](150) NULL,
	[parola] [nvarchar](250) NULL,
 CONSTRAINT [PK_uyeler] PRIMARY KEY CLUSTERED 
(
	[uye_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yemekler]    Script Date: 25.01.2022 13:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yemekler](
	[yemek_id] [int] IDENTITY(1,1) NOT NULL,
	[yemek_adi] [nvarchar](150) NULL,
	[tarif] [ntext] NULL,
	[aktif] [bit] NULL,
	[silindi] [bit] NULL,
	[sira] [int] NULL,
	[eklenme_tarihi] [date] NULL,
 CONSTRAINT [PK_yemekler] PRIMARY KEY CLUSTERED 
(
	[yemek_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yonetici]    Script Date: 25.01.2022 13:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yonetici](
	[yonetici_id] [int] IDENTITY(1,1) NOT NULL,
	[yonetici_eposta] [nvarchar](255) NULL,
	[yonetici_adi] [nvarchar](100) NULL,
	[yonetici_soyadi] [nvarchar](100) NULL,
	[aktif] [bit] NULL,
	[silindi] [bit] NULL,
	[parola] [nvarchar](50) NULL,
	[yetki] [int] NULL,
 CONSTRAINT [PK_yonetici] PRIMARY KEY CLUSTERED 
(
	[yonetici_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yorumlar]    Script Date: 25.01.2022 13:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[yorumlar](
	[yorum_id] [int] IDENTITY(1,1) NOT NULL,
	[yorum] [nvarchar](510) NULL,
	[onaylandi] [bit] NULL,
	[yorum_tarihi] [datetime] NULL,
	[yemek_id] [int] NULL,
	[uye_id] [int] NULL,
	[IP_adresi] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[yorum_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[sayfalar] ON 

GO
INSERT [dbo].[sayfalar] ([sayfa_id], [sayfa_basligi], [icerik], [sira], [silindi], [aktif]) VALUES (1, N'Anasayfa', N' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eros massa, iaculis id imperdiet eu, aliquam eget lorem.

Donec auctor urna erat, eu tristique libero tempor eu. Proin molestie orci magna. Nam fringilla eros a sem tristique suscipit. Nulla rutrum arcu in nunc volutpat aliquet. Donec vitae tempus mauris, non pharetra purus. Maecenas eu rhoncus justo, et ullamcorper massa. Quisque luctus ante vitae massa feugiat gravida. Integer eget arcu non justo fermentum efficitur. Nulla facilisis venenatis accumsan. Phasellus nec sapien at libero condimentum pellentesque sed eu nunc. Nunc non nulla a ex viverra fermentum non ut libero. Mauris lorem orci, vulputate eget ligula nec, efficitur luctus enim. Nullam eu orci tellus. Nulla iaculis suscipit augue at egestas. Vestibulum fringilla purus ex, eu accumsan erat elementum sit amet.

Aenean consequat mi non mi sodales convallis. Etiam ac rutrum tellus. Praesent sodales bibendum augue, sit amet aliquam nibh convallis vitae. Vivamus quis mauris pulvinar, condimentum justo non, posuere urna. Fusce rutrum fringilla sem, et fringilla nulla dapibus nec. Proin aliquet neque et libero posuere, luctus pulvinar dui dignissim. Nullam vestibulum purus diam, a sollicitudin nisl vulputate ut. Praesent iaculis ipsum neque, vel venenatis augue lobortis et. Praesent a quam porttitor, vestibulum enim a, rutrum elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut hendrerit enim at purus vehicula porttitor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi nec semper nulla. Curabitur at nunc tristique, volutpat quam quis, viverra ante. Maecenas viverra massa ut nunc finibus, et malesuada est sodales.

Morbi mollis nulla velit. Etiam euismod, orci sed commodo dictum, ligula magna fringilla turpis, non semper nisl dolor nec mauris. Donec facilisis tincidunt nunc, vel vulputate ligula pellentesque eget. Aenean risus arcu, congue in dui sit amet, congue tincidunt urna. Praesent vel nibh dapibus, ultricies magna ac, blandit metus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin in imperdiet eros, aliquet interdum orci. Morbi eu augue sit amet massa pharetra fermentum. Donec eu turpis non ligula scelerisque elementum. Vivamus placerat, purus sit amet condimentum suscipit, risus odio vulputate ipsum, in viverra neque orci vitae ex. Curabitur felis justo, volutpat non placerat eget, tristique id metus. Nunc tempor purus nec felis gravida, et viverra nisi ultricies. Cras congue congue sollicitudin.

Praesent luctus cursus risus, vel condimentum justo semper nec. Aliquam augue nisi, feugiat venenatis accumsan eu, aliquam id nulla. Nullam massa magna, euismod eu sem ac, convallis rutrum tortor. Sed ultricies suscipit metus, eget blandit neque luctus sed. Pellentesque in massa dignissim, luctus elit nec, aliquet est. Nunc ornare, justo id venenatis molestie, ante dolor vestibulum nunc, sed lobortis ipsum purus ultrices orci. Quisque elementum sit amet erat nec accumsan. Quisque a mattis odio. Morbi suscipit ex vel nunc mattis suscipit. Ut mollis neque ac dolor convallis, non convallis libero pulvinar. Integer rhoncus tellus arcu, ac euismod eros vestibulum vel. Nunc gravida lacus at ullamcorper pulvinar. Duis ante nibh, molestie vitae fermentum at, convallis id dolor. Sed auctor volutpat tincidunt. Nam sed facilisis elit, luctus congue sem. Nulla mollis nunc vitae nunc lobortis, eget rhoncus libero congue.', 1, 0, 1)
GO
INSERT [dbo].[sayfalar] ([sayfa_id], [sayfa_basligi], [icerik], [sira], [silindi], [aktif]) VALUES (2, N'Hakkimizda', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut rhoncus justo. Nunc accumsan nisl malesuada posuere commodo. Duis ut ex pulvinar, consequat libero eu, malesuada sem. Pellentesque maximus nibh neque, ut scelerisque leo imperdiet sed. Integer a est consectetur, aliquet orci convallis, dapibus dolor. Phasellus egestas vestibulum lorem. Suspendisse finibus luctus libero eget auctor. Duis lobortis nulla quis nibh ornare scelerisque. Donec laoreet pulvinar cursus. Suspendisse mattis risus augue, et consequat odio fringilla congue. Fusce sed imperdiet orci. Ut non hendrerit eros. Sed et turpis eu nisl bibendum feugiat. Fusce lobortis ornare mattis. Maecenas non sem nisi. Ut bibendum libero at tempor vestibulum.

Fusce tristique ligula non porta cursus. Sed tincidunt vel elit quis auctor. Mauris dictum ultrices nulla, sit amet feugiat felis cursus id. Mauris auctor euismod lacus et pharetra. Aliquam erat volutpat. Aenean id dictum dolor. Morbi a odio ornare, sagittis massa eget, faucibus justo.

Fusce molestie volutpat consectetur. Cras placerat dolor eu commodo posuere. Nullam elementum tempus fermentum. Fusce ultricies, dui et congue dignissim, ligula massa porttitor leo, in ultrices elit turpis a est. Aenean posuere tempus metus, vel sollicitudin dui pellentesque a. Sed nisi nisl, vehicula facilisis velit eget, facilisis accumsan erat. Nullam mollis urna id maximus imperdiet. Nulla ac commodo tellus. Nunc sodales tincidunt est vel iaculis. Maecenas efficitur iaculis placerat. Donec eget ullamcorper est. Etiam id leo imperdiet, gravida mi vel, malesuada ante.

Ut ac laoreet sapien, sed fringilla sapien. Pellentesque a ipsum quis augue fermentum rutrum. Maecenas sed aliquam enim. In tincidunt purus nisl, nec sodales elit dictum ac. Morbi sed enim elit. Praesent aliquet interdum ipsum. Donec tempor dui in placerat volutpat. Quisque ligula dui, tincidunt sed feugiat sed, mattis a dolor.

Mauris consectetur augue dolor, vitae congue purus semper ac. Aenean blandit elit nunc, vel lobortis leo mattis ut. In hac habitasse platea dictumst. Nullam quis nisl consectetur, tincidunt velit vitae, eleifend nisi. Donec placerat molestie posuere. Donec sapien ex, convallis in vestibulum at, vestibulum non tortor. Cras vel tempus elit.

Phasellus semper mi nec erat vestibulum, in porttitor dui ornare. Donec suscipit augue felis, a laoreet sem condimentum ac. Aliquam ultrices mauris ut dolor mattis bibendum. Vestibulum accumsan ipsum porta nunc scelerisque tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer dapibus massa urna, ac ullamcorper mi auctor tempor. In placerat fermentum placerat. Integer ullamcorper augue ut suscipit accumsan. Ut auctor, enim ut consequat vestibulum, nulla ex maximus odio, ac rhoncus dui velit in mauris. Nullam sit amet ullamcorper tortor, id elementum erat.

In vehicula sit amet ex eget sollicitudin. Donec ac elit sed nisl posuere consequat. Sed finibus vestibulum dolor, quis semper mi ullamcorper et. Suspendisse a justo metus. Aenean eget nunc tortor. Nullam finibus, enim quis aliquet convallis, elit augue placerat purus, a bibendum leo est et ex. Nunc arcu nisl, pulvinar id nulla ac, lacinia luctus dolor. Nunc nec neque in lorem finibus rhoncus. Integer quis consectetur massa. Quisque ultrices dolor vel imperdiet finibus.

Nulla suscipit urna faucibus augue euismod, in vehicula massa eleifend. Integer ut enim a odio malesuada tempor. Nam in nisi scelerisque, blandit elit ut, ornare risus. Donec ullamcorper nibh eget est aliquet, quis blandit dui porta. Donec finibus sem eget consectetur cursus. Fusce vitae semper metus. Phasellus bibendum, purus ut sodales aliquam, turpis erat convallis erat, sed fringilla orci velit nec nibh. Vivamus vitae mattis ipsum, facilisis tincidunt nibh. Aenean non ex ornare, aliquam mi ut, volutpat magna. Morbi in massa gravida, vulputate libero sit amet, placerat velit. Ut facilisis, enim nec scelerisque mollis, nisi nibh elementum tellus, eu suscipit augue justo a tellus.

Sed nunc ex, tempor vitae imperdiet vitae, cursus at lectus. Nam nisi orci, ullamcorper sed urna et, aliquam vulputate purus. Morbi scelerisque urna fermentum ornare tincidunt. Aliquam sit amet elit ut orci rutrum lacinia. Proin quis congue dolor. Duis rutrum ac velit a laoreet. Nunc placerat sagittis varius. In et dignissim urna.

 quis eros eu, tristique tempus sapien. Vestibulum at lobortis turpis. Pellentesque ornare eget lacus ac euismod. Curabitur congue, risus vitae vulputate interdum, diam lorem tincidunt eros, vel pellentesque nulla odio at sapien. Sed non nulla et sem faucibus vestibulum et et odio. Praesent porttitor libero ac enim auctor porta. Nullam vel dictum nisl. Maecenas cursus pharetra volutpat.

Proin at dui ex. Proin ac euismod eros. In porttitor tristique viverra. Sed quis risus mauris. Morbi facilisis quam ut massa interdum, maximus efficitur est lacinia. Donec nec velit ut tellus laoreet consectetur. Nullam eget enim ut lectus ornare egestas consequat nec velit.', 2, 0, 1)
GO
INSERT [dbo].[sayfalar] ([sayfa_id], [sayfa_basligi], [icerik], [sira], [silindi], [aktif]) VALUES (3, N'iletisim', N' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eros massa, iaculis id imperdiet eu, aliquam eget lorem.

Donec auctor urna erat, eu tristique libero tempor eu. Proin molestie orci magna. Nam fringilla eros a sem tristique suscipit. Nulla rutrum arcu in nunc volutpat aliquet. Donec vitae tempus mauris, non pharetra purus. Maecenas eu rhoncus justo, et ullamcorper massa. Quisque luctus ante vitae massa feugiat gravida. Integer eget arcu non justo fermentum efficitur. Nulla facilisis venenatis accumsan. Phasellus nec sapien at libero condimentum pellentesque sed eu nunc. Nunc non nulla a ex viverra fermentum non ut libero. Mauris lorem orci, vulputate eget ligula nec, efficitur luctus enim. Nullam eu orci tellus. Nulla iaculis suscipit augue at egestas. Vestibulum fringilla purus ex, eu accumsan erat elementum sit amet.

Aenean consequat mi non mi sodales convallis. Etiam ac rutrum tellus. Praesent sodales bibendum augue, sit amet aliquam nibh convallis vitae. Vivamus quis mauris pulvinar, condimentum justo non, posuere urna. Fusce rutrum fringilla sem, et fringilla nulla dapibus nec. Proin aliquet neque et libero posuere, luctus pulvinar dui dignissim. Nullam vestibulum purus diam, a sollicitudin nisl vulputate ut. Praesent iaculis ipsum neque, vel venenatis augue lobortis et. Praesent a quam porttitor, vestibulum enim a, rutrum elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut hendrerit enim at purus vehicula porttitor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi nec semper nulla. Curabitur at nunc tristique, volutpat quam quis, viverra ante. Maecenas viverra massa ut nunc finibus, et malesuada est sodales.

Morbi mollis nulla velit. Etiam euismod, orci sed commodo dictum, ligula magna fringilla turpis, non semper nisl dolor nec mauris. Donec facilisis tincidunt nunc, vel vulputate ligula pellentesque eget. Aenean risus arcu, congue in dui sit amet, congue tincidunt urna. Praesent vel nibh dapibus, ultricies magna ac, blandit metus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin in imperdiet eros, aliquet interdum orci. Morbi eu augue sit amet massa pharetra fermentum. Donec eu turpis non ligula scelerisque elementum. Vivamus placerat, purus sit amet condimentum suscipit, risus odio vulputate ipsum, in viverra neque orci vitae ex. Curabitur felis justo, volutpat non placerat eget, tristique id metus. Nunc tempor purus nec felis gravida, et viverra nisi ultricies. Cras congue congue sollicitudin.

Praesent luctus cursus risus, vel condimentum justo semper nec. Aliquam augue nisi, feugiat venenatis accumsan eu, aliquam id nulla. Nullam massa magna, euismod eu sem ac, convallis rutrum tortor. Sed ultricies suscipit metus, eget blandit neque luctus sed. Pellentesque in massa dignissim, luctus elit nec, aliquet est. Nunc ornare, justo id venenatis molestie, ante dolor vestibulum nunc, sed lobortis ipsum purus ultrices orci. Quisque elementum sit amet erat nec accumsan. Quisque a mattis odio. Morbi suscipit ex vel nunc mattis suscipit. Ut mollis neque ac dolor convallis, non convallis libero pulvinar. Integer rhoncus tellus arcu, ac euismod eros vestibulum vel. Nunc gravida lacus at ullamcorper pulvinar. Duis ante nibh, molestie vitae fermentum at, convallis id dolor. Sed auctor volutpat tincidunt. Nam sed facilisis elit, luctus congue sem. Nulla mollis nunc vitae nunc lobortis, eget rhoncus libero congue.

Nam quis volutpat purus. Proin semper consectetur nunc, vel varius ligula iaculis ac. Donec et eleifend augue, nec mattis magna. Sed cursus nec tellus in mollis. Cras vitae velit vel augue varius iaculis sed facilisis sem. Aenean nibh arcu, maximus quis eros eu, tristique tempus sapien. Vestibulum at lobortis turpis. Pellentesque ornare eget lacus ac euismod. Curabitur congue, risus vitae vulputate interdum, diam lorem tincidunt eros, vel pellentesque nulla odio at sapien. Sed non nulla et sem faucibus vestibulu', 3, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[sayfalar] OFF
GO
SET IDENTITY_INSERT [dbo].[uyeler] ON 

GO
INSERT [dbo].[uyeler] ([uye_id], [uye_adi], [uye_soyadi], [uyelik_tarihi], [aktif], [silindi], [tel], [ilce], [adres], [foto], [eposta], [parola]) VALUES (3, N'nihat', N'baran', CAST(N'2022-01-01 00:00:00.000' AS DateTime), 1, 0, N'555', NULL, NULL, NULL, N'nb@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b')
GO
INSERT [dbo].[uyeler] ([uye_id], [uye_adi], [uye_soyadi], [uyelik_tarihi], [aktif], [silindi], [tel], [ilce], [adres], [foto], [eposta], [parola]) VALUES (5, N'ali', N'kaya', CAST(N'2022-05-01 00:00:00.000' AS DateTime), 1, 0, N'5444', NULL, NULL, NULL, N'ak@gmail.com', N'123456')
GO
INSERT [dbo].[uyeler] ([uye_id], [uye_adi], [uye_soyadi], [uyelik_tarihi], [aktif], [silindi], [tel], [ilce], [adres], [foto], [eposta], [parola]) VALUES (6, N'mehmet', N'demir', CAST(N'2021-09-09 00:00:00.000' AS DateTime), 1, 0, N'4333', NULL, NULL, NULL, N'md@gmail.com', N'12341')
GO
SET IDENTITY_INSERT [dbo].[uyeler] OFF
GO
SET IDENTITY_INSERT [dbo].[yemekler] ON 

GO
INSERT [dbo].[yemekler] ([yemek_id], [yemek_adi], [tarif], [aktif], [silindi], [sira], [eklenme_tarihi]) VALUES (1, N'çorba', N'1l su mercimek tuz ', 1, 0, 1, CAST(N'2022-01-01' AS Date))
GO
INSERT [dbo].[yemekler] ([yemek_id], [yemek_adi], [tarif], [aktif], [silindi], [sira], [eklenme_tarihi]) VALUES (2, N'menemen', N'domates biber yumurta', 1, 0, 2, CAST(N'2022-01-05' AS Date))
GO
INSERT [dbo].[yemekler] ([yemek_id], [yemek_adi], [tarif], [aktif], [silindi], [sira], [eklenme_tarihi]) VALUES (3, N'Pizza Sosu', N'Pizza Sosu (Bu Sosu Mutlaka Deneyin) Tarifi İçin Malzemeler 
3 adet domates
1 diş sarımsak
1 yemek kaşığı domates salçası
5 yemek kaşığı sıvı yağ
1 tatlı kaşığı kekik
Cay kaşığı ucuyla kimyon
1,5 çay kaşığı tuz
1 tatlı kaşığı fesleğen', 1, 0, 3, CAST(N'2021-01-05' AS Date))
GO
INSERT [dbo].[yemekler] ([yemek_id], [yemek_adi], [tarif], [aktif], [silindi], [sira], [eklenme_tarihi]) VALUES (4, N'Az Ölçülü Revan', N'Az Ölçülü Revani Tarifi İçin Malzemeler
2 adet yumurta
3 yemek kaşığı toz şeker
2 yemek kaşığı yoğurt
Yarım su bardağı süt (100 ml)
Yarım su bardağı sıvı yağ (100 ml)
Yarım su bardağı irmik
1 adet limon kabuğu rendesi
1 paket vanilya
1 paket kabartma tozu
1 su bardağı un
Şerbeti için;

2,5 su bardağı su (500 ml)
2 su bardağı toz şeker
2-3 damla limon suyu', 1, 0, 4, CAST(N'2022-01-04' AS Date))
GO
INSERT [dbo].[yemekler] ([yemek_id], [yemek_adi], [tarif], [aktif], [silindi], [sira], [eklenme_tarihi]) VALUES (5, N'adsasd', NULL, 1, 1, 6, CAST(N'2022-01-07' AS Date))
GO
INSERT [dbo].[yemekler] ([yemek_id], [yemek_adi], [tarif], [aktif], [silindi], [sira], [eklenme_tarihi]) VALUES (6, N'asdasdasdasdasd', NULL, 1, 1, 7, CAST(N'2022-01-21' AS Date))
GO
INSERT [dbo].[yemekler] ([yemek_id], [yemek_adi], [tarif], [aktif], [silindi], [sira], [eklenme_tarihi]) VALUES (7, N'asdasdasdasdasdasd', NULL, 1, 1, 5, CAST(N'2022-01-21' AS Date))
GO
SET IDENTITY_INSERT [dbo].[yemekler] OFF
GO
SET IDENTITY_INSERT [dbo].[yonetici] ON 

GO
INSERT [dbo].[yonetici] ([yonetici_id], [yonetici_eposta], [yonetici_adi], [yonetici_soyadi], [aktif], [silindi], [parola], [yetki]) VALUES (5, N'admin@gmail.com', N'admin', N'admin', 0, 0, N'827ccb0eea8a706c4c34a16891f84e7b', 1)
GO
INSERT [dbo].[yonetici] ([yonetici_id], [yonetici_eposta], [yonetici_adi], [yonetici_soyadi], [aktif], [silindi], [parola], [yetki]) VALUES (6, N'ad@gmail.com', N'adminn', N'yonetici', 1, 0, N'81dc9bdb52d04dc20036dbd8313ed055', 1)
GO
SET IDENTITY_INSERT [dbo].[yonetici] OFF
GO
SET IDENTITY_INSERT [dbo].[yorumlar] ON 

GO
INSERT [dbo].[yorumlar] ([yorum_id], [yorum], [onaylandi], [yorum_tarihi], [yemek_id], [uye_id], [IP_adresi]) VALUES (1, N'menemen kuru olmuştu biraz su eklene bilir', 1, CAST(N'2022-01-05 00:00:00.000' AS DateTime), 2, 2, NULL)
GO
INSERT [dbo].[yorumlar] ([yorum_id], [yorum], [onaylandi], [yorum_tarihi], [yemek_id], [uye_id], [IP_adresi]) VALUES (2, N'çorba tarifiniz çok güzeldi çok begendik', 1, CAST(N'2022-01-02 00:00:00.000' AS DateTime), 1, 1, NULL)
GO
INSERT [dbo].[yorumlar] ([yorum_id], [yorum], [onaylandi], [yorum_tarihi], [yemek_id], [uye_id], [IP_adresi]) VALUES (3, N'  dasdasdasd', 0, CAST(N'2022-01-12 12:08:46.290' AS DateTime), NULL, NULL, N'Label')
GO
INSERT [dbo].[yorumlar] ([yorum_id], [yorum], [onaylandi], [yorum_tarihi], [yemek_id], [uye_id], [IP_adresi]) VALUES (4, N'adasdadsdasdas as dasdas das dasdas', 0, CAST(N'2022-01-12 12:21:26.463' AS DateTime), NULL, NULL, N'Label')
GO
INSERT [dbo].[yorumlar] ([yorum_id], [yorum], [onaylandi], [yorum_tarihi], [yemek_id], [uye_id], [IP_adresi]) VALUES (5, N'çok güzel çok begendim', 1, CAST(N'2022-01-12 14:07:40.363' AS DateTime), 4, 3, N'10.13.10.188')
GO
INSERT [dbo].[yorumlar] ([yorum_id], [yorum], [onaylandi], [yorum_tarihi], [yemek_id], [uye_id], [IP_adresi]) VALUES (6, N'4 kişilik için miktarlar iyi', 0, CAST(N'2022-01-13 12:51:45.163' AS DateTime), 4, 3, N'10.13.10.188')
GO
INSERT [dbo].[yorumlar] ([yorum_id], [yorum], [onaylandi], [yorum_tarihi], [yemek_id], [uye_id], [IP_adresi]) VALUES (7, N'4 kişilik için miktarlar iyi', 1, CAST(N'2022-01-13 12:52:56.050' AS DateTime), 4, 3, N'10.13.10.188')
GO
INSERT [dbo].[yorumlar] ([yorum_id], [yorum], [onaylandi], [yorum_tarihi], [yemek_id], [uye_id], [IP_adresi]) VALUES (8, NULL, 0, CAST(N'2022-01-13 12:52:58.547' AS DateTime), 4, 3, N'10.13.10.188')
GO
INSERT [dbo].[yorumlar] ([yorum_id], [yorum], [onaylandi], [yorum_tarihi], [yemek_id], [uye_id], [IP_adresi]) VALUES (9, N'Tuzu azdı', 1, CAST(N'2022-01-13 12:54:38.873' AS DateTime), 1, 3, N'10.13.10.188')
GO
INSERT [dbo].[yorumlar] ([yorum_id], [yorum], [onaylandi], [yorum_tarihi], [yemek_id], [uye_id], [IP_adresi]) VALUES (10, N'final proje ödevi', 0, CAST(N'2022-01-21 13:46:21.987' AS DateTime), 1, 3, N'10.13.10.188')
GO
SET IDENTITY_INSERT [dbo].[yorumlar] OFF
GO
USE [master]
GO
ALTER DATABASE [yemektarifleriDB] SET  READ_WRITE 
GO
