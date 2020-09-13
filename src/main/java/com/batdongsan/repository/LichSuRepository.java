package com.batdongsan.repository;

import com.batdongsan.entity.LichSuEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LichSuRepository extends CrudRepository<LichSuEntity, Integer> {
    List<LichSuEntity> findByTaiKhoanEntityEmail(String email);
    List<LichSuEntity> findByBaiDangEntityIdOrderByGiaDeXuatDesc(int id);
    List<LichSuEntity> findByBaiDangEntityId(int id);
    List<LichSuEntity> findByTaiKhoanEntityId(int id);
}
