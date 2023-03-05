package com.ltw.online_store.Repository;

import com.ltw.online_store.Entity.NguoiDung;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NguoiDungRepository extends JpaRepository<NguoiDung, Long> {
    NguoiDung findByTenDangNhap(String tenDangNhap);

}