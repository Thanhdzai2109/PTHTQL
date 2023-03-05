package com.ltw.online_store.Api;

import com.ltw.online_store.Entity.*;
import com.ltw.online_store.Service.ChiMucGioHangService;
import com.ltw.online_store.Service.GioHangService;
import com.ltw.online_store.Service.NguoiDungService;
import com.ltw.online_store.Service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/giohang")
@SessionAttributes("nguoiDungHienTai")
public class GioHangApi {

    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private SanPhamService sanPhamService;

    @Autowired
    private NguoiDungService nguoiDungService;

    @Autowired
    private ChiMucGioHangService chiMucGioHangService;

    @ModelAttribute("nguoiDungHienTai")
    public NguoiDung nguoiDung() {
        Authentication au = SecurityContextHolder.getContext().getAuthentication();
        return nguoiDungService.findByTenDangNhap(au.getName());
    }

    @GetMapping("/lay/giohangnguoidunghientai")
    public List<ChiMucGioHang> gioHang(HttpServletRequest request){
        NguoiDung nd = nguoiDung();
        GioHang gioHang = gioHangService.timTheoNguoiDung(nd);
        return chiMucGioHangService.timTheoGiohang(gioHang);
    }

    @GetMapping("/themvaogio/{id}")
    public DoiTuongTraVe themSanPhamVaoGioHang(@PathVariable Long id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        DoiTuongTraVe doiTuongTraVe = new DoiTuongTraVe();
        SanPham sanPham = sanPhamService.timTheoId(id);
        NguoiDung nd = (NguoiDung) request.getSession().getAttribute("nguoiDungHienTai");
        Authentication au = SecurityContextHolder.getContext().getAuthentication();
        if(au == null || au.getPrincipal() == "anonymousUser"){
            doiTuongTraVe.setTrangThai("chuadangnhap");
            doiTuongTraVe.setThongBao("Chưa đăng nhập");
            return doiTuongTraVe;
        }else{
            GioHang gioHang = gioHangService.timTheoNguoiDung(nd);
            System.out.println(nd.getTenDangNhap());
            if(gioHang == null) {
                gioHang = new GioHang();
                gioHang.setNguoiDung(nd);
                gioHang = gioHangService.luuGioHang(gioHang);
            }
            ChiMucGioHang chiMucGioHang = chiMucGioHangService.timTheoSanPhamVaGioHang(sanPham,gioHang);
            if(chiMucGioHang == null){
                chiMucGioHang = new ChiMucGioHang();
                chiMucGioHang.setGioHang(gioHang);
                chiMucGioHang.setSanPham(sanPham);
                chiMucGioHang.setSoLuong(1);
            }else{
                chiMucGioHang.setSoLuong(chiMucGioHang.getSoLuong()+1);
            }
            chiMucGioHang = chiMucGioHangService.luuChiMuc(chiMucGioHang);
        }
        doiTuongTraVe.setThongBao("Thêm thành công");
        return doiTuongTraVe;
    }

    @PostMapping("/thaydoi/chimuc")
    public DoiTuongTraVe thayDoiChiMuc(@RequestParam Long id,@RequestParam int soLuong){
        DoiTuongTraVe doiTuongTraVe = new DoiTuongTraVe();
        ChiMucGioHang chiMucGioHang = chiMucGioHangService.timTheoId(id);
        chiMucGioHang.setSoLuong(soLuong);
        chiMucGioHangService.luuChiMuc(chiMucGioHang);
        doiTuongTraVe.setTrangThai("ok");
        return doiTuongTraVe;
    }

    @PostMapping("/xoa/chimuc/{id}")
    public DoiTuongTraVe xoaChiMuc(@PathVariable Long id){
        DoiTuongTraVe doiTuongTraVe = new DoiTuongTraVe();
        chiMucGioHangService.xoaTheoId(id);
        doiTuongTraVe.setThongBao("Xóa thành công");
        return doiTuongTraVe;
    }

}
