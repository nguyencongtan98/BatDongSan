package com.batdongsan.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "thoihankhoa")
public class ThoiHanKhoaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "songaykhoa")
    private int soNgayKhoa;

    @OneToMany(mappedBy = "thoiHanKhoaEntity")
    private List<TaiKhoanEntity> taiKhoanEntities;

    public ThoiHanKhoaEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSoNgayKhoa() {
        return soNgayKhoa;
    }

    public void setSoNgayKhoa(int soNgayKhoa) {
        this.soNgayKhoa = soNgayKhoa;
    }

    public List<TaiKhoanEntity> getTaiKhoanEntities() {
        return taiKhoanEntities;
    }

    public void setTaiKhoanEntities(List<TaiKhoanEntity> taiKhoanEntities) {
        this.taiKhoanEntities = taiKhoanEntities;
    }
}
