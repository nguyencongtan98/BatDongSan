package com.batdongsan.service.impl;

import com.batdongsan.entity.DanhMucEntity;
import com.batdongsan.entity.DauTinEntity;
import com.batdongsan.entity.LoaiTinEntity;
import com.batdongsan.model.DanhMucModel;
import com.batdongsan.repository.DanhMucRepository;
import com.batdongsan.repository.LoaiTinRepository;
import com.batdongsan.service.IDanhMucService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DanhMucService implements IDanhMucService {
    @Autowired
    private LoaiTinRepository loaiTinRepository;

    @Autowired
    private DanhMucRepository danhMucRepository;

    @Override
    @Transactional
    public DanhMucModel insert(DanhMucModel danhMucModel) {
        // kiá»ƒm tra tÃªn danh má»¥c trong báº£ng loáº¡i tin cÃ³ tá»“n táº¡i hay chÆ°a
        // má»™t loáº¡i tin thÃ¬ cÃ³ ráº¥t nhiá»�u danh má»¥c nhÆ°ng má»—i danh má»¥c lÃ  khÃ¡c nhau
        LoaiTinEntity loaiTinEntity = loaiTinRepository.findOne(danhMucModel.getLoaiTinId());
        List<DanhMucEntity> danhMucEntities = danhMucRepository.findByLoaiTinEntityId(danhMucModel.getLoaiTinId());
        for(DanhMucEntity item : danhMucEntities){
            if(item.getTenDanhMuc().equals(danhMucModel.getTenDanhMuc())){
                danhMucModel.setId(0);
                return danhMucModel;
            }
        }
        DanhMucEntity danhMucEntity = new DanhMucEntity();
        danhMucEntity.setTenDanhMuc(danhMucModel.getTenDanhMuc());
        danhMucEntity.setLoaiTinEntity(loaiTinEntity);
        danhMucEntity = danhMucRepository.save(danhMucEntity);
        danhMucModel.setId(danhMucEntity.getId());
        danhMucModel.setTenDanhMuc(danhMucEntity.getTenDanhMuc());
        return danhMucModel;
    }

    @Override
    @Transactional
    public DanhMucModel update(DanhMucModel danhMucModel) {
        LoaiTinEntity loaiTinEntity = loaiTinRepository.findOne(danhMucModel.getLoaiTinId());
        List<DanhMucEntity> danhMucEntities = danhMucRepository.findByLoaiTinEntityId(danhMucModel.getLoaiTinId());
        for(DanhMucEntity item : danhMucEntities){
            if(item.getTenDanhMuc().equals(danhMucModel.getTenDanhMuc())){
                danhMucModel.setId(0);
                return danhMucModel;
            }
        }
        DanhMucEntity danhMucEntity = new DanhMucEntity();
        danhMucEntity.setTenDanhMuc(danhMucModel.getTenDanhMuc());
        danhMucEntity.setLoaiTinEntity(loaiTinEntity);
        danhMucEntity.setId(danhMucModel.getId());
        danhMucEntity = danhMucRepository.save(danhMucEntity);
        danhMucModel.setId(danhMucEntity.getId());
        danhMucModel.setTenDanhMuc(danhMucEntity.getTenDanhMuc());
        danhMucModel.setLoaiTinId(danhMucEntity.getLoaiTinEntity().getId());
        return danhMucModel;

    }

    @Override
    public DanhMucModel save(DanhMucModel danhMucModel) {
        return null;
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for(long id:ids){
            danhMucRepository.delete((int) id);
        }
    }
}
