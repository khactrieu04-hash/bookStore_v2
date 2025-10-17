package com.bookstore.service.impl;

import com.bookstore.entity.GioHangEntity;
import com.bookstore.repository.GioHangRepository;
import com.bookstore.service.GioHangService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class GioHangServiceImpl extends BaseServiceImpl<GioHangEntity, Long> implements GioHangService {
    private final GioHangRepository repository;

    public GioHangServiceImpl(GioHangRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<GioHangEntity, Long> getRepository() {
        return repository;
    }
}
