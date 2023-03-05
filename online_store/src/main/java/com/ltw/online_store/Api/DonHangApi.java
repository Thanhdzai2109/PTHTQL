package com.ltw.online_store.Api;

import com.ltw.online_store.Entity.DoiTuongTraVe;
import com.ltw.online_store.Entity.DonHang;
import com.ltw.online_store.Service.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/donhang")
public class DonHangApi {
    @Autowired
    private DonHangService donHangService;

    @GetMapping("/get/all")
    public List<DonHang> tatCaDonHang(){
        return donHangService.layTatCaDonHang();
    }

    @PostMapping("/hoanthanh/{id}")
    public void hoanThanhDon(@PathVariable Long id){
        donHangService.hoanThanhDonHang(id);
    }
}
