package com.batdongsan.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "tinhthanh")
public class TinhThanhEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "tentinhthanh")
    private String tenTinhThanh;

    @Column(name = "loai")
    private String loai;

    @OneToMany(mappedBy = "tinhThanhEntity")
    private List<BaiDangEntity> baiDangEntities;

    public TinhThanhEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenTinhThanh() {
        return tenTinhThanh;
    }

    public void setTenTinhThanh(String tenTinhThanh) {
        this.tenTinhThanh = tenTinhThanh;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

    public List<BaiDangEntity> getBaiDangEntities() {
        return baiDangEntities;
    }

    public void setBaiDangEntities(List<BaiDangEntity> baiDangEntities) {
        this.baiDangEntities = baiDangEntities;
    }
}
