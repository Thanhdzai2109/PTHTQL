package com.ltw.online_store.Service.Bus;

import com.ltw.online_store.Entity.ChiMucGioHang;
import com.ltw.online_store.Entity.ChiTietDonHang;
import com.ltw.online_store.Entity.DonHang;
import com.ltw.online_store.Repository.ChiTietDonHangRepository;
import com.ltw.online_store.Service.ChiTietDonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChiTietDonHangServiceImpl implements ChiTietDonHangService {
    @Autowired
    private ChiTietDonHangRepository chiTietDonHangRepository;

    @Override
    public ChiTietDonHang luuChiTietDonHang(ChiTietDonHang chiTietDonHang) {
        return chiTietDonHangRepository.save(chiTietDonHang);
    }

    @Override
    public ChiTietDonHang luuChiTietDonHang(ChiMucGioHang chiMucGioHang, DonHang donHang) {
        ChiTietDonHang chiTietDonHang = new ChiTietDonHang();
        chiTietDonHang.setDonHang(donHang);
        chiTietDonHang.setSanPham(chiMucGioHang.getSanPham());
        chiTietDonHang.setSoLuong(chiMucGioHang.getSoLuong());
        Long donGia = chiMucGioHang.getSoLuong() * chiMucGioHang.getSanPham().getGia();
        chiTietDonHang.setDonGia(donGia);
        return chiTietDonHangRepository.save(chiTietDonHang);
    }
}
