package com.bookstore.service.impl;

import com.bookstore.entity.YeuThichEntity;
import com.bookstore.repository.YeuThichRepository;
import com.bookstore.service.YeuThichService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class YeuThichServiceImpl extends BaseServiceImpl<YeuThichEntity, Long> implements YeuThichService {
    private final YeuThichRepository repository;

    public YeuThichServiceImpl(YeuThichRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<YeuThichEntity, Long> getRepository() {
        return repository;
    }
}
