package com.example.assignment2.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "nhanvien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String ten;
    private String maNV;
    @Column(name = "tendangnhap")
    private String tenDangNhap;
    @Column(name = "matkhau")
    private String matKhau;
    @Column(name = "trangthai")
    private Boolean trangThai;
}
