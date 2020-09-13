package com.batdongsan.controller;

import com.batdongsan.entity.ThoiHanEntity;
import com.batdongsan.repository.ThoiHanRepository;
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
@RequestMapping(value = "/admin-quanlythoihan")
public class AdminQuanLyThoiHanController {

    @Autowired
    MessageUtil messageUtil;

    @Autowired
    ThoiHanRepository thoiHanRepository;

    @RequestMapping(value = "/showthoihan" , method = RequestMethod.GET)
    public String hienThiThoiHan(Model model , HttpServletRequest request) {
        if(request.getParameter("message") != null){
            Map<String , String > message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message" , message.get("message"));
            model.addAttribute("alert" , message.get("alert"));
        }
        List<ThoiHanEntity> listThoiHan = thoiHanRepository.findAllDesc();
        Long total = thoiHanRepository.count();
        model.addAttribute("total",total);
        model.addAttribute("listThoiHan",listThoiHan);
        return "admin/admin-list-thoihan";
    }

    @RequestMapping(value = "/themthoihan")
    public String themThoiHan(Model model , HttpServletRequest request){
        if(request.getParameter("message") != null){
            Map<String , String > message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message" , message.get("message"));
            model.addAttribute("alert" , message.get("alert"));
        }
        return "admin/admin-add-thoihan";
    }

    @RequestMapping(value = "/editthoihan/{id}")
    public String chinhSuaThoiHan(@PathVariable int id, Model model ){
        //lay danh sach danh muc
        ThoiHanEntity listThoihan = (ThoiHanEntity) thoiHanRepository.findOne(id);
        model.addAttribute("ty",listThoihan);
        return "admin/admin-edit-thoihan";
    }

    @RequestMapping(value = "/timkiemthoihan" , method = RequestMethod.GET)
    public String timKiemThoiHan(@RequestParam("searchInput") int searchInput , Model model ){
        List<ThoiHanEntity> listTimKiem = thoiHanRepository.findBySoNgayContaining(searchInput);
        model.addAttribute("listThoiHan" , listTimKiem);
        return "admin/admin-list-thoihan";
    }
}
