# Bookstore API (Spring Boot) — Quick Start for FE

> Repo template helpers để FE clone về và chạy thử **có sẵn dữ liệu**.

## 1) Yêu cầu
- Java 21
- Maven 3.9+
- MySQL 8 (tự cài) **hoặc** Docker
- Git

## 2) Cách chạy bằng Docker (khuyến nghị, nhanh nhất)
```bash
# 1) Khởi động MySQL + Adminer và tự seed dữ liệu
docker compose up -d

# 2) Build & chạy API
./mvnw spring-boot:run -Dspring-boot.run.profiles=dev
# hoặc: mvn spring-boot:run -Dspring-boot.run.profiles=dev
```

- Adminer: http://localhost:8081  (Server: `db` hoặc `localhost`, User: `book`, Pass: `book`, DB: `hethongbansach`)
- MySQL: `localhost:3306`, user `book`, pass `book` (đặt trong `docker-compose.yml`)

## 3) Chạy với MySQL cài sẵn (không dùng Docker)
```bash
# Tạo DB & nhập dữ liệu mẫu
bash scripts/reset-db.sh
# Windows PowerShell:
#   .\scripts
eset-db.ps1
#   (có thể đổi tham số DB_HOST/DB_NAME/DB_USER/DB_PASS)

# Chạy API
mvn spring-boot:run -Dspring-boot.run.profiles=dev
```

## 4) Cấu hình
- Copy `.env.example` thành `.env` nếu muốn override biến môi trường
- Cấu hình JDBC/charset ở `src/main/resources/application-dev.yml`
- `ddl-auto: none` vì mình dùng `db/seed.sql` để tạo sẵn schema + data

## 5) Tài khoản mẫu để FE test
- Admin: `admin` / (mật khẩu bcrypt sẵn trong seed, ví dụ: `123456` nếu code encode như seed)
- NV kho: `nvkho`
- NV bán hàng: `nvbanhang`
- KH: `kh001`

> Lưu ý: Mật khẩu trong seed đã là **bcrypt**. Flow login cần đúng encoder trong Spring Security.

## 6) API base
- Port mặc định: `:8080`
- Ví dụ: `GET http://localhost:8080/api/san-pham`

## 7) Dọn rác trước khi push Git
Xem `AUDIT_CLEANUP.md`.

---

## FAQ
**Q: FE chỉ cần import dữ liệu và chạy nhanh?**  
A: Dùng Docker (mục 2). `db/seed.sql` sẽ tự chạy khi MySQL container khởi động lần đầu.

**Q: Muốn đổi user/pass DB?**  
A: Sửa `docker-compose.yml` + `.env`/`application-dev.yml` tương ứng.

**Q: Bị lỗi role NV_BAN_HANG vs NV_BANHANG?**  
A: Sửa seed (chỉ giữ 1 key), đồng bộ enum/constant trong code.
# bookStore_v2
