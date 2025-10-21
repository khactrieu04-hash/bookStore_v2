-- V3__seed_products_full.sql
-- Seed đầy đủ dữ liệu sản phẩm (upsert theo masp)

SET NAMES utf8mb4;
SET time_zone = '+00:00';

START TRANSACTION;

-- Đảm bảo loại khuyến mãi
INSERT INTO loai_khuyen_mai (malkm, mo_ta, ten_loaikm, ngay_tao, ngay_cap_nhat)
VALUES
  ('PERCENT','Giảm theo phần trăm','Giảm theo %', NOW(6), NOW(6)),
  ('AMOUNT','Giảm số tiền cố định','Giảm tiền mặt', NOW(6), NOW(6))
ON DUPLICATE KEY UPDATE
  mo_ta=VALUES(mo_ta),
  ten_loaikm=VALUES(ten_loaikm),
  ngay_cap_nhat=NOW(6);

-- Đảm bảo khuyến mãi
INSERT INTO khuyen_mai (makm, tenkm, gia_tri, ngay_ket_thuc, trang_thai, malkm, ngay_tao, ngay_cap_nhat)
VALUES
  ('KM001','Giảm 10%', 10.00, '2025-11-16 10:01:15.000000', b'1', 'PERCENT', NOW(6), NOW(6)),
  ('KM002','Giảm 20K', 20000.00, '2025-12-16 10:01:15.000000', b'1', 'AMOUNT', NOW(6), NOW(6))
ON DUPLICATE KEY UPDATE
  tenkm=VALUES(tenkm),
  gia_tri=VALUES(gia_tri),
  ngay_ket_thuc=VALUES(ngay_ket_thuc),
  trang_thai=VALUES(trang_thai),
  malkm=VALUES(malkm),
  ngay_cap_nhat=NOW(6);

-- Đảm bảo loại sản phẩm
INSERT INTO loai_san_pham (malsp, ten_loai, mo_ta, ngay_tao, ngay_cap_nhat)
VALUES
  ('SACH','Sách','Danh mục sách', NOW(6), NOW(6)),
  ('VPP','Văn phòng phẩm','Bút, vở, dụng cụ', NOW(6), NOW(6))
ON DUPLICATE KEY UPDATE
  ten_loai=VALUES(ten_loai),
  mo_ta=VALUES(mo_ta),
  ngay_cap_nhat=NOW(6);

-- ===============================
-- Upsert SẢN PHẨM (1 → 120)
-- ===============================
INSERT INTO san_pham
  (ngay_tao, ngay_cap_nhat, hinh_anh, masp, mo_ta, tensp, trang_thai, makm, malsp, thu_muc_anh, thuong_hieu)
