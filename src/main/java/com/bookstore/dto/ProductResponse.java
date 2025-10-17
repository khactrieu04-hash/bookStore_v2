package com.bookstore.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
@Builder
public class ProductResponse {
    private String id;             
    private String name;          
    private String category;       
    private String description;    
    private BigDecimal price;      
    private List<String> images;   
}
