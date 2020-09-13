package com.batdongsan.controller;

import com.batdongsan.entity.*;
import com.batdongsan.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class AdminHomeController {


    @Autowired
    ThoiHanRepository thoiHanRepository;

    @Autowired
    HomeController homeController;
    @Autowired
    BaiDangRepository baiDangRepository;
    @Autowired
    LoaiTinRepository loaiTinRepository;
    @Autowired
    DanhMucRepository danhMucRepository;
    @Autowired
    TaiKhoanRepository taiKhoanRepository;


    @RequestMapping(value = "")
    public String showTrangChuAdmin(HttpServletRequest request){

        /*HttpSession session = request.getSession();
        if (session.getAttribute("email-admin") == null) {
            return "redirect:/login";
        }*/
        return "admin/admin-home";
    }

    @RequestMapping(value = "/showloaitin")
    public String hienThiLoaiTin(Model model){
        List<LoaiTinEntity> listLoaiTin = (List<LoaiTinEntity>) loaiTinRepository.findAllDesc();
        model.addAttribute("listLoaiTin",listLoaiTin);
        return "admin-themloaitin";
    }

    @RequestMapping(value = "/showdanhmuc")
    public String showDanhMuc(Model model){
        //lay danh sach danh muc
        List<DanhMucEntity> listDanhMuc = (List<DanhMucEntity>) danhMucRepository.findAllDesc();
        model.addAttribute("listDanhMuc",listDanhMuc);
        homeController.loadLoaiTin(model);
        return "admin-themdanhmuc";
    }



    @RequestMapping(value = "/baidangchuaduyet")
    public String showbaidang(Model model){
        List<BaiDangEntity> listBaiDang = (List<BaiDangEntity>) baiDangRepository.findByTrangThai(0);
        model.addAttribute("listBaiDang",listBaiDang);
        return "admin-qlbaidangchuaduyet";
    }

    @RequestMapping(value = "/baidangdaduyet")
    public String showBaidang(Model model){
        List<BaiDangEntity> listBaiDang = (List<BaiDangEntity>) baiDangRepository.findByTrangThai(1);
        model.addAttribute("listBaiDang",listBaiDang);
        return "admin-qlbaidang";
    }

    @RequestMapping(value = "/showbaidang")
    public String showBaiDang(Model model){
        List<BaiDangEntity> listBaiDang = (List<BaiDangEntity>) baiDangRepository.findAll();
        model.addAttribute("listBaiDang",listBaiDang);
        return "admin-qlbaidang";
    }



    @RequestMapping(value = "/showtaikhooan")
    public String showTaiKhoan(Model model) {
        //lay danh sach danh muc
        List<TaiKhoanEntity> listTaiKhoan = (List<TaiKhoanEntity>) taiKhoanRepository.findAll();
        model.addAttribute("listTaiKhoan", listTaiKhoan);
//        homeController.loadLoaiTin(model);
        return "admin-qlthanhvien";
    }

    @RequestMapping(value = "/editloaitin/{id}")
    public String editLoaiTin(@PathVariable int id, Model model){
        //lay danh sach danh muc
        LoaiTinEntity listLoaitin = (LoaiTinEntity) loaiTinRepository.findOne(id);
        model.addAttribute("listLoaitin",listLoaitin);
        return "updateloaitin";
    }

    @RequestMapping(value = "/editdanhmuc/{id}")
    public String editDanhMuc(Model model ,@PathVariable int id){
        //lay danh sach danh muc
        DanhMucEntity danhMuc = (DanhMucEntity) danhMucRepository.findOne(id);
        model.addAttribute("danhMuc",danhMuc);
        return "updatedanhmuc";
    }

    @RequestMapping(value = "/editbaidang/{id}")
    public String editBaiDang(Model model ,@PathVariable int id){
        //lay danh sach danh muc
        BaiDangEntity baidang = (BaiDangEntity) baiDangRepository.findOne(id);
        model.addAttribute("baiDang",baidang);
        return "updatebaidang";
    }

    @RequestMapping(value = "/editbaidangko/{id}")
    public String editBaiDangKo(Model model ,@PathVariable int id){
        //lay danh sach danh muc
        BaiDangEntity baidang = (BaiDangEntity) baiDangRepository.findOne(id);
        model.addAttribute("baiDang",baidang);
        return "updatebaidangko";
    }

    @RequestMapping(value="/editthanhvien/{id}")
    public String editThanhVien(@PathVariable int id ,Model model){
        TaiKhoanEntity taikhoan=(TaiKhoanEntity) taiKhoanRepository.findOne(id);
        model.addAttribute("taiKhoan",taikhoan);
        return "updatethanhvien";
    }
}
