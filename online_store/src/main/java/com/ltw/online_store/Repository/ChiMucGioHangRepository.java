package com.ltw.online_store.Repository;

import com.ltw.online_store.Entity.ChiMucGioHang;
import com.ltw.online_store.Entity.GioHang;
import com.ltw.online_store.Entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ChiMucGioHangRepository extends JpaRepository<ChiMucGioHang, Long> {
    ChiMucGioHang findChiMucGioHangBySanPhamAndGioHang(SanPham sanPham, GioHang gioHang);
    List<ChiMucGioHang> findChiMucGioHangsByGioHang(GioHang gioHang);
}