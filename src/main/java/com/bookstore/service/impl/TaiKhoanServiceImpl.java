package com.bookstore.service.impl;

import com.bookstore.entity.TaiKhoanEntity;
import com.bookstore.repository.TaiKhoanRepository;
import com.bookstore.service.TaiKhoanService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class TaiKhoanServiceImpl extends BaseServiceImpl<TaiKhoanEntity, Long> implements TaiKhoanService {
    private final TaiKhoanRepository repository;

    public TaiKhoanServiceImpl(TaiKhoanRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<TaiKhoanEntity, Long> getRepository() {
        return repository;
    }
}
