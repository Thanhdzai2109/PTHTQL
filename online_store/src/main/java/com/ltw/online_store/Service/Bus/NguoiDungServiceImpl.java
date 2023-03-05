package com.ltw.online_store.Service.Bus;

import com.ltw.online_store.Dto.NguoiDungDto;
import com.ltw.online_store.Entity.NguoiDung;
import com.ltw.online_store.Entity.VaiTro;
import com.ltw.online_store.Repository.VaiTroRepository;
import com.ltw.online_store.Repository.NguoiDungRepository;
import com.ltw.online_store.Service.NguoiDungService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

@Service
public class NguoiDungServiceImpl implements NguoiDungService {
    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private VaiTroRepository vaiTroRepository;


    @Override
    public boolean nguoiDungTonTai(String username) {
        if(nguoiDungRepository.findByTenDangNhap(username) != null) return true;
        return false;
    }

    @Override
    public NguoiDung findByTenDangNhap(String tenDangNhap) {
        return nguoiDungRepository.findByTenDangNhap(tenDangNhap);
    }

    @Override
    public void saveUser(NguoiDung nguoiDung) {
        Set<VaiTro> vaiTros = new HashSet<VaiTro>();
        vaiTros.add(vaiTroRepository.findByTen("ROLE_USER"));
        nguoiDung.setMatKhau(bCryptPasswordEncoder.encode(nguoiDung.getMatKhau()));
        nguoiDung.setVaiTro(vaiTros);

        nguoiDungRepository.save(nguoiDung);
    }

    @Override
    public List<NguoiDung> getAll() {
        return nguoiDungRepository.findAll();
    }

    @Override
    public void deleteById(Long id) {
        nguoiDungRepository.deleteById(id);
    }

    @Override
    public NguoiDung getById(Long id) {
        return nguoiDungRepository.findById(id).get();
    }

    @Override
    public void updateUser(NguoiDungDto user) {
        NguoiDung oldNguoiDung = nguoiDungRepository.findByTenDangNhap(user.getTenDangNhap());
        if (!Objects.equals(user.getMatKhau(), "")) {
            oldNguoiDung.setMatKhau(bCryptPasswordEncoder.encode(user.getMatKhau()));
        }
        oldNguoiDung.setEmail(user.getEmail());
        oldNguoiDung.setDiaChi(user.getDiaChi());
        oldNguoiDung.setHoTen(user.getHoTen());
        nguoiDungRepository.save(oldNguoiDung);
    }

    @Override
    public void saveUser(NguoiDungDto nguoiDungDto) {
        NguoiDung nguoiDung = new NguoiDung();
        nguoiDung.setTenDangNhap(nguoiDungDto.getTenDangNhap());
        nguoiDung.setMatKhau(bCryptPasswordEncoder.encode(nguoiDungDto.getMatKhau()));
        nguoiDung.setEmail(nguoiDungDto.getEmail());
        nguoiDung.setDiaChi(nguoiDungDto.getDiaChi());
        Set<VaiTro> vaiTros = new HashSet<VaiTro>();
        vaiTros.add(vaiTroRepository.findByTen(nguoiDungDto.getTenVaiTro()));
        nguoiDung.setVaiTro(vaiTros);
        nguoiDungRepository.save(nguoiDung);
    }


}
