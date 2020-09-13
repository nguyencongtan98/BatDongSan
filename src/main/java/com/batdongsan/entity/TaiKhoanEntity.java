package com.batdongsan.entity;

//import org.springframework.stereotype.Controller;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "taikhoan")
public class TaiKhoanEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "tendangnhap")
    private String tenDangNhap;

    @Column(name = "matkhau")
    private  String matKhau;

    @Column(name = "email")
    private String email;

    @Column(name = "hoTen")
    private String hoTen;

    @Column(name = "sodienthoai")
    private String soDienThoai;

    @Column(name = "diachi")
    private String diaChi;

    @Column(name = "kichhoat")
    private String kichHoat;

    @Column(name = "trangthai")
    private int trangThai;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "ngayKhoa")
    private Date ngayKhoa;

    @Column(name = "nguoiKhoa")
    private String nguoiKhoa;


    @Column(name = "status")
    private int status;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "ngayXoa")
    private Date ngayXoa;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "ngayMoKhoa")
    private Date ngayChinhSua;

    @Column(name = "nguoiXoa")
    private String nguoiXoa;

    @Column(name = "nguoiMoKhoa")
    private String nguoiChinhSua;

    /*nhiều nhiều vs role*/
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "userid"),
            inverseJoinColumns = @JoinColumn(name = "roleid"))
    private List<RoleEntity> roles = new ArrayList<>();

    public List<RoleEntity> getRoles() {
        return roles;
    }

    public void setRoles(List<RoleEntity> roles) {
        this.roles = roles;
    }

    public List<RoleEntity> getUser() {
        return roles;
    }

    public void setUser(List<RoleEntity> user) {
        this.roles = user;
    }
    /**/

    public Date getNgayXoa() {
        return ngayXoa;
    }

    public void setNgayXoa(Date ngayXoa) {
        this.ngayXoa = ngayXoa;
    }

    public Date getNgayChinhSua() {
        return ngayChinhSua;
    }

    public void setNgayChinhSua(Date ngayChinhSua) {
        this.ngayChinhSua = ngayChinhSua;
    }

    public String getNguoiXoa() {
        return nguoiXoa;
    }

    public void setNguoiXoa(String nguoiXoa) {
        this.nguoiXoa = nguoiXoa;
    }

    public String getNguoiChinhSua() {
        return nguoiChinhSua;
    }

    public void setNguoiChinhSua(String nguoiChinhSua) {
        this.nguoiChinhSua = nguoiChinhSua;
    }


    @OneToMany(mappedBy = "taiKhoanEntity")
    private List<BaiDangEntity> baiDangEntities;

    @OneToMany(mappedBy = "taiKhoanEntity")
    private List<LichSuEntity> lichSuEntities;

    @OneToMany(mappedBy = "taiKhoanEntity")
    private List<DauTinEntity> dauTinEntities;

    @ManyToOne
    @JoinColumn(name = "thoiHanKhoaId")
    private ThoiHanKhoaEntity thoiHanKhoaEntity;

    public List<DauTinEntity> getDauTinEntities() {
        return dauTinEntities;
    }

    public void setDauTinEntities(List<DauTinEntity> dauTinEntities) {
        this.dauTinEntities = dauTinEntities;
    }

    public List<LichSuEntity> getLichSuEntities() {
        return lichSuEntities;
    }

    public void setLichSuEntities(List<LichSuEntity> lichSuEntities) {
        this.lichSuEntities = lichSuEntities;
    }

    public TaiKhoanEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getKichHoat() {
        return kichHoat;
    }

    public void setKichHoat(String kichHoat) {
        this.kichHoat = kichHoat;
    }


    public List<BaiDangEntity> getBaiDangEntities() {
        return baiDangEntities;
    }

    public void setBaiDangEntities(List<BaiDangEntity> baiDangEntities) {
        this.baiDangEntities = baiDangEntities;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    public ThoiHanKhoaEntity getThoiHanKhoaEntity() {
        return thoiHanKhoaEntity;
    }

    public void setThoiHanKhoaEntity(ThoiHanKhoaEntity thoiHanKhoaEntity) {
        this.thoiHanKhoaEntity = thoiHanKhoaEntity;
    }

    public Date getNgayKhoa() {
        return ngayKhoa;
    }

    public void setNgayKhoa(Date ngayKhoa) {
        this.ngayKhoa = ngayKhoa;
    }


    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getNguoiKhoa() {
        return nguoiKhoa;
    }

    public void setNguoiKhoa(String nguoiKhoa) {
        this.nguoiKhoa = nguoiKhoa;
    }
}
