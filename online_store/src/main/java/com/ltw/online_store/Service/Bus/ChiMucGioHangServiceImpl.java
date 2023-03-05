package com.ltw.online_store.Service.Bus;

import com.ltw.online_store.Entity.ChiMucGioHang;
import com.ltw.online_store.Entity.GioHang;
import com.ltw.online_store.Entity.SanPham;
import com.ltw.online_store.Repository.ChiMucGioHangRepository;
import com.ltw.online_store.Service.ChiMucGioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChiMucGioHangServiceImpl implements ChiMucGioHangService {
    @Autowired
    private ChiMucGioHangRepository chiMucGioHangRepository;

    @Override
    public ChiMucGioHang timTheoSanPhamVaGioHang(SanPham sp, GioHang gh) {
        return chiMucGioHangRepository.findChiMucGioHangBySanPhamAndGioHang(sp,gh);
    }

    @Override
    public ChiMucGioHang luuChiMuc(ChiMucGioHang chiMucGioHang) {
        return chiMucGioHangRepository.save(chiMucGioHang);
    }

    @Override
    public List<ChiMucGioHang> timTheoGiohang(GioHang gioHang) {
        return chiMucGioHangRepository.findChiMucGioHangsByGioHang(gioHang);
    }

    @Override
    public ChiMucGioHang timTheoId(Long id) {
        return chiMucGioHangRepository.findById(id).get();
    }

    @Override
    public void xoaTheoId(Long id) {
        chiMucGioHangRepository.deleteById(id);
    }

    @Override
    public void xoaChiMuc(ChiMucGioHang chiMucGioHang) {
        chiMucGioHangRepository.delete(chiMucGioHang);
    }
}
