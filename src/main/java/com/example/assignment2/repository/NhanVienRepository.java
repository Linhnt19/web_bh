package com.example.assignment2.repository;

import com.example.assignment2.model.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface NhanVienRepository extends JpaRepository<NhanVien,Integer> {
    boolean existsByTenDangNhap(String tenDangNhap);
    Optional<NhanVien> findByTenDangNhapAndMatKhau(String tenDangNhap, String matKhau);
}
