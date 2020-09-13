package com.batdongsan.controller;

import com.batdongsan.entity.RoleEntity;
import com.batdongsan.entity.TaiKhoanEntity;
//import com.batdongsan.mail.GmailSender;
import com.batdongsan.mail.SendMail;
import com.batdongsan.repository.TaiKhoanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

//import java.util.List;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/register")
public class RegisterController {
    @Autowired
    TaiKhoanRepository taiKhoanRepository;
    @Autowired
    HomeController homeController;


    @RequestMapping(value = "", method = RequestMethod.GET)
    public String showFormRegister(Model model) {
        model.addAttribute("message", "empty");
        homeController.loadTinhThanh(model);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadBaiDangGiaRe(model);
        homeController.loadBaiDangGiaCao(model);
        return "dangky2";
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public String register(@RequestParam("matKhau2") String matKhau2, TaiKhoanEntity taikhoan, Model model) {
    	  homeController.loadTinhThanh(model);
          homeController.loadLoaiTin(model);
          homeController.loadDanhMuc(model);
          homeController.loadBaiDangGiaRe(model);
          homeController.loadBaiDangGiaCao(model);
        String key = "abhY6^QuI90!n1nP";
        if (taiKhoanRepository.countByEmail(taikhoan.getEmail()) == 0) {
            if (taikhoan.getMatKhau().equals(matKhau2)) {

                String hassMatKhau = BCrypt.hashpw(taikhoan.getMatKhau(), BCrypt.gensalt());
                String kichHoat = BCrypt.hashpw(taikhoan.getEmail(), BCrypt.gensalt());

                String email = taikhoan.getEmail();

                taikhoan.setMatKhau(hassMatKhau);
                taikhoan.setKichHoat(kichHoat);
                taikhoan.setTenDangNhap(email);

                taikhoan.setTrangThai(1);
                List<RoleEntity> roleEntities = new ArrayList<>();
                RoleEntity roleEntity = new RoleEntity();
                roleEntity.setId(2);
                roleEntities.add(roleEntity);

                taikhoan.setRoles(roleEntities);
                taiKhoanRepository.save(taikhoan);


                String content = "Click link to active account: http://localhost:8080/register/kichhoat/" + taikhoan.getEmail()+"/";
                try {

                    SendMail sendMail = new SendMail();
                    sendMail.sendMail(taikhoan.getEmail(), "Actice Code", content);
                } catch (Exception e) {
                }
            } else {
                model.addAttribute("thongbao", "Mật khẩu không trùng khớp");
                return "dangky2";
            }
            model.addAttribute("thongbao", "Vui lòng check mail để kích hoạt tài khoản");
            return "dangky2";
        } else {
            model.addAttribute("thongbao", "Email đã được sử dụng");
        }
        return "dangky2";
    }

    @RequestMapping(value = "/kichhoat/{email}/", method = RequestMethod.GET)
    public String kichHoat(@PathVariable("email") String email,
                           Model model) {

        TaiKhoanEntity tk = taiKhoanRepository.findByEmail(email);
        boolean valuate = BCrypt.checkpw(email, tk.getKichHoat());

        if (valuate) {
            tk.setKichHoat(null);
            tk.setStatus(1);
            taiKhoanRepository.save(tk);
            model.addAttribute("thongbao", "Kich hoat thanh cong");
            return "redirect:/login/";
        } else {
            model.addAttribute("thongbao", "Kich hoat khong thanh cong");
        }

        return "dangky2";
    }

    public static void main(String[] args) throws UnsupportedEncodingException, MessagingException {
        String password = "tancoder01@gmail.com";
        String hash = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println(hash);

        boolean valuate = BCrypt.checkpw(password, "$2a$10$3p8Od6IqGlOkbh7ZLygbh.xDdtMFUYs8gflzg9Pg3FDQSybCtyLAC");
        System.out.println(valuate);
    }


}
