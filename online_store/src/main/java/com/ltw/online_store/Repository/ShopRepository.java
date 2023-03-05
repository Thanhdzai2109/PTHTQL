package com.ltw.online_store.Repository;

import com.ltw.online_store.Entity.NhanHieu;
import com.ltw.online_store.Entity.Shop;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ShopRepository extends JpaRepository<Shop, Long> {

}
