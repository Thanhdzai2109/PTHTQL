package com.ltw.online_store.Service;

import com.ltw.online_store.Entity.DonHang;

import java.util.List;

public interface DonHangService {
    DonHang luuDonHang(DonHang donHang);
    List<DonHang> layTatCaDonHang();
    void hoanThanhDonHang(Long id);
}
