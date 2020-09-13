package com.batdongsan.model;

//import org.springframework.stereotype.Controller;

import com.batdongsan.entity.*;

import javax.persistence.*;
import java.util.List;

public class TaiKhoanModel {
    private int id;
    private int thoiHanKhoa;
    private String tenDangNhap;
    private String matKhau;
    private String email;
    private String hoTen;
    private String soDienThoai;
    private String diaChi;
    private String kichHoat;
    private int trangThai;
    private List<BaiDangEntity> baiDangEntities;
    private List<LichSuEntity> lichSuEntities;
    private List<DauTinEntity> dauTinEntities;
    private int thoiHanKhoaEntity;
    private String password;
    private String password1;
    private String password2;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword1() {
        return password1;
    }

    public void setPassword1(String password1) {
        this.password1 = password1;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public List<DauTinEntity> getDauTinEntities() {
        return dauTinEntities;
    }

    public void setDauTinEntities(List<DauTinEntity> dauTinEntities) {
        this.dauTinEntities = dauTinEntities;
    }

    public List<LichSuEntity> getLichSuEntities() {
        return lichSuEntities;
    }

    public void setLichSuEntities(List<LichSuEntity> lichSuEntities) {
        this.lichSuEntities = lichSuEntities;
    }

    public TaiKhoanModel() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getKichHoat() {
        return kichHoat;
    }

    public void setKichHoat(String kichHoat) {
        this.kichHoat = kichHoat;
    }


    public List<BaiDangEntity> getBaiDangEntities() {
        return baiDangEntities;
    }

    public void setBaiDangEntities(List<BaiDangEntity> baiDangEntities) {
        this.baiDangEntities = baiDangEntities;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    public int getThoiHanKhoaEntity() {
        return thoiHanKhoaEntity;
    }

    public void setThoiHanKhoaEntity(int thoiHanKhoaEntity) {
        this.thoiHanKhoaEntity = thoiHanKhoaEntity;
    }

    public int getThoiHanKhoa() {
        return thoiHanKhoa;
    }

    public void setThoiHanKhoa(int thoiHanKhoa) {
        this.thoiHanKhoa = thoiHanKhoa;
    }
}
