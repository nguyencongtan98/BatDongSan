package com.batdongsan.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "thoihan")
public class ThoiHanEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "songay")
    private int soNgay;

    @OneToMany(mappedBy = "thoiHanEntity")
    private List<BaiDangEntity> baiDangEntities;

    public ThoiHanEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSoNgay() {
        return soNgay;
    }

    public void setSoNgay(int soNgay) {
        this.soNgay = soNgay;
    }

    public List<BaiDangEntity> getBaiDangEntities() {
        return baiDangEntities;
    }

    public void setBaiDangEntities(List<BaiDangEntity> baiDangEntities) {
        this.baiDangEntities = baiDangEntities;
    }
}
