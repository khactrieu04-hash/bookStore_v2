package com.bookstore.service;

import java.util.List;
import java.util.Optional;

public interface BaseService<T, ID> {
    T create(T entity);
    T update(ID id, T entity);
    void delete(ID id);
    Optional<T> findById(ID id);
    List<T> findAll();
}
