package com.bookstore.service.impl;

import com.bookstore.entity.NhanVienEntity;
import com.bookstore.repository.NhanVienRepository;
import com.bookstore.service.NhanVienService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class NhanVienServiceImpl extends BaseServiceImpl<NhanVienEntity, Long> implements NhanVienService {
    private final NhanVienRepository repository;

    public NhanVienServiceImpl(NhanVienRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<NhanVienEntity, Long> getRepository() {
        return repository;
    }
}
