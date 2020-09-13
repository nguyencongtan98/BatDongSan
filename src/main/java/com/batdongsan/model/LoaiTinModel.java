package com.batdongsan.model;

public class LoaiTinModel {

    private int id;
    private String tenLoaiTin;
    private  String searchInput;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }


    public String getSearchInput() {
        return searchInput;
    }

    public void setSearchInput(String searchInput) {
        this.searchInput = searchInput;
    }

    public String getTenLoaiTin() {
        return tenLoaiTin;
    }

    public void setTenLoaiTin(String tenLoaiTin) {
        this.tenLoaiTin = tenLoaiTin;
    }
}
