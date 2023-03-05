package com.ltw.online_store.Api;

import com.ltw.online_store.Dto.NguoiDungDto;
import com.ltw.online_store.Entity.DoiTuongTraVe;
import com.ltw.online_store.Service.VaiTroService;
import com.ltw.online_store.Service.NguoiDungService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@SessionAttributes("loggerInUser")
@RequestMapping("/api/account")
public class TaiKhoanApi {
    @Autowired
    private NguoiDungService nguoiDungService;

    @Autowired
    private VaiTroService vaiTroService;

    @DeleteMapping("/delete/{id}")
    public void deleteAccountById(@PathVariable Long id, Model model){
        nguoiDungService.deleteById(id);
    }

    @GetMapping("/get/{id}")
    public ResponseEntity<?> getAccountById(@PathVariable Long id, Model model){
        return ResponseEntity.ok(nguoiDungService.getById(id));
    }

    @PostMapping("/update")
    public void updateAccount(@RequestBody NguoiDungDto user, Model model){
        model.addAttribute("loggerInUser",user);
        nguoiDungService.updateUser(user);
    }

    @GetMapping("/get/all")
    public ResponseEntity<?> getAllAccounts(){
        return ResponseEntity.ok(nguoiDungService.getAll());
    }

    @PostMapping("/save")
    public DoiTuongTraVe saveAccount(@RequestBody NguoiDungDto nguoiDungDto, Model model){
        DoiTuongTraVe doiTuongTraVe = new DoiTuongTraVe();
        if(nguoiDungService.nguoiDungTonTai(nguoiDungDto.getTenDangNhap())) {
            doiTuongTraVe.setThongBao("Tên người dùng đã tồn tại!");
            doiTuongTraVe.setTrangThai("loi");
            return doiTuongTraVe;
        }
        else {
            doiTuongTraVe.setThongBao("Thêm tài khoản thành công");
            doiTuongTraVe.setTrangThai("thanhcong");
            nguoiDungService.saveUser(nguoiDungDto);
        }
        return doiTuongTraVe;
    }
}
