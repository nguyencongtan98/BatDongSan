package com.batdongsan.controller;

import com.batdongsan.entity.*;
import com.batdongsan.repository.*;
import com.batdongsan.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

@Controller
@RequestMapping(value = "/quanlytin")
public class QuanLyTinController {
    private static final String IMG_ROOT_PATH = "E:\\GITHUB\\BatDongSan\\src\\main\\webapp\\resources\\images";

    @Autowired
    HomeController homeController = new HomeController();
    @Autowired
    DanhMucRepository danhMucRepository;
    @Autowired
    LoaiTinRepository loaiTinRepository;
    @Autowired
    BaiDangRepository baiDangRepository;
    @Autowired
    ThoiHanRepository thoiHanRepository;
    @Autowired
    TaiKhoanRepository taiKhoanRepository;
    @Autowired
    MenhGiaRepository menhGiaRepository;
    @Autowired
    TinhThanhRepository tinhThanhRepository;
    @Autowired
    AnhRepository anhRepository;

    @RequestMapping(value = "")
    public String showQuanLyTin(Model model) {
        System.out.println(SecurityUtils.getPrincipal().getEmail());
        if (SecurityUtils.getPrincipal().getEmail() == null) {
            return "redirect:/login";
        } else {
            List<ThoiHanEntity> listThoiHan = (List<ThoiHanEntity>) thoiHanRepository.findAll();
            model.addAttribute("listThoiHan", listThoiHan);

            List<MenhGiaEntity> listMenhGia = (List<MenhGiaEntity>) menhGiaRepository.findAll();
            model.addAttribute("listMenhGia", listMenhGia);

            homeController.loadTinhThanh(model);
            homeController.loadLoaiTin(model);
            homeController.loadDanhMuc(model);
            homeController.loadBaiDangGiaCao(model);
            model.addAttribute("danhMuc", new DanhMucEntity());
            model.addAttribute("hidden", "hidden");
            /*session.setAttribute("loaiTinId", 1);
            session.setAttribute("tinhThanhId", 1);*/
            return "thembaidang";
        }

    }

    @RequestMapping(value = "/showdanhmuc/{id}")
    public String showDanhMuc(@PathVariable int id, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("loaiTinId", id);
        homeController.loadLoaiTin(model);
        homeController.loadTinhThanh(model);
        homeController.loadDanhMuc(model);
        List<DanhMucEntity> listDanhMuc2 = (List<DanhMucEntity>) danhMucRepository.findByLoaiTinEntityId((int) session.getAttribute("loaiTinId"));
        model.addAttribute("listDanhMuc2", listDanhMuc2);

        List<ThoiHanEntity> listThoiHan = (List<ThoiHanEntity>) thoiHanRepository.findAll();
        model.addAttribute("listThoiHan", listThoiHan);

        List<MenhGiaEntity> listMenhGia = (List<MenhGiaEntity>) menhGiaRepository.findAll();
        model.addAttribute("listMenhGia", listMenhGia);
        return "quanlybaidang";
    }


    @RequestMapping(value = "/showformtin")
    public String showFormTin(@PathVariable int id, Model model) {
        model.addAttribute("hidden", " ");
        return "quanlybaidang";
    }

    @RequestMapping(value = "/showquanhuyen/{id}")
    public String showQuanHuyen(@PathVariable int id, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("tinhThanhId", id);


        List<DanhMucEntity> listDanhMuc2 = (List<DanhMucEntity>) danhMucRepository.findByLoaiTinEntityId((int) session.getAttribute("loaiTinId"));
        model.addAttribute("listDanhMuc2", listDanhMuc2);

        List<ThoiHanEntity> listThoiHan = (List<ThoiHanEntity>) thoiHanRepository.findAll();
        model.addAttribute("listThoiHan", listThoiHan);

        List<MenhGiaEntity> listMenhGia = (List<MenhGiaEntity>) menhGiaRepository.findAll();
        model.addAttribute("listMenhGia", listMenhGia);
        homeController.loadLoaiTin(model);
        homeController.loadTinhThanh(model);
        homeController.loadDanhMuc(model);

        return "quanlybaidang";
    }

