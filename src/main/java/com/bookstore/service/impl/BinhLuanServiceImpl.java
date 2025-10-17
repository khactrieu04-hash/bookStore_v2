package com.bookstore.service.impl;

import com.bookstore.entity.BinhLuanEntity;
import com.bookstore.repository.BinhLuanRepository;
import com.bookstore.service.BinhLuanService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class BinhLuanServiceImpl extends BaseServiceImpl<BinhLuanEntity, Long> implements BinhLuanService {
    private final BinhLuanRepository repository;

    public BinhLuanServiceImpl(BinhLuanRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<BinhLuanEntity, Long> getRepository() {
        return repository;
    }
}
