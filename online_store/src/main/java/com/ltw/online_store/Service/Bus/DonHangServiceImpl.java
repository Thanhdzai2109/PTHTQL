package com.ltw.online_store.Service.Bus;

import com.ltw.online_store.Entity.DonHang;
import com.ltw.online_store.Repository.DonHangRepository;
import com.ltw.online_store.Service.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service
public class DonHangServiceImpl implements DonHangService {
    @Autowired
    private DonHangRepository donHangRepository;

    @Override
    public DonHang luuDonHang(DonHang donHang) {
        return donHangRepository.save(donHang);
    }

    @Override
    public List<DonHang> layTatCaDonHang() {
        return donHangRepository.findAll();
    }

    @Override
    public void hoanThanhDonHang(Long id) {
        DonHang donHang = donHangRepository.findById(id).get();
        donHang.setTrangThai("hoanthanh");
        donHang.setNgayNhan(new Date());
        donHangRepository.save(donHang);
    }
}
