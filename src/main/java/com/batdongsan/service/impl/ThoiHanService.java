package com.batdongsan.service.impl;

import com.batdongsan.converter.ThoiHanConverter;
import com.batdongsan.entity.ThoiHanEntity;
import com.batdongsan.model.ThoiHanModel;
import com.batdongsan.repository.ThoiHanRepository;
import com.batdongsan.service.IThoiHanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

@Service
public class ThoiHanService implements IThoiHanService {

    @Autowired
    private ThoiHanConverter thoiHanConverter;

    @Autowired
    private ThoiHanRepository thoiHanRepository;

    @Override
    @Transactional
    public ThoiHanModel update(ThoiHanModel thoiHanModel) {
        List<ThoiHanEntity> thoiHanEntityList = (List<ThoiHanEntity>) thoiHanRepository.findAll();
        for (ThoiHanEntity item : thoiHanEntityList) {
            if (thoiHanModel.getSoNgay() == item.getSoNgay()) {
                thoiHanModel.setId(0);
                return thoiHanModel;
            }
        }
        ThoiHanEntity oldThoiHan = thoiHanRepository.findOne(thoiHanModel.getId());
        oldThoiHan = thoiHanConverter.toEntity(oldThoiHan, thoiHanModel);
        oldThoiHan = thoiHanRepository.save(oldThoiHan);
        return thoiHanConverter.toDto(oldThoiHan);
    }

    @Override
    @Transactional
    public ThoiHanModel insert(ThoiHanModel thoiHanModel) {
        // ktra khi de trong so ngay
        //-----
        //ktra khi nhap so ngay = 0
        ThoiHanEntity thoiHanEntity = thoiHanRepository.findBySoNgay(thoiHanModel.getSoNgay());
        if(thoiHanEntity!=null){

        }
        else {
            ThoiHanEntity thoiHanEntity1 = thoiHanConverter.toEntity(thoiHanModel);
            thoiHanEntity1 = thoiHanRepository.save(thoiHanEntity1);//đổ dữ liệu từ model sang entity để lưu xuống csdl
            thoiHanModel = thoiHanConverter.toDto(thoiHanEntity1);//đổ dữ liệu đã lưu xuống csdl qua model để trả ra view
        }
        return thoiHanModel;
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for (long id:ids){
            thoiHanRepository.delete((int) id);
        }
    }

    /*@Override
    public ThoiHanModel search(ThoiHanModel thoiHanModel) {
        List<ThoiHanEntity> list;
        // ko có giá trị
        if(thoiHanModel.getSearchInput() == 0){
            list = (List<ThoiHanEntity>) thoiHanRepository.findAll();
        }
        // có giá trị tồn tại trong csdl
        else{
            list = thoiHanRepository.findBySoNgayContaining(thoiHanModel.getSearchInput());
        }
        // có nhưng k tồn tại trong csdl
        if(list != thoiHanRepository.findBySoNgayContaining(thoiHanModel.getSearchInput())){
            System.out.println("ko có trong csdl");
            return null;
        }
        for (ThoiHanEntity iten:list) {
            ThoiHanModel model = new ThoiHanModel();
            model.setSoNgay(iten.getSoNgay());
            return model;
        }
        return thoiHanModel;
    }*/
}
