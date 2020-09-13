package com.batdongsan.controller;

import com.batdongsan.entity.BaiDangEntity;
import com.batdongsan.repository.BaiDangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping(value = "/timkiem")
public class TimKiemController {
    @Autowired
    BaiDangRepository baiDangRepository;
    @Autowired
    HomeController homeController;


    @RequestMapping(value = "", method = GET)
    public String searchBaiDang(@RequestParam("searchInput") String searchInput, Model model) {
        List<BaiDangEntity> resultList;
        if (searchInput.isEmpty()) {
            resultList = (List<BaiDangEntity>) baiDangRepository.findByTrangThaiAndStatusOrderByIdDesc(1,1);
        } else {
            resultList = baiDangRepository.findByTieuDeContainingAndTrangThaiAndStatus(searchInput, 1,1);
        }
        List<BaiDangEntity> resultList2 = baiDangRepository.findByTieuDeContainingAndTrangThaiAndStatus(searchInput, 1,1);
        if (resultList2.isEmpty()) {
            model.addAttribute("thongbao", "Không tìm thấy bài đăng nào !");
        }
        int i =0;
        for (BaiDangEntity baiDangEntity : resultList2) {
			i++;
		}
        model.addAttribute("total", i);
        model.addAttribute("listBaiDang", resultList);
       
        
       

        homeController.loadTinhThanh(model);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadBaiDangGiaRe(model);
        homeController.loadBaiDangGiaCao(model);

        return "index_4";

    }

    @RequestMapping(value = "/theotinhthanh/{id}")
    public String timbaiDangTheoTinhThanh(@PathVariable int id, Model model) {

        List<BaiDangEntity> listBaiDang = baiDangRepository.findByTinhThanhEntityId(id);
        model.addAttribute("listBaiDang", listBaiDang);

        if (listBaiDang.isEmpty()) {
            model.addAttribute("thongbao", "Không tìm thấy bài đăng nào !");
        }
        
        int i =0;
        for (BaiDangEntity baiDangEntity : listBaiDang) {
			i++;
		}
        model.addAttribute("total", i);

        homeController.loadTinhThanh(model);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadBaiDangGiaRe(model);
        homeController.loadBaiDangGiaCao(model);
        return "index_4";

    }

    @RequestMapping(value = "/timbaidangtheodanhmuc/{id}")
    public String timTheoDanhMuc(@PathVariable int id, Model model) throws ParseException {


        List<BaiDangEntity> listBaiDang = baiDangRepository.findByDanhMucEntityId(id);

        if (listBaiDang.isEmpty()) {
            model.addAttribute("thongbao", "Không tìm thấy bài đăng nào !");
        }else model.addAttribute("listBaiDang", listBaiDang);
        
        int i =0;
        for (BaiDangEntity baiDangEntity : listBaiDang) {
			i++;
		}
        model.addAttribute("total", i);

        homeController.loadTinhThanh(model);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadBaiDangGiaRe(model);
        homeController.loadBaiDangGiaCao(model);
        return "index_4";
    }

    @RequestMapping(value = "/timbaidangtheoloaitin/{id}")
    public String timTheoLoaiTin(@PathVariable int id, Model model) throws ParseException {


        List<BaiDangEntity> listBaiDang = baiDangRepository.findByDanhMucEntityLoaiTinEntityId(id);

        if (listBaiDang.isEmpty()) {
            model.addAttribute("thongbao", "Không tìm thấy bài đăng nào !");
        }else model.addAttribute("listBaiDang", listBaiDang);
        
        int i =0;
        for (BaiDangEntity baiDangEntity : listBaiDang) {
			i++;
		}
        model.addAttribute("total", i);
        

        homeController.loadTinhThanh(model);
        homeController.loadLoaiTin(model);
        homeController.loadDanhMuc(model);
        homeController.loadBaiDangGiaRe(model);
        homeController.loadBaiDangGiaCao(model);
        return "index_4";
    }


}
