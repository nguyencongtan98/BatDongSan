package com.batdongsan.model;

public class ThoiHanModel {

    private int id;
    private int soNgay;
    private  int searchInput;
    private long[] ids;


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

    public int getSearchInput() {
        return searchInput;
    }

    public void setSearchInput(int searchInput) {
        this.searchInput = searchInput;
    }

    public long[] getIds() {
        return ids;
    }

    public void setIds(long[] ids) {
        this.ids = ids;
    }
}
