package com.bookstore.service.impl;

import com.bookstore.entity.NhaCungCapEntity;
import com.bookstore.repository.NhaCungCapRepository;
import com.bookstore.service.NhaCungCapService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class NhaCungCapServiceImpl extends BaseServiceImpl<NhaCungCapEntity, Long> implements NhaCungCapService {
    private final NhaCungCapRepository repository;

    public NhaCungCapServiceImpl(NhaCungCapRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<NhaCungCapEntity, Long> getRepository() {
        return repository;
    }
}
