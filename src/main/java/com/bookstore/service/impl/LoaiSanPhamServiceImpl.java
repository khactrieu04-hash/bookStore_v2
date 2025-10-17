package com.bookstore.service.impl;

import com.bookstore.entity.LoaiSanPhamEntity;
import com.bookstore.repository.LoaiSanPhamRepository;
import com.bookstore.service.LoaiSanPhamService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class LoaiSanPhamServiceImpl extends BaseServiceImpl<LoaiSanPhamEntity, Long> implements LoaiSanPhamService {
    private final LoaiSanPhamRepository repository;

    public LoaiSanPhamServiceImpl(LoaiSanPhamRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<LoaiSanPhamEntity, Long> getRepository() {
        return repository;
    }
}
