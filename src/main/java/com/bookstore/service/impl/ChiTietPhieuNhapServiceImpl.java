package com.bookstore.service.impl;

import com.bookstore.entity.ChiTietPhieuNhapEntity;
import com.bookstore.repository.ChiTietPhieuNhapRepository;
import com.bookstore.service.ChiTietPhieuNhapService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class ChiTietPhieuNhapServiceImpl extends BaseServiceImpl<ChiTietPhieuNhapEntity, Long> implements ChiTietPhieuNhapService {
    private final ChiTietPhieuNhapRepository repository;

    public ChiTietPhieuNhapServiceImpl(ChiTietPhieuNhapRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<ChiTietPhieuNhapEntity, Long> getRepository() {
        return repository;
    }
}
