package com.batdongsan.repository;

import com.batdongsan.entity.ThoiHanEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ThoiHanRepository extends CrudRepository<ThoiHanEntity,Integer> {
    ThoiHanEntity findBySoNgay(int soNgay);
    List<ThoiHanEntity> findBySoNgayContaining(int searchInput);
    @Query("select b from ThoiHanEntity b ORDER BY b.id desc ")
    List<ThoiHanEntity> findAllDesc();
}
