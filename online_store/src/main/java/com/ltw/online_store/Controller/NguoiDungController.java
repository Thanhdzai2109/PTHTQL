package com.ltw.online_store.Controller;

import com.ltw.online_store.Entity.NhanHieu;
import com.ltw.online_store.Entity.DanhMuc;
import com.ltw.online_store.Entity.NguoiDung;
import com.ltw.online_store.Entity.SanPham;
import com.ltw.online_store.Service.NhanHieuService;
import com.ltw.online_store.Service.DanhMucService;
import com.ltw.online_store.Service.NguoiDungService;
import com.ltw.online_store.Service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@SessionAttributes("nguoiDungHienTai")
public class NguoiDungController {

    @Autowired
    private NguoiDungService nguoiDungService;

    @Autowired
    private NhanHieuService nhanHieuService;

    @Autowired
    private DanhMucService danhMucService;

    @Autowired
    private SanPhamService sanPhamService;

    @ModelAttribute("nguoiDungHienTai")
    public NguoiDung nguoiDungHienTai() {
        Authentication au = SecurityContextHolder.getContext().getAuthentication();
        return nguoiDungService.findByTenDangNhap(au.getName());
    }

    @ModelAttribute("cacSanPham")
    public List<SanPham> cacSanPham(){
        return sanPhamService.tatCaSanPham();
    }

    @ModelAttribute("cacNhanHieu")
    public List<NhanHieu> cacNhanHieu(){
        return nhanHieuService.getAll();
    }

    @ModelAttribute("cacDanhMuc")
    public List<DanhMuc> cacDanhMuc(){
        return danhMucService.tatCaDanhMuc();
    }

    @GetMapping("/dang-nhap")
    public String trangDangNhap(){
        return "dangnhap";
    }

    @GetMapping("/trang-chu")
    public String trangChu(){
        return "web/trangchu";
    }

    @GetMapping("/lien-he")
    public String trangLienHe(){
        return "web/lienhe";
    }

    @GetMapping("/chi-tiet-san-pham")
    public String chiTietSanPham(@RequestParam Long id, Model model){
        model.addAttribute("sanPham",sanPhamService.timTheoId(id));
        return "web/chitietsanpham";
    }

    @GetMapping("/tim-san-pham")
    public String timSanPham(Model model) {
        return "web/timsanpham";
    }

    @GetMapping("/thong-tin-tai-khoan")
    public String trangThongTinNguoiDung(){
        return "web/thongtin";
    }

    @GetMapping("/trang-san-pham")
    public String trangSanPham(@RequestParam(required = false) Long idCategory,Model model){
        model.addAttribute("idCategory",idCategory);
        return "web/sanpham";
    }

    @GetMapping("/dang-xuat")
    public String trangDangXuat(HttpServletRequest request, HttpServletResponse response, Model model){
        Authentication au = SecurityContextHolder.getContext().getAuthentication();
        String userName = au.getName();
        System.out.println(userName);
        if(au != null){
            new SecurityContextLogoutHandler().logout(request, response,au);
        }
        return "redirect:/dang-nhap?dang-xuat";
    }



}
