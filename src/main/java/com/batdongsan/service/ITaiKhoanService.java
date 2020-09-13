package com.batdongsan.service;

import com.batdongsan.model.TaiKhoanModel;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;

public interface ITaiKhoanService {
    TaiKhoanModel khoaTaiKhoanUser(TaiKhoanModel taiKhoanModel, HttpServletRequest request);
    TaiKhoanModel khoaTaiKhoanAdmin(TaiKhoanModel taiKhoanModel, HttpServletRequest request);
    TaiKhoanModel moTaiKhoan(TaiKhoanModel taiKhoanModel , HttpServletRequest request) throws ParseException;
    TaiKhoanModel moTaiKhoanAdmin(TaiKhoanModel taiKhoanModel, HttpServletRequest request);
    void deleteUser(long[] ids);
    void deleteAdmin(long[] ids , HttpServletRequest request);
    TaiKhoanModel khoiPhucTaiKhoan(TaiKhoanModel taiKhoanModel , HttpServletRequest request);
    TaiKhoanModel capNhatThongTin(TaiKhoanModel taiKhoanModel);
    TaiKhoanModel doiMatKhau(TaiKhoanModel taiKhoanModel);
}