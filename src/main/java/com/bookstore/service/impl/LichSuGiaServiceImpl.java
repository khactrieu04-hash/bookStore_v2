package com.bookstore.service.impl;

import com.bookstore.entity.LichSuGiaEntity;
import com.bookstore.repository.LichSuGiaRepository;
import com.bookstore.service.LichSuGiaService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class LichSuGiaServiceImpl extends BaseServiceImpl<LichSuGiaEntity, Long> implements LichSuGiaService {
    private final LichSuGiaRepository repository;

    public LichSuGiaServiceImpl(LichSuGiaRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<LichSuGiaEntity, Long> getRepository() {
        return repository;
    }
}
