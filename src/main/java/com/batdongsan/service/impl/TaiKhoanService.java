package com.batdongsan.service.impl;

import com.batdongsan.crypto.Pbkdf2Encryptor;
import com.batdongsan.entity.*;
import com.batdongsan.model.MyUser;
import com.batdongsan.model.TaiKhoanModel;
import com.batdongsan.repository.*;
import com.batdongsan.service.ITaiKhoanService;
import com.batdongsan.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

@Service
public class TaiKhoanService implements ITaiKhoanService {
    @Autowired
    private ThoiHanKhoaRepository thoiHanKhoaRepository;

    @Autowired
    private TaiKhoanRepository taiKhoanRepository;

    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    @Override
    @Transactional
    public TaiKhoanModel khoaTaiKhoanUser(TaiKhoanModel taiKhoanModel, HttpServletRequest request) {
        Calendar cal = Calendar.getInstance();
        Date date = cal.getTime();
        ThoiHanKhoaEntity list = thoiHanKhoaRepository.findOne(taiKhoanModel.getThoiHanKhoaEntity());
        TaiKhoanEntity old = taiKhoanRepository.findOne(taiKhoanModel.getId());
        List<BaiDangEntity> entities = baiDangRepository.findByTaiKhoanEntityId(taiKhoanModel.getId());
        // khi khóa tài khoản thì bài đăng sẽ đc xóa luôn
        //thay vì phải lưu trong database
        for (BaiDangEntity item : entities) {
            item.setStatus(0);
            item.setTrangThai(0);
            baiDangRepository.save(item);
        }
        old.setNgayKhoa(date);
        old.setNguoiKhoa(SecurityUtils.getPrincipal().getHoTen());
        old.setTrangThai(0);
        old.setNguoiChinhSua(null);
        old.setNgayChinhSua(null);
        old.setThoiHanKhoaEntity(list);
        old = taiKhoanRepository.save(old);
        // trả về model
        TaiKhoanModel taiKhoanModel1 = new TaiKhoanModel();
        taiKhoanModel1.setId(old.getId());
        taiKhoanModel1.setThoiHanKhoaEntity(old.getThoiHanKhoaEntity().getId());
        return taiKhoanModel1;
    }

    @Override
    @Transactional
    public TaiKhoanModel khoaTaiKhoanAdmin(TaiKhoanModel taiKhoanModel, HttpServletRequest request) {
        Calendar cal = Calendar.getInstance();
        Date date = cal.getTime();
        ThoiHanKhoaEntity list = thoiHanKhoaRepository.findOne(taiKhoanModel.getThoiHanKhoaEntity());
        TaiKhoanEntity old = taiKhoanRepository.findOne(taiKhoanModel.getId());
        old.setNgayKhoa(date);
        old.setTrangThai(0);
        old.setNgayXoa(null);
        old.setNguoiXoa(null);
        old.setNguoiChinhSua(null);
        old.setNgayChinhSua(null);
        old.setNguoiKhoa(SecurityUtils.getPrincipal().getHoTen());
        old.setThoiHanKhoaEntity(list);
        old = taiKhoanRepository.save(old);
        // trả về model
        TaiKhoanModel taiKhoanModel1 = new TaiKhoanModel();
        taiKhoanModel1.setId(old.getId());
        taiKhoanModel1.setThoiHanKhoaEntity(old.getThoiHanKhoaEntity().getId());
        return taiKhoanModel1;
    }

