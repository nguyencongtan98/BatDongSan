package com.batdongsan.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "baidang")
public class BaiDangEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "tieude")
    private String tieuDe;

    @Column(name = "noidung")
    private String noiDung;

    @Column(name = "gia")
    private double gia;
    
    @Column(name = "diachi")
    private String diaChi;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "orderDate")
    private Date ngayDang;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "ngayDuyet")
    private Date ngayDuyet;

    @Column(name = "status")
    private int status;

    @Column(name = "trangthai")
    private int trangThai;

    @Column(name = "sosao")
    private int soSao;

    @Column(name = "dientichdat")
    private double dienTichDat;

    @Column(name = "tanglau")
    private int tangLau;

    @Column(name = "phongngu")
    private int phongNgu;

    @Column(name = "phongtam")
    private int phongTam;

    @Column(name = "dientichsudung")
    private double dienTichSuDung;
    
	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	@ManyToOne
    @JoinColumn(name = "taiKhoanId")
    private TaiKhoanEntity taiKhoanEntity;

    @ManyToOne
    @JoinColumn(name = "menhGiaId")
    private MenhGiaEntity menhGiaEntity;


    @ManyToOne
    @JoinColumn(name = "danhMucId")
    private DanhMucEntity danhMucEntity;

    @ManyToOne
    @JoinColumn(name = "tinhThanhId")
    private TinhThanhEntity tinhThanhEntity;

    @ManyToOne
    @JoinColumn(name = "thoiHanId")
    private ThoiHanEntity thoiHanEntity;

    @OneToMany(mappedBy = "baiDangEntity")
    private List<LichSuEntity> lichSuEntities;

    @OneToMany(mappedBy = "baiDangEntity", fetch = FetchType.EAGER)
    private List<AnhEntity> anhEntities;

    @OneToMany(mappedBy = "baiDangEntity")
    private List<DauTinEntity> dauTinEntities;

    public List<DauTinEntity> getDauTinEntities() {
        return dauTinEntities;
    }

    public void setDauTinEntities(List<DauTinEntity> dauTinEntities) {
        this.dauTinEntities = dauTinEntities;
    }

    public BaiDangEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public double getDienTichDat() {
        return dienTichDat;
    }

    public void setDienTichDat(double dienTichDat) {
        this.dienTichDat = dienTichDat;
    }

    public int getTangLau() {
        return tangLau;
    }

    public void setTangLau(int tangLau) {
        this.tangLau = tangLau;
    }

    public int getPhongNgu() {
        return phongNgu;
    }

    public void setPhongNgu(int phongNgu) {
        this.phongNgu = phongNgu;
    }

    public int getPhongTam() {
        return phongTam;
    }

    public void setPhongTam(int phongTam) {
        this.phongTam = phongTam;
    }

    public double getDienTichSuDung() {
        return dienTichSuDung;
    }

    public void setDienTichSuDung(double dienTichSuDung) {
        this.dienTichSuDung = dienTichSuDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }


    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public Date getNgayDang() {
        return ngayDang;
    }

    public void setNgayDang(Date ngayDang) {
        this.ngayDang = ngayDang;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    public int getSoSao() {
        return soSao;
    }

    public void setSoSao(int soSao) {
        this.soSao = soSao;
    }

    public TaiKhoanEntity getTaiKhoanEntity() {
        return taiKhoanEntity;
    }

    public void setTaiKhoanEntity(TaiKhoanEntity taiKhoanEntity) {
        this.taiKhoanEntity = taiKhoanEntity;
    }

    public MenhGiaEntity getMenhGiaEntity() {
        return menhGiaEntity;
    }

    public void setMenhGiaEntity(MenhGiaEntity menhGiaEntity) {
        this.menhGiaEntity = menhGiaEntity;
    }

    public DanhMucEntity getDanhMucEntity() {
        return danhMucEntity;
    }

    public void setDanhMucEntity(DanhMucEntity danhMucEntity) {
        this.danhMucEntity = danhMucEntity;
    }

    public TinhThanhEntity getTinhThanhEntity() {
        return tinhThanhEntity;
    }

    public void setTinhThanhEntity(TinhThanhEntity tinhThanhEntity) {
        this.tinhThanhEntity = tinhThanhEntity;
    }

    public ThoiHanEntity getThoiHanEntity() {
        return thoiHanEntity;
    }

    public void setThoiHanEntity(ThoiHanEntity thoiHanEntity) {
        this.thoiHanEntity = thoiHanEntity;
    }

    public List<LichSuEntity> getLichSuEntities() {
        return lichSuEntities;
    }

    public void setLichSuEntities(List<LichSuEntity> lichSuEntities) {
        this.lichSuEntities = lichSuEntities;
    }

    public List<AnhEntity> getAnhEntities() {
        return anhEntities;
    }

    public void setAnhEntities(List<AnhEntity> anhEntities) {
        this.anhEntities = anhEntities;
    }

    public Date getNgayDuyet() {
        return ngayDuyet;
    }

    public void setNgayDuyet(Date ngayDuyet) {
        this.ngayDuyet = ngayDuyet;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
