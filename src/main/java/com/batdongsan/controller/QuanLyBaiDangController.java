package com.batdongsan.controller;

import com.batdongsan.entity.*;
import com.batdongsan.repository.AnhRepository;
import com.batdongsan.repository.BaiDangRepository;
import com.batdongsan.repository.TaiKhoanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

@Controller
@RequestMapping(value = "/quanlybaidang")
public class QuanLyBaiDangController {
    private static final String IMG_ROOT_PATH = "E:\\GITHUB\\BatDongSan\\src\\main\\webapp\\resources\\images";

    @Autowired
    TaiKhoanRepository taiKhoanRepository;
    @Autowired
    BaiDangRepository baiDangRepository;
    @Autowired
    AnhRepository anhRepository;

    @RequestMapping(value = "/tan/{id}")
    public String fdsf(@PathVariable int id, @RequestParam("tinhThanhId") int tinhThanhId, @RequestParam("danhMucId") int danhMucId,
                       @RequestParam("menhGiaId") int menhGiaId, @RequestParam("thoiHanId") int thoiHanId,
                       @RequestParam("fileData") CommonsMultipartFile[] fileData,
                       HttpServletRequest request, BaiDangEntity baidang){
        HttpSession session = request.getSession();
        TaiKhoanEntity tk = taiKhoanRepository.findByEmail((String) session.getAttribute("emailUser"));
        baidang.setTaiKhoanEntity(tk);

//        QuanHuyenEntity quanHuyen = new QuanHuyenEntity();
        DanhMucEntity danhmuc = new DanhMucEntity();
        MenhGiaEntity menhgia = new MenhGiaEntity();
        ThoiHanEntity thoihan = new ThoiHanEntity();
        TaiKhoanEntity taikhoan = new TaiKhoanEntity();
        TinhThanhEntity tinhthanh = new TinhThanhEntity();

        baidang.setId(id);

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

        } catch (Exception e) {
            System.out.println(e);
            return "Error when uploading file" + e;
        }
        baiDangRepository.save(baidang);
        anh.setBaiDangEntity(baidang);
        anhRepository.save(anh);
        return "quanlybaidang";

    }
}
