package com.batdongsan.converter;

import com.batdongsan.entity.LoaiTinEntity;
import com.batdongsan.entity.ThoiHanEntity;
import com.batdongsan.model.LoaiTinModel;
import com.batdongsan.model.ThoiHanModel;
import org.springframework.stereotype.Component;

@Component
public class LoaiTinConverter {

    public LoaiTinModel toDto(LoaiTinEntity entity) {
        LoaiTinModel result = new LoaiTinModel();
        result.setId(entity.getId());
        result.setTenLoaiTin(entity.getTenLoaiTin());
        return result;
    }

    public LoaiTinEntity toEntity(LoaiTinModel dto) {
        LoaiTinEntity result = new LoaiTinEntity();
        result.setId(dto.getId());
        result.setTenLoaiTin(dto.getTenLoaiTin());
        return result;
    }

    public LoaiTinEntity toEntity(LoaiTinEntity oldLoaiTin ,LoaiTinModel dto) {
        oldLoaiTin.setTenLoaiTin(dto.getTenLoaiTin());
        return oldLoaiTin;
    }
}
