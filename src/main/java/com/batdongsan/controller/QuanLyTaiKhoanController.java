package com.batdongsan.controller;

import com.batdongsan.entity.TaiKhoanEntity;
import com.batdongsan.repository.TaiKhoanRepository;
import com.batdongsan.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/quanlitaikhoan")
public class QuanLyTaiKhoanController {

    @Autowired
    TaiKhoanRepository taiKhoanRepository;
    @Autowired
    HomeController homeController;

    @RequestMapping(value = "/thongtincanhan")
    public String showThongTinCaNhan(Model model){
        TaiKhoanEntity taikhoan = taiKhoanRepository.findByEmail(SecurityUtils.getPrincipal().getEmail());
        model.addAttribute("taiKhoan",taikhoan);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadTinhThanh(model);
        homeController.loadBaiDangGiaCao(model);
        homeController.loadBaiDangGiaRe(model);
        return "thongtincanhan";

    }

    @RequestMapping(value = "/capnhattaikhoan", method = RequestMethod.POST)
    public String capNhatThongTin(Model model, TaiKhoanEntity taikhoan, HttpServletRequest request){
        HttpSession session = request.getSession();
        TaiKhoanEntity tk = taiKhoanRepository.findByEmail(SecurityUtils.getPrincipal().getEmail());
        tk.setHoTen(taikhoan.getHoTen());
        tk.setDiaChi(taikhoan.getDiaChi());
        tk.setSoDienThoai(taikhoan.getSoDienThoai());

        taiKhoanRepository.save(tk);
        return "redirect:/quanlitaikhoan/thongtincanhan";
    }
}
