package com.batdongsan.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "danhmuc")
public class DanhMucEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "tendanhmuc")
    private String tenDanhMuc;

    @OneToMany(mappedBy = "danhMucEntity")
    private List<BaiDangEntity> baiDangEntities;

    @ManyToOne
    @JoinColumn(name = "loaiTinId")
    private LoaiTinEntity loaiTinEntity;

    public DanhMucEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenDanhMuc() {
        return tenDanhMuc;
    }

    public void setTenDanhMuc(String tenDanhMuc) {
        this.tenDanhMuc = tenDanhMuc;
    }

    public List<BaiDangEntity> getBaiDangEntities() {
        return baiDangEntities;
    }

    public void setBaiDangEntities(List<BaiDangEntity> baiDangEntities) {
        this.baiDangEntities = baiDangEntities;
    }

    public LoaiTinEntity getLoaiTinEntity() {
        return loaiTinEntity;
    }

    public void setLoaiTinEntity(LoaiTinEntity loaiTinEntity) {
        this.loaiTinEntity = loaiTinEntity;
    }
}
