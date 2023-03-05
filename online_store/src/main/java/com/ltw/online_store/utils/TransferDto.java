package com.ltw.online_store.Utils;

import com.ltw.online_store.Dto.NguoiDungDto;
import com.ltw.online_store.Dto.SanPhamDto;
import com.ltw.online_store.Entity.DanhMuc;
import com.ltw.online_store.Entity.NguoiDung;
import com.ltw.online_store.Entity.SanPham;
import com.ltw.online_store.Repository.DanhMucRepository;
import com.ltw.online_store.Repository.NhanHieuRepository;
import com.ltw.online_store.Service.DanhMucService;
import com.ltw.online_store.Service.NhanHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TransferDto {
    @Autowired
    private static DanhMucService danhMucService;

    @Autowired
    private static NhanHieuService nhanHieuService;

    public static NguoiDungDto taiKhoanDto(NguoiDung nguoiDung){
//        UserDto userDto = new UserDto(user.getId(), user.getFullName(),
//                user.getUserName(), user.getEmail(), user.getAddress(),user.get);
        return null;
    }
    public static SanPham sanPham(SanPhamDto sanPhamDto){
//        SanPham sanPham = new SanPham();
//        sanPham.setAnh(sanPhamDto.getAnh());
//        sanPham.setGia(sanPhamDto.getGia());
//        System.out.println("nhan hieu: "+nhanHieuService.timTheoId(sanPhamDto.getNhanHieu()));
//        sanPham.setNhanHieu(nhanHieuService.timTheoId(sanPhamDto.getNhanHieu()));
//        sanPham.setDanhMuc(danhMucService.timTheoId(sanPhamDto.getDanhMuc()));
//
//        sanPham.setMauSac(sanPhamDto.getMauSac());
//        sanPham.setGioiTinh(sanPhamDto.getGioiTinh());
//        sanPham.setMoTa(sanPhamDto.getMoTa());
//
//        sanPham.setSoLuong(sanPhamDto.getSoLuong());
        return null;
    }
}
