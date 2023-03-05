package com.ltw.online_store.Controller;

import com.ltw.online_store.Entity.DanhMuc;
import com.ltw.online_store.Entity.NguoiDung;
import com.ltw.online_store.Entity.NhanHieu;
import com.ltw.online_store.Service.DanhMucService;
import com.ltw.online_store.Service.NhanHieuService;
import com.ltw.online_store.Service.VaiTroService;
import com.ltw.online_store.Service.NguoiDungService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@SessionAttributes("nguoiDungHienTai")
@RequestMapping("/admin")
public class QuanTriController {

    @Autowired
    private NguoiDungService nguoiDungService;

    @Autowired
    private VaiTroService vaiTroService;

    @Autowired
    private DanhMucService danhMucService;

    @Autowired
    private NhanHieuService nhanHieuService;

    @ModelAttribute("cacDanhMuc")
    public List<DanhMuc> layTatCaDanhMuc(){
        return danhMucService.tatCaDanhMuc();
    }
    @ModelAttribute("cacNhanHieu")
    public List<NhanHieu> layTatCaNhanHieu(){
        return nhanHieuService.getAll();
    }
    @ModelAttribute("nguoiDungHienTai")
    public NguoiDung nguoiDungHienTai() {
        Authentication au = SecurityContextHolder.getContext().getAuthentication();
        return nguoiDungService.findByTenDangNhap(au.getName());
    }

    @GetMapping("/trang-quan-tri")
    public String homePage(){
        return "admin/trangquantri";
    }

    @GetMapping("/thong-tin-tai-khoan")
    public String profilePage(){
        return "admin/thongtin";
    }

    @GetMapping("/nhan-hieu")
     public String brandPage() {
        return "admin/nhanhieu";
    }

    @GetMapping("/danh-muc")
    public String trangDanhMuc(){
        return "admin/danhmuc";
    }

    @GetMapping("/san-pham")
    public String quanLySanPham(){
        return "admin/sanpham";
    }

    @GetMapping("/don-hang")
    public String quanLyDonHang(){
        return "admin/donhang";
    }

    @GetMapping("/lien-he")
    public String quanLyLienHe() {
        return "admin/lienhe";
    }

    @GetMapping("/quan-ly-tai-khoan")
    public String accountManagementPage(Model model){
        model.addAttribute("users", nguoiDungService.getAll());
        model.addAttribute("roles", vaiTroService.getAll());
        return "admin/taikhoan";
    }

    @GetMapping("/delete")
    public String deleteAccount(@RequestParam Long id){
        nguoiDungService.deleteById(id);
        return "redirect:/admin/quan-ly-tai-khoan";
    }
    @GetMapping("/thong-ke")
    public String thongKePage(Model model) {
        return "admin/thongKe";
    }
}