    @RequestMapping(value = "/dangtin", method = RequestMethod.POST)
    public String dangTin(@RequestParam("tinhThanhId") int tinhThanhId, @RequestParam("danhMucId") int danhMucId,
                          @RequestParam("menhGiaId") int menhGiaId, @RequestParam("thoiHanId") int thoiHanId,
                          @RequestParam("fileData") CommonsMultipartFile[] fileData,
                          HttpServletRequest request, BaiDangEntity baidang, Model model, Product product) {
        HttpSession session = request.getSession();
        TaiKhoanEntity tk = taiKhoanRepository.findByEmail(SecurityUtils.getPrincipal().getEmail());
        baidang.setTaiKhoanEntity(tk);

//        QuanHuyenEntity quanHuyen = new QuanHuyenEntity();
        DanhMucEntity danhmuc = new DanhMucEntity();
        MenhGiaEntity menhgia = new MenhGiaEntity();
        ThoiHanEntity thoihan = new ThoiHanEntity();
        TaiKhoanEntity taikhoan = new TaiKhoanEntity();
        TinhThanhEntity tinhthanh = new TinhThanhEntity();

        danhmuc.setId(danhMucId);
        baidang.setDanhMucEntity(danhmuc);

        menhgia.setId(menhGiaId);
        baidang.setMenhGiaEntity(menhgia);

        thoihan.setId(thoiHanId);
        baidang.setThoiHanEntity(thoihan);

        tinhthanh.setId(tinhThanhId);
        baidang.setTinhThanhEntity(tinhthanh);
       /* quanHuyen.setId(quanHuyenId);
        baidang.setQuanHuyenEntity(quanHuyen);*/

        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        baidang.setNgayDang(date);

        baidang.setSoSao(0);
        baidang.setTrangThai(1);
        AnhEntity anh = new AnhEntity();
        try {
            CommonsMultipartFile[] files = fileData;

            for (int i = 0; i < files.length; i++) {
                CommonsMultipartFile file = files[i];
                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                // Assume uploaded file location on web server is D:\file-upload

                File dir = new File(IMG_ROOT_PATH);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Create the file on server
                String fileSource = dir.getAbsolutePath() + File.separator + file.getOriginalFilename();
                File serverFile = new File(fileSource);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                String fileAnh = "/resources/images/" + file.getOriginalFilename();
                anh.setSrc(fileAnh);
                stream.write(bytes);
                stream.close();
            }

            //return "You uploaded successfully a file, at : " + fileSource;
//            return "redirect:/photos";
        } catch (Exception e) {
            System.out.println(e);
            return "Error when uploading file" + e;
        }
        baiDangRepository.save(baidang);
        anh.setBaiDangEntity(baidang);
        anhRepository.save(anh);
        return "quanlybaidang";
    }

