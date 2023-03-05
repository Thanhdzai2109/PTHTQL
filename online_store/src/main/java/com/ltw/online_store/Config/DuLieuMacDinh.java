package com.ltw.online_store.Config;

import com.ltw.online_store.Entity.NguoiDung;
import com.ltw.online_store.Entity.VaiTro;
import com.ltw.online_store.Repository.VaiTroRepository;
import com.ltw.online_store.Repository.NguoiDungRepository;
import com.ltw.online_store.Service.VaiTroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class DuLieuMacDinh implements ApplicationListener<ContextRefreshedEvent> {
   @Autowired
   private NguoiDungRepository nguoiDungRepository;

   @Autowired
   private VaiTroRepository vaiTroRepository;

   @Autowired
   private VaiTroService vaiTroService;

   @Autowired
   private BCryptPasswordEncoder passwordEncoder;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        if(vaiTroRepository.findByTen("ROLE_ADMIN") == null){
            vaiTroRepository.save(new VaiTro("ROLE_ADMIN"));
        }

        if(vaiTroRepository.findByTen("ROLE_USER") == null){
            vaiTroRepository.save(new VaiTro("ROLE_USER"));
        }

        if(nguoiDungRepository.findByTenDangNhap("admin") == null){
            NguoiDung nguoiDung = new NguoiDung("admin","thang.hoangngoc.it@gmail.com", passwordEncoder.encode("123456"));
            nguoiDung.setVaiTro(vaiTroService.getRoleAdmins());
            nguoiDungRepository.save(nguoiDung);
        }

        if(nguoiDungRepository.findByTenDangNhap("user1") == null){
            NguoiDung nguoiDung = new NguoiDung("user1","user@gmail.com", passwordEncoder.encode("123456"));
            nguoiDung.setVaiTro(vaiTroService.getRoleUsers());
            nguoiDungRepository.save(nguoiDung);
        }
    }
}
