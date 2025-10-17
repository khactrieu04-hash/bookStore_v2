package com.bookstore.service.impl;

import com.bookstore.entity.KhachHangEntity;
import com.bookstore.repository.KhachHangRepository;
import com.bookstore.service.KhachHangService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class KhachHangServiceImpl extends BaseServiceImpl<KhachHangEntity, Long> implements KhachHangService {
    private final KhachHangRepository repository;

    public KhachHangServiceImpl(KhachHangRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<KhachHangEntity, Long> getRepository() {
        return repository;
    }
}
