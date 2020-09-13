package com.batdongsan.entity;

import javax.persistence.*;

@Entity
@Table(name = "dautin")
public class DauTinEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "taiKhoanId")
    private TaiKhoanEntity taiKhoanEntity;

    @ManyToOne
    @JoinColumn(name = "baiDangId")
    private BaiDangEntity baiDangEntity;

    public DauTinEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public TaiKhoanEntity getTaiKhoanEntity() {
        return taiKhoanEntity;
    }

    public void setTaiKhoanEntity(TaiKhoanEntity taiKhoanEntity) {
        this.taiKhoanEntity = taiKhoanEntity;
    }

    public BaiDangEntity getBaiDangEntity() {
        return baiDangEntity;
    }

    public void setBaiDangEntity(BaiDangEntity baiDangEntity) {
        this.baiDangEntity = baiDangEntity;
    }
}
