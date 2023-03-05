package com.ltw.online_store.Service.Bus;


import com.ltw.online_store.Entity.VaiTro;
import com.ltw.online_store.Entity.NguoiDung;
import com.ltw.online_store.Repository.NguoiDungRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.HashSet;
import java.util.Set;

@Service
public class UserDetailsServiceImlp implements UserDetailsService {
    @Autowired
    private NguoiDungRepository nguoiDungRepository;


    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String tenDangNhap) throws UsernameNotFoundException {
        NguoiDung nguoiDung = nguoiDungRepository.findByTenDangNhap(tenDangNhap);
        if (nguoiDung == null) {
            throw new UsernameNotFoundException("user with username: "+tenDangNhap+" is not exist");
        }
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        Set<VaiTro> vaiTros = nguoiDung.getVaiTro();
        System.out.println(vaiTros);
        for (VaiTro vaiTro : vaiTros) {
            grantedAuthorities.add(new SimpleGrantedAuthority(vaiTro.getTen()));
        }
        return new org.springframework.security.core.userdetails.User(tenDangNhap, nguoiDung.getMatKhau(), grantedAuthorities);
    }
}
