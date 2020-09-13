package com.batdongsan.controller;

import static com.batdongsan.mail.GmailSender.sendEmail;

import java.text.ParseException;
import java.util.Random;

//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.batdongsan.crypto.Pbkdf2Encryptor;
import com.batdongsan.entity.TaiKhoanEntity;
import com.batdongsan.mail.SendMail;
import com.batdongsan.repository.TaiKhoanRepository;

import com.batdongsan.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/login")
public class LoginController extends Thread {

    @Autowired
    HomeController homeController;
    public int check = 0;
    @Autowired
    TaiKhoanRepository taiKhoanRepository;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String showFormLogin(Model model, HttpServletRequest request) {
        homeController.loadTinhThanh(model);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadBaiDangGiaRe(model);
        homeController.loadBaiDangGiaCao(model);
        return "dangnhap2";
    }

	/*
	 * @RequestMapping(value = "", method = RequestMethod.POST) public String
	 * login(TaiKhoanEntity taiKhoan, Model model, HttpServletRequest request) {
	 * String key = "abhY6^QuI90!n1nP"; String hassMatKhau =
	 * Pbkdf2Encryptor.createHash(taiKhoan.getMatKhau(), key, 1000); HttpSession
	 * session = request.getSession();
	 * 
	 * TaiKhoanEntity tk = taiKhoanRepository.findByEmail(taiKhoan.getEmail());
	 * 
	 * 
	 * if (captchaOK) { if
	 * (taiKhoanRepository.countByEmailAndMatKhau(taiKhoan.getEmail(), hassMatKhau)
	 * == 1) { if (tk.getKichHoat() == null) {
	 * 
	 * if (2 == 2){ session.setAttribute("id", taiKhoan.getId());
	 * session.setAttribute("emailUser", taiKhoan.getEmail());
	 * session.setAttribute("diaChi", taiKhoan.getDiaChi());
	 * session.setAttribute("soDienThoai", taiKhoan.getSoDienThoai()); return
	 * "redirect:/"; } else { session.setAttribute("id", tk.getId());
	 * session.setAttribute("email-admin", tk.getEmail());
	 * session.setAttribute("diaChi", tk.getDiaChi());
	 * session.setAttribute("soDienThoai", tk.getSoDienThoai());
	 * session.setAttribute("hoTen", tk.getHoTen());
	 * session.setAttribute("ten-dang-nhap", tk.getTenDangNhap()); return
	 * "redirect:/admin/"; } } else model.addAttribute("thongbao",
	 * "Tai khoan chua duoc kick hoat vui long kiem tra mail de kich hoat"); } else
	 * { if (check == 0) session.setAttribute("check", "0"); else if (check == 1)
	 * session.setAttribute("check", "1"); else if (check == 2)
	 * session.setAttribute("check", "2"); if (check >= 3) {
	 * model.addAttribute("thongbao2", "thu lai sau vai phut"); } check++;
	 * model.addAttribute("thongbao",
	 * "Ten dang nhap hoac mat khau khong dung vui long thu lai"); } } else {
	 * model.addAttribute("thongbao", "Vui lÃƒÂ²ng xac nhan recapcha"); }
	 * homeController.loadDanhMuc(model); homeController.loadLoaiTin(model);
	 * homeController.loadTinhThanh(model);
	 * 
	 * return "dangnhap2"; }
	 */

    @RequestMapping(value = "/forgotpass", method = RequestMethod.POST)
    public String forgotPass(TaiKhoanEntity taikhoan, Model model) {
        Random random = new Random(); // or new Random(someSeed);
        int matKhau = 100000 + random.nextInt(899999);

        String key = "abhY6^QuI90!n1nP";
        String hassMatKhau = Pbkdf2Encryptor.createHash(String.valueOf(matKhau), key, 1000);

        TaiKhoanEntity tk = taiKhoanRepository.findByEmail(taikhoan.getEmail());

        tk.setMatKhau(hassMatKhau);
        taiKhoanRepository.save(tk);
        String content = "Mat khau moi cua ban la: " + matKhau;
        try {
            sendEmail(taikhoan.getEmail(), "Mat khau moi", content, false);
        } catch (Exception e) {
        }
        model.addAttribute("thongbao", "Vui lÃƒÂ²ng check mail de lay mat khau moi");

        return "active";
    }

