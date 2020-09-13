package com.batdongsan.controller;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Product {
    private CommonsMultipartFile[] fileData;

    public Product() {
    }

    public CommonsMultipartFile[] getFileData() {
        return fileData;
    }

    public void setFileData(CommonsMultipartFile[] fileData) {
        this.fileData = fileData;
    }
}