    @Transactional
    @RequestMapping(value = "/thembaidang", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=UTF-8")
    public String themBaiDang(@RequestParam("tinhThanhId") int tinhThanhId, @RequestParam("danhMucId") int danhMucId,
                              @RequestParam("menhGiaId") int menhGiaId, @RequestParam("thoiHanId") int thoiHanId,
//                              @RequestParam("fileData") CommonsMultipartFile[] fileData,
                              HttpServletRequest request, BaiDangEntity baidang, Model model, ThoiHanEntity thoihan, Product product) {
        HttpSession session = request.getSession();
        TaiKhoanEntity tk = taiKhoanRepository.findByEmail(SecurityUtils.getPrincipal().getEmail());
        baidang.setTaiKhoanEntity(tk);


//        QuanHuyenEntity quanHuyen = new QuanHuyenEntity();
        DanhMucEntity danhmuc = new DanhMucEntity();
        MenhGiaEntity menhgia = new MenhGiaEntity();
//        ThoiHanEntity thoihan = new ThoiHanEntity();
        TaiKhoanEntity taikhoan = new TaiKhoanEntity();
        TinhThanhEntity tinhthanh = new TinhThanhEntity();

        danhmuc.setId(danhMucId);
        baidang.setDanhMucEntity(danhmuc);

        menhgia.setId(menhGiaId);
        baidang.setMenhGiaEntity(menhgia);

        thoihan.setId(thoiHanId);
        baidang.setThoiHanEntity(thoihan);

        tinhthanh.setId(tinhThanhId);
        baidang.setTinhThanhEntity(tinhthanh);
       /* quanHuyen.setId(quanHuyenId);
        baidang.setQuanHuyenEntity(quanHuyen);*/

        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        baidang.setNgayDang(date);

        baidang.setSoSao(0);
        baidang.setTrangThai(0);
        baidang.setStatus(1);
        AnhEntity anh = new AnhEntity();
        try {
            CommonsMultipartFile[] files = product.getFileData();

            for (int i = 0; i < files.length; i++) {
                CommonsMultipartFile file = files[i];
                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                // Assume uploaded file location on web server is D:\file-upload

                File dir = new File(IMG_ROOT_PATH);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Create the file on server
                String fileSource = dir.getAbsolutePath() + File.separator + file.getOriginalFilename();
                File serverFile = new File(fileSource);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                String fileAnh = "/resources/images/" + file.getOriginalFilename();
                anh.setSrc(fileAnh);
                stream.write(bytes);
                stream.close();
            }

            //return "You uploaded successfully a file, at : " + fileSource;
//            return "redirect:/photos";
        } catch (Exception e) {
            System.out.println(e);
            return "Error when uploading file" + e;
        }
        baiDangRepository.save(baidang);
        anh.setBaiDangEntity(baidang);
        anhRepository.save(anh);
        model.addAttribute("thongbao2", "Thêm bài đăng thành công vui lòng chờ admin duyệt");


        return "thembaidang";
    }

    @RequestMapping(value = "/chinhsuabaidang", method = RequestMethod.GET)
    public String showChinhSuaBaiDang(Model model, HttpServletRequest request) {

        HttpSession session = request.getSession();
        String email2 = (String) session.getAttribute("emailUser");
        List<BaiDangEntity> listBaiDang = baiDangRepository.findByTaiKhoanEntityEmail(SecurityUtils.getPrincipal().getEmail());
        model.addAttribute("listBaiDang", listBaiDang);
        homeController.loadTinhThanh(model);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadBaiDangGiaCao(model);
        homeController.loadBaiDangGiaRe(model);
        return "chinhsuabaidang";
    }

    @RequestMapping(value = "/showquanlytin")
    public String showSuaTin(@RequestParam(value = "param1", required = true) String parameter1, Model model) {

        model.addAttribute("message", parameter1);

        return "chinhsuabaidang";
    }

    @RequestMapping(value = "/showquanlytin/{id}", method = RequestMethod.GET)
    public String showChinhSuaBaiDang(@PathVariable int id, Model model, HttpServletRequest request/*,
                                      @RequestParam(value = "param1", required = true) String parameter1*/) {

        HttpSession session = request.getSession();
        session.setAttribute("tinhthanhid", String.valueOf(id));


        BaiDangEntity baiDang = baiDangRepository.findOne(id);
        model.addAttribute("baiDang", baiDang);
//        model.addAttribute("message", parameter1);
        homeController.loadTinhThanh(model);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadMenhGia(model);
        homeController.loadThoiHan(model);
        homeController.loadBaiDangGiaCao(model);
        homeController.loadBaiDangGiaRe(model);

        return "capnhatbaidang";
    }


    @RequestMapping(value = "/chinhsuabaidang", method = POST, consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public String chinhSuaBaiDang(@RequestParam("tinhThanhId") int tinhThanhId, @RequestParam("danhMucId") int danhMucId,
                                  @RequestParam("menhGiaId") int menhGiaId, @RequestParam("thoiHanId") int thoiHanId,
                                  HttpServletRequest request, BaiDangEntity baidang) {

        HttpSession session = request.getSession();

        TinhThanhEntity tinhthanh = new TinhThanhEntity();
        tinhthanh.setId(tinhThanhId);
        baidang.setTinhThanhEntity(tinhthanh);

        DanhMucEntity danhmuc = new DanhMucEntity();
        danhmuc.setId(danhMucId);
        baidang.setDanhMucEntity(danhmuc);

        MenhGiaEntity menhgia = new MenhGiaEntity();
        menhgia.setId(menhGiaId);
        baidang.setMenhGiaEntity(menhgia);

        ThoiHanEntity thoihan = new ThoiHanEntity();
        thoihan.setId(thoiHanId);
        baidang.setThoiHanEntity(thoihan);

        TaiKhoanEntity taikhoan = taiKhoanRepository.findByEmail(SecurityUtils.getPrincipal().getEmail());
        baidang.setTaiKhoanEntity(taikhoan);

        baidang.setNgayDang(baidang.getNgayDang());

        baidang.setSoSao(0);
        baidang.setTrangThai(1);
        AnhEntity anh = new AnhEntity();
        return "dangnhap2";
    }

    @Autowired
    LichSuRepository lichSuRepository;
    @Autowired
    DauTinRepository dauTinRepository;

    @RequestMapping(value = "/xoabaidang/{id}")
    public String xoaBaiDang(@PathVariable int id, Model model, HttpServletRequest request) {

        BaiDangEntity baiDang = baiDangRepository.findOne(id);
        List<LichSuEntity> listLichSu = lichSuRepository.findByBaiDangEntityId(id);
        for (LichSuEntity ls : listLichSu) {
            lichSuRepository.delete(ls.getId());
        }

        List<AnhEntity> listAnh = anhRepository.findByBaiDangEntityId(id);
        for (AnhEntity anh : listAnh) {
            anhRepository.delete(anh.getId());
        }

        List<DauTinEntity> listDauTin = dauTinRepository.findByBaiDangEntityId(id);
        for (DauTinEntity dautin : listDauTin) {
            dauTinRepository.delete(dautin.getId());
        }
        baiDangRepository.delete(id);
        return "redirect:/quanlytin/chinhsuabaidang";
    }

    @RequestMapping(value = "/suabaidang/{id}", method = POST)
    public String capNhatBaiDang(Model model, BaiDangEntity baidang, @RequestParam("tinhThanhId") int tinhThanhId,
                                 @RequestParam("danhMucId") int danhMucId, @RequestParam("menhGiaId") int menhGiaId,
                                 @RequestParam("thoiHanId") int thoiHanId, HttpServletRequest request, Product product) {
        HttpSession session = request.getSession();
        model.addAttribute("fdfd", baidang.getTieuDe());
        BaiDangEntity bd = baiDangRepository.findOne(baidang.getId());

        TaiKhoanEntity tk = taiKhoanRepository.findByEmail(SecurityUtils.getPrincipal().getEmail());
        baidang.setTaiKhoanEntity(tk);

        TinhThanhEntity tinhthanh = new TinhThanhEntity();
        DanhMucEntity danhmuc = new DanhMucEntity();
        MenhGiaEntity menhgia = new MenhGiaEntity();
        ThoiHanEntity thoihan = new ThoiHanEntity();

        tinhthanh.setId(tinhThanhId);
        danhmuc.setId(danhMucId);
        menhgia.setId(menhGiaId);
        thoihan.setId(thoiHanId);

        bd.setTinhThanhEntity(tinhthanh);
        bd.setDanhMucEntity(danhmuc);
        bd.setMenhGiaEntity(menhgia);
        bd.setThoiHanEntity(thoihan);

        bd.setTieuDe(baidang.getTieuDe());
        bd.setNoiDung(baidang.getNoiDung());
        bd.setPhongNgu(baidang.getPhongNgu());
        bd.setPhongTam(baidang.getPhongTam());
        bd.setTangLau(baidang.getTangLau());
        bd.setDienTichDat(baidang.getDienTichDat());
        bd.setDienTichSuDung(baidang.getDienTichSuDung());
        bd.setGia(baidang.getGia());

        List<AnhEntity> listAnh = anhRepository.findByBaiDangEntityId(baidang.getId());
        for (AnhEntity anh2 : listAnh) {
            anhRepository.delete(anh2.getId());
        }

        AnhEntity anh = new AnhEntity();
        try {
            CommonsMultipartFile[] files = product.getFileData();

            for (int i = 0; i < files.length; i++) {
                CommonsMultipartFile file = files[i];
                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                // Assume uploaded file location on web server is D:\file-upload

                File dir = new File(IMG_ROOT_PATH);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Create the file on
                String fileSource = dir.getAbsolutePath() + File.separator + file.getOriginalFilename();
                File serverFile = new File(fileSource);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                String fileAnh = "/resources/images/" + file.getOriginalFilename();
                anh.setSrc(fileAnh);
                stream.write(bytes);
                stream.close();
            }

            //return "You uploaded successfully a file, at : " + fileSource;
//            return "redirect:/photos";
        } catch (Exception e) {
            System.out.println(e);
            return "Error when uploading file" + e;
        }
        anh.setBaiDangEntity(baidang);
        anhRepository.save(anh);

        baiDangRepository.save(bd);

        return "redirect:/quanlytin/suabaidang";
    }

    @RequestMapping(value = "/capnhapbaidang", method = POST)
    public String capNhatBaiDang(Model model, BaiDangEntity baidang) {
        model.addAttribute("fdfd", baidang.getTieuDe());
        return "dangnhap2";
    }


}
