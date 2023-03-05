package com.ltw.online_store.Service;

import com.ltw.online_store.Dto.NguoiDungDto;
import com.ltw.online_store.Entity.NguoiDung;

import java.util.List;

public interface NguoiDungService {
    boolean nguoiDungTonTai(String username);
    NguoiDung findByTenDangNhap(String userName);
    void saveUser(NguoiDung nguoiDung);
    List<NguoiDung> getAll();
    void deleteById(Long id);
    NguoiDung getById(Long id);
    void updateUser(NguoiDungDto user);
    void saveUser(NguoiDungDto user);
}
