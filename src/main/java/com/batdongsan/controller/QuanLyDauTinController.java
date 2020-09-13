package com.batdongsan.controller;

import com.batdongsan.entity.BaiDangEntity;
import com.batdongsan.entity.DauTinEntity;
import com.batdongsan.entity.TaiKhoanEntity;
import com.batdongsan.repository.BaiDangRepository;
import com.batdongsan.repository.DauTinRepository;
import com.batdongsan.repository.TaiKhoanRepository;
import com.batdongsan.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.List;

@Controller
@RequestMapping(value = "quanlidautin")
public class QuanLyDauTinController {

    @Autowired
    TaiKhoanRepository taiKhoanRepository;
    @Autowired
    DauTinRepository dauTinRepository;
    @Autowired
    HomeController homeController;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String showDauTin(HttpServletRequest request, Model model){
        TaiKhoanEntity taikhoan = taiKhoanRepository.findByEmail(SecurityUtils.getPrincipal().getEmail());
        List<DauTinEntity> listDauTin = (List<DauTinEntity>) dauTinRepository.findByTaiKhoanEntityId(taikhoan.getId());
        model.addAttribute("listDauTin",listDauTin);
        homeController.loadTinhThanh(model);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadBaiDangGiaCao(model);
        homeController.loadBaiDangGiaRe(model);
        return "dautin";
    }

    @RequestMapping(value = "/xoadautinh/{id}", method = RequestMethod.GET)
    public String xoaDauTin(@PathVariable int id, HttpServletRequest request, Model model){
        dauTinRepository.delete(id);
        homeController.loadTinhThanh(model);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadBaiDangGiaCao(model);
        return "redirect:/quanlidautin/";
    }

    @Autowired
    BaiDangRepository baiDangRepository;


    @RequestMapping(value = "/themdautin/{id}", method = RequestMethod.GET)
    public String themDauTin(@PathVariable int id, HttpServletRequest request, Model model) throws Exception {

        HttpSession session = request.getSession();
        TaiKhoanEntity tk = taiKhoanRepository.findByEmail(SecurityUtils.getPrincipal().getEmail());
        DauTinEntity dautin = new DauTinEntity();
        dautin.setTaiKhoanEntity(tk);

        BaiDangEntity baidang = baiDangRepository.findOne(id);
        dautin.setBaiDangEntity(baidang);

        homeController.loadTinhThanh(model);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadBaiDang(model);
        dauTinRepository.save(dautin);

        return "redirect:/quanlidautin/";
    }
}
