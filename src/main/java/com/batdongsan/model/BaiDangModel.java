package com.batdongsan.model;

import com.batdongsan.entity.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BaiDangModel {
    private int id;
    private String tieuDe;
    private String noiDung;
    private double gia;
    private Date ngayDang;
    private int trangThai;
    private int soSao;
    private double dienTichDat;
    private int tangLau;
    private int phongNgu;
    private int phongTam;
    private double dienTichSuDung;
    private String searchInput;
    private List<BaiDangModel> listResult = new ArrayList<>();

    private TaiKhoanEntity taiKhoanEntity;
    private MenhGiaEntity menhGiaEntity;
    private DanhMucEntity danhMucEntity;
    private TinhThanhEntity tinhThanhEntity;
    private ThoiHanEntity thoiHanEntity;

    public TaiKhoanEntity getTaiKhoanEntity() {
        return taiKhoanEntity;
    }

    public void setTaiKhoanEntity(TaiKhoanEntity taiKhoanEntity) {
        this.taiKhoanEntity = taiKhoanEntity;
    }

    public MenhGiaEntity getMenhGiaEntity() {
        return menhGiaEntity;
    }

    public void setMenhGiaEntity(MenhGiaEntity menhGiaEntity) {
        this.menhGiaEntity = menhGiaEntity;
    }

    public DanhMucEntity getDanhMucEntity() {
        return danhMucEntity;
    }

    public void setDanhMucEntity(DanhMucEntity danhMucEntity) {
        this.danhMucEntity = danhMucEntity;
    }

    public TinhThanhEntity getTinhThanhEntity() {
        return tinhThanhEntity;
    }

    public void setTinhThanhEntity(TinhThanhEntity tinhThanhEntity) {
        this.tinhThanhEntity = tinhThanhEntity;
    }

    public ThoiHanEntity getThoiHanEntity() {
        return thoiHanEntity;
    }

    public void setThoiHanEntity(ThoiHanEntity thoiHanEntity) {
        this.thoiHanEntity = thoiHanEntity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }


    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public Date getNgayDang() {
        return ngayDang;
    }

    public void setNgayDang(Date ngayDang) {
        this.ngayDang = ngayDang;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    public int getSoSao() {
        return soSao;
    }

    public void setSoSao(int soSao) {
        this.soSao = soSao;
    }

    public double getDienTichDat() {
        return dienTichDat;
    }

    public void setDienTichDat(double dienTichDat) {
        this.dienTichDat = dienTichDat;
    }

    public int getTangLau() {
        return tangLau;
    }

    public void setTangLau(int tangLau) {
        this.tangLau = tangLau;
    }

    public int getPhongNgu() {
        return phongNgu;
    }

    public void setPhongNgu(int phongNgu) {
        this.phongNgu = phongNgu;
    }

    public int getPhongTam() {
        return phongTam;
    }

    public void setPhongTam(int phongTam) {
        this.phongTam = phongTam;
    }

    public double getDienTichSuDung() {
        return dienTichSuDung;
    }

    public void setDienTichSuDung(double dienTichSuDung) {
        this.dienTichSuDung = dienTichSuDung;
    }

    public String getSearchInput() {
        return searchInput;
    }

    public void setSearchInput(String searchInput) {
        this.searchInput = searchInput;
    }

    public List<BaiDangModel> getListResult() {
        return listResult;
    }

    public void setListResult(List<BaiDangModel> listResult) {
        this.listResult = listResult;
    }
}
