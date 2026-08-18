CREATE DATABASE QuanLySach

USE QuanLySach

CREATE TABLE TacGia ( 
	MaTacGia INT PRIMARY KEY,
	TenTacGia VARCHAR(100) not null,
	QuocTich VARCHAR(50) null
);

CREATE TABLE Sach (
    MaSach INT PRIMARY KEY,
    TieuDe VARCHAR(200) NOT NULL,
    NamXuatBan INT NULL,
    MaTacGia INT,
    FOREIGN KEY (MaTacGia) REFERENCES TacGia(MaTacGia)
);

INSERT INTO TacGia (MaTacGia, TenTacGia, QuocTich)
VALUES
(1, 'Nguyễn Nhật Ánh', 'Việt Nam'),
(2, 'Haruki Murakami', 'Nhật Bản'),
(3, 'J.K. Rowling', 'Anh');

INSERT INTO Sach (MaSach, TieuDe, NamXuatBan, MaTacGia)
VALUES
(1, 'Mắt Biếc', 1990, 1),
(2, 'Tôi thấy hoa vàng trên cỏ xanh', 2005, 1),
(3, 'Rừng Na Uy', 1987, 2),
(4, 'Harry Potter và Hòn đá Phù thủy', 1997, 3);

SELECT * FROM TacGia;

SELECT * FROM Sach;

SELECT * FROM TacGia WHERE QuocTich =  'Việt Nam' ; 

SELECT Sach.TieuDe, TacGia.TenTacGia
FROM Sach
JOIN TacGia
ON Sach.MaTacGia = TacGia.MaTacGia;

SELECT *
FROM Sach
WHERE NamXuatBan > 1990;

SELECT tg.TenTacGia, COUNT(s.MaSach) AS SoLuongSach
FROM TacGia tg
JOIN Sach s
ON tg.MaTacGia = s.MaTacGia
GROUP BY tg.MaTacGia, tg.TenTacGia;

SELECT tg.TenTacGia, COUNT(s.MaSach) AS SoLuongSach
FROM TacGia tg
JOIN Sach s
ON tg.MaTacGia = s.MaTacGia
GROUP BY tg.MaTacGia, tg.TenTacGia
ORDER BY SoLuongSach DESC
LIMIT 1;