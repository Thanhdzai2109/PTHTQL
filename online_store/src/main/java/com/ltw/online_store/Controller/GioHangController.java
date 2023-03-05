package com.ltw.online_store.Controller;

import com.ltw.online_store.Entity.*;
import com.ltw.online_store.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@SessionAttributes("nguoiDungHienTai")
public class GioHangController {


    @Autowired
    private NguoiDungService nguoiDungService;

    @Autowired
    private NhanHieuService nhanHieuService;

    @Autowired
    private DanhMucService danhMucService;

    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private ChiMucGioHangService chiMucGioHangService;

    @Autowired
    private DonHangService donHangService;

    @Autowired
     private ChiTietDonHangService chiTietDonHangService;

    @ModelAttribute("nguoiDungHienTai")
    public NguoiDung nguoiDungHienTai() {
        Authentication au = SecurityContextHolder.getContext().getAuthentication();
        return nguoiDungService.findByTenDangNhap(au.getName());
    }

    @ModelAttribute("cacNhanHieu")
    public List<NhanHieu> cacNhanHieu(){
        return nhanHieuService.getAll();
    }

    @ModelAttribute("cacDanhMuc")
    public List<DanhMuc> cacDanhMuc(){
        return danhMucService.tatCaDanhMuc();
    }

    @GetMapping("/xac-nhan-don-hang")
    public String xacNhanDonHang(Model model) {
        NguoiDung nguoiDung = nguoiDungHienTai();
        GioHang gioHang = gioHangService.timTheoNguoiDung(nguoiDung);
        List<ChiMucGioHang> chiMucGioHangs = chiMucGioHangService.timTheoGiohang(gioHang);
        List<ChiTietDonHang> chiTietDonHangs = new ArrayList<>();
        DonHang donHang = new DonHang();
        donHang.setNguoiDung(nguoiDung);
        donHang.setNgayDat(new Date());
        donHang.setTrangThai("chuahoanthanh");
        donHang = donHangService.luuDonHang(donHang);
        long tongGia = 0;
        for (ChiMucGioHang chiMuc : chiMucGioHangs){
            ChiTietDonHang chiTietDonHang = chiTietDonHangService.luuChiTietDonHang(chiMuc,donHang);
            chiTietDonHangs.add(chiTietDonHang);
            tongGia += chiTietDonHang.getDonGia();
            chiMucGioHangService.xoaChiMuc(chiMuc);
        }
        donHang.setTongGia(tongGia);
        donHang.setChiTiets(chiTietDonHangs);
        donHang = donHangService.luuDonHang(donHang);
        model.addAttribute("donHang",donHang);
        model.addAttribute("chiTiets",chiTietDonHangs);
        return "web/xacnhandonhang";
    }

    @GetMapping("/gio-hang")
    public String cartPage(HttpServletRequest request, Model model){
        return "web/giohang";
    }

}
