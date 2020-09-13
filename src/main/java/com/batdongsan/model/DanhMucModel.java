package com.batdongsan.model;

import com.batdongsan.entity.BaiDangEntity;
import com.batdongsan.entity.LoaiTinEntity;

import javax.persistence.*;
import java.util.List;

public class DanhMucModel {
    private int id;
    private String tenDanhMuc;
    private List<BaiDangEntity> baiDangEntities;
    private int loaiTinId;



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


    public int getLoaiTinId() {
        return loaiTinId;
    }

    public void setLoaiTinId(int loaiTinId) {
        this.loaiTinId = loaiTinId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
