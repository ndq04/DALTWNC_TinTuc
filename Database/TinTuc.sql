CREATE DATABASE TinTuc
GO

USE TinTuc
GO

CREATE TABLE Users
(
	Username NVARCHAR (100) PRIMARY KEY ,
	Password NVARCHAR (100),
) 
GO

CREATE TABLE Categories
(
	Id INT IDENTITY PRIMARY KEY,
	Ten NVARCHAR (100),
)
GO 


CREATE TABLE Post
(
	Id INT IDENTITY PRIMARY KEY,
	TenBV NTEXT,
	MoTa NTEXT,
	NoiDung NTEXT,
	TacGia NTEXT,
	NgayDang DATETIME,
	Id_Categories INT
)
GO

CREATE TABLE Media
(
	Id INT IDENTITY PRIMARY KEY,
	Url NVARCHAR (100) ,
	Main BIT ,
	Id_Post INT
)
GO

CREATE TABLE Comment
(
	Id INT IDENTITY PRIMARY KEY,
	Id_Post INT,
	NoiDung NVARCHAR (100),
	NgayViet DATETIME,
	ButDanh NVARCHAR (100)
) 
GO

CREATE PROC DanhMuc_SelectAll
AS
BEGIN
	SELECT * FROM Categories
END
GO


CREATE PROC DanhMuc_SelectID(
	@Id INT
)
AS
BEGIN
	SELECT * FROM Categories WHERE Id = @Id
END
GO


CREATE PROC ChiTiet_SelectAll
AS
BEGIN
	SELECT * FROM Post
END
GO

CREATE PROC ChiTiet_SelectID
(
	@ID_DM INT
)
AS
BEGIN
	SELECT * FROM Post WHERE Id_Categories = @ID_DM
END
GO

CREATE PROC ChiTiet_SELECT
(
	@ID_BV INT
)
AS
BEGIN
	SELECT * FROM Post WHERE Id = @ID_BV
END
GO

CREATE PROC BinhLuan_SelectByID
(
	@ID_BV INT
)
AS
BEGIN
	SELECT * FROM Comment WHERE Id = @ID_BV
END
GO

CREATE PROC ChiTiet_SelectNew
AS
BEGIN
	SELECT TOP 5 * FROM Post ORDER BY Id DESC
END
GO

insert into dbo.Comment (NoiDung, NgayViet, ButDanh) 
values (N'Nội dung bình luận 1', GETDATE(), N'Vô Danh'),
	   (N'Nội dung bình luận 2', GETDATE(), N'Vô Danh'),
	   (N'Nội dung bình luận 3', GETDATE(), N'Vô Danh'),
	   (N'Nội dung bình luận 1', GETDATE(), N'Vô Danh'),
	   (N'Nội dung bình luận 2', GETDATE(), N'Vô Danh'),
	   (N'Nội dung bình luận 3', GETDATE(), N'Vô Danh')