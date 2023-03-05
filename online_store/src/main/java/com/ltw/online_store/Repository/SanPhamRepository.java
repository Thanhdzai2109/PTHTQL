package com.ltw.online_store.Repository;

import com.ltw.online_store.Entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SanPhamRepository extends JpaRepository<SanPham, Long> {
    SanPham findSanPhamByTen(String ten);
}