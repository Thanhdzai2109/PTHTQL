package com.ltw.online_store.Repository;

import com.ltw.online_store.Entity.VaiTro;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VaiTroRepository extends JpaRepository<VaiTro, Long> {
    VaiTro findByTen(String roleName);
}