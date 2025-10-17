package com.bookstore.service.impl;

import com.bookstore.entity.HoaDonEntity;
import com.bookstore.repository.HoaDonRepository;
import com.bookstore.service.HoaDonService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class HoaDonServiceImpl extends BaseServiceImpl<HoaDonEntity, Long> implements HoaDonService {
    private final HoaDonRepository repository;

    public HoaDonServiceImpl(HoaDonRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<HoaDonEntity, Long> getRepository() {
        return repository;
    }
}
