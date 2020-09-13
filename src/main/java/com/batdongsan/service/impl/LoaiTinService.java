package com.batdongsan.service.impl;

import com.batdongsan.converter.LoaiTinConverter;
import com.batdongsan.entity.DanhMucEntity;
import com.batdongsan.entity.LoaiTinEntity;
import com.batdongsan.model.LoaiTinModel;
import com.batdongsan.repository.DanhMucRepository;
import com.batdongsan.repository.LoaiTinRepository;
import com.batdongsan.service.ILoaiTinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class LoaiTinService implements ILoaiTinService {

    @Autowired
    private DanhMucRepository danhMucRepository;

    @Autowired
    private LoaiTinRepository loaiTinRepository;

    @Autowired
    private LoaiTinConverter loaiTinConverter;

    @Override
    @Transactional
    public LoaiTinModel update(LoaiTinModel loaiTinModel) {
        List<LoaiTinEntity> list = (List<LoaiTinEntity>) loaiTinRepository.findAll();
        for (LoaiTinEntity item : list) {
            if (loaiTinModel.getTenLoaiTin().equals(item.getTenLoaiTin())) {
                loaiTinModel.setId(0);
                return loaiTinModel;
            }
        }
        LoaiTinEntity oldLoaiTin = loaiTinRepository.findOne(loaiTinModel.getId());
        oldLoaiTin = loaiTinConverter.toEntity(oldLoaiTin, loaiTinModel);
        oldLoaiTin = loaiTinRepository.save(oldLoaiTin);
        return loaiTinConverter.toDto(oldLoaiTin);
    }

    @Override
    @Transactional
    public LoaiTinModel insert(LoaiTinModel loaiTinModel) {
        //ktra trùng trong csdl
        LoaiTinEntity loaiTinEntity = loaiTinRepository.findByTenLoaiTin(loaiTinModel.getTenLoaiTin());
        // ktra chính xác theo tên loại tin có trong csdl
        // if trùng thì ko cho thêm
        if (loaiTinEntity != null) {

        } else {
            LoaiTinEntity loaiTinEntity1 = new LoaiTinEntity();
            loaiTinEntity1.setTenLoaiTin(loaiTinModel.getTenLoaiTin());
            loaiTinEntity1 = loaiTinRepository.save(loaiTinEntity1);
            loaiTinModel.setTenLoaiTin(loaiTinEntity1.getTenLoaiTin());
            loaiTinModel.setId(loaiTinEntity1.getId());
        }
        // ktra xem cái tên loại tin khi client gửi về có giá trị ko
        // isempty là ko nhập gì
        // nếu nhập dấu cách thì vẫn có giá trị nhưng là rỗng
        /*if(loaiTinModel.getTenLoaiTin().isEmpty()){
            return null;
        }*/
        // xét cho giá trị rỗng
        /*if(loaiTinModel.getTenLoaiTin() == ""){
            return null;
        }*/
        return loaiTinModel;
    }

    @Override
    public List<LoaiTinModel> search(LoaiTinModel loaiTinModel) {
        List<LoaiTinEntity> list = loaiTinRepository.findByTenLoaiTinContaining(loaiTinModel.getSearchInput());
        List<LoaiTinModel> loaiTinModels = new ArrayList<>();
        loaiTinModels.add((LoaiTinModel) list);
        return loaiTinModels;
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        // có 2 tr / hợp xảy ra
        // có id và ko có id
        // ko có id thì xử lý ngoài giao diện , ko cho kích vào nút xóa khi ko tít bài cần xóa
        // nếu có thì:
        for (long id : ids) {
            //loai tin ràng buộc vs danh mục nên muốn xóa loại tin thì xóa danh mục trước
            List<DanhMucEntity> list = danhMucRepository.findByLoaiTinEntityId((int) id);
            for (DanhMucEntity item : list) {
                danhMucRepository.delete(item.getId());
            }
            loaiTinRepository.delete((int) id);
        }
    }
}
