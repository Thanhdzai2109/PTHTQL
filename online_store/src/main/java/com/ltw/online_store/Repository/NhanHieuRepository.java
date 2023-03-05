package com.ltw.online_store.Repository;

import com.ltw.online_store.Entity.NhanHieu;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NhanHieuRepository extends JpaRepository<NhanHieu, Long> {
    NhanHieu findByTen(String ten);
}