package com.ltw.online_store.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;

    @Transient
    @JsonIgnore
    private MultipartFile anh;

    private String pathAnh;

    private String ten;
    private long gia;

    private String gioiTinh;

    private String mauSac;

    private int soLuong;
    @ManyToOne
    @JoinColumn(name = "id_danh_muc")
    private DanhMuc danhMuc;

    @ManyToOne
    @JoinColumn(name = "id_nhan_hieu")
    private NhanHieu nhanHieu;

    @ManyToOne
    @JoinColumn(name = "id_Shop")
    private Shop shop;

    @Column(length = 6000)
    private String moTa;
}
