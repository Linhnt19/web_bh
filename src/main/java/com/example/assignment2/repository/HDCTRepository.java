package com.example.assignment2.repository;

import com.example.assignment2.model.HoaDon;
import com.example.assignment2.model.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HDCTRepository extends JpaRepository<HoaDonChiTiet,Integer> {
}
