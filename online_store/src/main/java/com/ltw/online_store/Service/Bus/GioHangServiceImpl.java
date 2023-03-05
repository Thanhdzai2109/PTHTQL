package com.ltw.online_store.Service.Bus;

import com.ltw.online_store.Entity.ChiMucGioHang;
import com.ltw.online_store.Entity.GioHang;
import com.ltw.online_store.Entity.NguoiDung;
import com.ltw.online_store.Entity.SanPham;
import com.ltw.online_store.Repository.GioHangRepository;
import com.ltw.online_store.Service.GioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GioHangServiceImpl implements GioHangService {
    @Autowired
    private GioHangRepository gioHangRepository;

    @Override
    public GioHang timTheoNguoiDung(NguoiDung nguoiDung) {
        return gioHangRepository.findGioHangByNguoiDung(nguoiDung);
    }

    @Override
    public GioHang luuGioHang(GioHang gioHang) {
        return gioHangRepository.save(gioHang);
    }
}
