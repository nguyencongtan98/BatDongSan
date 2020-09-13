package com.batdongsan.controller;

import com.batdongsan.entity.LoaiTinEntity;
import com.batdongsan.entity.MenhGiaEntity;
import com.batdongsan.entity.ThoiHanEntity;
import com.batdongsan.repository.LoaiTinRepository;
import com.batdongsan.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin-quanlyloaitin")
public class AdminQuanLyLoaiTinController {

    @Autowired
    private LoaiTinRepository loaiTinRepository;

    @Autowired
    private MessageUtil messageUtil;

    @RequestMapping(value = "/showloaitin" , method = RequestMethod.GET , produces = "application/x-www-form-urlencoded;charset=UTF-8")
    public String hienThiLoaiTin(Model model,HttpServletRequest request) {
        List<LoaiTinEntity> listLoaiTin = loaiTinRepository.findAllDesc();
        Long total = loaiTinRepository.count();
        model.addAttribute("total",total);
        model.addAttribute("listLoaitin",listLoaiTin);
        if(request.getParameter("message")!=null){
            Map<String , String > message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message" , message.get("message"));
            model.addAttribute("alert" , message.get("alert"));
        }
        return "admin/admin-list-loaitin";
    }

    @RequestMapping(value = "/themloaitin" , produces = "application/x-www-form-urlencoded;charset=UTF-8")
    public String themLoaiTin(Model modeld){
        return "admin/admin-add-loaitin";
    }

    @RequestMapping(value = "/capnhatloaitin/{id}" , produces = "application/x-www-form-urlencoded;charset=UTF-8")
    public String capNhatLoaitin(Model model , @PathVariable int id) {
        LoaiTinEntity loaiTinEntity = loaiTinRepository.findOne(id);
        model.addAttribute("ty" , loaiTinEntity);
        return "admin/admin-edit-loaitin";
    }

    @RequestMapping(value = "/timkiemloaitin" , method = RequestMethod.GET)
    public String timKiemLoaiTin(@RequestParam(value = "searchInput" , required = false) String searchInput ,
                                 HttpServletRequest request,Model model){
        List<LoaiTinEntity> listLoaiTin;
        // kiểm tra xem giá trị nhập vào có rỗng không
        if (searchInput.isEmpty()) {
            listLoaiTin = (List<LoaiTinEntity>) loaiTinRepository.findAllDesc();
            Long total = loaiTinRepository.count();
            model.addAttribute("total",total);
        }
        // tìm theo giá trị nhập vào
        else {
            listLoaiTin = loaiTinRepository.findByTenLoaiTinContaining(searchInput);
            Long total = loaiTinRepository.countByTenLoaiTinContaining(searchInput);
            model.addAttribute("total",total);
        }
        // kiểm tra trong danh sách có gì để hiển thị không
        if (listLoaiTin.isEmpty()) {
            model.addAttribute("message", "Không tìm thấy");
            model.addAttribute("alert" , "danger");
        }
        model.addAttribute("listLoaitin" , listLoaiTin);
        return "admin/admin-list-loaitin";
    }
}
