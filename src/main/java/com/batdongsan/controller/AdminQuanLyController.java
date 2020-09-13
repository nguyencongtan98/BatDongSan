package com.batdongsan.controller;

import com.batdongsan.entity.*;
import com.batdongsan.repository.*;
import com.batdongsan.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.*;

@Controller
@RequestMapping(value = "/adminquanli")
public class AdminQuanLyController {

    private static final String IMG_ROOT_PATH = "E:\\GITHUB\\BatDongSan\\src\\main\\webapp\\resources\\images";

    @Autowired
    ThoiHanRepository thoiHanRepository;

    /*@RequestMapping(value = "/thoihan" , method = PUT)
    public ThoiHanModel updateThoiHan(@RequestBody ThoiHanModel thoiHanModel) {
        return thoiHanService.updateThoiHan(thoiHanModel);
    }*/

    @RequestMapping(value = "/themthoihan",method = GET, produces = "application/x-www-form-urlencoded;charset=UTF-8")
    public String themThoiHan(ThoiHanEntity thoihan, Model model) {
        /*if (thoiHanRepository.findBySoNgay(thoihan.getSoNgay()) != null) {
            model.addAttribute("thongbao", "Them that bai");
        } else {
            thoiHanRepository.save(thoihan);
            model.addAttribute("thongbao", "Them thanh cong");
        }*/
        return "admin/admin-edit-thoihan";

    }

    @RequestMapping(value = "/suathoihan/{id}")
    public String suaThoiHan(@PathVariable int id, ThoiHanEntity thoihan, Model model) {

        if (thoiHanRepository.findBySoNgay(thoihan.getSoNgay()) != null) {
            model.addAttribute("thongbao", "Sua that bai");
        } else {
            thoihan.setId(id);
            thoiHanRepository.save(thoihan);
            model.addAttribute("thongbao", "Sua thanh cong");
        }
        return "redirect:/admin/showthoihan";
    }

    @RequestMapping(value = "/xoathoihan/{id}")
    public String xoaThoiHan(@PathVariable int id, ThoiHanEntity thoihan, Model model) {

        thoiHanRepository.delete(id);
        model.addAttribute("thongbao", "Xoa thanh cong");
        return "redirect:/admin/showthoihan";
    }

    @RequestMapping(value = "/searchthoihan", method = GET)
    public String searchThoiHan(@RequestParam("searchInput") int searchInput, Model model) {
        List<ThoiHanEntity> resultList;
        if (searchInput == 0) {
            resultList = (List<ThoiHanEntity>) thoiHanRepository.findAll();
        } else {
            resultList = thoiHanRepository.findBySoNgayContaining(searchInput);
        }
        if (resultList != thoiHanRepository.findBySoNgayContaining(searchInput)) {
            model.addAttribute("noteFound", "Not found product");
        }
        model.addAttribute("listThoiHan", resultList);
        return "admin-list-thoihan";
    }

    @Autowired
    LoaiTinRepository loaiTinRepository;

    @RequestMapping(value = "/themloaitin", produces = "application/x-www-form-urlencoded;charset=UTF-8")
    public String themLoaiTin(LoaiTinEntity loaitin, Model model) {

        if (loaiTinRepository.findByTenLoaiTin(loaitin.getTenLoaiTin()) != null) {
            model.addAttribute("thongbao", "Them that bai");

        } else {
            model.addAttribute("thongbao", "Them thanh cong");
            loaiTinRepository.save(loaitin);

        }
        return "redirect:/admin/showloaitin";
    }

    @RequestMapping(value = "/sualoaitin/{id}")
    public String suaLoaiTin(@PathVariable int id, LoaiTinEntity loaitin, Model model) {
//        loaitin.setId(id);
//        loaiTinRepository.save(loaitin);
//        model.addAttribute("thongbao","Sua thanh cong");

        if (loaiTinRepository.findByTenLoaiTin(loaitin.getTenLoaiTin()) != null) {
            model.addAttribute("thongbao", "Sua that bai");
        } else {
            loaitin.setId(id);
            loaiTinRepository.save(loaitin);
            model.addAttribute("thongbao", "Sua thanh cong");
        }
        return "redirect:/admin/showloaitin";
    }

