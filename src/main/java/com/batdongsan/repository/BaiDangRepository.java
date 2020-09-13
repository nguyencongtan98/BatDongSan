package com.batdongsan.repository;

import com.batdongsan.entity.BaiDangEntity;
import com.batdongsan.model.BaiDangModel;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface BaiDangRepository extends CrudRepository<BaiDangEntity, Integer> {

    List<BaiDangEntity> findByTinhThanhEntityId(int id);

    List<BaiDangEntity> findByDanhMucEntityId(int id);
    List<BaiDangEntity> findByDanhMucEntityLoaiTinEntityId(int id);

    List<BaiDangEntity> findByTaiKhoanEntityEmail(String email);

    List<BaiDangEntity> findByTrangThaiAndStatusOrderByNgayDuyetDesc(int trangThai , int status);
    List<BaiDangEntity> findByTrangThaiAndStatusOrderByIdDesc(int trangThai , int status);
    Long countByTrangThaiAndStatusOrderByIdDesc(int trangthai,int status);

    @Query("select b from BaiDangEntity b  ORDER BY b.ngayDang desc")
    List<BaiDangEntity> findAllDesc();

    @Query("update BaiDangEntity b SET b.tieuDe = tieuDe,b.noiDung = noiDung where b.id=id")
    Void Update(String tieuDe, String noiDung, int id);

    List<BaiDangEntity> findByStatusOrderByIdDesc(int status);

    Long countByStatus(int status);
    List<BaiDangEntity> findByTieuDeContaining(String searchInput);

    List<BaiDangEntity> findByTrangThai(int trangthai);

    List<BaiDangEntity> findByTieuDeContainingAndTrangThaiAndStatus(String searchInput, int trangthai , int status);

    Long countByTieuDeContainingAndTrangThaiAndStatus(String searchInput,int trangthai ,int status);

    List<BaiDangEntity> findByTieuDeContainingAndStatus(String searchInput,int status);
    Long countByTieuDeContainingAndStatus(String searchInput,int status);

    List<BaiDangEntity> findByTaiKhoanEntityId(int id);

    @Query(value = "SELECT b from BaiDangEntity b where b.trangThai =1 ORDER BY b.id ASC  ")
    List<BaiDangEntity> findBaiDangGiaRe();

    @Query(value = "SELECT b from BaiDangEntity b where b.trangThai =1 ORDER BY b.id desc ")
    List<BaiDangEntity> findBaiDangGiaCao();

    List<BaiDangEntity> findByStatus(int status);



    @Transactional
    @Modifying
    @Query("update BaiDangEntity bd set bd.tieuDe =:tieuDe, bd.noiDung=:noiDung,bd.gia =:gia, bd.phongNgu=:phongNgu,bd.phongTam=:phongTam,bd.tangLau=:tangLau where bd.id =:id")
    void upDateBaiDang(@Param("id") int id,@Param("tieuDe") String tieuDe, @Param("noiDung") String noiDung, @Param("phongTam") int phongTam,
    @Param("phongNgu") int phongNgu,@Param("tangLau") int tangLau);


}
