package com.ltw.online_store.Service;

import com.ltw.online_store.Dto.SanPhamDto;
import com.ltw.online_store.Entity.SanPham;
import com.ltw.online_store.Entity.Shop;

import java.util.List;

public interface ShopService {

    List<Shop> tatCaShop();
    void luuSanPham(SanPham sanPham);
    Long luuSanPham(SanPhamDto sanPhamDto);
    void xoaSanPham(Long id);
    SanPham timTheoId(Long id);

}
