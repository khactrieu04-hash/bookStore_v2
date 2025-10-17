package com.bookstore.api;

import com.bookstore.entity.TaiKhoanEntity;
import com.bookstore.service.TaiKhoanService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tai-khoan")
public class TaiKhoanAPI {
    private final TaiKhoanService service;

    public TaiKhoanAPI(TaiKhoanService service) {
        this.service = service;
    }

    @GetMapping
    public List<TaiKhoanEntity> list() {
        return service.findAll();
    }

    @GetMapping("/<built-in function id>")
    public ResponseEntity<TaiKhoanEntity> get(@PathVariable Long id) {
        return service.findById(id).map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
    }

    @PreAuthorize("hasAnyRole('ADMIN','NV_BANHANG','NV_KHO')")
    @PostMapping
    public TaiKhoanEntity create(@RequestBody TaiKhoanEntity e) {
        return service.create(e);
    }

    @PreAuthorize("hasAnyRole('ADMIN','NV_BANHANG','NV_KHO')")
    @PutMapping("/<built-in function id>")
    public ResponseEntity<TaiKhoanEntity> update(@PathVariable Long id, @RequestBody TaiKhoanEntity e) {
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
