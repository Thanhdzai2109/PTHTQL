package com.ltw.online_store.Controller;

import javax.validation.Valid;
import com.ltw.online_store.Entity.NguoiDung;
import com.ltw.online_store.Service.SecurityService;
import com.ltw.online_store.Service.NguoiDungService;
import com.ltw.online_store.utils.validator.XacThucNguoiDung;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class DangKyController {

    @Autowired
    private NguoiDungService nguoiDungService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private XacThucNguoiDung xacThucNguoiDung;

    @GetMapping("/dang-ky")
    public String registerPage(Model model){
        model.addAttribute("newUser",new NguoiDung());
        return "dangky";
    }

    @PostMapping("/dang-ky")
    public String registerProcess(@ModelAttribute("newUser") @Valid NguoiDung nguoiDung, BindingResult bindingResult, Model model) {

         xacThucNguoiDung.validate(nguoiDung, bindingResult);

        if (bindingResult.hasErrors()) {
            return "dangky";
        }
        System.out.println(nguoiDung);
        nguoiDungService.saveUser(nguoiDung);

        securityService.autoLogin(nguoiDung.getTenDangNhap(), nguoiDung.getMatKhau());

        return "redirect:/";
    }

}