    @RequestMapping(value = "/logout-user")
    public String logoutUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("emailUser");
        return "redirect:/";
    }

    @RequestMapping(value = "/logout-admin")
    public String logoutAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("email-admin");
        return "redirect:/";
    }

    @RequestMapping(value = "/doimatkhahu", method = RequestMethod.GET)
    public String showFormDoiMatKhau(Model model) throws Exception {
        homeController.loadTinhThanh(model);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadBaiDang(model);
        homeController.loadBaiDangGiaRe(model);
        homeController.loadBaiDangGiaCao(model);
        return "doimatkhau";
    }


    @RequestMapping(value = "/doimatkhahu", method = RequestMethod.POST)
    public String doiMatKhau(@RequestParam("matKhauMoi1") String matKhauMoi1, @RequestParam("matKhauMoi2") String matKhauMoi2, HttpServletRequest request, Model model, TaiKhoanEntity taikhoan) {
        HttpSession session = request.getSession();
        String key = "abhY6^QuI90!n1nP";

        String hassMatKhau = BCrypt.hashpw(taikhoan.getMatKhau(), BCrypt.gensalt());
        TaiKhoanEntity tk = taiKhoanRepository.findByEmail(SecurityUtils.getPrincipal().getEmail());
        boolean valuate = BCrypt.checkpw(taikhoan.getMatKhau(), tk.getMatKhau());

        if (valuate) {
            if (matKhauMoi1.equals(matKhauMoi2)) {
                String hassMatKhauMoi = BCrypt.hashpw(matKhauMoi1, BCrypt.gensalt());
                tk.setMatKhau(hassMatKhauMoi);
                taiKhoanRepository.save(tk);
            } else {
                model.addAttribute("thongbao1", true);
                return "redirect:/login/doimatkhahu";
            }
        } else {
            model.addAttribute("thongbao2",true);
            return "redirect:/login/doimatkhahu";
        }

        return "redirect:/";
    }

    @RequestMapping(value = "/quenmatkhau", method = RequestMethod.POST)
    public String mailQuenMatKhau(TaiKhoanEntity taikhoan, Model model) {

        TaiKhoanEntity tk = taiKhoanRepository.findByEmail(taikhoan.getEmail());
        if (tk != null) {
            try {
                SendMail sendMail = new SendMail();
                String content = "Click link to active account: http://localhost:8080/login/showquenmatkhau/" + tk.getId();
                sendMail.sendMail(taikhoan.getEmail(),"Quên mật khẩu",content);
                model.addAttribute("message","Vui lòng check mail để lấy lại mật khẩu");
            } catch (Exception e) {
            }
        } else model.addAttribute("thongbao", "Sai email");

        return "dangnhap2";
    }

    @RequestMapping(value = "/showquenmatkhau/{id}")
    public String showFormQuenMatKhau(@PathVariable int id, Model model) {
        model.addAttribute("id", id);
        homeController.loadDanhMuc(model);
        homeController.loadLoaiTin(model);
        homeController.loadTinhThanh(model);
        homeController.loadBaiDangGiaCao(model);
        homeController.loadBaiDangGiaRe(model);
        return "quenmatkhau";
    }

    @RequestMapping(value = "/quenmatkhau2", method = RequestMethod.POST)
    public String QuenMatKhau(@RequestParam("matKhau2") String matKhau2, Model model, TaiKhoanEntity taikhoan) {

        TaiKhoanEntity tk = taiKhoanRepository.findOne(taikhoan.getId());

        if (taikhoan.getMatKhau().equals(matKhau2)) {
            String hassMatKhau = BCrypt.hashpw(taikhoan.getMatKhau(), BCrypt.gensalt());
            tk.setMatKhau(hassMatKhau);
            taiKhoanRepository.save(tk);
            model.addAttribute("thongbao", "Đổi mật khẩu thành công vui lòng đăng nhập lại");
            return "quenmatkhau";
        } else {
            model.addAttribute("thongbao", "Mật khẩu không trung khớp vui lòng nhập lại");
        }
        return "quenmatkhau";
    }

    @RequestMapping(value = "/dang-xuat" , method = RequestMethod.GET)
    public ModelAndView logoutPage (HttpServletRequest request , HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/accessDenied" , method = RequestMethod.GET)
    public ModelAndView accessDenied () {
        return new ModelAndView("redirect:/login?accessDenied");
    }


}