    @RequestMapping(value = "/xoaloaitin/{id}")
    public String xoaLoaiTin(@PathVariable int id, LoaiTinEntity loaitin, Model model) {

        List<DanhMucEntity> listDanhMuc = (List<DanhMucEntity>) danhMucRepository.findByLoaiTinEntityId(id);
        for (DanhMucEntity dm : listDanhMuc) {
            danhMucRepository.delete(dm.getId());
        }


        loaiTinRepository.delete(id);
        model.addAttribute("thongbao", "Xoa thanh cong");
        return "redirect:/admin/showloaitin";
    }

    @RequestMapping(value = "/searchloaitin", method = GET)
    public String searchLoaiTin(@RequestParam("searchInput") String searchInput, Model model) {
        List<LoaiTinEntity> resultList;
        if (searchInput.isEmpty()) {
            resultList = (List<LoaiTinEntity>) loaiTinRepository.findAll();
        } else {
            resultList = loaiTinRepository.findByTenLoaiTinContaining(searchInput);
        }
        if (resultList != loaiTinRepository.findByTenLoaiTinContaining(searchInput)) {
            model.addAttribute("noteFound", "Not found product");
        }
        model.addAttribute("listLoaiTin", resultList);
        return "admin-themloaitin";
    }

    @Autowired
    DanhMucRepository danhMucRepository;

    @Autowired
    TinhThanhRepository tinhThanhRepository;
    @Autowired
    BaiDangRepository baiDangRepository;

    @RequestMapping(value = "/themdanhmuc", method = POST, produces = "application/x-www-form-urlencoded;charset=UTF-8")
    public String themDanhMuc(@RequestParam("loaiTinId") int loaiTinId, DanhMucEntity danhmuc, Model model) {

        LoaiTinEntity loaitin = new LoaiTinEntity();
        loaitin.setId(loaiTinId);
        danhmuc.setLoaiTinEntity(loaitin);

        if (danhMucRepository.findByTenDanhMuc(danhmuc.getTenDanhMuc()) != null) {
            model.addAttribute("thongbao", "Them that bai");

        } else {
            model.addAttribute("thongbao", "Them thanh cong");
            danhMucRepository.save(danhmuc);
        }
        return "redirect:/admin/showdanhmuc";

    }

    @RequestMapping(value = "/suadanhmuc/{id}")
    public String suaDanhMuc(@PathVariable int id, DanhMucEntity danhmuc, Model model) {

        if (danhMucRepository.findByTenDanhMuc(danhmuc.getTenDanhMuc()) != null) {
            model.addAttribute("thongbao", "Sua that bai");
        } else {
            danhmuc.setId(id);
            danhMucRepository.save(danhmuc);
            model.addAttribute("thongbao", "Sua thanh cong");
        }
        return "redirect:/admin/showdanhmuc";
    }

    @RequestMapping(value = "/xoadanhmuc/{id}")
    public String xoaDanhMuc(@PathVariable int id, DanhMucEntity danhmuc, Model model) {

        danhMucRepository.delete(id);
        model.addAttribute("thongbao", "Xoa thanh cong");
        return "redirect:/admin/showdanhmuc";
    }

    @RequestMapping(value = "/search", method = GET)
    public String search(@RequestParam("searchInput") String searchInput, Model model) {
        List<DanhMucEntity> resultList;
        if (searchInput.isEmpty()) {
            resultList = (List<DanhMucEntity>) danhMucRepository.findAll();
        } else {
            resultList = danhMucRepository.findByTenDanhMucContaining(searchInput);
        }
        if (resultList != danhMucRepository.findByTenDanhMucContaining(searchInput)) {
            model.addAttribute("noteFound", "Not found product");
        }
        model.addAttribute("listDanhMuc", resultList);
        return "admin-themdanhmuc";
    }

    @Autowired
    TaiKhoanRepository taiKhoanRepository;
    @Autowired
    LichSuRepository lichSuRepository;
    @Autowired
    AnhRepository anhRepository;

    @RequestMapping(value = "/xoathanhvien/{id}")
    public String xoaThanhVien(@PathVariable int id, TaiKhoanEntity taikhoan, Model model) {

        List<BaiDangEntity> listBaiDang = baiDangRepository.findByTaiKhoanEntityId(id);
        List<LichSuEntity> listLichSu = lichSuRepository.findByTaiKhoanEntityId(id);

        for (BaiDangEntity baidang : listBaiDang) {
            List<AnhEntity> listAnh = anhRepository.findByBaiDangEntityId(id);
            for (AnhEntity anh : listAnh) {
                anhRepository.delete(anh.getId());
            }
            baiDangRepository.delete(baidang.getId());
        }

        for (LichSuEntity lichsu : listLichSu) {
            lichSuRepository.delete(lichsu.getId());
        }
        taiKhoanRepository.delete(id);
        return "fdf";
    }

