package com.ltw.online_store.Api;

import com.ltw.online_store.Dto.SanPhamDto;
import com.ltw.online_store.Entity.DoiTuongTraVe;
import com.ltw.online_store.Entity.SanPham;
import com.ltw.online_store.Service.NhanHieuService;
import com.ltw.online_store.Service.SanPhamService;
import com.ltw.online_store.Utils.TransferDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.validation.Valid;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@RestController
@RequestMapping("/api/sanpham")
public class SanPhamApi {
    @Autowired
    private SanPhamService sanPhamService;

    @Autowired
    private NhanHieuService nhanHieuService;

    @Autowired
    private ServletContext app;

    @GetMapping("/get/all")
    public List<SanPham> sanPhams(){
        return sanPhamService.tatCaSanPham();
    }

    @DeleteMapping("/xoa/{id}")
    public DoiTuongTraVe xoaSanPhamBoiId(@PathVariable Long id){
        DoiTuongTraVe doiTuongTraVe = new DoiTuongTraVe();
        doiTuongTraVe.setThongBao("Xoa thành công");
        sanPhamService.xoaSanPham(id);
        return doiTuongTraVe;
    }

    @GetMapping("/get/{id}")
    public SanPham sanPhamTheoId(@PathVariable Long id){
        return sanPhamService.timTheoId(id);
    }

    @PostMapping("/luu")
    public DoiTuongTraVe luuSanPham(@ModelAttribute @Valid SanPhamDto sanPhamDto){
        DoiTuongTraVe doiTuongTraVe = new DoiTuongTraVe();
        if(sanPhamService.sanPhamTonTai(sanPhamDto.getTen())){
            doiTuongTraVe.setThongBao("Sản phẩm đã tồn tại!");
            return doiTuongTraVe;
        }else {
            String path = app.getRealPath("/");
            try {
                long id = sanPhamService.luuSanPham(sanPhamDto);
                String filePath = path + "/WEB-INF/template/img/"+id + sanPhamDto.getAnh().getOriginalFilename();
                sanPhamDto.getAnh().transferTo(Path.of(filePath));
                System.out.println("filePath: " + filePath);
                doiTuongTraVe.setThongBao("Lưu thành công");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return doiTuongTraVe;
    }

    @GetMapping("/timkiem")
    public List<SanPham> timKiem(@RequestParam String txt){
        List<SanPham> sanPhams = sanPhams();
        List<SanPham> ketQua = new ArrayList<>();
        txt = txt.toLowerCase();
        for(SanPham sanPham : sanPhams) {
            String chuoi = sanPham.getTen() +" "+ sanPham.getGioiTinh() + " " + sanPham.getMauSac()+ " "+ sanPham.getDanhMuc().getTen()+ " "+sanPham.getNhanHieu().getTen();
            chuoi = chuoi.toLowerCase(Locale.ROOT);
            if(chuoi.contains(txt)) {
                ketQua.add(sanPham);
            }
        }
        return ketQua;
    }
}
