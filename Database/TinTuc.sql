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

/*Lấy ra tất cả danh mục */
CREATE PROC DanhMuc_SelectAll
AS
BEGIN
	SELECT * FROM Categories
END
GO

EXEC DanhMuc_SelectAll
GO

/*Lấy ra 1 danh mục theo Id danh mục*/
CREATE PROC DanhMuc_ByIdCategories
(
	@ID INT
)
AS
BEGIN
	SELECT * FROM Categories WHERE Id = @ID
END
GO

EXEC DanhMuc_ByIdCategories 5
GO

/*Lấy ra tất cả bài viết*/
CREATE PROC BaiViet_SelectAll
AS
BEGIN
	SELECT * FROM Post
END
GO

EXEC BaiViet_SelectAll
GO

/*Lấy ra tất cả bài viết theo Id danh mục*/
CREATE PROC BaiViet_ByIdCategories
(
	@ID_DM INT
)
AS
BEGIN
	SELECT * FROM Post WHERE Id_Categories = @ID_DM
END
GO

EXEC BaiViet_ByIdCategories 6
GO

/*Lấy ra 1 bài viết theo Id bài viết*/
CREATE PROC BaiViet_ByIdPost
(
	@ID_BV INT
)
AS
BEGIN
	SELECT * FROM Post WHERE Id = @ID_BV
END
GO

EXEC BaiViet_ByIdPost 3
GO

/*Lấy ra tất cả bình luận theo Id bài viết*/
CREATE PROC BinhLuan_ByIdPost
(
	@ID_BV INT
)
AS
BEGIN
	SELECT * FROM Comment WHERE Id_Post = @ID_BV
END
GO

EXEC BinhLuan_ByIdPost 3
GO

/*Lấy ra 5 bài viết mới nhất*/
CREATE PROC BaiViet_5New
AS
BEGIN
	SELECT TOP 5 * FROM Post ORDER BY Id DESC
END
GO

EXEC BaiViet_5New
GO