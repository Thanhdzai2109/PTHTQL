package com.ltw.online_store.Service;

import com.ltw.online_store.Entity.ChiMucGioHang;
import com.ltw.online_store.Entity.GioHang;
import com.ltw.online_store.Entity.NguoiDung;
import com.ltw.online_store.Entity.SanPham;

public interface GioHangService {
    GioHang timTheoNguoiDung(NguoiDung nguoiDung);
    GioHang luuGioHang(GioHang gioHang);
}
