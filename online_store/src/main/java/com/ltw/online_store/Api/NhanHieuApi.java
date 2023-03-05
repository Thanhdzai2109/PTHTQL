package com.ltw.online_store.Api;

import com.ltw.online_store.Entity.NhanHieu;
import com.ltw.online_store.Entity.DoiTuongTraVe;
import com.ltw.online_store.Service.NhanHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/brand")
public class NhanHieuApi {
    @Autowired
    private NhanHieuService nhanHieuService;

    @GetMapping("/get/all")
    public ResponseEntity<?> nhanHieus(){
        return ResponseEntity.ok(nhanHieuService.getAll());
    }

    @PostMapping("/save")
    public DoiTuongTraVe luuNhanHieu(@RequestBody NhanHieu nhanHieu){
        DoiTuongTraVe doiTuongTraVe = new DoiTuongTraVe();
        if(nhanHieuService.nhanHieuTonTai(nhanHieu)){
            doiTuongTraVe.setThongBao("Nhãn hiệu đã tồn tại!");
            return doiTuongTraVe;
        }else{
            nhanHieuService.save(nhanHieu);
            doiTuongTraVe.setThongBao("Thêm thành công");
        }
        return doiTuongTraVe;
    }

    @DeleteMapping("/delete/{id}")
    public void xoaNhanHieu(@PathVariable Long id){
        nhanHieuService.deleteById(id);
    }

}
