package com.ltw.online_store.Dto;

import lombok.Data;

import java.io.Serializable;


@Data
public class NguoiDungDto implements Serializable {
    private final Long id;
    private final String hoTen;
    private final String tenDangNhap;
    private final String email;
    private final String diaChi;
    private String matKhau;
    private final String tenVaiTro;

    public NguoiDungDto(Long id, String hoTen, String tenDangNhap, String email, String diaChi, String tenVaiTro){
        this.id = id;
        this.hoTen = hoTen;
        this.tenDangNhap = tenDangNhap;

        this.email = email;
        this.diaChi = diaChi;
        this.tenVaiTro = tenVaiTro;
    }
}
