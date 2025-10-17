package com.bookstore.service.impl;

import com.bookstore.entity.KhoEntity;
import com.bookstore.repository.KhoRepository;
import com.bookstore.service.KhoService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class KhoServiceImpl extends BaseServiceImpl<KhoEntity, Long> implements KhoService {
    private final KhoRepository repository;

    public KhoServiceImpl(KhoRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<KhoEntity, Long> getRepository() {
        return repository;
    }
}