VALUES
  (NOW(6),NOW(6),'1.1.jpg','SP001','', 'Define The Relationship - Định Rõ Mối Quan Hệ', b'1','KM001','SACH','ngon-tinh','NXB Trẻ'),
  (NOW(6),NOW(6),'1.2.jpg','SP002','', 'Vũ Khúc Đoạn Tình (Tái bản năm 2025)', b'1',NULL,'SACH','ngon-tinh','NXB Kim Đồng'),
  (NOW(6),NOW(6),'2.jpg','SP003','', 'Vẫn Cứ Yêu', b'1','KM002','SACH','ngon-tinh','Thiên Long'),

  (NOW(6),NOW(6),'4.1.jpg','SP004',NULL,'Khi Anh Cười, Hào Hoa Phong Nhã', NULL,NULL,'SACH','ngon-tinh','NXB Trẻ'),
  (NOW(6),NOW(6),'5.jpg','SP005',NULL,'Reminders Of Him - Hồi Ức Vụn Vỡ', NULL,NULL,'SACH','ngon-tinh','NXB Trẻ'),
  (NOW(6),NOW(6),'6.jpg','SP006',NULL,'Đuổi Theo Mùa Hạ', NULL,NULL,'SACH','ngon-tinh','NXB Trẻ'),

  (NOW(6),NOW(6),'1.jpg','SP007',NULL,'Tết Ở Làng Địa Ngục', NULL,NULL,'SACH','kinh-di','NXB Trẻ'),
  (NOW(6),NOW(6),'1.4.jpg','SP008',NULL,'Đũa: Chuyện Linh Dị', NULL,NULL,'SACH','kinh-di','NXB Trẻ'),
  (NOW(6),NOW(6),'3.jpg','SP009',NULL,'Ngôi Nhà Kỳ Quái', NULL,NULL,'SACH','kinh-di','NXB Trẻ'),
  (NOW(6),NOW(6),'4.jpg','SP010',NULL,'Sĩ Số Lớp Vắng 0', NULL,NULL,'SACH','kinh-di','NXB Trẻ'),

  (NOW(6),NOW(6),'7.jpg','SP011',NULL,'Tình Yêu Đau Dạ Dày', b'1',NULL,'SACH','ngon-tinh','NXB Trẻ'),
  (NOW(6),NOW(6),'8.jpg','SP012',NULL,'Heart Bones - Lời Nói Dối Mùa Hè', b'1',NULL,'SACH','ngon-tinh','NXB Trẻ'),
  (NOW(6),NOW(6),'9.jpg','SP013',NULL,'Con Dao Nhỏ Của Emiri', b'1',NULL,'SACH','ngon-tinh','NXB Trẻ'),
  (NOW(6),NOW(6),'10.jpg','SP014',NULL,'Yêu Anh Hơn Cả Tử Thần', b'1',NULL,'SACH','ngon-tinh','NXB Trẻ'),
  (NOW(6),NOW(6),'11.jpg','SP015',NULL,'Phán Quan', b'1',NULL,'SACH','ngon-tinh','NXB Trẻ'),

  (NOW(6),NOW(6),'5.jpg','SP016',NULL,'Đôi Mắt Trũng Sâu', b'1',NULL,'SACH','kinh-di','NXB Kim Đồng'),
  (NOW(6),NOW(6),'6.jpg','SP017',NULL,'Những Đồ Vật Có Linh Hồn', b'1',NULL,'SACH','kinh-di','NXB Nhã Nam'),
  (NOW(6),NOW(6),'7.jpg','SP018',NULL,'Bức Họa Múa Rối Xương', b'1',NULL,'SACH','kinh-di','NXB Trẻ'),
  (NOW(6),NOW(6),'8.jpg','SP019',NULL,'Tứ Trấn Huyền Linh', b'1',NULL,'SACH','kinh-di','NXB Nhã Nam'),
  (NOW(6),NOW(6),'9.jpg','SP020',NULL,'Bóng Trăng Trắng Ngà', b'1',NULL,'SACH','kinh-di','NXB Trẻ'),
  (NOW(6),NOW(6),'10.jpg','SP021',NULL,'Ám Ảnh', b'1',NULL,'SACH','kinh-di','NXB Trẻ'),
  (NOW(6),NOW(6),'11.jpg','SP022','17 Âm 1','17 Âm 1', b'1',NULL,'SACH','kinh-di','NXB Trẻ'),

  (NOW(6),NOW(6),'1.jpg','SP023',NULL,'Xứ Tháng Mười', b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
  (NOW(6),NOW(6),'2.jpg','SP024',NULL,'Trường Ca Achilles', b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),

  (NOW(6),NOW(6),'4.jpg','SP026',NULL,'Biên Niên Ký Sao Hỏa', b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
  (NOW(6),NOW(6),'5.jpg','SP027',NULL,'Cái Chết Của Những Xác Sống - Tập 1', b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
  (NOW(6),NOW(6),'6.jpg','SP028',NULL,'Hòn Đá Mù - Medusa Những Chuyện Chưa Kể', b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
  (NOW(6),NOW(6),'7.jpg','SP029',NULL,'Cựu Tộc - Quyển 1: Huyền Thoại Về Rồng Tuyết', b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
  (NOW(6),NOW(6),'8.jpg','SP030','', 'Hội Bàn Tròn Ma Thuật - Tập 1: Legendborn', b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
  (NOW(6),NOW(6),'9.jpg','SP031','Thế Giới Atlantis','Thế Giới Atlantis', b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
  (NOW(6),NOW(6),'10.jpg','SP032',NULL,'Fourth Wing - Cánh Tư', b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
  (NOW(6),NOW(6),'11.jpg','SP033','Kẻ Canh Gác Bầu Trời - Những Chân Trời Đã Mất','Kẻ Canh Gác Bầu Trời - Những Chân Trời Đã Mất', b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),

  (NOW(6),NOW(6),'1.jpg','SP034',NULL,'Ghi Chép Pháp Y - Những Thi Thể Không Hoàn Chỉnh', b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),
  (NOW(6),NOW(6),'2.jpg','SP035',NULL,'Tội Ác Liên Hoàn - Tập 1: Ván Bài Đô Mi Nô', b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),
  (NOW(6),NOW(6),'3.jpg','SP036',NULL,'Sự Thật Bị Che Khuất', b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),

  (NOW(6),NOW(6),'5.jpg','SP038',NULL,'Nhân Chứng Cuối Cùng', b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),
  (NOW(6),NOW(6),'6.jpg','SP039',NULL,'8 Vụ Án Hoàn Hảo - Vạch Trần Tâm Lý Kẻ Phạm Tội', b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),
  (NOW(6),NOW(6),'7.jpg','SP040',NULL,'Sherlock Holmes: Tuyển Tập Những Vụ Án Hóc Búa Nhất', b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),
  (NOW(6),NOW(6),'8.jpg','SP041',NULL,'Cô Hầu Gái', b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),
  (NOW(6),NOW(6),'9.jpg','SP042',NULL,'Hải Quỳ', b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),

  (NOW(6),NOW(6),'1.jpg','SP044',NULL,'Nếu Gặp Lại Em Trên Ngọn Đồi Hoa Nở', b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
  (NOW(6),NOW(6),'2.jpg','SP045',NULL,'Hôn Nhân Hạnh Phúc Của Tôi', b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
  (NOW(6),NOW(6),'3.jpg','SP046',NULL,'Đêm Nay Dẫu Tình Yêu Này Biến Mất Khỏi Thế Gian', b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
  (NOW(6),NOW(6),'4.jpg','SP047',NULL,'Hội Chứng Tuổi Thanh Xuân', b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
  (NOW(6),NOW(6),'5.jpg','SP048',NULL,'Thiên Sứ Nhà Bên', b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
  (NOW(6),NOW(6),'6.jpg','SP049',NULL,'Chúa Tể Bóng Tối', b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
  (NOW(6),NOW(6),'7.jpg','SP050',NULL,'Dược Sư Tự Sự', b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
  (NOW(6),NOW(6),'8.jpg','SP051','Tôi Muốn Bảo Vệ Cậu, Dù Phải Mất Đi... Tình Yêu Này','Tôi Muốn Bảo Vệ Cậu, Dù Phải Mất Đi... Tình Yêu Này', b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
  (NOW(6),NOW(6),'9.jpg','SP052',NULL,'Thám Tử Đã Chết', b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
  (NOW(6),NOW(6),'10.jpg','SP053',NULL,'Arya Bàn Bên Thỉnh Thoảng Lại Trêu Ghẹo Tôi Bằng Tiếng Nga', b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
  (NOW(6),NOW(6),'11.jpg','SP054',NULL,'Nguyệt Đạo Dị Giới', b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),

  (NOW(6),NOW(6),'1.jpg','SP055',NULL,'Thắng Pháp Trên Bầu Trời Điện Biên Phủ', b'1',NULL,'SACH','truyen-lich-su','NXB Trẻ'),
  (NOW(6),NOW(6),'2.jpg','SP056',NULL,'Hồ Xuân Hương', b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
  (NOW(6),NOW(6),'4.jpg','SP058',NULL,'Bốn Năm Sau Và Những Trang Viết Về Điện Biên', b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
  (NOW(6),NOW(6),'6.jpg','SP060',NULL,'Ngự Tiền Quan Án - Đại Án Quảng Nam', b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
  (NOW(6),NOW(6),'7.jpg','SP061','Nước Non Vạn Dặm 3 - Từ Việt Bắc Về Hà Nội','Nước Non Vạn Dặm 3 - Từ Việt Bắc Về Hà Nội', b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
  (NOW(6),NOW(6),'8.jpg','SP062',NULL,'Ấn Kiếm Hồng Nhan', b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
  (NOW(6),NOW(6),'9.jpg','SP063',NULL,'Hoàng Lê Nhất Thống Chí', b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
  (NOW(6),NOW(6),'10.jpg','SP064','Như Sơ','Như Sơ', b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
  (NOW(6),NOW(6),'11.jpg','SP065','Trần Triều Nhàn Thoại','Trần Triều Nhàn Thoại', b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),

  (NOW(6),NOW(6),'1.jpg','SP066','Khó Dỗ Dành','Khó Dỗ Dành', b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
  (NOW(6),NOW(6),'2.jpg','SP067',NULL,'Nếu Gặp Lại Em Trên Ngọn Đồi Hoa Nở', b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
  (NOW(6),NOW(6),'3.jpg','SP068',NULL,'Những Chiếc Cầu Ở Quận Madison (Tái bản năm 2022)', b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
  (NOW(6),NOW(6),'4.jpg','SP069',NULL,'Lưỡng Giới (Giải Pulitzer 2003) (Bìa Mềm)', b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
  (NOW(6),NOW(6),'5.jpg','SP070',NULL,'Điều Kỳ Diệu Của Tiệm Tạp Hóa Namiya (Tái bản năm 2018)', b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
  (NOW(6),NOW(6),'6.jpg','SP071',NULL,'Người Đẹp Ngủ Mê (Tái bản năm 2023)', b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
  (NOW(6),NOW(6),'7.jpg','SP072',NULL,'Chiến Binh Cầu Vồng', b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
  (NOW(6),NOW(6),'8.jpg','SP073',NULL,'Gã Du Đãng Chúng Ta Đang Lùng Kiếm', b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
  (NOW(6),NOW(6),'9.jpg','SP074',NULL,'Đêm Nay Dẫu Tình Yêu Này Biến Mất Khỏi Thế Gian', b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
  (NOW(6),NOW(6),'10.jpg','SP075',NULL,'Thoát Đến Phương Tây', b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
  (NOW(6),NOW(6),'11.jpg','SP076',NULL,'Truyện Kiều Văn Xuôi: Dành Cho Người Trẻ (Tái bản năm 2022)', b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),

  (NOW(6),NOW(6),'1.jpg','SP077',NULL,'Tục Ngữ, Ca Dao, Dân Ca Việt Nam', b'1',NULL,'SACH','tho-van','NXB Thơ'),
  (NOW(6),NOW(6),'2.jpg','SP078',NULL,'Ai Tưới Tình Để Hồn Thơ Lén Nở', b'1',NULL,'SACH','tho-van','NXB Thơ'),
  (NOW(6),NOW(6),'3.jpg','SP079',NULL,'Vườn Tôi Có Cây Lá Bình Yên', b'1',NULL,'SACH','tho-van','NXB Thơ'),
  (NOW(6),NOW(6),'4.jpg','SP080',NULL,'Tặng Người, Người Ấy Em Thương', b'1',NULL,'SACH','tho-van','NXB Thơ'),
  (NOW(6),NOW(6),'5.jpg','SP081',NULL,'Cảm Ơn Bạn Đã Không Từ Bỏ Chính Mình', b'1',NULL,'SACH','tho-van','NXB Thơ'),
  (NOW(6),NOW(6),'6.jpg','SP082',NULL,'Thanh Xuân Là Gì Em Nhỉ?', b'1',NULL,'SACH','tho-van','NXB Thơ'),
  (NOW(6),NOW(6),'7.jpg','SP083',NULL,'Không Sao Mà Chúng Ta Rồi Sẽ Ổn', b'1',NULL,'SACH','tho-van','NXB Thơ'),
  (NOW(6),NOW(6),'8.jpg','SP084',NULL,'Người Con Gái Ta Thương', b'1',NULL,'SACH','tho-van','NXB Thơ'),
  (NOW(6),NOW(6),'9.jpg','SP085',NULL,'Thơ Từng Ôm Và Mặt Trời Từng Hạt (Bộ 4 quyển + CD 32 bài thơ của Thiền sư Thích Nhất Hạnh)', b'1',NULL,'SACH','tho-van','NXB Thơ'),
  (NOW(6),NOW(6),'10.jpg','SP086',NULL,'Như Sao Trời Ôm Lấy Đại Dương', b'1',NULL,'SACH','tho-van','NXB Thơ'),
  (NOW(6),NOW(6),'11.jpg','SP087',NULL,'An (Thơ @yenlamtho)', b'1',NULL,'SACH','tho-van','NXB Thơ'),

  (NOW(6),NOW(6),'1.jpg','SP088',NULL,'Tranh Dân Gian Việt Nam: Sưu Tầm Và Nghiên Cứu', b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
  (NOW(6),NOW(6),'2.jpg','SP089',NULL,'Để Hiểu Nghệ Thuật', b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
  (NOW(6),NOW(6),'3.jpg','SP090',NULL,'Xem Tranh', b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
  (NOW(6),NOW(6),'4.jpg','SP091',NULL,'Kiến Thức Căn Bản Cần Biết - Theo Dòng Lịch Sử Nghệ Thuật', b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
  (NOW(6),NOW(6),'5.jpg','SP092',NULL,'Nghệ Thuật Với Thị Giác', b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
  (NOW(6),NOW(6),'6.jpg','SP093',NULL,'Dẫn Luận Về Lịch Sử Nghệ Thuật', b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
  (NOW(6),NOW(6),'7.jpg','SP094',NULL,'Mỹ Thuật Huế - Nhìn Từ Góc Độ Ý Nghĩa Và Biểu Tượng Trang Trí', b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
  (NOW(6),NOW(6),'8.jpg','SP095',NULL,'Câu Chuyện Nghệ Thuật - Lịch Sử Nghệ Thuật Qua Các Trào Lưu Lớn Và Những Kiệt Tác Truyền Cảm Hứng', b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
  (NOW(6),NOW(6),'9.jpg','SP096',NULL,'Vẻ Đẹp Của Những Vật Dụng Hàng Ngày', b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
  (NOW(6),NOW(6),'10.jpg','SP097',NULL,'Nghệ Thuật Không Chỉ Để Ngắm', b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
  (NOW(6),NOW(6),'11.jpg','SP098',NULL,'How Art Works - Hiểu Hết Về Nghệ Thuật', b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),

  (NOW(6),NOW(6),'1.jpg','SP099',NULL,'Thái Công - A Passion for Aesthetics (Sách tiếng Anh)', b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
  (NOW(6),NOW(6),'2.jpg','SP100',NULL,'Kiến Trúc Hiện Đại Miền Nam Việt Nam - Chủ Nghĩa Bản Địa Hiện Đại Giữa Thế Kỷ XX', b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
  (NOW(6),NOW(6),'3.jpg','SP101',NULL,'Kỹ Thuật Kiến Trúc Cảnh Quan', b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
  (NOW(6),NOW(6),'4.jpg','SP102',NULL,'Ngôi Nhà Điên (Sách ảnh) (Ngôn ngữ Việt-Anh-Trung-Nga)', b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
  (NOW(6),NOW(6),'5.jpg','SP103',NULL,'Dẫn Luận Về Kiến Trúc', b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
  (NOW(6),NOW(6),'6.jpg','SP104',NULL,'Lịch Sử Kiến Trúc Cảnh Quan Thế Giới Qua Hình Vẽ', b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
  (NOW(6),NOW(6),'7.jpg','SP105',NULL,'Nhận Diện Đô Thị Việt Nam Đương Đại: Câu Chuyện Quy Hoạch - Kiến Trúc', b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
  (NOW(6),NOW(6),'8.jpg','SP106',NULL,'A Crash Course Series: Đọc Hiểu Công Trình Kiến Trúc', b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
  (NOW(6),NOW(6),'9.jpg','SP107',NULL,'Có Ngôi Nhà Ở Trong Ta', b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
  (NOW(6),NOW(6),'10.jpg','SP108',NULL,'Kiến Trúc Pháp - Đông Dương: Dấu Tích "Sài Gòn - Hòn Ngọc Viễn Đông"', b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
  (NOW(6),NOW(6),'11.jpg','SP109',NULL,'Kiến Trúc Hà Nội', b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),

  (NOW(6),NOW(6),'1.jpg','SP110',NULL,'Atlas Thế Giới', b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
  (NOW(6),NOW(6),'2.jpg','SP111',NULL,'Combo Em Vào Bếp (Bộ 5 cuốn)', b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
  (NOW(6),NOW(6),'3.jpg','SP112',NULL,'A Lê Hấp! Thế Giới Chim', b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
  (NOW(6),NOW(6),'4.jpg','SP113',NULL,'Từ Điển Muôn Loài - Những Người Bạn Rừng Xanh (Tái bản năm 2020)', b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
  (NOW(6),NOW(6),'5.jpg','SP114',NULL,'Từ Điển Muôn Loài - Những Người Bạn Côn Trùng', b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
  (NOW(6),NOW(6),'6.jpg','SP115',NULL,'Từ Điển Muôn Loài - Chúng Mình Thích Bay Lượn', b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
  (NOW(6),NOW(6),'7.jpg','SP116',NULL,'Từ Điển Muôn Loài - Những Người Bạn Lạ Kì (Tái bản năm 2020)', b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
  (NOW(6),NOW(6),'8.jpg','SP117',NULL,'Từ Điển Muôn Loài - Chúng Mình Thích Nước (Tái bản năm 2020)', b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
  (NOW(6),NOW(6),'9.jpg','SP118',NULL,'Combo Lịch Sử Việt Nam Bằng Tranh (Bộ 8 cuốn)', b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
  (NOW(6),NOW(6),'10.jpg','SP119',NULL,'Bách Khoa Thư Về Thế Giới Động Vật (Bìa cứng)', b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
  (NOW(6),NOW(6),'11.jpg','SP120',NULL,'Mở Khóa Trí Tưởng Tượng - Hơn 250 Cách Đập Tan Buồn Chán', b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa')
ON DUPLICATE KEY UPDATE
  hinh_anh=VALUES(hinh_anh),
  mo_ta=VALUES(mo_ta),
  tensp=VALUES(tensp),
  trang_thai=COALESCE(VALUES(trang_thai), san_pham.trang_thai),
  makm=VALUES(makm),
  malsp=VALUES(malsp),
  thu_muc_anh=VALUES(thu_muc_anh),
  thuong_hieu=VALUES(thuong_hieu),
  ngay_cap_nhat=NOW(6);

COMMIT;
