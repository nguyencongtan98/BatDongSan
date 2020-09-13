package com.batdongsan.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "loaitin")
public class LoaiTinEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "tenloaitin")
    private String tenLoaiTin;

    @OneToMany(mappedBy = "loaiTinEntity")
    private List<DanhMucEntity> danhMucEntities;

    public LoaiTinEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenLoaiTin() {
        return tenLoaiTin;
    }

    public void setTenLoaiTin(String tenLoaiTin) {
        this.tenLoaiTin = tenLoaiTin;
    }

    public List<DanhMucEntity> getDanhMucEntities() {
        return danhMucEntities;
    }

    public void setDanhMucEntities(List<DanhMucEntity> danhMucEntities) {
        this.danhMucEntities = danhMucEntities;
    }
}
