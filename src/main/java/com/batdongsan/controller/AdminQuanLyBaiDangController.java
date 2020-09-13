package com.batdongsan.controller;


import com.batdongsan.entity.BaiDangEntity;
import com.batdongsan.entity.LoaiTinEntity;
import com.batdongsan.entity.TaiKhoanEntity;
import com.batdongsan.repository.BaiDangRepository;
import com.batdongsan.repository.LoaiTinRepository;
import com.batdongsan.repository.TaiKhoanRepository;
import com.batdongsan.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin-quanlybaidang")
public class AdminQuanLyBaiDangController {

    @Autowired
    private LoaiTinRepository loaiTinRepository;

    @Autowired
    private MessageUtil messageUtil;

    @Autowired
    private BaiDangRepository baiDangRepository;


    @RequestMapping(value = "/showbaidang", produces = "application/x-www-form-urlencoded;charset=UTF-8", method = RequestMethod.GET)
    public String hienThiBaiDang(Model model, @RequestParam(value = "searchInput", required = false) String searchInput,
                                 HttpServletRequest request) {
        List<BaiDangEntity> listbaidang;
        if(searchInput != null) {
            listbaidang = baiDangRepository.findByTieuDeContainingAndStatus(searchInput, 1);
            if (listbaidang.isEmpty()) {
                model.addAttribute("message", "Không tìm thấy");
                model.addAttribute("alert", "danger");
            } else {
                Long total = baiDangRepository.countByTieuDeContainingAndStatus(searchInput,  1);
                model.addAttribute("total", total);
            }
        }
        else {
            listbaidang = baiDangRepository.findByStatusOrderByIdDesc(1);
            if (listbaidang.isEmpty()){
                model.addAttribute("message" , "Danh sách trống");
                model.addAttribute("alert" , "danger");
            }else {
                Long total = baiDangRepository.countByStatus(1);
                model.addAttribute("total", total);
            }
        }
        if(request.getParameter("message") != null){
            Map<String , String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message" , message.get("message"));
            model.addAttribute("alert" , message.get("alert"));
        }
        model.addAttribute("listBaiDang",listbaidang);
        return "admin/admin-list-baidang";
    }

    @RequestMapping(value = "/showbaidangchuaduyet", produces = "application/x-www-form-urlencoded;charset=UTF-8", method = RequestMethod.GET)
    public String hienThiBaiDangChuaDuyet(Model model, @RequestParam(value = "searchInput", required = false) String searchInput,
                                          HttpServletRequest request) {
        List<BaiDangEntity> listbaidang;
        if(searchInput != null) {
            listbaidang = baiDangRepository.findByTieuDeContainingAndTrangThaiAndStatus(searchInput, 0, 1);
            if (listbaidang.isEmpty()) {
                model.addAttribute("message", "Không tìm thấy");
                model.addAttribute("alert", "danger");
            } else {
                Long total = baiDangRepository.countByTieuDeContainingAndTrangThaiAndStatus(searchInput, 0, 1);
                model.addAttribute("total", total);
            }
        }
        else {
            listbaidang = baiDangRepository.findByTrangThaiAndStatusOrderByIdDesc(0,1);
            if (listbaidang.isEmpty()){
                model.addAttribute("message" , "Danh sách trống");
                model.addAttribute("alert" , "danger");
            }else {
                Long total = baiDangRepository.countByTrangThaiAndStatusOrderByIdDesc(0, 1);
                model.addAttribute("total", total);
            }
        }
        if(request.getParameter("message") != null){
            Map<String , String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message" , message.get("message"));
            model.addAttribute("alert" , message.get("alert"));
        }
        model.addAttribute("listBaiDang",listbaidang);
        return "admin/admin-list-baidangchuaduyet";
    }

