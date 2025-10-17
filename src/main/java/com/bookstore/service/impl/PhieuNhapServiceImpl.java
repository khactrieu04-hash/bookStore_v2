package com.bookstore.service.impl;

import com.bookstore.entity.PhieuNhapEntity;
import com.bookstore.repository.PhieuNhapRepository;
import com.bookstore.service.PhieuNhapService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class PhieuNhapServiceImpl extends BaseServiceImpl<PhieuNhapEntity, Long> implements PhieuNhapService {
    private final PhieuNhapRepository repository;

    public PhieuNhapServiceImpl(PhieuNhapRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<PhieuNhapEntity, Long> getRepository() {
        return repository;
    }
}