    @Override
    @Transactional
    public TaiKhoanModel moTaiKhoan(TaiKhoanModel taiKhoanModel, HttpServletRequest request) throws ParseException {
        TaiKhoanEntity old = taiKhoanRepository.findOne(taiKhoanModel.getId());
        old.setTrangThai(1);
        old.setNgayKhoa(null);
        old.setNguoiKhoa(null);
        old.setThoiHanKhoaEntity(null);
        old.setNgayChinhSua(new Timestamp(System.currentTimeMillis()));
        old.setNguoiChinhSua(SecurityUtils.getPrincipal().getHoTen());

        //ktra xem bài đăng còn hạn đăng bài ko
        List<BaiDangEntity> entities = baiDangRepository.findByTaiKhoanEntityId(taiKhoanModel.getId());
        for (BaiDangEntity item : entities) {
            if (item.getNgayDuyet() == null) {
                item.setStatus(1);
            } else {
                item.setStatus(1);
                Date date = item.getNgayDuyet();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                Date d = df.parse(date.toString());
                final java.util.Calendar cal = GregorianCalendar.getInstance();
                cal.setTime(d);
                cal.add(GregorianCalendar.DATE, item.getThoiHanEntity().getSoNgay());
                // gọi 1 cái calendar thứ 2 để so sánh vs cái thứ nhất
                Calendar cal2 = Calendar.getInstance();
                // nếu ngày thứ nhất giống ngày thứ 2 thì gỡ bài
                if (df.format(cal.getTime()).compareTo(df.format(cal2.getTime())) <= 0) {
                    item.setTrangThai(0);
                } else {
                    item.setTrangThai(1);
                }
                baiDangRepository.save(item);
            }
        }
        //
        old = taiKhoanRepository.save(old);
        TaiKhoanModel taiKhoanModel1 = new TaiKhoanModel();
        taiKhoanModel1.setId(old.getId());
        taiKhoanModel1.setTrangThai(old.getTrangThai());
        return taiKhoanModel1;
    }

    @Override
    @Transactional
    public TaiKhoanModel moTaiKhoanAdmin(TaiKhoanModel taiKhoanModel, HttpServletRequest request) {
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        TaiKhoanEntity old = taiKhoanRepository.findOne(taiKhoanModel.getId());
        old.setTrangThai(1);
        old.setNgayChinhSua(date);
        old.setNguoiChinhSua(SecurityUtils.getPrincipal().getHoTen());
        old.setNgayKhoa(null);
        old.setNguoiKhoa(null);
        old.setNgayXoa(null);
        old.setNguoiXoa(null);
        old.setThoiHanKhoaEntity(null);
        old = taiKhoanRepository.save(old);
        TaiKhoanModel taiKhoanModel1 = new TaiKhoanModel();
        taiKhoanModel1.setId(old.getId());
        taiKhoanModel1.setTrangThai(old.getTrangThai());
        return taiKhoanModel1;
    }

    @Autowired
    private BaiDangRepository baiDangRepository;

    @Autowired
    private AnhRepository anhRepository;

    @Autowired
    private DauTinRepository dauTinRepository;

    @Autowired
    private LichSuRepository lichSuRepository;

    @Override
    @Transactional
    public void deleteUser(long[] ids) {
        for (long id : ids) {
            // mún xóa tài khoản thì xóa bai đăng
            // mún xóa bài đăng thì xóa dấu tin ,ảnh , lịch sử
            List<BaiDangEntity> list = baiDangRepository.findByTaiKhoanEntityId((int) id);
            for (BaiDangEntity item : list) {
                // xóa ảnh
                List<AnhEntity> anhEntities = anhRepository.findByBaiDangEntityId(item.getId());
                if (anhEntities.isEmpty()) {
                } else {
                    for (AnhEntity item1 : anhEntities) {
                        anhRepository.delete(item1.getId());
                    }
                }
                // xóa dấu tin
                List<DauTinEntity> dauTinEntities = dauTinRepository.findByBaiDangEntityId(item.getId());
                if (dauTinEntities.isEmpty()) {
                } else {
                    for (DauTinEntity item2 : dauTinEntities) {
                        dauTinRepository.delete(item2.getId());
                    }
                }
                // xóa lịch sử
                List<LichSuEntity> lichSuEntities = lichSuRepository.findByBaiDangEntityId(item.getId());
                if (lichSuEntities.isEmpty()) {
                } else {
                    for (LichSuEntity item3 : lichSuEntities) {
                        lichSuRepository.delete(item3.getId());
                    }
                }
                baiDangRepository.delete(item.getId());
            }
            taiKhoanRepository.delete((int) id);
        }
    }

