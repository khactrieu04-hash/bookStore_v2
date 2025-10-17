package com.bookstore.service.impl;

import com.bookstore.entity.LoaiKhuyenMaiEntity;
import com.bookstore.repository.LoaiKhuyenMaiRepository;
import com.bookstore.service.LoaiKhuyenMaiService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class LoaiKhuyenMaiServiceImpl extends BaseServiceImpl<LoaiKhuyenMaiEntity, Long> implements LoaiKhuyenMaiService {
    private final LoaiKhuyenMaiRepository repository;

    public LoaiKhuyenMaiServiceImpl(LoaiKhuyenMaiRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<LoaiKhuyenMaiEntity, Long> getRepository() {
        return repository;
    }
}
