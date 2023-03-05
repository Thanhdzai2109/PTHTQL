package com.ltw.online_store.Api;

import com.ltw.online_store.Dto.LienHeDto;
import com.ltw.online_store.Entity.LienHe;
import com.ltw.online_store.Service.EmailService;
import com.ltw.online_store.Service.LienHeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/lienhe")
public class LienHeApi {
    @Autowired
    private LienHeService lienHeService;

    @Autowired
    private EmailService emailService;

    @PostMapping("/them")
    public void themLienHe(@RequestBody LienHe lienHe){
        lienHeService.luuLienHe(lienHe);
    }

    @GetMapping("/get/all")
    public List<LienHe> tatCaLienHe() {
        return lienHeService.tatCaLienHe();
    }

    @DeleteMapping("/xoa/{id}")
    public void xoaLienHe(@PathVariable Long id) {
        lienHeService.xoaLienHe(id);
    }

    @PostMapping("/traloi")
    public void traLoiLienHe(@RequestBody LienHeDto lienHeDto){
        LienHe lienHe = lienHeService.timTheoId(lienHeDto.getId());
        String email = lienHe.getEmail();
        lienHeService.xoaLienHe(lienHeDto.getId());
        emailService.sendSimpleMessage(email,"Trả lời ý kiến đóng góp bạn đã gửi cho shop",lienHeDto.getTraLoi());

    }

}
