package com.ltw.online_store.Service;

import com.ltw.online_store.Entity.LienHe;

import java.util.List;

public interface LienHeService {
    LienHe luuLienHe(LienHe lienHe);
    List<LienHe> tatCaLienHe();
    void xoaLienHe(Long id);
    LienHe timTheoId(Long id);
}
