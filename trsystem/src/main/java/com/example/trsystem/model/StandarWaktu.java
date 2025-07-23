package com.example.trsystem.model;

import jakarta.persistence.*;

@Entity
@Table(name = "standar_waktu")
public class StandarWaktu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String deskripsi;
    
    private Integer waktu;

    public Long getId() { return id; }
    public void setId(Long id){this.id = id;}

    public String getDeskripsi() { return deskripsi; }

    public void setDeskripsi(String deskripsi) { this.deskripsi = deskripsi; }

    public Integer getWaktu() { return waktu; }

    public void setWaktu(Integer waktu) { this.waktu = waktu; }
}
