package com.bookstore.service.impl;

import com.bookstore.entity.KhuyenMaiEntity;
import com.bookstore.repository.KhuyenMaiRepository;
import com.bookstore.service.KhuyenMaiService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class KhuyenMaiServiceImpl extends BaseServiceImpl<KhuyenMaiEntity, Long> implements KhuyenMaiService {
    private final KhuyenMaiRepository repository;

    public KhuyenMaiServiceImpl(KhuyenMaiRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<KhuyenMaiEntity, Long> getRepository() {
        return repository;
    }
}
