package com.batdongsan.repository;

import com.batdongsan.entity.DanhMucEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DanhMucRepository extends CrudRepository<DanhMucEntity, Integer> {
    List<DanhMucEntity> findByLoaiTinEntityId(int id);
    DanhMucEntity findByTenDanhMuc(String tenDanhMuc);
    List<DanhMucEntity> findByTenDanhMucContaining(String searchInput);
    Long countByTenDanhMucContaining (String searchInput);
    @Query("select b from DanhMucEntity b ORDER BY b.id desc ")
    List<DanhMucEntity> findAllDesc();
}
