package com.batdongsan.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "menhgia")
public class MenhGiaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "tenloaitin")
    private String tenMenhGia;

    @OneToMany(mappedBy = "menhGiaEntity")
    private List<BaiDangEntity> baiDangEntities;

    public MenhGiaEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenMenhGia() {
        return tenMenhGia;
    }

    public void setTenMenhGia(String tenMenhGia) {
        this.tenMenhGia = tenMenhGia;
    }

    public List<BaiDangEntity> getBaiDangEntities() {
        return baiDangEntities;
    }

    public void setBaiDangEntities(List<BaiDangEntity> baiDangEntities) {
        this.baiDangEntities = baiDangEntities;
    }
}
