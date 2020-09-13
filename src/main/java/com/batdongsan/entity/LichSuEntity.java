package com.batdongsan.entity;

import javax.persistence.*;

@Entity
@Table(name = "lichsu")
public class LichSuEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "giadexuat")
    private double giaDeXuat;

    @ManyToOne
    @JoinColumn(name = "baiDangId")
    private BaiDangEntity baiDangEntity;

    @ManyToOne
    @JoinColumn(name = "taiKhoanId")
    private TaiKhoanEntity taiKhoanEntity;

    public TaiKhoanEntity getTaiKhoanEntity() {
        return taiKhoanEntity;
    }

    public void setTaiKhoanEntity(TaiKhoanEntity taiKhoanEntity) {
        this.taiKhoanEntity = taiKhoanEntity;
    }

    public LichSuEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getGiaDeXuat() {
        return giaDeXuat;
    }

    public void setGiaDeXuat(double giaDeXuat) {
        this.giaDeXuat = giaDeXuat;
    }

    public BaiDangEntity getBaiDangEntity() {
        return baiDangEntity;
    }

    public void setBaiDangEntity(BaiDangEntity baiDangEntity) {
        this.baiDangEntity = baiDangEntity;
    }

}
