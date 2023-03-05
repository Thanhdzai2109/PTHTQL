package com.ltw.online_store.Entity;

import lombok.*;

import javax.persistence.*;


@Data
@Entity
public class LienHe {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;

    private String hoTen;

    private String email;

    private String loiNhan;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
