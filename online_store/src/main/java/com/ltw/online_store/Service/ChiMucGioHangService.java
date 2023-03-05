package com.ltw.online_store.Service;

import com.ltw.online_store.Entity.ChiMucGioHang;
import com.ltw.online_store.Entity.GioHang;
import com.ltw.online_store.Entity.SanPham;

import java.util.List;

public interface ChiMucGioHangService {
    ChiMucGioHang timTheoSanPhamVaGioHang(SanPham sp, GioHang gh);
    ChiMucGioHang luuChiMuc(ChiMucGioHang chiMucGioHang);
    List<ChiMucGioHang> timTheoGiohang(GioHang gioHang);
    ChiMucGioHang timTheoId(Long id);
    void xoaTheoId(Long id);
    void xoaChiMuc(ChiMucGioHang chiMucGioHang);
}