    @RequestMapping(value = "/searchthanhvien", method = GET)
    public String searchThanhVien(@RequestParam("searchInput") String searchInput, Model model) {
        List<TaiKhoanEntity> resultList;
        if (searchInput == "") {
            resultList = (List<TaiKhoanEntity>) taiKhoanRepository.findAll();
        } else {
            resultList = taiKhoanRepository.findByHoTenContaining(searchInput);
        }
        if (resultList != taiKhoanRepository.findByHoTenContaining(searchInput)) {
            model.addAttribute("noteFound", "Not found product");
        }
        model.addAttribute("listTaiKhoan", resultList);
        return "admin-qlthanhvien";
    }


    @RequestMapping(value = "/searchbaidangdd", method = GET)
    public String searchbaidang(@RequestParam("searchInput") String searchInput, Model model) {
        List<BaiDangEntity> resultList;
        if (searchInput.isEmpty()) {
            resultList = (List<BaiDangEntity>) baiDangRepository.findAll();
        } else {
            resultList = baiDangRepository.findByTieuDeContainingAndStatus(searchInput,1);
        }
        if (resultList != baiDangRepository.findByTieuDeContainingAndStatus(searchInput,1)) {
            model.addAttribute("noteFound", "Not found product");
        }
        model.addAttribute("listBaiDang", resultList);
        return "admin-qlbaidang";
    }

    @RequestMapping(value = "/duyetbaidang/{id}")
    public String duyetBaiDang(@PathVariable int id, Model model) {

        BaiDangEntity baidang = baiDangRepository.findOne(id);
        baidang.setTrangThai(1);
        baiDangRepository.save(baidang);
        return "redirect:/admin/baidangchuaduyet";
    }

    @RequestMapping(value = "/capnhapbaidang", method = POST)
    public String capNhatBaiDang(Model model, BaiDangEntity baidang, @RequestParam("tinhThanhId") int tinhThanhId,
                                 @RequestParam("danhMucId") int danhMucId, @RequestParam("menhGiaId") int menhGiaId,
                                 @RequestParam("thoiHanId") int thoiHanId, HttpServletRequest request){
        HttpSession session = request.getSession();
        model.addAttribute("fdfd",baidang.getTieuDe());
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


        baiDangRepository.save(bd);

        return "redirect:/quanlytin/showquanlytin/"+baidang.getId();

    }
    @RequestMapping(value = "/uploadFile/{id}", method = POST)
    public String capNhatAnh( Product product, @PathVariable int id) {

        BaiDangEntity baidang = baiDangRepository.findOne(id);
        List<AnhEntity> listAnh = anhRepository.findByBaiDangEntityId(baidang.getId());
        for (AnhEntity anh2: listAnh) {
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

        return "redirect:/quanlytin/chinhsuabaidang";
    }

    @Autowired
    DauTinRepository dauTinRepository;
    @Autowired
    HomeController homeController;

    @RequestMapping(value = "/xoataikhoan/{id}")
    public String xoaTaiKhoan(@PathVariable int id){

        List<DauTinEntity> listDauTin = dauTinRepository.findByTaiKhoanEntityId(id);
        for ( DauTinEntity dautin :listDauTin) {
            dauTinRepository.delete(dautin.getId());
        }

        List<LichSuEntity> listLichSu = lichSuRepository.findByTaiKhoanEntityId(id);
        for (LichSuEntity lichsu: listLichSu) {
            lichSuRepository.delete(lichsu.getId());
        }

        List<BaiDangEntity> listBaiDang = baiDangRepository.findByTaiKhoanEntityId(id);
        for (BaiDangEntity baidang: listBaiDang) {
            List<AnhEntity> listAnh = anhRepository.findByBaiDangEntityId(baidang.getId());
            for ( AnhEntity anh : listAnh) {
                anhRepository.delete(anh.getId());
            }
            baiDangRepository.delete(baidang.getId());
        }

        taiKhoanRepository.delete(id);


        return "redirect:/admin";
    }
}
