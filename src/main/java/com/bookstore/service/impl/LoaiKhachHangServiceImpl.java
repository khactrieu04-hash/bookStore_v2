package com.bookstore.service.impl;

import com.bookstore.entity.LoaiKhachHangEntity;
import com.bookstore.repository.LoaiKhachHangRepository;
import com.bookstore.service.LoaiKhachHangService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class LoaiKhachHangServiceImpl extends BaseServiceImpl<LoaiKhachHangEntity, Long> implements LoaiKhachHangService {
    private final LoaiKhachHangRepository repository;

    public LoaiKhachHangServiceImpl(LoaiKhachHangRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<LoaiKhachHangEntity, Long> getRepository() {
        return repository;
    }
}
