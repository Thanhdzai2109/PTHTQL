package com.ltw.online_store.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class ChiTietDonHang {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne
    @JoinColumn(name = "id_san_pham")
    private SanPham sanPham;

    private long donGia;
    private int soLuong;

    @ManyToOne
    @JoinColumn(name = "id_don_hang")
    private DonHang donHang;


}
