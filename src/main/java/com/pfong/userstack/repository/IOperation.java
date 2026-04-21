package com.pfong.userstack.repository;

import java.util.List;
import org.springframework.dao.DataAccessException;

public interface IOperation<T, K> {
    List<T> findAll() throws DataAccessException;

    T findById(K key) throws DataAccessException;

    String add(T entity) throws DataAccessException;

    boolean update(T entity, K key) throws DataAccessException;

    boolean delete(K key) throws DataAccessException;
}
