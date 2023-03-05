package com.ltw.online_store.Repository;

import com.ltw.online_store.Entity.GioHang;
import com.ltw.online_store.Entity.NguoiDung;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GioHangRepository extends JpaRepository<GioHang, Long> {
    GioHang findGioHangByNguoiDung(NguoiDung nguoiDung);
}