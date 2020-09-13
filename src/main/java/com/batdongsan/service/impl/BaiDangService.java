package com.batdongsan.service.impl;

import com.batdongsan.entity.AnhEntity;
import com.batdongsan.entity.BaiDangEntity;
import com.batdongsan.entity.DauTinEntity;
import com.batdongsan.entity.LichSuEntity;
import com.batdongsan.model.BaiDangModel;
import com.batdongsan.model.LoaiTinModel;
import com.batdongsan.repository.*;
import com.batdongsan.service.IBaiDangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


@Service
public class BaiDangService implements IBaiDangService {

    @Autowired
    private AnhRepository anhRepository;

    @Autowired
    private LichSuRepository lichSuRepository;

    @Autowired
    private DauTinRepository dauTinRepository;

    @Autowired
    private BaiDangRepository baiDangRepository;

    @Override
    @Transactional
    public BaiDangModel duyetbaidang(BaiDangModel baiDangModel) {
        BaiDangEntity old = baiDangRepository.findOne(baiDangModel.getId());
        Calendar cal = Calendar.getInstance();
        /*cal.setTime(old.getNgayDang());*/
        // update tt từ 0 thành 1
        // update ngày hiện tại khi duyệt
        /*old.setNgayDang(cal.getTime());*/
        /*cal.add(Calendar.DATE,old.getThoiHanEntity().getSoNgay());//vd thời hank = 2 thì ngày tăng 2 ngày
        Calendar calendar = Calendar.getInstance();
        if(cal.getTime().compareTo(calendar.getTime()) <=0){
            old.setTrangThai(0);
        }*/
        old.setTrangThai(1);
        old.setNgayDuyet(cal.getTime());
        old = baiDangRepository.save(old);
        BaiDangModel model = new BaiDangModel();
        model.setTrangThai(old.getTrangThai());
        return model;
    }

    @Override
    @Transactional
    public BaiDangModel thaobaidang(BaiDangModel baiDangModel) {
        BaiDangEntity old = baiDangRepository.findOne(baiDangModel.getId());
        old.setTrangThai(0);
        old = baiDangRepository.save(old);
        BaiDangModel baiDangModel1 = new BaiDangModel();
        baiDangModel.setTrangThai(old.getTrangThai());
        return baiDangModel1;
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for(long id:ids){
            //ktra bảng dấu tin
            List<DauTinEntity> list = dauTinRepository.findByBaiDangEntityId((int) id);
            if(list.isEmpty()){

            }else {
                for (DauTinEntity item : list){
                    dauTinRepository.delete(item.getId());
                }
            }

            //ktra bảng lich sử
            List<LichSuEntity> list1 = lichSuRepository.findByBaiDangEntityId((int) id);
            if(list1.isEmpty()){

            }
            else {
                for(LichSuEntity item : list1){
                    lichSuRepository.delete(item.getId());
                }
            }

            //ktra bảng ảnh
            List<AnhEntity> list2 = anhRepository.findByBaiDangEntityId((int) id);
            if(list2.isEmpty()){

            }
            else {
                for(AnhEntity item : list2){
                    anhRepository.delete(item.getId());
                }
            }

            // xóa xong các bảng ràng buộc
            // thì xóa bài đăng
            baiDangRepository.delete((int) id);
        }
    }
}
