package com.ltw.online_store.Service;

import com.ltw.online_store.Entity.DanhMuc;

import java.util.List;

public interface DanhMucService {
    List<DanhMuc> tatCaDanhMuc();
    void xoaBoiID(Long id);
    boolean danhMucTonTai(DanhMuc danhMuc);
    void luuDanhMuc(DanhMuc danhMuc);
    DanhMuc timTheoTen(String ten);
    DanhMuc timTheoId(Long id);
}
