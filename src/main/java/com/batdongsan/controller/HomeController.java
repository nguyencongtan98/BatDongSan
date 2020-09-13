package com.batdongsan.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.batdongsan.entity.BaiDangEntity;
import com.batdongsan.entity.DanhMucEntity;
import com.batdongsan.entity.LoaiTinEntity;
import com.batdongsan.entity.MenhGiaEntity;
import com.batdongsan.entity.ThoiHanEntity;
import com.batdongsan.entity.TinhThanhEntity;
import com.batdongsan.repository.BaiDangRepository;
import com.batdongsan.repository.DanhMucRepository;
import com.batdongsan.repository.LichSuRepository;
import com.batdongsan.repository.LoaiTinRepository;
import com.batdongsan.repository.MenhGiaRepository;
import com.batdongsan.repository.ThoiHanRepository;
import com.batdongsan.repository.TinhThanhRepository;
import com.batdongsan.util.Location;


@Controller
@RequestMapping(value = "/")
public class HomeController {
	@Autowired
	DanhMucRepository danhMucRepository;
	@Autowired
	TinhThanhRepository tinhThanhRepository;
	@Autowired
	BaiDangRepository baiDangRepository;
	@Autowired
	LoaiTinRepository loaiTinRepository;
	@Autowired
	MenhGiaRepository menhGiaRepository;
	@Autowired
	ThoiHanRepository thoiHanRepository;

	@RequestMapping(value = "/chinhsuabaidang", method = RequestMethod.POST)
	public String fdsf(@PathVariable int id, Model model, BaiDangEntity baidang) {
		model.addAttribute("id", id);
		return "quanlybaidang";
	}

	@RequestMapping(value = "/xoathoihan/{id}")
	public String xoaThoiHan(@PathVariable int id, ThoiHanEntity thoihan, Model model) {
		int n = JOptionPane.showConfirmDialog(null, "Báº¡n cÃ³ muá»‘n xÃ³a khÃ´ng?", "ThÃ´ng bÃ¡o",
				JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
		if (n == 0) {
			thoiHanRepository.delete(id);
			model.addAttribute("thongbao", "Xoa thanh cong");
			return "redirect:/admin/showthoihan";
		} else
			return "redirect:/admin/showthoihan";
	}

	@RequestMapping(value = "")
	public String showHome(Model model, HttpServletRequest request) throws Exception {
		// Load trang chá»§
		loadBaiDang(model);
		loadDanhMuc(model);
		loadLoaiTin(model);
		loadTinhThanh(model);
		loadBaiDangGiaRe(model);
		loadBaiDangGiaCao(model);
		HttpSession session = request.getSession();
		Long total = baiDangRepository.count();
		model.addAttribute("total", total);
		model.addAttribute("kimtradangnhap", session.getAttribute("emailUser"));
		return "index_4";
	}

	@RequestMapping(value = "/timqtinhthanh/{id}")
	public String timQuanHuyen(@PathVariable("id") int id, Model model) {

		loadDanhMuc(model);
		loadLoaiTin(model);
		loadTinhThanh(model);

		TinhThanhEntity tinhThanh = tinhThanhRepository.findOne(id);
		model.addAttribute("tinhThanh", tinhThanh);

		model.addAttribute("tinhThanh1", "");
		return "index";
	}

	public void loadTinhThanh(Model model) {
		List<TinhThanhEntity> listTinhThanh = (List<TinhThanhEntity>) tinhThanhRepository.findAll();
		model.addAttribute("listTinhThanh", listTinhThanh);
		model.addAttribute("tinhThanh1", "Tá»‰nh, thÃ nh phá»‘");
	}

	public void loadBaiDang(Model model) throws Exception {
		List<BaiDangEntity> listBaiDang = (List<BaiDangEntity>) baiDangRepository.findByTrangThaiAndStatusOrderByNgayDuyetDesc(1, 1);
		for (BaiDangEntity baiDang : listBaiDang) {
			Date date = baiDang.getNgayDuyet();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date d = df.parse(date.toString());
			final java.util.Calendar cal = GregorianCalendar.getInstance();
			cal.setTime(d);
			cal.add(GregorianCalendar.DATE, baiDang.getThoiHanEntity().getSoNgay());
//            System.out.println("result: " + df.format(cal.getTime()));
			Calendar cal2 = Calendar.getInstance();
//            System.out.println("result1: " + df.format(cal2.getTime()));

			if (df.format(cal.getTime()).compareTo(df.format(cal2.getTime())) <= 0) {
				baiDang.setTrangThai(0);
				baiDangRepository.save(baiDang);
			}
		}
		model.addAttribute("listBaiDang", listBaiDang);
	}

	public void loadBaiDangGiaRe(Model model) {
		List<BaiDangEntity> listBaiDangGiaRe = baiDangRepository.findBaiDangGiaRe();
		model.addAttribute("listBaiDangGiaRe", listBaiDangGiaRe);
	}

	public void loadBaiDangGiaCao(Model model) {
		List<BaiDangEntity> listBaiDangGiaCao = baiDangRepository.findBaiDangGiaCao();
		model.addAttribute("listBaiDangGiaCao", listBaiDangGiaCao);
	}

	public void loadDanhMuc(Model model) {
		// Láº¥y danh sÃ¡ch danh má»¥c
		List<DanhMucEntity> listDanhMuc = (List<DanhMucEntity>) danhMucRepository.findAll();
		model.addAttribute("listDanhMuc", listDanhMuc);
	}

	public void loadLoaiTin(Model model) {
		// Láº¥y danh sÃ¡ch loáº¡i tin
		List<LoaiTinEntity> listLoaiTin = (List<LoaiTinEntity>) loaiTinRepository.findAll();
		model.addAttribute("listLoaiTin", listLoaiTin);
	}

	@Autowired
	LichSuRepository lichSuRepository;

	@RequestMapping(value = "/xemchitiet/{id}")
	public String showChiTietBaiDang(@PathVariable int id, Model model) throws Exception {

		BaiDangEntity baiDang = baiDangRepository.findOne(id);
		model.addAttribute("baiDang", baiDang);
		model.addAttribute("listLichSu", lichSuRepository.findByBaiDangEntityIdOrderByGiaDeXuatDesc(id));
		loadBaiDang(model);
		loadDanhMuc(model);
		loadLoaiTin(model);
		loadTinhThanh(model);
		loadBaiDangGiaCao(model);

		return "about";
	}

	public void loadMenhGia(Model model) {
		// Láº¥y danh sÃ¡ch danh má»¥c
		List<MenhGiaEntity> listMenhGia = (List<MenhGiaEntity>) menhGiaRepository.findAll();
		model.addAttribute("listMenhGia", listMenhGia);
	}

	public void loadThoiHan(Model model) {
		// Láº¥y danh sÃ¡ch danh má»¥c
		List<ThoiHanEntity> listThoiHan = (List<ThoiHanEntity>) thoiHanRepository.findAll();
		model.addAttribute("listThoiHan", listThoiHan);
	}

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String showMap(Model model) throws Exception {
		loadBaiDang(model);
		loadDanhMuc(model);
		loadLoaiTin(model);
		loadTinhThanh(model);
		loadBaiDangGiaCao(model);
		loadBaiDangGiaRe(model);
		model.addAttribute("location", new Location(16.058581, 108.168957));
		return "map";
	}


}
