package com.bookstore.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Value;

import java.math.BigDecimal;

@Value
@Builder
public class BookCardResponse {
    @JsonProperty("_id")
    String id;             // MaSP

    String name;           // TenSP (tên sách)
    String brand;          // ThuongHieu (NXB/tác giả nếu bạn dùng)
    String category;       // TenLoai
    String description;    // MoTa
    BigDecimal price;      // Giá hiện hành (từ LichSuGia)
    String image;          // 1 ảnh chính (URL tĩnh /images/..)
}
