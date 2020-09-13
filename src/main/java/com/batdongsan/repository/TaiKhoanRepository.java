package com.batdongsan.repository;

import com.batdongsan.entity.TaiKhoanEntity;
//import com.batdongsan.entity.ThanhVienEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TaiKhoanRepository extends CrudRepository<TaiKhoanEntity,Integer> {
    Integer countByEmail(String email);
    Integer countByEmailAndMatKhau(String email,String matKhau);
    TaiKhoanEntity findOneByStatusAndEmailAndTrangThai( int status , String tendangnhap,int trangthai);
    TaiKhoanEntity findByEmail(String email);
    List<TaiKhoanEntity> findByHoTenContainingAndTrangThaiAndStatus(String searhInput,int trangthai,int status);
    Integer countByTrangThaiAndStatus(int trangthai , int status);
    Integer countByHoTenContainingAndTrangThaiAndStatus(String searhInput,int trangthai,int status);
    List<TaiKhoanEntity> findByTrangThaiAndStatus(int trangthai , int status);

    List<TaiKhoanEntity> findByHoTenContaining(String searchInput);
}
