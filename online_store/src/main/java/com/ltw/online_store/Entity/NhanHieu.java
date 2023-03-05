package com.ltw.online_store.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class NhanHieu {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;

    @NonNull
    @Column(unique = true)
    private String ten;

    @JsonIgnore
    @OneToMany(mappedBy = "nhanHieu")
    private List<SanPham> sanPhams;

    public NhanHieu(String ten) {
        this.ten = ten;
    }
}