    @RequestMapping(value = "/showbaidangdaduyet", produces = "application/x-www-form-urlencoded;charset=UTF-8", method = RequestMethod.GET)
    public String hienThiBaiDangDaDuyet(Model model, @RequestParam(value = "searchInput", required = false) String searchInput,
                                          HttpServletRequest request) {
        List<BaiDangEntity> listbaidang;
        if(searchInput != null) {
            listbaidang = baiDangRepository.findByTieuDeContainingAndTrangThaiAndStatus(searchInput, 1, 1);
            if (listbaidang.isEmpty()) {
                model.addAttribute("message", "Không tìm thấy");
                model.addAttribute("alert", "danger");
            } else {
                Long total = baiDangRepository.countByTieuDeContainingAndTrangThaiAndStatus(searchInput, 1, 1);
                model.addAttribute("total", total);
            }
        }
        else {
            listbaidang = baiDangRepository.findByTrangThaiAndStatusOrderByIdDesc(1,1);
            if (listbaidang.isEmpty()){
                model.addAttribute("message" , "Danh sách trống");
                model.addAttribute("alert" , "danger");
            }else {
                Long total = baiDangRepository.countByTrangThaiAndStatusOrderByIdDesc(1, 1);
                model.addAttribute("total", total);
            }
        }
        if(request.getParameter("message") != null){
            Map<String , String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message" , message.get("message"));
            model.addAttribute("alert" , message.get("alert"));
        }
        model.addAttribute("listBaiDang",listbaidang);
        return "admin/admin-list-baidangdaduyet";
    }

    @RequestMapping(value = "/showbaidangkhoa", produces = "application/x-www-form-urlencoded;charset=UTF-8", method = RequestMethod.GET)
    public String hienThiBaiDangKhoa(Model model, @RequestParam(value = "searchInput", required = false) String searchInput,
                                        HttpServletRequest request) {
        List<BaiDangEntity> listbaidang;
        if(searchInput != null) {
            listbaidang = baiDangRepository.findByTieuDeContainingAndTrangThaiAndStatus(searchInput, 0, 0);
            if (listbaidang.isEmpty()) {
                model.addAttribute("message", "Không tìm thấy");
                model.addAttribute("alert", "danger");
            } else {
                Long total = baiDangRepository.countByTieuDeContainingAndTrangThaiAndStatus(searchInput, 0, 0);
                model.addAttribute("total", total);
            }
        }
        else {
            listbaidang = baiDangRepository.findByTrangThaiAndStatusOrderByIdDesc(0,0);
            if (listbaidang.isEmpty()){
                model.addAttribute("message" , "Danh sách trống");
                model.addAttribute("alert" , "danger");
            }else {
                Long total = baiDangRepository.countByTrangThaiAndStatusOrderByIdDesc(0, 0);
                model.addAttribute("total", total);
            }
        }
        if(request.getParameter("message") != null){
            Map<String , String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message" , message.get("message"));
            model.addAttribute("alert" , message.get("alert"));
        }
        model.addAttribute("listBaiDang",listbaidang);
        return "admin/admin-list-baidangkhoa";
    }

    @RequestMapping(value = "/chitietbaidang", produces = "application/x-www-form-urlencoded;charset=UTF-8" , method = RequestMethod.GET)
    public String chiTietBaiDang(@RequestParam("id") int id, Model model) {

        BaiDangEntity listBaiDang = baiDangRepository.findOne(id);

        model.addAttribute("listBaiDang" , listBaiDang);
        LoaiTinEntity listLoaiTin = loaiTinRepository.findOne(listBaiDang.getDanhMucEntity().getId());
        model.addAttribute("listLoaiTin" , listLoaiTin);
        /*return "adminindex";*/
        return "admin/admin-chitiet-baidang";
        /*return "updatebaidang";*/
    }

    @RequestMapping(value = "/chitietbaidang1", produces = "application/x-www-form-urlencoded;charset=UTF-8" , method = RequestMethod.GET)
    public String chiTietBaiDang1(@RequestParam("id") int id, Model model) {
        BaiDangEntity listBaiDang = baiDangRepository.findOne(id);
        model.addAttribute("listBaiDang" , listBaiDang);
        LoaiTinEntity listLoaiTin = loaiTinRepository.findOne(listBaiDang.getDanhMucEntity().getId());
        model.addAttribute("listLoaiTin" , listLoaiTin);
        return "admin/admin-chitiet-baidang1";
    }

}
