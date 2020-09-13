package com.batdongsan.service;

import com.batdongsan.model.DanhMucModel;

public interface IDanhMucService {
    DanhMucModel insert(DanhMucModel danhMucModel);
    DanhMucModel update(DanhMucModel danhMucModel);
    DanhMucModel save(DanhMucModel danhMucModel);
    void delete(long[] ids);
}
