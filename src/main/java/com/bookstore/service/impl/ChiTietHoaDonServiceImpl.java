package com.bookstore.service.impl;

import com.bookstore.entity.ChiTietHoaDonEntity;
import com.bookstore.repository.ChiTietHoaDonRepository;
import com.bookstore.service.ChiTietHoaDonService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class ChiTietHoaDonServiceImpl extends BaseServiceImpl<ChiTietHoaDonEntity, Long> implements ChiTietHoaDonService {
    private final ChiTietHoaDonRepository repository;

    public ChiTietHoaDonServiceImpl(ChiTietHoaDonRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<ChiTietHoaDonEntity, Long> getRepository() {
        return repository;
    }
}
