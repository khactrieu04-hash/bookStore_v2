package com.bookstore.service.impl;

import com.bookstore.entity.VaiTroEntity;
import com.bookstore.repository.VaiTroRepository;
import com.bookstore.service.VaiTroService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class VaiTroServiceImpl extends BaseServiceImpl<VaiTroEntity, Long> implements VaiTroService {
    private final VaiTroRepository repository;

    public VaiTroServiceImpl(VaiTroRepository repository) {
        this.repository = repository;
    }

    @Override
    protected JpaRepository<VaiTroEntity, Long> getRepository() {
        return repository;
    }
}
