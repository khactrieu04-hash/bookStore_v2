package com.bookstore.api;

import com.bookstore.entity.KhuyenMaiEntity;
import com.bookstore.service.KhuyenMaiService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/khuyen-mai")
public class KhuyenMaiAPI {
    private final KhuyenMaiService service;

    public KhuyenMaiAPI(KhuyenMaiService service) {
        this.service = service;
    }

    @GetMapping
    public List<KhuyenMaiEntity> list() {
        return service.findAll();
    }

    @GetMapping("/<built-in function id>")
    public ResponseEntity<KhuyenMaiEntity> get(@PathVariable Long id) {
        return service.findById(id).map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
    }

    @PreAuthorize("hasAnyRole('ADMIN','NV_BANHANG','NV_KHO')")
    @PostMapping
    public KhuyenMaiEntity create(@RequestBody KhuyenMaiEntity e) {
        return service.create(e);
    }

    @PreAuthorize("hasAnyRole('ADMIN','NV_BANHANG','NV_KHO')")
    @PutMapping("/<built-in function id>")
    public ResponseEntity<KhuyenMaiEntity> update(@PathVariable Long id, @RequestBody KhuyenMaiEntity e) {
        if (service.findById(id).isEmpty()) return ResponseEntity.notFound().build();
        e.setId(id);
        return ResponseEntity.ok(service.update(id, e));
    }

    @PreAuthorize("hasAnyRole('ADMIN','NV_BANHANG','NV_KHO')")
    @DeleteMapping("/<built-in function id>")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        if (service.findById(id).isEmpty()) return ResponseEntity.notFound().build();
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
