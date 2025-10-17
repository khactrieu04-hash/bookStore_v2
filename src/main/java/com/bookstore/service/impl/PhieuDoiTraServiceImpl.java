package com.bookstore.service.impl;

import com.bookstore.entity.PhieuDoiTraEntity;
import com.bookstore.repository.PhieuDoiTraRepository;
import com.bookstore.service.PhieuDoiTraService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class PhieuDoiTraServiceImpl extends BaseServiceImpl<PhieuDoiTraEntity, Long> implements PhieuDoiTraService {
    private final PhieuDoiTraRepository repository;

    public PhieuDoiTraServiceImpl(PhieuDoiTraRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<PhieuDoiTraEntity, Long> getRepository() {
        return repository;
    }
}
