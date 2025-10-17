// com.bookstore.dto.ProductJson.java
package com.bookstore.dto;

import java.math.BigDecimal;
import java.util.List;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductJson {
	private String id;
	private String name;
	private String brand;
	private String category;
	private String description;
	private BigDecimal price;
	private List<String> images;
}
	