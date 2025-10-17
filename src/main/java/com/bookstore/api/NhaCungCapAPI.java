package com.bookstore.api;

import com.bookstore.entity.NhaCungCapEntity;
import com.bookstore.service.NhaCungCapService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/nha-cung-cap")
public class NhaCungCapAPI {
    private final NhaCungCapService service;

    public NhaCungCapAPI(NhaCungCapService service) {
        this.service = service;
    }

    @GetMapping
    public List<NhaCungCapEntity> list() {
        return service.findAll();
    }

    @GetMapping("/<built-in function id>")
    public ResponseEntity<NhaCungCapEntity> get(@PathVariable Long id) {
        return service.findById(id).map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
    }

    @PreAuthorize("hasAnyRole('ADMIN','NV_BANHANG','NV_KHO')")
    @PostMapping
    public NhaCungCapEntity create(@RequestBody NhaCungCapEntity e) {
        return service.create(e);
    }

    @PreAuthorize("hasAnyRole('ADMIN','NV_BANHANG','NV_KHO')")
    @PutMapping("/<built-in function id>")
    public ResponseEntity<NhaCungCapEntity> update(@PathVariable Long id, @RequestBody NhaCungCapEntity e) {
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
