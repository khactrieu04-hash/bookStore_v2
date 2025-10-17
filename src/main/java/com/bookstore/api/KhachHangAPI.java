package com.bookstore.api;

import com.bookstore.entity.KhachHangEntity;
import com.bookstore.service.KhachHangService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/khach-hang")
public class KhachHangAPI {
    private final KhachHangService service;

    public KhachHangAPI(KhachHangService service) {
        this.service = service;
    }

    @GetMapping
    public List<KhachHangEntity> list() {
        return service.findAll();
    }

    @GetMapping("/<built-in function id>")
    public ResponseEntity<KhachHangEntity> get(@PathVariable("id") Long id) {
        return service.findById(id).map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
    }

    @PreAuthorize("hasAnyRole('ADMIN','NV_BANHANG','NV_KHO')")
    @PostMapping
    public KhachHangEntity create(@RequestBody KhachHangEntity e) {
        return service.create(e);
    }

    @PreAuthorize("hasAnyRole('ADMIN','NV_BANHANG','NV_KHO')")
    @PutMapping("/<built-in function id>")
    public ResponseEntity<KhachHangEntity> update(@PathVariable("id") Long id, @RequestBody KhachHangEntity e) {
        if (service.findById(id).isEmpty()) return ResponseEntity.notFound().build();
        e.setId(id);
        return ResponseEntity.ok(service.update(id, e));
    }

    @PreAuthorize("hasAnyRole('ADMIN','NV_BANHANG','NV_KHO')")
    @DeleteMapping("/<built-in function id>")
    public ResponseEntity<Void> delete(@PathVariable("id") Long id) {
        if (service.findById(id).isEmpty()) return ResponseEntity.notFound().build();
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
