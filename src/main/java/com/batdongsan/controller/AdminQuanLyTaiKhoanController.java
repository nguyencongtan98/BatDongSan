package com.batdongsan.controller;

import com.batdongsan.entity.BaiDangEntity;
import com.batdongsan.entity.RoleEntity;
import com.batdongsan.entity.TaiKhoanEntity;
import com.batdongsan.entity.ThoiHanKhoaEntity;
import com.batdongsan.model.MyUser;
import com.batdongsan.model.TaiKhoanModel;
import com.batdongsan.repository.BaiDangRepository;
import com.batdongsan.repository.TaiKhoanRepository;
import com.batdongsan.repository.ThoiHanKhoaRepository;
import com.batdongsan.util.MessageUtil;
import com.batdongsan.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/admin-quanlytaikhoan")
public class AdminQuanLyTaiKhoanController {
    @Autowired
    private MessageUtil messageUtil;

    @Autowired
    private TaiKhoanRepository taiKhoanRepository;

    @RequestMapping(value = "/showtaikhoanuser")
    public String hienThiTaiKhoanUser(Model model, @RequestParam(value = "searchInput", required = false) String searchInput, HttpServletRequest request) throws Exception {
        loadTaiKhoanUser(model);
        List<TaiKhoanEntity> list = taiKhoanRepository.findByTrangThaiAndStatus(1, 1);
        List<TaiKhoanEntity> list1 = new ArrayList<>();//list user
        Integer total = 0;
        if (list.isEmpty()) {
            model.addAttribute("message", "Danh sÃ¡ch trá»‘ng");
            model.addAttribute("alert", "danger");
        } else {
            if (searchInput != null) {
                List<TaiKhoanEntity> listSearch = taiKhoanRepository.findByHoTenContainingAndTrangThaiAndStatus(searchInput, 1, 1);
                for (TaiKhoanEntity item : listSearch) {
                    for (RoleEntity roleEntity : item.getRoles()) {
                        if (roleEntity.getCode().equals("user")) {
                            list1.add(taiKhoanRepository.findOne(item.getId()));
                            total = total + 1;
                        }
                    }
                }
            } else {
                for (TaiKhoanEntity item : list) {
                    for (RoleEntity roleEntity : item.getRoles()) {
                        if (roleEntity.getCode().equals("user")) {
                            list1.add(taiKhoanRepository.findOne(item.getId()));
                            total = total + 1;
                        }
                    }
                }
            }
            if (list1.isEmpty()) {
                model.addAttribute("message", "KhÃ´ng tÃ¬m tháº¥y");
                model.addAttribute("alert", "danger");
            } else {
                model.addAttribute("total", total);
                model.addAttribute("listTaiKhoan", list1);
            }
        }
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message", message.get("message"));
            model.addAttribute("alert", message.get("alert"));
        }
        return "admin/admin-list-taikhoan-user";
    }

    @RequestMapping(value = "/showtaikhoanadmin")
    public String hienThiTaiKhoanAdmin(Model model, @RequestParam(value = "searchInput", required = false) String searchInput, HttpServletRequest request) throws Exception {
        loadTaiKhoanAdmin(model);
        List<TaiKhoanEntity> list = taiKhoanRepository.findByTrangThaiAndStatus(1, 1);
        List<TaiKhoanEntity> list1 = new ArrayList<>();//list user
        Integer total = 0;
        if (list.isEmpty()) {
            model.addAttribute("message", "Danh sÃ¡ch trá»‘ng");
            model.addAttribute("alert", "danger");
        } else {
            if (searchInput != null) {
                List<TaiKhoanEntity> listSearch = taiKhoanRepository.findByHoTenContainingAndTrangThaiAndStatus(searchInput, 1, 1);
                for (TaiKhoanEntity item : listSearch) {
                    for (RoleEntity roleEntity : item.getRoles()) {
                        if (roleEntity.getCode().equals("admin")) {
                            list1.add(taiKhoanRepository.findOne(item.getId()));
                            total = total + 1;
                        }
                    }
                }
            } else {
                for (TaiKhoanEntity item : list) {
                    for (RoleEntity roleEntity : item.getRoles()) {
                        if (roleEntity.getCode().equals("admin")) {
                            list1.add(taiKhoanRepository.findOne(item.getId()));
                            total = total + 1;
                        }
                    }
                }
            }
            if (list1.isEmpty()) {
                model.addAttribute("message", "KhÃ´ng tÃ¬m tháº¥y");
                model.addAttribute("alert", "danger");
            } else {
                model.addAttribute("total", total);
                model.addAttribute("listTaiKhoan", list1);
            }
        }
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message", message.get("message"));
            model.addAttribute("alert", message.get("alert"));
        }
        return "admin/admin-list-taikhoan-admin";
    }

    @RequestMapping(value = "/showtaikhoanlockuser")
    public String hienThiTaiKhoanLockUser(Model model,
                                          @RequestParam(value = "searchInput", required = false) String searchInput,
                                          HttpServletRequest request) throws Exception {
        loadTaiKhoanUser(model);
        List<TaiKhoanEntity> list = taiKhoanRepository.findByTrangThaiAndStatus(0, 1);
        List<TaiKhoanEntity> list1 = new ArrayList<>();//list user
        Integer total = 0;
        if (list.isEmpty()) {
            model.addAttribute("message", "Danh sÃ¡ch trá»‘ng");
            model.addAttribute("alert", "danger");
        } else {
            if (searchInput != null) {
                List<TaiKhoanEntity> listSearch = taiKhoanRepository.findByHoTenContainingAndTrangThaiAndStatus(searchInput, 0, 1);
                for (TaiKhoanEntity item : listSearch) {
                    for (RoleEntity roleEntity : item.getRoles()) {
                        if (roleEntity.getCode().equals("user")) {
                            list1.add(taiKhoanRepository.findOne(item.getId()));
                            total = total + 1;
                        }
                    }
                }
            } else {
                for (TaiKhoanEntity item : list) {
                    for (RoleEntity roleEntity : item.getRoles()) {
                        if (roleEntity.getCode().equals("user")) {
                            list1.add(taiKhoanRepository.findOne(item.getId()));
                            total = total + 1;
                        }
                    }
                }
            }
            if (list1.isEmpty()) {
                model.addAttribute("message", "Không tìm thấy");
                model.addAttribute("alert", "danger");
            } else {
                model.addAttribute("total", total);
                model.addAttribute("listTaiKhoan", list1);
            }
        }
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message", message.get("message"));
            model.addAttribute("alert", message.get("alert"));
        }
        return "admin/admin-list-taikhoanlock-user";
    }

    @RequestMapping(value = "/showtaikhoanlockadmin")
    public String hienThiTaiKhoanLockAdmin(Model model,
                                           @RequestParam(value = "searchInput", required = false) String searchInput,
                                           HttpServletRequest request) throws Exception {
        loadTaiKhoanAdmin(model);
        List<TaiKhoanEntity> list = taiKhoanRepository.findByTrangThaiAndStatus(0, 1);
        List<TaiKhoanEntity> list1 = new ArrayList<>();//list user
        Integer total = 0;
        if (list.isEmpty()) {
            model.addAttribute("message", "Danh sách trống");
            model.addAttribute("alert", "danger");
        } else {
            if (searchInput != null) {
                List<TaiKhoanEntity> listSearch = taiKhoanRepository.findByHoTenContainingAndTrangThaiAndStatus(searchInput, 0, 1);
                for (TaiKhoanEntity item : listSearch) {
                    for (RoleEntity roleEntity : item.getRoles()) {
                        if (roleEntity.getCode().equals("admin")) {
                            list1.add(taiKhoanRepository.findOne(item.getId()));
                            total = total + 1;
                        }
                    }
                }
            } else {
                for (TaiKhoanEntity item : list) {
                    for (RoleEntity roleEntity : item.getRoles()) {
                        if (roleEntity.getCode().equals("admin")) {
                            list1.add(taiKhoanRepository.findOne(item.getId()));
                            total = total + 1;
                        }
                    }
                }
            }
            if (list1.isEmpty()) {
                model.addAttribute("message", "Không tìm thấy");
                model.addAttribute("alert", "danger");
            } else {
                model.addAttribute("total", total);
                model.addAttribute("listTaiKhoan", list1);
            }
        }
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message", message.get("message"));
            model.addAttribute("alert", message.get("alert"));
        }
        return "admin/admin-list-taikhoanlock-admin";
    }

    //dÃ nh cho admin
    @RequestMapping(value = "/showtaikhoandelete")
    public String hienThiTaiKhoanDaXoa(Model model,
                                       @RequestParam(value = "searchInput", required = false) String searchInput,
                                       HttpServletRequest request) {

        List<TaiKhoanEntity> list = taiKhoanRepository.findByTrangThaiAndStatus(0, 0);
        Integer total = taiKhoanRepository.countByTrangThaiAndStatus(0, 0);
        if (list.isEmpty()) {
            model.addAttribute("message", "Danh sÃ¡ch trá»‘ng");
            model.addAttribute("message", "danger");
        } else {
            if (searchInput != null) {
                List<TaiKhoanEntity> listSearch = taiKhoanRepository.findByHoTenContainingAndTrangThaiAndStatus(searchInput, 0, 0);
                if (listSearch.isEmpty()) {
                    model.addAttribute("message", "Không tìm thấy");
                    model.addAttribute("alert", "danger");
                }
                else {
                    model.addAttribute("total", taiKhoanRepository.countByHoTenContainingAndTrangThaiAndStatus(searchInput, 0, 0));
                    model.addAttribute("listTaiKhoan", listSearch);
                }
            } else {
                model.addAttribute("total", total);
                model.addAttribute("listTaiKhoan", list);
            }
        }
        return "admin/admin-list-taikhoandaxoa";
    }

    @Autowired
    private ThoiHanKhoaRepository thoiHanKhoaRepository;


    @RequestMapping(value = "/chitiettaikhoan")
    public String capNhatTaiKhoan(Model model, @RequestParam("id") int id, HttpServletRequest request) {
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message", message.get("message"));
            model.addAttribute("alert", message.get("alert"));

        }
        TaiKhoanEntity taiKhoanEntity = taiKhoanRepository.findOne(id);
        model.addAttribute("listTaiKhoan", taiKhoanEntity);
        List<ThoiHanKhoaEntity> list = (List<ThoiHanKhoaEntity>) thoiHanKhoaRepository.findAll();
        model.addAttribute("listThoiHanKhoa", list);
        return "admin/admin-edit-taikhoan";
    }

    @RequestMapping(value = "/thongtincanhan")
    public String thongTinCaNhan(Model model) {
        TaiKhoanEntity taiKhoanEntity = taiKhoanRepository.findOne(SecurityUtils.getPrincipal().getId());
        model.addAttribute("listTaiKhoan", taiKhoanEntity);
        return "admin/admin-thong-tin-ca-nhan";
    }

    @RequestMapping(value = "/chitiettaikhoanadmin")
    public String capNhatTaiKhoanAmin(Model model, @RequestParam("id") int id, HttpServletRequest request) {
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message", message.get("message"));
            model.addAttribute("alert", message.get("alert"));

        }
        TaiKhoanEntity taiKhoanEntity = taiKhoanRepository.findOne(id);
        model.addAttribute("listTaiKhoan", taiKhoanEntity);
        List<ThoiHanKhoaEntity> list = (List<ThoiHanKhoaEntity>) thoiHanKhoaRepository.findAll();
        model.addAttribute("listThoiHanKhoa", list);
        return "admin/admin-edit-taikhoan-admin";
    }

    @RequestMapping(value = "/doimatkhau")
    public String doiMatKhau(Model model, HttpServletRequest request) {
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("message", message.get("message"));
            model.addAttribute("alert", message.get("alert"));

        }
        TaiKhoanEntity taiKhoanEntity = taiKhoanRepository.findOne(SecurityUtils.getPrincipal().getId());
        model.addAttribute("listTaiKhoan", taiKhoanEntity);
        return "admin/admin-doi-mat-khau1";
    }

    @Autowired
    private BaiDangRepository baiDangRepository;

    public void loadTaiKhoanUser(Model model) throws Exception {
        // láº¥y danh sÃ¡ch tÃ i khoáº£n bá»‹ khÃ³a cÃ³ tráº¡ng thÃ¡i == 0
        List<TaiKhoanEntity> list = taiKhoanRepository.findByTrangThaiAndStatus(0, 1);
        List<TaiKhoanEntity> newList = new ArrayList<>();
        for (TaiKhoanEntity item1 : list) {
            for (RoleEntity roleEntity : item1.getRoles()) {
                if (roleEntity.getCode().equals("user")) {
                    newList.add(taiKhoanRepository.findOne(item1.getId()));
                }
            }
        }
        for (TaiKhoanEntity item : newList) {
            Date date = item.getNgayKhoa();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date d = df.parse(date.toString());
            final java.util.Calendar cal = GregorianCalendar.getInstance();
            cal.setTime(d);
            cal.add(GregorianCalendar.DATE, item.getThoiHanKhoaEntity().getSoNgayKhoa());
            Calendar cal2 = Calendar.getInstance();
            if (df.format(cal.getTime()).compareTo(df.format(cal2.getTime())) <= 0) {
                List<BaiDangEntity> entities = baiDangRepository.findByTaiKhoanEntityId(item.getId());
                for (BaiDangEntity item1 : entities) {
                    item1.setStatus(1);
                    Date date1 = item1.getNgayDuyet();
                    SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
                    Date d1 = df1.parse(date1.toString());
                    final java.util.Calendar cal1 = GregorianCalendar.getInstance();
                    cal1.setTime(d1);
                    cal1.add(GregorianCalendar.DATE, item1.getThoiHanEntity().getSoNgay());
                    Calendar cal3 = Calendar.getInstance();
                    if (df1.format(cal1.getTime()).compareTo(df1.format(cal3.getTime())) <= 0) {
                        item1.setTrangThai(0);
                    } else {
                        item1.setTrangThai(1);
                    }
                    baiDangRepository.save(item1);
                }
                item.setTrangThai(1);
                item.setThoiHanKhoaEntity(null);
                item.setNgayKhoa(null);
                item.setNguoiKhoa(null);
                taiKhoanRepository.save(item);
            }
        }
    }

    public void loadTaiKhoanAdmin(Model model) throws Exception {
        // láº¥y danh sÃ¡ch tÃ i khoáº£n bá»‹ khÃ³a cÃ³ tráº¡ng thÃ¡i == 0
        List<TaiKhoanEntity> list = taiKhoanRepository.findByTrangThaiAndStatus(0, 1);
        List<TaiKhoanEntity> newList = new ArrayList<>();
        for (TaiKhoanEntity item1 : list) {
            for (RoleEntity roleEntity : item1.getRoles()) {
                if (roleEntity.getCode().equals("admin")) {
                    newList.add(taiKhoanRepository.findOne(item1.getId()));
                }
            }
        }
        for (TaiKhoanEntity item : newList) {
            Date date = item.getNgayKhoa();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            if (date == null) {

            } else {
                Date d = df.parse(date.toString());
                final java.util.Calendar cal = GregorianCalendar.getInstance();
                cal.setTime(d);
                cal.add(GregorianCalendar.DATE, item.getThoiHanKhoaEntity().getSoNgayKhoa());
//            System.out.println("result: " + df.format(cal.getTime()));
                Calendar cal2 = Calendar.getInstance();
//            System.out.println("result1: " + df.format(cal2.getTime()));

                //
                if (df.format(cal.getTime()).compareTo(df.format(cal2.getTime())) <= 0) {
                    item.setTrangThai(1);
                    item.setThoiHanKhoaEntity(null);
                    item.setNgayKhoa(null);
                    taiKhoanRepository.save(item);
                }
            }
        }
    }
}