    @Override
    @Transactional
    public void deleteAdmin(long[] ids, HttpServletRequest request) {
        for (long id : ids) {
            TaiKhoanEntity old = taiKhoanRepository.findOne((int) id);
            Calendar calendar = Calendar.getInstance();
            Date date = calendar.getTime();
            old.setStatus(0);
            old.setThoiHanKhoaEntity(null);
            old.setNgayKhoa(null);
            old.setNguoiKhoa(null);
            old.setNgayChinhSua(null);
            old.setNguoiChinhSua(null);
            old.setNguoiXoa(SecurityUtils.getPrincipal().getHoTen());
            old.setNgayXoa(date);
            // ktra xem tài khoản đó có bị khóa không
            // nếu không thì khi xóa sẽ khóa luôn
            if (old.getTrangThai() == 1) {
                old.setTrangThai(0);
            }
            taiKhoanRepository.save(old);
        }
    }

    @Override
    @Transactional
    public TaiKhoanModel khoiPhucTaiKhoan(TaiKhoanModel taiKhoanModel, HttpServletRequest request) {
        TaiKhoanEntity old = taiKhoanRepository.findOne(taiKhoanModel.getId());
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        old.setStatus(1);
        old.setNguoiChinhSua(SecurityUtils.getPrincipal().getHoTen());
        old.setTrangThai(1);
        old.setNgayChinhSua(date);
        old.setNgayKhoa(null);
        old.setNguoiKhoa(null);
        old.setNgayXoa(null);
        old.setNguoiXoa(null);
        old.setThoiHanKhoaEntity(null);
        old = taiKhoanRepository.save(old);
        TaiKhoanModel taiKhoanModel1 = new TaiKhoanModel();
        taiKhoanModel1.setTrangThai(old.getTrangThai());
        return taiKhoanModel1;
    }

    @Override
    @Transactional
    public TaiKhoanModel capNhatThongTin(TaiKhoanModel taiKhoanModel) {
        TaiKhoanEntity old = taiKhoanRepository.findOne(taiKhoanModel.getId());
        if (taiKhoanModel.getDiaChi().equals(old.getDiaChi()) && taiKhoanModel.getHoTen().equals(old.getHoTen()) &&
                taiKhoanModel.getSoDienThoai().equals(old.getSoDienThoai())) {
            taiKhoanModel.setId(0);
            return taiKhoanModel;
        } else {
            old.setDiaChi(taiKhoanModel.getDiaChi());
            old.setSoDienThoai(taiKhoanModel.getSoDienThoai());
            old.setHoTen(taiKhoanModel.getHoTen());
            old = taiKhoanRepository.save(old);
            TaiKhoanModel taiKhoanModel1 = new TaiKhoanModel();
            taiKhoanModel1.setId(old.getId());
            taiKhoanModel1.setDiaChi(old.getDiaChi());
            taiKhoanModel1.setSoDienThoai(old.getSoDienThoai());
            taiKhoanModel.setHoTen(old.getHoTen());
            return taiKhoanModel1;
        }
    }

    @Override
    @Transactional
    public TaiKhoanModel doiMatKhau(TaiKhoanModel taiKhoanModel) {
        TaiKhoanEntity old = taiKhoanRepository.findOne(SecurityUtils.getPrincipal().getId());
        boolean hass = BCrypt.checkpw(taiKhoanModel.getPassword(), old.getMatKhau());
        if (hass) {
            if(taiKhoanModel.getPassword().equals(taiKhoanModel.getPassword1())){
                taiKhoanModel.setId(1);
            }
            else {
                // lấy mk mới hass sang chuỗi mã hóa rồi lưu xuống database
                String hassNew = BCrypt.hashpw(taiKhoanModel.getPassword1(), BCrypt.gensalt());
                old.setMatKhau(hassNew);
                taiKhoanRepository.save(old);
            }
        } else {//mk hiện tại ko đúng
            taiKhoanModel.setId(0);
        }
        return taiKhoanModel;
    }
}
