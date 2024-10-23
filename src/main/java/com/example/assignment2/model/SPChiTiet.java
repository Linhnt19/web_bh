package com.example.assignment2.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "sanphamct")
public class SPChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String maSPCT;

    @ManyToOne
    @JoinColumn(name = "idsanpham", referencedColumnName = "id")
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "idmausac", referencedColumnName = "id")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "idkichthuoc", referencedColumnName = "id")
    private KichThuoc kichThuoc;

    @Column(name = "hinhanh")
    private String hinhAnh;

    @Column(name = "soluong")
    private Integer soLuong;

    @Column(name = "gia")
    private Float donGia;

    @Column(name = "trangthai")
    private Boolean trangThai;
}

