package com.batdongsan.validators;

import com.batdongsan.model.LoaiTinModel;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


@Component
public class CheckLoaiTin implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.equals(LoaiTinModel.class);
    }

    @Override
    public void validate(Object target, Errors errors) {
        LoaiTinModel loaiTinModel = (LoaiTinModel) target;
        if(loaiTinModel.getTenLoaiTin().matches("")){
            errors.rejectValue("tenLoaiTin","Tên loại tin không được để trống!");
        }
    }
}
