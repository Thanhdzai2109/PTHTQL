package com.ltw.online_store.Repository;

import com.ltw.online_store.Entity.DanhMuc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

public interface DanhMucRepository extends JpaRepository<DanhMuc, Long> {
    DanhMuc findByTen(String ten);
}