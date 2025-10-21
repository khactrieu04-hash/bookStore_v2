-- Flyway V2: Seed dữ liệu mẫu đồng nhất
USE bansach;
SET NAMES utf8mb4;

-- Vai trò
INSERT INTO vai_tro (ngay_cap_nhat, ngay_tao, mavt, ten_vai_tro) VALUES
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','ADMIN','Quản trị'),
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','NV_KHO','Nhân viên kho'),
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','NV_BANHANG','Nhân viên bán hàng'),
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','KHACH_HANG','Khách hàng');

-- Loại khuyến mại
INSERT INTO loai_khuyen_mai (ngay_cap_nhat, ngay_tao, malkm, mo_ta, ten_loaikm) VALUES
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','PERCENT','Giảm theo phần trăm','Giảm theo %'),
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','AMOUNT','Giảm số tiền cố định','Giảm tiền mặt');

-- Khuyến mại
INSERT INTO khuyen_mai (ngay_cap_nhat, ngay_tao, gia_tri, makm, ngay_ket_thuc, tenkm, trang_thai, malkm) VALUES
 ('2025-10-17 10:01:15','2025-10-17 10:01:15',10.00,'KM001','2025-11-16 10:01:15','Giảm 10%',b'1','PERCENT'),
 ('2025-10-17 10:01:15','2025-10-17 10:01:15',20000.00,'KM002','2025-12-16 10:01:15','Giảm 20K',b'1','AMOUNT');

-- Loại khách hàng
INSERT INTO loai_khach_hang (ngay_cap_nhat, ngay_tao, malkh, mo_ta, ten_loaikh, makm) VALUES
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','THANH_VIEN','Khách hàng thành viên','Thành viên',NULL),
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','VIP','Khách hàng VIP','VIP',NULL);

-- Loại sản phẩm
INSERT INTO loai_san_pham (ngay_cap_nhat, ngay_tao, malsp, mo_ta, ten_loai) VALUES
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','SACH','Danh mục sách','Sách'),
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','VPP','Bút, vở, dụng cụ','Văn phòng phẩm');

-- Tài khoản (mật khẩu đã băm bcrypt: "123456" ví dụ – thay bằng băm của bạn nếu khác)
-- Bạn đã dùng chuỗi băm giống nhau, giữ nguyên để khớp với code xác thực hiện có.
INSERT INTO tai_khoan (ngay_cap_nhat, ngay_tao, matk, mat_khau, ten_dang_nhap, trang_thai, mavt) VALUES
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','TK_ADMIN','$2a$10$bz.P4YnSDtcS.derj5g9AuwvYylZU7gGk1jBGngg2PWBFZBdS3T0G','admin',b'1','ADMIN'),
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','TK_NV_KHO','$2a$10$bz.P4YnSDtcS.derj5g9AuwvYylZU7gGk1jBGngg2PWBFZBdS3T0G','nvkho',b'1','NV_KHO'),
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','TK_NV_BH','$2a$10$bz.P4YnSDtcS.derj5g9AuwvYylZU7gGk1jBGngg2PWBFZBdS3T0G','nvbanhang',b'1','NV_BANHANG'),
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','TK_KH_001','$2a$10$bz.P4YnSDtcS.derj5g9AuwvYylZU7gGk1jBGngg2PWBFZBdS3T0G','kh001',b'1','KHACH_HANG');

-- Nhân viên
INSERT INTO nhan_vien (ngay_cap_nhat, ngay_tao, email, gioi_tinh, ho_tennv, manv, ngay_sinh, sdt, trang_thai, matk) VALUES
 ('2025-10-17 10:01:24','2025-10-17 10:01:24','nv.kho@example.com',b'1','Nguyễn Văn Kho','NV001','1995-05-05 00:00:00','0902000001',b'1','TK_NV_KHO'),
 ('2025-10-17 10:01:24','2025-10-17 10:01:24','nv.banhang@example.com',b'0','Trần Thu Bán','NV002','1998-08-20 00:00:00','0902000002',b'1','TK_NV_BH');

-- Khách hàng
INSERT INTO khach_hang (ngay_cap_nhat, ngay_tao, dia_chi, email, ho_tenkh, makh, sdt, tich_diem, trang_thai, malkh, matk) VALUES
 ('2025-10-17 10:01:24','2025-10-17 10:01:24','Q.1, TP.HCM','kh1@example.com','Phạm Quốc Khánh','KH001','0903000001',120.00,b'1','THANH_VIEN','TK_KH_001'),
 ('2025-10-17 10:01:24','2025-10-17 10:01:24','Q.3, TP.HCM','kh2@example.com','Lê Thu Trang','KH002','0903000002',560.00,b'1','VIP',NULL);

-- Nhà cung cấp (tối thiểu 2 cái dùng cho phiếu nhập)
INSERT INTO nha_cung_cap (ngay_cap_nhat, ngay_tao, dia_chi, email, mancc, ngay_ket_thuc, sdt, tenncc, trang_thai) VALUES
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','TP.HCM','contact@nxbtre.vn','NCC001',NULL,'0901000001','NXB Trẻ',b'1'),
 ('2025-10-17 10:01:15','2025-10-17 10:01:15','Hà Nội','contact@alphabooks.vn','NCC002',NULL,'0901000002','Alpha Books',b'1');

-- Phiếu nhập
INSERT INTO phieu_nhap (ngay_cap_nhat, ngay_tao, chiet_khau, madxpn, mapn, mo_ta, tong_tien, trang_thai, mancc, manv) VALUES
 ('2025-10-17 10:01:24','2025-10-17 10:01:24',0.00,NULL,'PN001','Nhập sách Java',300000.00,'DA_NHAP','NCC001','NV001'),
 ('2025-10-17 10:01:24','2025-10-17 10:01:24',0.00,NULL,'PN002','Nhập VPP',150000.00,'DA_NHAP','NCC002','NV001');

