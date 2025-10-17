// src/main/java/com/bookstore/service/ProductExcelService.java
package com.bookstore.service;

import com.bookstore.dto.ProductPublicResponse;
import lombok.RequiredArgsConstructor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.Normalizer;
import java.util.*;

@Service
@RequiredArgsConstructor
public class ProductExcelService {

  @Value("${app.data.products-excel}")
  private String excelPath;

  public List<ProductPublicResponse> findAll() {
    try (var in = Files.newInputStream(Paths.get(excelPath));
         var wb = new XSSFWorkbook(in)) {

      var sh = wb.getSheetAt(0);
      if (sh.getPhysicalNumberOfRows() < 2) return List.of();

      // header map
      var header = sh.getRow(0);
      Map<String,Integer> idx = new HashMap<>();
      for (int c=0; c<header.getLastCellNum(); c++) {
        String key = normalize(cellStr(header.getCell(c)));
        idx.put(key, c);
      }

      int cId     = col(idx, "id","ma","ma sp","masp","mã","mã sp");
      int cName   = col(idx, "name","ten","ten sach","tensach","tên","tên sách");
      int cBrand  = col(idx, "brand","nxb","nha xuat ban","nhaxuatban","nhà xuất bản");
      int cCat    = col(idx, "category","the loai","theloai","danh muc","danhmuc","thể loại","danh mục");
      int cDesc   = col(idx, "description","mo ta","mota","mô tả");
      int cPrice  = col(idx, "price","gia","giaban","giá","giá bán");
      int cFolder = col(idx, "image folder","image_folder","thu muc anh","thumucanh","folder anh","folder");

      List<ProductPublicResponse> list = new ArrayList<>();

      for (int r=1; r<=sh.getLastRowNum(); r++) {
        var row = sh.getRow(r);
        if (row == null) continue;

        String id = getStr(row, cId);
        if (id == null || id.isBlank()) continue;

        String name   = getStr(row, cName);
        String brand  = getStr(row, cBrand);
        String cat    = getStr(row, cCat);
        String desc   = getStr(row, cDesc);
        BigDecimal price = getDecimal(row, cPrice);
        String folder = getStr(row, cFolder);

        list.add(ProductPublicResponse.builder()
            .id(id)
            .name(name)
            .brand(brand)
            .category(cat)
            .description(desc)
            .price(price == null ? BigDecimal.ZERO : price)
            .images(List.of())           // sẽ gán ở Controller
            .imageFolder(folder)         // giữ nội bộ để suy luận ảnh
            .build());
      }
      return list;
    } catch (IOException e) {
      throw new IllegalStateException("Không đọc được Excel: " + excelPath, e);
    }
  }

  // ==== Helpers ====
  private static String getStr(Row r, int idx){
    if (idx < 0) return null;
    var c = r.getCell(idx);
    if (c == null) return null;
    c.setCellType(CellType.STRING);
    return c.getStringCellValue().trim();
  }

  private static BigDecimal getDecimal(Row r, int idx){
    if (idx < 0) return BigDecimal.ZERO;
    var c = r.getCell(idx);
    if (c == null) return BigDecimal.ZERO;
    return switch (c.getCellType()){
      case NUMERIC -> BigDecimal.valueOf(c.getNumericCellValue());
      case STRING -> {
        String s = c.getStringCellValue().replace(",","").trim();
        yield s.isEmpty() ? BigDecimal.ZERO : new BigDecimal(s);
      }
      default -> BigDecimal.ZERO;
    };
  }

  private static int col(Map<String,Integer> idx, String... aliases){
    for (var a: aliases){
      Integer i = idx.get(normalize(a));
      if (i != null) return i;
    }
    return -1;
  }

  private static String cellStr(Cell c){
    return c == null ? "" : c.toString();
  }

  private static String normalize(String s){
    String x = Normalizer.normalize(String.valueOf(s).toLowerCase(), Normalizer.Form.NFD);
    x = x.replaceAll("\\p{M}+","");      // bỏ dấu
    x = x.replaceAll("[^a-z0-9]+"," ").trim();
    return x;
  }
}
