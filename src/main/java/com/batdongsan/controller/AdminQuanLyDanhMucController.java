package com.batdongsan.controller;

import com.batdongsan.entity.DanhMucEntity;
import com.batdongsan.entity.LoaiTinEntity;
import com.batdongsan.repository.DanhMucRepository;
import com.batdongsan.repository.LoaiTinRepository;
import com.batdongsan.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin-quanlydanhmuc")
public class AdminQuanLyDanhMucController {
    @Autowired
    private MessageUtil messageUtil;

    @Autowired
    private DanhMucRepository danhMucRepository;

    @Autowired
    private LoaiTinRepository loaiTinRepository;

    @RequestMapping(value = "/showdanhmuc", produces = "application/x-www-form-urlencoded;charset=UTF-8", method = RequestMethod.GET)
    public String hienThiDanhMuc(Model model, HttpServletRequest request, @RequestParam(value = "searchInput", required = false) String searchInput) {
        List<DanhMucEntity> list;
        if (searchInput != null) {
            if(searchInput.isEmpty()){
                list = danhMucRepository.findAllDesc();
                Long total = danhMucRepository.count();
                model.addAttribute("total", total);
            }else {
                list = danhMucRepository.findByTenDanhMucContaining(searchInput);
                Long total = danhMucRepository.countByTenDanhMucContaining(searchInput);
                model.addAttribute("total", total);
            }
            if(list.isEmpty()){
                model.addAttribute("message" , "Không tìm thấy");
                model.addAttribute("alert" , "danger");
            }
        } else {
            list = danhMucRepository.findAllDesc();
            Long total = danhMucRepository.count();
            model.addAttribute("total", total);
        }
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message", message.get("message"));
            model.addAttribute("alert", message.get("alert"));
        }
        model.addAttribute("listDanhMuc", list);
        return "admin/admin-list-danhmuc";
    }

    @RequestMapping(value = "/capnhatdanhmuc", produces = "application/x-www-form-urlencoded;charset=UTF-8", method = RequestMethod.GET)
    public String capNhatDanhMuc(Model model, @RequestParam(value = "id") int id) {
        DanhMucEntity list = danhMucRepository.findOne(id);
        model.addAttribute("ty", list);
        List<LoaiTinEntity> list1 = (List<LoaiTinEntity>) loaiTinRepository.findAll();
        model.addAttribute("listLoaiTin", list1);
        return "admin/admin-edit-danhmuc";
    }

    @RequestMapping(value = "/themdanhmuc", produces = "application/x-www-form-urlencoded;charset=UTF-8", method = RequestMethod.GET)
    public String themDanhMuc(Model model, HttpServletRequest request) {
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message", message.get("message"));
            model.addAttribute("alert", message.get("alert"));
        }
        List<LoaiTinEntity> list1 = (List<LoaiTinEntity>) loaiTinRepository.findAll();
        model.addAttribute("listLoaiTin", list1);
        return "admin/admin-add-danhmuc";
    }

}
