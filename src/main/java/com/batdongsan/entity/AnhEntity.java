package com.batdongsan.entity;

import javax.persistence.*;

@Entity
@Table(name = "anh")
public class AnhEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "src")
    private String src;

    @ManyToOne
    @JoinColumn(name = "baiDangId")
    private BaiDangEntity baiDangEntity;

    public AnhEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public BaiDangEntity getBaiDangEntity() {
        return baiDangEntity;
    }

    public void setBaiDangEntity(BaiDangEntity baiDangEntity) {
        this.baiDangEntity = baiDangEntity;
    }
}
