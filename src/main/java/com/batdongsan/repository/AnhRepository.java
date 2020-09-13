package com.batdongsan.repository;

import com.batdongsan.entity.AnhEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AnhRepository extends CrudRepository<AnhEntity, Integer> {
    List<AnhEntity> findByBaiDangEntityId(int id);
}
