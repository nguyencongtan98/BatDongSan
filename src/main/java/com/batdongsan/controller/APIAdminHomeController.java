package com.batdongsan.controller;

import com.batdongsan.entity.BaiDangEntity;
import com.batdongsan.entity.LoaiTinEntity;
import com.batdongsan.model.*;
import com.batdongsan.repository.DanhMucRepository;
import com.batdongsan.repository.LoaiTinRepository;
import com.batdongsan.service.*;
import com.batdongsan.validators.CheckLoaiTin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;

@RestController(value = "controllerAPI")
public class APIAdminHomeController {

    @Autowired
    private ITaiKhoanService taiKhoanService;

    @Autowired
    private ILoaiTinService loaiTinService;

    @Autowired
    private IBaiDangService baiDangService;

    @Autowired
    private IThoiHanService thoiHanService;

    @Autowired
    private IDanhMucService danhMucService;

    @Autowired
    private LoaiTinRepository loaiTinRepository;

    @PutMapping("/admin/updatethoihan")
    public ThoiHanModel updateThoiHan(@RequestBody ThoiHanModel thoiHanModel) {
        return thoiHanService.update(thoiHanModel);
    }

    @PostMapping("/admin/addthoihan")
    public ThoiHanModel addThoiHan(@RequestBody ThoiHanModel thoiHanModel) {
        return thoiHanService.insert(thoiHanModel);
    }

    @DeleteMapping("/admin/xoathoihan")
    public void xoaThoiHan(@RequestBody long[] ids){
        thoiHanService.delete(ids);
    }


    @GetMapping("/admin/searchloaitin")
    public List<LoaiTinModel> searchLoaiTin(@RequestBody LoaiTinModel loaiTinModel) {
        return loaiTinService.search(loaiTinModel);
    }

    @PutMapping("/admin/updateloaitin")
    public LoaiTinModel updateLoaiTin(@RequestBody LoaiTinModel loaiTinModel) {
        return loaiTinService.update(loaiTinModel);
    }

    @PostMapping("/admin/addloaitin")
    public LoaiTinModel addLoaiTin(@RequestBody LoaiTinModel loaiTinModel) {
        return loaiTinService.insert(loaiTinModel);
    }

    @DeleteMapping("/admin/xoaloaitin")
    public void xoaLoaiTin(@RequestBody long[] ids){
        loaiTinService.delete(ids);
    }

    @PutMapping("/admin/duyetbaidang")
    public BaiDangModel updateBaiDang(@RequestBody BaiDangModel baiDangModel) {
        return baiDangService.duyetbaidang(baiDangModel);
    }

    @PutMapping("/admin/thaobaidang")
    public BaiDangModel thaoBaiDang(@RequestBody BaiDangModel baiDangModel) {
        return baiDangService.thaobaidang(baiDangModel);
    }

    @DeleteMapping("/admin/xoabaidang")
    public void xoaBaiDang(@RequestBody long[] ids){
        baiDangService.delete(ids);
    }

    @PostMapping("/admin/adddanhmuc")
    public DanhMucModel addDanhMuc(@RequestBody DanhMucModel danhMucModel) {
        return danhMucService.insert(danhMucModel);
    }

    @PutMapping("/admin/updatedanhmuc")
    public DanhMucModel updateDanhMuc(@RequestBody DanhMucModel danhMucModel) {
        return danhMucService.update(danhMucModel);
    }

    @DeleteMapping("/admin/xoadanhmuc")
    public void xoaDanhMuc(@RequestBody long[] ids){
        danhMucService.delete(ids);
    }


    @PutMapping("/admin/khoataikhoan")
    public TaiKhoanModel lockTaiKhoanUser(@RequestBody TaiKhoanModel taiKhoanModel , HttpServletRequest request) {
        return taiKhoanService.khoaTaiKhoanUser(taiKhoanModel , request);
    }

    @PutMapping("/admin/khoataikhoanadmin")
    public TaiKhoanModel lockTaiKhoanAdmin(@RequestBody TaiKhoanModel taiKhoanModel, HttpServletRequest request) {
        return taiKhoanService.khoaTaiKhoanAdmin(taiKhoanModel,request);
    }

    @PutMapping("/admin/motaikhoan")
    public TaiKhoanModel unLockTaiKhoan(@RequestBody TaiKhoanModel taiKhoanModel , HttpServletRequest request) throws ParseException {
        return taiKhoanService.moTaiKhoan(taiKhoanModel , request);
    }

    @PutMapping("/admin/motaikhoanadmin")
    public TaiKhoanModel unLockTaiKhoanAdmin(@RequestBody TaiKhoanModel taiKhoanModel, HttpServletRequest request) {
        return taiKhoanService.moTaiKhoanAdmin(taiKhoanModel,request);
    }

    @DeleteMapping("/admin/xoataikhoanadmin")
    public void xoaTaiKhoanAdmin(@RequestBody long[] ids , HttpServletRequest request) {
        taiKhoanService.deleteAdmin(ids , request);
    }

    @DeleteMapping("/admin/xoataikhoanuser")
    public void xoaTaiKhoanUser(@RequestBody long[] ids) {
        taiKhoanService.deleteUser(ids);
    }

    @PutMapping("/admin/khoiphuctaikhoan")
    public TaiKhoanModel khoiPhucTaiKhoan(@RequestBody TaiKhoanModel taiKhoanModel , HttpServletRequest request) {
        return taiKhoanService.khoiPhucTaiKhoan(taiKhoanModel , request);
    }

    @PutMapping("/admin/capnhatthongtin")
    public TaiKhoanModel capNhatThongTinCaNhan(@RequestBody TaiKhoanModel taiKhoanModel) {
        return taiKhoanService.capNhatThongTin(taiKhoanModel);
    }

    @PutMapping("/admin/doimatkhau")
    public TaiKhoanModel doiMatKhau(@RequestBody TaiKhoanModel taiKhoanModel) {
        return taiKhoanService.doiMatKhau(taiKhoanModel);
    }

    /*@GetMapping("/admin/searchthoihan")
    public ThoiHanModel searchThoiHan(@RequestBody ThoiHanModel thoiHanModel) {
        return thoiHanService.insert(thoiHanModel);
    }*/
    /*@PutMapping("/admin/updatethoihan")
    public ThoiHanEntity updateNew(@RequestBody ThoiHanEntity thoiHanEntity) {
        return thoiHanRepository.save(thoiHanEntity);
    }*/
}
