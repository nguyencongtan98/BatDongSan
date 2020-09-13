package com.batdongsan.repository;

import com.batdongsan.entity.LoaiTinEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LoaiTinRepository extends CrudRepository<LoaiTinEntity, Integer> {
    LoaiTinEntity findByTenLoaiTin(String tenLoaiTin);
    List<LoaiTinEntity> findByTenLoaiTinContaining(String searchInput);
    Long countByTenLoaiTinContaining(String searchInput);
    @Query("select b from LoaiTinEntity b ORDER BY b.id desc ")
    List<LoaiTinEntity> findAllDesc();
}
