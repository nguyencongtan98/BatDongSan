package com.batdongsan.service;

import com.batdongsan.model.BaiDangModel;
import com.batdongsan.model.LoaiTinModel;

import java.util.List;

public interface IBaiDangService {
    BaiDangModel duyetbaidang (BaiDangModel baiDangModel);
    BaiDangModel thaobaidang (BaiDangModel baiDangModel);
    void delete(long[] ids);
}