package com.bookstore.api;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

@RestController
@RequestMapping("/api/admin/upload")
@RequiredArgsConstructor
public class UploadAPI {

    @Value("${app.files.images-dir}")
    private String imagesDir;

    @PostMapping("/product/{maSP}")
    public ResponseEntity<?> uploadForProduct(@PathVariable String maSP,
                                              @RequestParam("file") MultipartFile file) throws Exception {
        if (file.isEmpty()) return ResponseEntity.badRequest().body(Map.of("error","File rỗng"));
        Path folder = Paths.get(imagesDir).resolve(maSP).toAbsolutePath().normalize();
        Files.createDirectories(folder);

        String filename = System.currentTimeMillis() + "_" + StringUtils.cleanPath(file.getOriginalFilename());
        Path dest = folder.resolve(filename);
        file.transferTo(dest.toFile());

        String publicUrl = "/images/" + maSP + "/" + filename;
        return ResponseEntity.ok(Map.of("url", publicUrl));
    }
}
