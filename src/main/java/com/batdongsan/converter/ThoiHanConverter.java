package com.batdongsan.converter;

import com.batdongsan.entity.ThoiHanEntity;
import com.batdongsan.model.ThoiHanModel;
import org.springframework.stereotype.Component;

@Component
public class ThoiHanConverter {
	
	//truyền từ entity sang DTO
	public ThoiHanModel toDto(ThoiHanEntity entity) {
		ThoiHanModel result = new ThoiHanModel();
		result.setId(entity.getId());
		result.setSoNgay(entity.getSoNgay());
		return result;
	}
	
	//truyền từ DTO sang entity với NewEntity mới (khi thêm mới thì có entity mới)
	
	public ThoiHanEntity toEntity(ThoiHanModel dto) {
		ThoiHanEntity result = new ThoiHanEntity();
		result.setSoNgay(dto.getSoNgay());
		return result;
	}
	//truyền từ DTO sang entity với NewEntity cũ (khi update)
	
	public ThoiHanEntity toEntity(ThoiHanEntity oldThoiHan ,ThoiHanModel dto) {
		oldThoiHan.setSoNgay(dto.getSoNgay());
		return oldThoiHan;
	}
}
