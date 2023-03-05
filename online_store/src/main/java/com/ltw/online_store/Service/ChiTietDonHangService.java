package com.ltw.online_store.Service;

import com.ltw.online_store.Entity.ChiMucGioHang;
import com.ltw.online_store.Entity.ChiTietDonHang;
import com.ltw.online_store.Entity.DonHang;

public interface ChiTietDonHangService {
    ChiTietDonHang luuChiTietDonHang(ChiTietDonHang chiTietDonHang);
    ChiTietDonHang luuChiTietDonHang(ChiMucGioHang chiMucGioHang, DonHang donHang);
}
