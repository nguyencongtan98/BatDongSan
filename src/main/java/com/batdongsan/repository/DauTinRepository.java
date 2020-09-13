package com.batdongsan.repository;

import com.batdongsan.entity.DauTinEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DauTinRepository extends CrudRepository<DauTinEntity , Integer> {
    List<DauTinEntity> findByTaiKhoanEntityId(int id);
    List<DauTinEntity> findByBaiDangEntityId(int id);
}
