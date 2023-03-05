package com.ltw.online_store.Dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

@Data
public class SanPhamDto implements Serializable {
    private final Long id;
    private final String ten;
    private final long gia;
    private final String gioiTinh;
    private final String mauSac;
    private final int soLuong;
    private final String moTa;
    private Long danhMuc;
    private Long nhanHieu;
    private MultipartFile anh;

    public SanPhamDto(Long id, String ten, long gia, String gioiTinh, String mauSac, int soLuong, String moTa, Long danhMuc, Long nhanHieu, MultipartFile anh) {
        this.id = id;
        this.ten = ten;
        this.gia = gia;
        this.gioiTinh = gioiTinh;
        this.mauSac = mauSac;
        this.soLuong = soLuong;
        this.moTa = moTa;
        this.danhMuc = danhMuc;
        this.nhanHieu = nhanHieu;
        this.anh = anh;
    }

}