-- Sản phẩm (đủ cho các bản ghi liên quan)
INSERT INTO san_pham (ngay_cap_nhat, ngay_tao, hinh_anh, masp, mo_ta, tensp, trang_thai, makm, malsp, thu_muc_anh, thuong_hieu) VALUES
 ('2025-10-17 10:01:24','2025-10-17 10:01:24','1.1.jpg','SP001','', 'Define The Relationship - Định Rõ Mối Quan Hệ',b'1','KM001','SACH','ngon-tinh','NXB Trẻ'),
 ('2025-10-17 10:01:24','2025-10-17 10:01:24','1.2.jpg','SP002','', 'Vũ Khúc Đoạn Tình (Tái bản năm 2025)',         b'1',NULL,'SACH','ngon-tinh','NXB Kim Đồng'),
 ('2025-10-17 10:01:24','2025-10-17 10:01:24','2.jpg',  'SP003','', 'Vẫn Cứ Yêu',                                   b'1','KM002','SACH','ngon-tinh','Thiên Long');

-- Chi tiết phiếu nhập
INSERT INTO chi_tiet_phieu_nhap (ngay_cap_nhat, ngay_tao, gia_nhap, mactpn, so_luong, tong_tien, mapn, masp) VALUES
 ('2025-10-17 10:01:24','2025-10-17 10:01:24',100000.00,'CTPN001',3,300000.00,'PN001','SP001'),
 ('2025-10-17 10:01:24','2025-10-17 10:01:24',15000.00,'CTPN002',10,150000.00,'PN002','SP003');

-- Kho (tồn theo lô nhập)
INSERT INTO kho (ngay_cap_nhat, ngay_tao, ma_kho, so_luong_ton, trang_thai, mactpn, masp) VALUES
 ('2025-10-17 10:01:24','2025-10-17 10:01:24','KHO001',3 ,b'1','CTPN001','SP001'),
 ('2025-10-17 10:01:24','2025-10-17 10:01:24','KHO002',10,b'1','CTPN002','SP003');

-- Lịch sử giá (giá bán hiện hành lấy từ lô nhập)
INSERT INTO lich_su_gia (ngay_cap_nhat, ngay_tao, gia_ban, malsg, ngay_ket_thuc, trang_thai, mactpn, masp) VALUES
 ('2025-10-17 10:01:24','2025-10-17 10:01:24',150000.00,'LSG001',NULL,b'1','CTPN001','SP001'),
 ('2025-10-17 10:01:24','2025-10-17 10:01:24',20000.00 ,'LSG002',NULL,b'1','CTPN002','SP003');

-- Hóa đơn
INSERT INTO hoa_don (ngay_cap_nhat, ngay_tao, chiet_khau, loaihd, mahd, phuong_thuc_thanh_toan, tong_tien, tong_tien_saukm, trang_thai, makh, makm, manv) VALUES
 ('2025-10-17 10:02:52','2025-10-17 10:01:24',0.00,b'1','HD001',b'1',170000.00,153000.00,'DA_THANH_TOAN','KH001','KM001','NV002'),
 ('2025-10-17 10:02:52','2025-10-17 10:01:24',0.00,b'1','HD002',b'0',20000.00 ,20000.00 ,'CHO_THANH_TOAN','KH002',NULL,'NV002');

-- Chi tiết hóa đơn
INSERT INTO chi_tiet_hoa_don (ngay_cap_nhat, ngay_tao, gia_ban, macthd, so_luong, tong_tien, mactpn, mahd, masp) VALUES
 ('2025-10-17 10:01:24','2025-10-17 10:01:24',150000.00,'CTHD001',1,150000.00,'CTPN001','HD001','SP001'),
 ('2025-10-17 10:01:24','2025-10-17 10:01:24',20000.00 ,'CTHD002',1,20000.00 ,'CTPN002','HD001','SP003'),
 ('2025-10-17 10:01:24','2025-10-17 10:01:24',20000.00 ,'CTHD003',1,20000.00 ,'CTPN002','HD002','SP003');

-- Bình luận
INSERT INTO binh_luan (ngay_cap_nhat, ngay_tao, diem_so, mabl, noi_dung, trang_thai, macthd) VALUES
 ('2025-10-17 10:01:24','2025-10-17 10:01:24','5','BL001','Sách hay, giao nhanh',b'1','CTHD001'),
 ('2025-10-17 10:01:24','2025-10-17 10:01:24','4','BL002','Bút viết êm',       b'1','CTHD003');

-- Giỏ hàng
INSERT INTO gio_hang (ngay_cap_nhat, ngay_tao, so_luong, tong_tien, makh, masp) VALUES
 ('2025-10-17 10:02:48','2025-10-17 10:01:24',2,0.00,'KH001','SP002'),
 ('2025-10-17 10:02:48','2025-10-17 10:01:24',5,100000.00,'KH002','SP003');

-- Phiếu đổi trả
INSERT INTO phieu_doi_tra (ngay_cap_nhat, ngay_tao, ly_do, mapdt, trang_thai, mahd) VALUES
 ('2025-10-17 10:01:24','2025-10-17 10:01:24','Sách lỗi gáy','PDT001',b'0','HD001');

-- Yêu thích
INSERT INTO yeu_thich (ngay_cap_nhat, ngay_tao, makh, masp) VALUES
 ('2025-10-17 10:01:24','2025-10-17 10:01:24','KH001','SP002'),
 ('2025-10-17 10:01:24','2025-10-17 10:01:24','KH001','SP003');
