USE [InsuranceCard]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([ID], [Brand], [isDelete]) VALUES (1, N'Honda', 0)
INSERT [dbo].[Brand] ([ID], [Brand], [isDelete]) VALUES (2, N'Yamaha', 0)
INSERT [dbo].[Brand] ([ID], [Brand], [isDelete]) VALUES (3, N'Piaggio', 0)
INSERT [dbo].[Brand] ([ID], [Brand], [isDelete]) VALUES (4, N'Suzuki', 0)
INSERT [dbo].[Brand] ([ID], [Brand], [isDelete]) VALUES (5, N'SYM', 0)
INSERT [dbo].[Brand] ([ID], [Brand], [isDelete]) VALUES (6, N'Triumph', 0)
INSERT [dbo].[Brand] ([ID], [Brand], [isDelete]) VALUES (7, N'Harley Davidson', 0)
INSERT [dbo].[Brand] ([ID], [Brand], [isDelete]) VALUES (8, N'Ducati', 0)
INSERT [dbo].[Brand] ([ID], [Brand], [isDelete]) VALUES (9, N'KTM', 0)
INSERT [dbo].[Brand] ([ID], [Brand], [isDelete]) VALUES (10, N'Kawasaki', 0)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
INSERT [dbo].[ContractStatusCode] ([StatusCode], [StatusName], [isDelete]) VALUES (0, N'Out of date', 0)
INSERT [dbo].[ContractStatusCode] ([StatusCode], [StatusName], [isDelete]) VALUES (1, N'Active', 0)
INSERT [dbo].[ContractStatusCode] ([StatusCode], [StatusName], [isDelete]) VALUES (2, N'Processing', 0)
INSERT [dbo].[ContractStatusCode] ([StatusCode], [StatusName], [isDelete]) VALUES (3, N'Canceling', 0)
INSERT [dbo].[ContractStatusCode] ([StatusCode], [StatusName], [isDelete]) VALUES (4, N'Canceled', 0)
INSERT [dbo].[ContractStatusCode] ([StatusCode], [StatusName], [isDelete]) VALUES (5, N'Rejected', 0)
GO
INSERT [dbo].[AccountStatusCode] ([StatusCode], [StatusName], [isDelete]) VALUES (0, N'Inactive', 0)
INSERT [dbo].[AccountStatusCode] ([StatusCode], [StatusName], [isDelete]) VALUES (1, N'Active', 0)
INSERT [dbo].[AccountStatusCode] ([StatusCode], [StatusName], [isDelete]) VALUES (2, N'Pending', 0)
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (1, N'anhnq@fpt.edu.vn', N'quynhanh', 0, 0, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (2, N'loandphe150131@fpt.edu.vn', N'loandphe150131', 1, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (3, N'quynhmai@gmail.com', N'quynhmai', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (4, N'quynhdo@gmail.vn', N'quynhdo123', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (5, N'dotung@mail.com', N'dotung123', 0, 2, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (6, N'camtu@fpt.edu', N'camtumarketing', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (7, N'truongtrang@gg.com', N'ttttCVA', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (8, N'thuuyen@fpt.edu', N'thuuyenftc', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (9, N'haphuong@ftu.edu', N'phuongin123', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (10, N'vietphan@fpt.edu', N'vietfusw123', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (11, N'ngoclinh@cva.edu', N'france2019', 0, 2, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (12, N'huynkhe153585@fpt.edu.vn', N'huynkhe153585', 1, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (13, N'minhnguyet@neu.edu', N'minhnguyet294', 1, 0, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (14, N'phamhang@fpt.ed', N'phamhangfcc', 1, 0, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (15, N'ngocanh@hn.vn', N'ngocanh264', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (16, N'phuongthao@cva.edu', N'phuongthaoCVA', 0, 2, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (17, N'hatrang@cva.edu', N'hatrangCVA', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (18, N'quynmhe153283@fpt.edu.vn', N'quynmhe153283', 1, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (19, N'phuongnga@sp.edu', N'quynhngaSP', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (20, N'khanhthanh@nn.edu', N'khanhthanh1712', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (21, N'hoangtoan@fpt.edu', N'hoangtoan123', 0, 0, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (22, N'vietlinh@fpt.edu', N'vietlinhfcc', 0, 2, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (23, N'trunghieu@cva2.com', N'trunghieu', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (24, N'tuanminh@ccva.edu', N'tuanminhCVA', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (25, N'tiennqhe153125@fpt.edu.vn', N'tiennqhe153125', 1, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (26, N'kimngan@cva.edu', N'kimnganD2', 0, 2, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (27, N'boilinh@cva.edu', N'boilinhD2', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (28, N'thanhvan@cva.edu', N'thanhvanD2', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (29, N'minhchau@neu.edu', N'minhchauD2', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (30, N'tuyetntahe153175@fpt.edu.vn', N'tuyetntahe153175', 1, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (31, N'maiphuong@fpt.eu', N'maiphuongftv', 0, 0, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (32, N'bacngo@fpt.edu', N'bacngoftc', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (33, N'thanhson@gmail.com', N'thanhson26', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (34, N'phuonglinh@bn.vn', N'phuonglinh22', 0, 2, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (35, N'minhduy@fpt.edu', N'minhduyai', 0, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (36, N'ttmy@thuyloi.edu', N'ttmy2006', 1, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (37, N'phuonganh@neu.edu', N'phuonganhh', 1, 1, 0, NULL)
INSERT [dbo].[Account] ([ID], [Email], [Password], [Role], [Status], [isDelete], [GoogleID]) VALUES (38, N'haanh@neu.edu', N'haanh2501', 1, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (1, N'Nguyễn Quỳnh', N'Anh', N'11 Thụy Khuê', CAST(N'1995-05-16' AS Date), CAST(N'2019-05-14T00:00:00.000' AS DateTime), N'0111111111', N'101111111111', N'Hà Nội', N'Quận Tây Hồ', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (3, N'Trần Lê', N'Quỳnh Mai', N'243 Âu Cơ', CAST(N'2001-03-28' AS Date), CAST(N'2020-01-06T00:00:00.000' AS DateTime), N'0222222222', N'202222222222', N'Hà Nội', N'Quận Tây Hồ', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (4, N'Đỗ Như', N'Quỳnh', N'Lạng Khê', CAST(N'2000-09-14' AS Date), CAST(N'2018-10-18T00:00:00.000' AS DateTime), N'0333333333', N'303333333333', N'Bắc Ninh', N'Huyện Lương Tài', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (5, N'Đỗ Thế', N'Tùng', N'19 Lạc Long Quân', CAST(N'2001-10-20' AS Date), CAST(N'2020-01-04T00:00:00.000' AS DateTime), N'0444444444', N'404444444444', N'Hà Nội', N'Quận Tây Hồ', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (6, N'Nguyễn Cẩm', N'Tú', N'Sóc Sơn', CAST(N'1998-06-14' AS Date), CAST(N'2018-04-12T00:00:00.000' AS DateTime), N'0555555555', N'505555555555', N'Hà Nội', N'Huyện Thạch Thất', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (7, N'Trương Thu', N'Trang', N'176 Hoàng Hoa Thám', CAST(N'1990-03-29' AS Date), CAST(N'2018-03-18T00:00:00.000' AS DateTime), N'0666666666', N'606666666666', N'Hà Nội', N'Quận Ba Đình', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (8, N'Nguyễn Thu', N'Uyên', N'89 Định Công', CAST(N'2000-05-24' AS Date), CAST(N'2019-05-05T00:00:00.000' AS DateTime), N'0777777777', N'707777777777', N'Hà Nội', N'Quận Hoàng Mai', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (9, N'Nguyễn Hà ', N'Phương', N'77 Hàng Bông', CAST(N'2001-12-13' AS Date), CAST(N'2020-04-25T00:00:00.000' AS DateTime), N'0888888888', N'808888888888', N'Hà Nội', N'Hoàn Kiếm', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (10, N'Phan Tuấn', N'Việt', N'354 Khương Trung', CAST(N'2001-07-11' AS Date), CAST(N'2019-12-12T00:00:00.000' AS DateTime), N'0999999999', N'909999999999', N'Hà Nội', N'Quận Thanh Xuân', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (11, N'Nguyễn Ngọc', N'Linh', N'156 Nguyễn Khoái', CAST(N'1996-04-20' AS Date), CAST(N'2019-08-15T00:00:00.000' AS DateTime), N'0122222222', N'102222222222', N'Bắc Giang', N'Huyện Lục Nam', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (15, N'Nguyễn Ngọc', N'Anh', N'23 Hai Bà Trưng', CAST(N'1994-09-13' AS Date), CAST(N'2016-04-22T00:00:00.000' AS DateTime), N'0133333333', N'103333333333', N'Tuyên Quang', N'Huyện Hàm Yên', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (16, N'Lưu Phương', N'Thảo', N'455 Bà Triệu', CAST(N'1992-11-25' AS Date), CAST(N'2015-07-24T00:00:00.000' AS DateTime), N'0144444444', N'104444444444', N'An Giang', N'Huyện Châu Thành', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (17, N'Nguyễn Hà', N'Trang', N'34 Nguyễn Thái Học', CAST(N'1995-01-14' AS Date), CAST(N'2017-09-09T00:00:00.000' AS DateTime), N'0155555555', N'105555555555', N'Lào Cai', N'Huyện Bảo Yên', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (19, N'Nguyễn Phương', N'Nga', N'205 Mai Hắc Đế', CAST(N'1997-11-20' AS Date), CAST(N'2019-06-06T00:00:00.000' AS DateTime), N'0166666666', N'106666666666', N'Hưng Yên', N'Huyện Khoái Châu', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (20, N'Nguyễn Công', N'Khánh Thành', N'Thị trấn Thứa', CAST(N'1999-12-17' AS Date), CAST(N'2020-03-25T00:00:00.000' AS DateTime), N'0177777777', N'107777777777', N'Bắc Ninh', N'Huyện Lương Tài', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (21, N'Hoàng Văn', N'Toản', N'555 Hoàng Quốc Việt', CAST(N'1993-05-06' AS Date), CAST(N'2018-05-16T00:00:00.000' AS DateTime), N'0188888888', N'108888888888', N'Thái Nguyên', N'Huyện Phú Lương', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (22, N'Nguyễn Việt', N'Linh', N'58 Tràng Thi', CAST(N'1994-02-22' AS Date), CAST(N'2019-04-21T00:00:00.000' AS DateTime), N'0199999999', N'109999999999', N'Hòa Bình', N'Huyện Mai Châu', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (23, N'Nguyễn Trung', N'Hiếu', N'96 Nguyễn Xiển', CAST(N'2000-10-15' AS Date), CAST(N'2020-11-16T00:00:00.000' AS DateTime), N'0211111111', N'201111111111', N'Hà Nội', N'Quận Đống Đa', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (24, N'Trương Tuấn', N'Minh', N'201 Trúc Bạch', CAST(N'1997-05-30' AS Date), CAST(N'2018-09-24T00:00:00.000' AS DateTime), N'0222222222', N'202222222222', N'Hải Phòng', N'Quận Đồ Sơn', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (26, N'Lê Kim', N'Ngân', N'75 Thái Hà', CAST(N'1998-07-30' AS Date), CAST(N'2019-01-02T00:00:00.000' AS DateTime), N'0233333333', N'203333333333', N'Hà Nội', N'Quận Đống Đa', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (27, N'Vũ Nguyễn', N'Bội Linh', N'83 Hồ Tùng Mậu', CAST(N'2001-03-17' AS Date), CAST(N'2020-05-12T00:00:00.000' AS DateTime), N'0244444444', N'204444444444', N'Hà Nội', N'Quận Cầu Giấy', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (28, N'Lê Thanh', N'Vân', N'30 Quán Thánh', CAST(N'2001-10-05' AS Date), CAST(N'2019-11-11T00:00:00.000' AS DateTime), N'0255555555', N'205555555555', N'Hà Nội', N'Quận Ba Đình', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (29, N'Nguyễn Minh', N'Châu', N'198 Âu Cơ', CAST(N'2001-04-04' AS Date), CAST(N'2019-10-24T00:00:00.000' AS DateTime), N'0266666666', N'206666666666', N'Hà Nội', N'Quận Tây Hồ', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (31, N'Hà Mai', N'Phương', N'104 Chương Dương', CAST(N'1986-02-15' AS Date), CAST(N'2013-08-19T00:00:00.000' AS DateTime), N'0277777777', N'207777777777', N'Thanh Hóa', N'Thị xã Sầm Sơn', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (32, N'Ngô Việt', N'Bắc', N'388 Nguyễn Văn Cừ', CAST(N'1982-06-25' AS Date), CAST(N'2015-07-30T00:00:00.000' AS DateTime), N'0288888888', N'208888888888', N'Thái Bình', N'Huyện Kiến Xương', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (33, N'Nguyễn Thanh', N'Sơn', N'294 Ngô Gia Tự', CAST(N'1972-05-15' AS Date), CAST(N'2012-08-26T00:00:00.000' AS DateTime), N'0299999999', N'209999999999', N'Quảng Ninh', N'Huyện Cô Tô', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (34, N'Đặng Phương', N'Linh', N'587 Bồ Đề', CAST(N'1977-11-12' AS Date), CAST(N'2012-06-30T00:00:00.000' AS DateTime), N'0311111111', N'301111111111', N'Hà Nội', N'Quận Long Biên', 0)
INSERT [dbo].[Customer] ([AccountID], [FirstName], [LastName], [Address], [Dob], [JoinDate], [Phone], [PersonalID], [Province], [District], [isDelete]) VALUES (35, N'Trần Minh', N'Duy', N'37 Nguyễn Chí Thanh', CAST(N'1989-08-05' AS Date), CAST(N'2014-04-03T00:00:00.000' AS DateTime), N'0322222222', N'302222222222', N'Phú Thọ', N'Huyện Cẩm Khê', 0)
GO
INSERT [dbo].[ProductStatusCode] ([StatusCode], [StatusName], [isDelete]) VALUES (0, N'Inactive', 0)
INSERT [dbo].[ProductStatusCode] ([StatusCode], [StatusName], [isDelete]) VALUES (1, N'Active', 0)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (1, N'Bảo hiểm Bảo Việt cho xe 50cc trở xuống', N'Bảo hiểm xe máy tự nguyện', 300000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2010-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (2, N'Bảo hiểm bắt buộc cho xe 50cc trở xuống', N'Bảo hiểm bắt buộc', 55000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2009-12-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (3, N'Bảo hiểm Bảo Việt cho xe trên 50cc', N'Bảo hiểm xe máy tự nguyện', 350000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2010-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (4, N'Bảo hiểm Bảo Việt cho xe trên 175cc', N'Bảo hiểm xe máy tự nguyện', 500000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2010-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (5, N'Bảo hiểm bắt buộc cho xe trên 50cc', N'Bảo hiểm bắt buộc', 65000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2009-12-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (6, N'Bảo hiểm bắt buộc cho xe trên 175cc', N'Bảo hiểm bắt buộc', 290000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2009-12-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (7, N'Bảo hiểm PVI cho xe 50cc trở xuống', N'Bảo hiểm xe máy tự nguyện', 250000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2010-07-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (8, N'Bảo hiểm PVI cho xe trên 50cc', N'Bảo hiểm xe máy tự nguyện', 300000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2010-07-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (9, N'Bảo hiểm PVI cho xe trên 175cc', N'Bảo hiểm xe máy tự nguyện', 450000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2010-07-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (10, N'Bảo hiểm XiNhan cho xe 50cc trở xuống', N'Bảo hiểm xe máy tự nguyện', 260000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2011-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (11, N'Bảo hiểm XiNhan cho xe trên 50cc', N'Bảo hiểm xe máy tự nguyện', 310000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2011-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (12, N'Bảo hiểm XiNhan cho xe trên 175cc', N'Bảo hiểm xe máy tự nguyện', 435000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2011-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (13, N'Bảo hiểm Bảo Minh cho xe 50cc trở xuống', N'Bảo hiểm xe máy tự nguyện', 320000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2011-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (14, N'Bảo hiểm Bảo Minh cho xe trên 50cc', N'Bảo hiểm xe máy tự nguyện', 370000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2011-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (15, N'Bảo hiểm Bảo Minh cho xe trên 175cc', N'Bảo hiểm xe máy tự nguyện', 520000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2011-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (16, N'Bảo hiểm Liberty cho xe 50cc trở xuống', N'Bảo hiểm xe máy tự nguyện', 340000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2011-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (17, N'Bảo hiểm Liberty cho xe trên 50cc', N'Bảo hiểm xe máy tự nguyện', 390000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2011-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ID], [Title], [Description], [Price], [ImageURL], [Status], [isDelete], [ContentDetail], [StartDate]) VALUES (18, N'Bảo hiểm Liberty cho xe trên 175cc', N'Bảo hiểm xe máy tự nguyện', 530000.0000, N'asset/image/example_productImage.png', 1, 0, N'Khi lưu thông trên đường không may gặp sự cố gây tổn thất cho bên thứ ba, bạn cần chuẩn bị hồ sơ bao gồm các tài liệu như sau:

1 Tài liệu liên quan đến xe, lái xe 
 Giấy đăng ký xe; Giấy phép lái xe; Giấy cmt; Giấy chứng nhận bảo hiểm.

2. Tài liệu chứng minh thiệt hại về người
Giấy chứng thương;Giấy ra viện; Giấy chứng nhận phẫu thuật; Hồ sơ bệnh án.; Giấy chứng tử (trong trường hợp nạn nhân tử vong).

3. Tài liệu chứng minh thiệt hại về tài sản:
Hóa đơn, chứng từ hợp lệ về việc sửa chữa, thay mới tài sản bị thiệt hại do tai nạn. Các giấy tờ chứng minh chi phí cần thiết và hợp lý mà chủ xe đã chi ra để giảm thiểu tổn thất hay để thực hiện theo chỉ dẫn của doanh nghiệp bảo hiểm.

4. Bản sao các tài liệu liên quan của cơ quan có thẩm quyền về vụ tai nạn
Biên bản khám nghiệm hiện trường vụ tai nạn; Sơ đồ hiện trường, bản ảnh; Biên bản khám nghiệm phương tiện liên quan đến tai nạn...', CAST(N'2011-03-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Staff] ([AccountID], [FirstName], [LastName], [Phone], [isDelete]) VALUES (2, N'Đỗ Phương', N'Loan', N'0172172172', 0)
INSERT [dbo].[Staff] ([AccountID], [FirstName], [LastName], [Phone], [isDelete]) VALUES (12, N'Nguyễn Khánh', N'Huy', N'0911101110', 0)
INSERT [dbo].[Staff] ([AccountID], [FirstName], [LastName], [Phone], [isDelete]) VALUES (13, N'Nguyễn Minh', N'Nguyệt', N'0123456789', 0)
INSERT [dbo].[Staff] ([AccountID], [FirstName], [LastName], [Phone], [isDelete]) VALUES (14, N'Phạm Minh', N'Hằng', N'0987654321', 0)
INSERT [dbo].[Staff] ([AccountID], [FirstName], [LastName], [Phone], [isDelete]) VALUES (18, N'Nguyễn Mạnh', N'Quý', N'0406406406', 0)
INSERT [dbo].[Staff] ([AccountID], [FirstName], [LastName], [Phone], [isDelete]) VALUES (25, N'Nguyễn Quế', N'Tiến', N'0305305305', 0)
INSERT [dbo].[Staff] ([AccountID], [FirstName], [LastName], [Phone], [isDelete]) VALUES (30, N'Nguyễn Thị', N'Ánh Tuyết', N'0199199199', 0)
INSERT [dbo].[Staff] ([AccountID], [FirstName], [LastName], [Phone], [isDelete]) VALUES (36, N'Thái Trà', N'My', N'0123123123', 0)
INSERT [dbo].[Staff] ([AccountID], [FirstName], [LastName], [Phone], [isDelete]) VALUES (37, N'Trần Phương', N'Anh', N'0234234234', 0)
INSERT [dbo].[Staff] ([AccountID], [FirstName], [LastName], [Phone], [isDelete]) VALUES (38, N'Lê Hà', N'Anh', N'0345345345', 0)
GO
SET IDENTITY_INSERT [dbo].[VehicleType] ON 

INSERT [dbo].[VehicleType] ([ID], [VehicleType], [isDelete]) VALUES (1, N'50cc trở xuống', 0)
INSERT [dbo].[VehicleType] ([ID], [VehicleType], [isDelete]) VALUES (2, N'Trên 50cc', 0)
INSERT [dbo].[VehicleType] ([ID], [VehicleType], [isDelete]) VALUES (3, N'Trên 175cc', 0)
SET IDENTITY_INSERT [dbo].[VehicleType] OFF
GO
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([ID], [ProductID], [CustomerID], [StartDate], [EndDate], [Status], [isDelete], [ContractFee], [CancelComment], [CancelReason], [CancelDate], [CancelRequestDate], [VehicleTypeID], [Engine], [LicensePlate], [Color], [CertImage], [BrandID], [Owner], [Chassis], [RequestDate], [ResolveDate], [StartStaff], [CancelStaff]) VALUES (1, 1, 1, CAST(N'2019-05-16T00:00:00.000' AS DateTime), CAST(N'2020-05-16T00:00:00.000' AS DateTime), 0, 0, 300000.0000, NULL, NULL, NULL, NULL, 1, N'1AA1-111111', N'11A-111.11', N'Black', N'asset/image/example_certImage.png', 4, N'Nguyễn Văn A', N'A11AA-111111', CAST(N'2019-05-15T08:10:14.000' AS DateTime), CAST(N'2019-05-15T09:00:14.000' AS DateTime), 2, NULL)
INSERT [dbo].[Contract] ([ID], [ProductID], [CustomerID], [StartDate], [EndDate], [Status], [isDelete], [ContractFee], [CancelComment], [CancelReason], [CancelDate], [CancelRequestDate], [VehicleTypeID], [Engine], [LicensePlate], [Color], [CertImage], [BrandID], [Owner], [Chassis], [RequestDate], [ResolveDate], [StartStaff], [CancelStaff]) VALUES (2, 17, 4, CAST(N'2020-10-21T00:00:00.000' AS DateTime), CAST(N'2022-10-21T00:00:00.000' AS DateTime), 1, 0, 780000.0000, NULL, NULL, NULL, NULL, 2, N'2BB2-222222', N'22B-222.22', N'Blue', N'asset/image/example_certImage.png', 1, N'Nguyễn Văn B', N'B22BB-222222', CAST(N'2020-10-20T11:37:00.000' AS DateTime), CAST(N'2020-10-20T13:42:00.000' AS DateTime), 18, NULL)
INSERT [dbo].[Contract] ([ID], [ProductID], [CustomerID], [StartDate], [EndDate], [Status], [isDelete], [ContractFee], [CancelComment], [CancelReason], [CancelDate], [CancelRequestDate], [VehicleTypeID], [Engine], [LicensePlate], [Color], [CertImage], [BrandID], [Owner], [Chassis], [RequestDate], [ResolveDate], [StartStaff], [CancelStaff]) VALUES (3, 6, 9, CAST(N'2022-02-18T00:00:00.000' AS DateTime), CAST(N'2025-02-18T00:00:00.000' AS DateTime), 2, 0, 870000.0000, NULL, NULL, NULL, NULL, 3, N'3CC3-333333', N'33C-333.33', N'Red', N'asset/image/example_certImage.png', 2, N'Nguyễn Văn C', N'C33CC-333333', CAST(N'2022-02-15T15:14:00.000' AS DateTime), NULL, 38, NULL)
INSERT [dbo].[Contract] ([ID], [ProductID], [CustomerID], [StartDate], [EndDate], [Status], [isDelete], [ContractFee], [CancelComment], [CancelReason], [CancelDate], [CancelRequestDate], [VehicleTypeID], [Engine], [LicensePlate], [Color], [CertImage], [BrandID], [Owner], [Chassis], [RequestDate], [ResolveDate], [StartStaff], [CancelStaff]) VALUES (4, 18, 19, CAST(N'2019-06-09T00:00:00.000' AS DateTime), CAST(N'2020-06-09T00:00:00.000' AS DateTime), 4, 0, 530000.0000, N'Gói đắt', N'Đổi gói BH khác', CAST(N'2020-06-02T10:16:22.000' AS DateTime), CAST(N'2020-06-01T13:21:05.000' AS DateTime), 3, N'4DD4-444444', N'44D-444.44', N'White', N'asset/image/example_certImage', 3, N'Nguyễn Thị D', N'D44DD-444444', CAST(N'2019-06-08T09:06:25.000' AS DateTime), CAST(N'2019-06-08T16:02:54.000' AS DateTime), 12, 38)
INSERT [dbo].[Contract] ([ID], [ProductID], [CustomerID], [StartDate], [EndDate], [Status], [isDelete], [ContractFee], [CancelComment], [CancelReason], [CancelDate], [CancelRequestDate], [VehicleTypeID], [Engine], [LicensePlate], [Color], [CertImage], [BrandID], [Owner], [Chassis], [RequestDate], [ResolveDate], [StartStaff], [CancelStaff]) VALUES (5, 10, 32, CAST(N'2021-07-21T00:00:00.000' AS DateTime), CAST(N'2022-07-21T00:00:00.000' AS DateTime), 3, 0, 260000.0000, N'Không hài lòng cơ chế BH', N'Không muốn sử dụng nữa', NULL, CAST(N'2022-02-15T21:17:32.000' AS DateTime), 1, N'5EE5-555555', N'55E-555.55', N'Brown', N'asset/image/example_certImage.png', 5, N'Nguyễn Văn E', N'E55EE-555555', CAST(N'2021-07-15T18:30:25.000' AS DateTime), CAST(N'2021-07-16T13:21:11.000' AS DateTime), 30, 30)
INSERT [dbo].[Contract] ([ID], [ProductID], [CustomerID], [StartDate], [EndDate], [Status], [isDelete], [ContractFee], [CancelComment], [CancelReason], [CancelDate], [CancelRequestDate], [VehicleTypeID], [Engine], [LicensePlate], [Color], [CertImage], [BrandID], [Owner], [Chassis], [RequestDate], [ResolveDate], [StartStaff], [CancelStaff]) VALUES (6, 9, 29, CAST(N'2019-10-26T00:00:00.000' AS DateTime), CAST(N'2020-10-26T00:00:00.000' AS DateTime), 5, 0, 450000.0000, NULL, NULL, NULL, NULL, 3, N'6FF6-555555', N'66F-666.66', N'Green', N'asset/image/example_certImage.png', 6, N'Nguyễn Văn F', N'F66FF-666666', CAST(N'2019-10-25T19:27:33.000' AS DateTime), CAST(N'2019-10-26T08:45:21.000' AS DateTime), 25, NULL)
INSERT [dbo].[Contract] ([ID], [ProductID], [CustomerID], [StartDate], [EndDate], [Status], [isDelete], [ContractFee], [CancelComment], [CancelReason], [CancelDate], [CancelRequestDate], [VehicleTypeID], [Engine], [LicensePlate], [Color], [CertImage], [BrandID], [Owner], [Chassis], [RequestDate], [ResolveDate], [StartStaff], [CancelStaff]) VALUES (7, 5, 23, CAST(N'2021-11-15T00:00:00.000' AS DateTime), CAST(N'2022-11-15T00:00:00.000' AS DateTime), 5, 0, 65000.0000, NULL, NULL, NULL, NULL, 2, N'7GG7-777777', N'77G-777.77', N'Pink', N'asset/image/example_certImage.png', 8, N'Nguyễn Văn G', N'G77GG-777777', CAST(N'2021-11-14T11:22:55.000' AS DateTime), CAST(N'2021-11-14T14:33:03.000' AS DateTime), 36, 36)
SET IDENTITY_INSERT [dbo].[Contract] OFF
GO
SET IDENTITY_INSERT [dbo].[Accident] ON 

INSERT [dbo].[Accident] ([ID], [AccidentDate], [Title], [CreatedDate], [Attachment], [HumanDamage], [VehicleDamage], [ContractID], [isDelete]) VALUES (1, CAST(N'2020-02-10T15:39:44.000' AS DateTime), N'Tai nạn xe', CAST(N'2020-02-13T13:04:35.000' AS DateTime), NULL, N'Xước nhẹ', N'Hỏng 20%', 1, 0)
INSERT [dbo].[Accident] ([ID], [AccidentDate], [Title], [CreatedDate], [Attachment], [HumanDamage], [VehicleDamage], [ContractID], [isDelete]) VALUES (2, CAST(N'2021-12-14T18:01:33.000' AS DateTime), N'Mất xe', CAST(N'2021-12-15T21:35:41.000' AS DateTime), NULL, N'Không', N'Bị trộm xe', 5, 0)
INSERT [dbo].[Accident] ([ID], [AccidentDate], [Title], [CreatedDate], [Attachment], [HumanDamage], [VehicleDamage], [ContractID], [isDelete]) VALUES (3, CAST(N'2022-02-19T21:33:11.000' AS DateTime), N'Tai nạn xe', CAST(N'2022-02-19T22:17:16.160' AS DateTime), NULL, N'Gãy tay', N'Hỏng 50%', 2, 0)
SET IDENTITY_INSERT [dbo].[Accident] OFF
GO
INSERT [dbo].[CompensationStatusCode] ([StatusCode], [StatusName], [isDelete]) VALUES (0, N'deny', 0)
INSERT [dbo].[CompensationStatusCode] ([StatusCode], [StatusName], [isDelete]) VALUES (1, N'accept', 0)
INSERT [dbo].[CompensationStatusCode] ([StatusCode], [StatusName], [isDelete]) VALUES (2, N'pending', 0)
GO
SET IDENTITY_INSERT [dbo].[Compensation] ON 

INSERT [dbo].[Compensation] ([ID], [DriverName], [CreatedDate], [ResolveDate], [ResolveNote], [Status], [Description], [Attachment], [isDelete], [AccidentID]) VALUES (1, N'Nguyễn Quỳnh Anh', CAST(N'2020-02-13T13:04:35.000' AS DateTime), CAST(N'2020-02-14T09:55:10.000' AS DateTime), NULL, 1, N'Đền bù tổn thất sau tai nạn xe, xe bị hư hỏng 20%', NULL, 0, 1)
INSERT [dbo].[Compensation] ([ID], [DriverName], [CreatedDate], [ResolveDate], [ResolveNote], [Status], [Description], [Attachment], [isDelete], [AccidentID]) VALUES (2, N'Nguyễn Văn E', CAST(N'2021-12-15T21:35:41.000' AS DateTime), CAST(N'2021-12-16T14:50:44.000' AS DateTime), N'Chưa đủ điều kiện được đền bù', 0, NULL, NULL, 0, 2)
INSERT [dbo].[Compensation] ([ID], [DriverName], [CreatedDate], [ResolveDate], [ResolveNote], [Status], [Description], [Attachment], [isDelete], [AccidentID]) VALUES (3, N'Nguyễn Văn B', CAST(N'2022-02-19T22:17:16.160' AS DateTime), NULL, NULL, 2, NULL, NULL, 0, 3)
SET IDENTITY_INSERT [dbo].[Compensation] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([ID], [FullName], [Phone], [Email], [Address], [Province], [District], [ContractID]) VALUES (1, N'Nguyễn Văn A', N'0123456789', N'ane@gmail.com.vn', N'doan xem', N'Hà Nội', N'Quận Hoàn Kiếm', 1)
INSERT [dbo].[Delivery] ([ID], [FullName], [Phone], [Email], [Address], [Province], [District], [ContractID]) VALUES (2, N'Nguyễn Văn B', N'0354465654', N'bne@gmail.com.vn', N'289 Hồ Tùng Mậu', N'Hà Nội', N'Quận Bắc Từ Liêm', 2)
INSERT [dbo].[Delivery] ([ID], [FullName], [Phone], [Email], [Address], [Province], [District], [ContractID]) VALUES (3, N'Nguyễn Văn C', N'0945145435', N'cne@gmail.com.vn', N'lalalal', N'Bắc Ninh', N'Thành phố Bắc Ninh', 3)
INSERT [dbo].[Delivery] ([ID], [FullName], [Phone], [Email], [Address], [Province], [District], [ContractID]) VALUES (4, N'Nguyễn Văn D', N'0732154145', N'dne@gmail.com.vn', N'ai biet', N'Thành phố Hồ Chí Minh', N'Quận Tân Bình', 4)
INSERT [dbo].[Delivery] ([ID], [FullName], [Phone], [Email], [Address], [Province], [District], [ContractID]) VALUES (5, N'Nguyễn Văn E', N'0354854651', N'ene@gmail.com.vn', N'kho nghi qua', N'Hải Dương', N'Thị xã Chí Linh', 5)
INSERT [dbo].[Delivery] ([ID], [FullName], [Phone], [Email], [Address], [Province], [District], [ContractID]) VALUES (6, N'Nguyễn Văn F', N'0545132125', N'fne@gmail.com.vn', N'aaaaabb', N'Bình Dương', N'Huyện Dĩ An', 6)
INSERT [dbo].[Delivery] ([ID], [FullName], [Phone], [Email], [Address], [Province], [District], [ContractID]) VALUES (7, N'Nguyễn Văn G', N'0376356548', N'gne@gmail.com.vn', N'ulatr', N'Khánh Hòa', N'Thành phố Nha Trang', 7)
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentMethod] ON 

INSERT [dbo].[PaymentMethod] ([ID], [PaymentMethod], [isDelete]) VALUES (1, N'Tiền mặt', 0)
INSERT [dbo].[PaymentMethod] ([ID], [PaymentMethod], [isDelete]) VALUES (2, N'Paypal', 0)
SET IDENTITY_INSERT [dbo].[PaymentMethod] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([ID], [PaidDate], [PaymentMethodID], [Note], [Amount], [StartDate], [ContractID], [isDelete]) VALUES (1, CAST(N'2019-05-15T10:20:14.000' AS DateTime), 1, NULL, 300000.0000, CAST(N'2019-05-15T08:10:14.000' AS DateTime), 1, 0)
INSERT [dbo].[Payment] ([ID], [PaidDate], [PaymentMethodID], [Note], [Amount], [StartDate], [ContractID], [isDelete]) VALUES (2, CAST(N'2020-10-20T11:42:55.000' AS DateTime), 2, NULL, 780000.0000, CAST(N'2020-10-20T11:37:00.000' AS DateTime), 2, 0)
INSERT [dbo].[Payment] ([ID], [PaidDate], [PaymentMethodID], [Note], [Amount], [StartDate], [ContractID], [isDelete]) VALUES (3, NULL, NULL, N'processing', 870000.0000, CAST(N'2022-02-15T15:14:00.000' AS DateTime), 3, 0)
INSERT [dbo].[Payment] ([ID], [PaidDate], [PaymentMethodID], [Note], [Amount], [StartDate], [ContractID], [isDelete]) VALUES (4, CAST(N'2019-06-08T09:15:33.000' AS DateTime), 2, NULL, 530000.0000, CAST(N'2019-06-08T09:06:25.000' AS DateTime), 4, 0)
INSERT [dbo].[Payment] ([ID], [PaidDate], [PaymentMethodID], [Note], [Amount], [StartDate], [ContractID], [isDelete]) VALUES (5, CAST(N'2021-07-18T09:23:25.000' AS DateTime), 1, NULL, 260000.0000, CAST(N'2021-07-15T18:30:25.000' AS DateTime), 5, 0)
INSERT [dbo].[Payment] ([ID], [PaidDate], [PaymentMethodID], [Note], [Amount], [StartDate], [ContractID], [isDelete]) VALUES (6, NULL, NULL, N'rejected', 450000.0000, CAST(N'2019-10-25T19:27:33.000' AS DateTime), 6, 0)
INSERT [dbo].[Payment] ([ID], [PaidDate], [PaymentMethodID], [Note], [Amount], [StartDate], [ContractID], [isDelete]) VALUES (7, NULL, NULL, N'rejected', 650000.0000, CAST(N'2021-11-14T11:22:55.000' AS DateTime), 7, 0)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (1, 2, CAST(N'2019-05-14T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (3, 12, CAST(N'2020-01-06T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (4, 18, CAST(N'2018-10-18T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (5, 25, CAST(N'2020-01-04T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (6, 30, CAST(N'2018-04-12T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (7, 36, CAST(N'2018-03-18T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (8, 37, CAST(N'2019-05-05T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (9, 38, CAST(N'2020-04-25T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (10, 2, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (11, 2, CAST(N'2019-08-15T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (15, 12, CAST(N'2016-04-22T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (16, 12, CAST(N'2015-07-24T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (17, 12, CAST(N'2017-09-09T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (19, 12, CAST(N'2019-06-06T00:00:00.000' AS DateTime), CAST(N'2019-06-10T10:29:23.000' AS DateTime), 0, 38)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (19, 38, CAST(N'2019-06-10T10:30:23.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (20, 12, CAST(N'2020-03-25T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (21, 12, CAST(N'2018-05-16T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (22, 12, CAST(N'2019-04-21T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (23, 18, CAST(N'2020-11-16T00:00:00.000' AS DateTime), CAST(N'2020-11-20T15:25:00.000' AS DateTime), 0, 36)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (23, 36, CAST(N'2020-11-20T15:26:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (24, 18, CAST(N'2018-09-24T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (26, 18, CAST(N'2019-01-02T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (27, 18, CAST(N'2020-05-12T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (28, 25, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (29, 25, CAST(N'2019-10-24T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (31, 30, CAST(N'2013-08-19T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (32, 30, CAST(N'2015-07-30T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (33, 36, CAST(N'2012-08-26T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (34, 37, CAST(N'2012-06-30T00:00:00.000' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Customer_Staff] ([CustomerID], [StaffID], [StartDate], [EndDate], [isDelete], [NextStaff]) VALUES (35, 37, CAST(N'2014-04-03T00:00:00.000' AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[ProductUpdateTime] ([ProductID], [UpdateTime], [isDelete]) VALUES (2, CAST(N'2011-05-16T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ProductUpdateTime] ([ProductID], [UpdateTime], [isDelete]) VALUES (5, CAST(N'2011-06-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ProductUpdateTime] ([ProductID], [UpdateTime], [isDelete]) VALUES (10, CAST(N'2015-03-20T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ProductUpdateTime] ([ProductID], [UpdateTime], [isDelete]) VALUES (17, CAST(N'2014-09-09T00:00:00.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Moderator] ON 

INSERT [dbo].[Moderator] ([ID], [UserName], [Password], [isDelete]) VALUES (1, N'team1SE1517', N'insurancecard', 0)
SET IDENTITY_INSERT [dbo].[Moderator] OFF
GO
