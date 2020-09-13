package com.batdongsan.converter;

import com.batdongsan.entity.BaiDangEntity;
import com.batdongsan.model.BaiDangModel;
import org.springframework.stereotype.Component;

@Component
public class BaiDangConverter {
    public BaiDangModel toDto(BaiDangEntity entity) {
        BaiDangModel result = new BaiDangModel();
        result.setId(entity.getId());
        result.setTieuDe(entity.getTieuDe());
        result.setNoiDung(entity.getNoiDung());
        result.setGia(entity.getGia());
        result.setNgayDang(entity.getNgayDang());
        result.setTrangThai(entity.getTrangThai());
        result.setDienTichDat(entity.getDienTichDat());
        result.setDienTichSuDung(entity.getDienTichSuDung());
        result.setPhongNgu(entity.getPhongNgu());
        result.setPhongTam(entity.getPhongTam());
        result.setTangLau(entity.getTangLau());
        result.setTinhThanhEntity(entity.getTinhThanhEntity());
        return result;
    }
}
