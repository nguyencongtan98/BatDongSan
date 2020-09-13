package com.batdongsan.service;

import com.batdongsan.model.LoaiTinModel;

import java.util.List;

public interface ILoaiTinService {
    LoaiTinModel update (LoaiTinModel loaiTinModel);
    LoaiTinModel insert (LoaiTinModel loaiTinModel);
    List<LoaiTinModel> search (LoaiTinModel loaiTinModel);
    void delete(long[] ids);
}
