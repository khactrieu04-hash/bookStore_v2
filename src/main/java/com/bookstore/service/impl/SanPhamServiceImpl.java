package com.bookstore.service.impl;

import com.bookstore.entity.SanPhamEntity;
import com.bookstore.repository.SanPhamRepository;
import com.bookstore.service.SanPhamService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class SanPhamServiceImpl extends BaseServiceImpl<SanPhamEntity, Long> implements SanPhamService {
    private final SanPhamRepository repository;

    public SanPhamServiceImpl(SanPhamRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<SanPhamEntity, Long> getRepository() {
        return repository;
    }
}
