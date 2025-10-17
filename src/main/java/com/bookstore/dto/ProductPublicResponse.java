// ProductPublicResponse.java
package com.bookstore.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Builder(toBuilder = true)              // <== phải có để dùng p.toBuilder()
public class ProductPublicResponse {
    private String id;
    private String name;
    private String brand;
    private String category;
    private String description;
    private java.math.BigDecimal price;
    private java.util.List<String> images;

    // nếu bạn muốn đọc cột folder từ Excel:
    @com.fasterxml.jackson.annotation.JsonIgnore
    private String imageFolder;
}
