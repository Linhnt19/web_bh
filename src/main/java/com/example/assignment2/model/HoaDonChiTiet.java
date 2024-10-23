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
@Table(name = "hoadonchitiet")
public class HoaDonChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "idspct", referencedColumnName = "id")
    private SPChiTiet spChiTiet;
    @ManyToOne
    @JoinColumn(name = "idhoadon", referencedColumnName = "id")
    private HoaDon hoaDon;
    @Column(name = "soluong")
    private Integer soLuong;
    @Column(name = "gia")
    private Float donGia;
    @Column(name = "trangthai")
    private Boolean trangThai;
}
