package com.batdongsan.service;

import com.batdongsan.model.ThoiHanModel;

public interface IThoiHanService {
    ThoiHanModel update(ThoiHanModel thoiHanModel);
    ThoiHanModel insert(ThoiHanModel thoiHanModel);
    void delete(long[] ids);
}
