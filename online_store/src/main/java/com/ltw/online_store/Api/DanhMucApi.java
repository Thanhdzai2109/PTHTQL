package com.ltw.online_store.Api;

import com.ltw.online_store.Entity.DanhMuc;
import com.ltw.online_store.Entity.DoiTuongTraVe;
import com.ltw.online_store.Service.DanhMucService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/danh-muc")
public class DanhMucApi {

    @Autowired
    private DanhMucService danhMucService;

    @GetMapping("/get/cac-danh-muc")
    public ResponseEntity<?> layTatCaDanhMuc(){
        return ResponseEntity.ok(danhMucService.tatCaDanhMuc());
    }

    @DeleteMapping("/xoa/{id}")
    public DoiTuongTraVe xoaDanhMuc(@PathVariable Long id){
        DoiTuongTraVe doiTuongTraVe = new DoiTuongTraVe();
        danhMucService.xoaBoiID(id);
        doiTuongTraVe.setThongBao("Xóa thành công");
        return doiTuongTraVe;
    }

    @PostMapping("/them")
    public DoiTuongTraVe themDanhMuc(@RequestBody DanhMuc danhMuc){
        DoiTuongTraVe doiTuongTraVe = new DoiTuongTraVe();
        if(danhMucService.danhMucTonTai(danhMuc)){
            doiTuongTraVe.setThongBao("Danh mục đã tồn tại!");
        }else{
            danhMucService.luuDanhMuc(danhMuc);
            doiTuongTraVe.setThongBao("Thêm thành công");
        }
        return doiTuongTraVe;
    }

}
