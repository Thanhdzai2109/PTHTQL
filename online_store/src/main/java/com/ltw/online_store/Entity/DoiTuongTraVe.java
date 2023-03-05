package com.ltw.online_store.Entity;

import java.util.List;

public class DoiTuongTraVe {
    private Object duLieu;
    private String thongBao;
    private String trangThai;

    public GioHang getGioHang() {
        return gioHang;
    }

    public void setGioHang(GioHang gioHang) {
        this.gioHang = gioHang;
    }

    private GioHang gioHang;

    public DoiTuongTraVe() {
    }

    public Object getDuLieu() {
        return duLieu;
    }

    public String getThongBao() {
        return thongBao;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setDuLieu(Object duLieu) {
        this.duLieu = duLieu;
    }

    public void setThongBao(String thongBao) {
        this.thongBao = thongBao;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
}
