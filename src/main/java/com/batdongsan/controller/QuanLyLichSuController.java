package com.batdongsan.controller;

import com.batdongsan.entity.BaiDangEntity;
import com.batdongsan.entity.LichSuEntity;
import com.batdongsan.entity.TaiKhoanEntity;
import com.batdongsan.repository.BaiDangRepository;
import com.batdongsan.repository.LichSuRepository;
import com.batdongsan.repository.TaiKhoanRepository;
import com.batdongsan.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/quanlilichsu")
public class QuanLyLichSuController {

    @Autowired
    LichSuRepository lichSuRepository;
    @Autowired
    TaiKhoanRepository taiKhoanRepository;
    @Autowired
    BaiDangRepository baiDangRepository;
    @Autowired
    HomeController homeController;

    @RequestMapping(value = "", method = RequestMethod.POST)
    public String themGiaDeXuat(@RequestParam("baiDangId") int baiDangId, Model model,BaiDangEntity baidang, LichSuEntity lichsu, HttpServletRequest request){

        if (SecurityUtils.getPrincipal().getEmail()!=null){
            TaiKhoanEntity taikhoan = taiKhoanRepository.findByEmail(SecurityUtils.getPrincipal().getEmail());
            lichsu.setTaiKhoanEntity(taikhoan);
            baidang.setId(baiDangId);
            lichsu.setBaiDangEntity(baidang);
            lichsu.setGiaDeXuat(baidang.getGia());
            lichSuRepository.save(lichsu);
        }else{
            return "redirect:/login/";
        }

        return "redirect:/xemchitiet/"+baiDangId;
    }

    @RequestMapping(value = "/giadexuat")
    public String xemLichSuDeXuat(HttpServletRequest request,Model model){
        HttpSession session = request.getSession();

        List<LichSuEntity> listLichSu = lichSuRepository.findByTaiKhoanEntityEmail(SecurityUtils.getPrincipal().getEmail());
        model.addAttribute("listLichSu",listLichSu);
        homeController.loadTinhThanh(model);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadBaiDangGiaCao(model);
        homeController.loadBaiDangGiaRe(model);
        return "lichsudexuat";
    }

    @RequestMapping(value = "/lichsubaidang/{id}")
    public String lichSuBaiDang(@PathVariable int id, HttpServletRequest request,Model model){
        HttpSession session = request.getSession();
        BaiDangEntity baiDang = baiDangRepository.findOne(id);
        model.addAttribute("baiDang",baiDang);
        List<LichSuEntity> listLichSu = lichSuRepository.findByBaiDangEntityIdOrderByGiaDeXuatDesc(id);
        model.addAttribute("listLichSu",listLichSu);
        homeController.loadBaiDangGiaCao(model);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadTinhThanh(model);
        homeController.loadBaiDangGiaRe(model);

        return "lichsubaidang";
    }

    @RequestMapping(value = "/xoa/{id}/{baiDangId}")
    public String xoaDeXuatNguoiKhac(@PathVariable int id,@PathVariable int baiDangId, BaiDangEntity baidang){
        lichSuRepository.delete(id);
        return "redirect:/quanlilichsu/lichsubaidang/"+baiDangId;
    }

    @RequestMapping(value = "/xoa/{id}")
    public String xoaDeXuatCaNhan(@PathVariable int id){
        lichSuRepository.delete(id);
        return "redirect:/quanlilichsu/giadexuat";
    }
}
