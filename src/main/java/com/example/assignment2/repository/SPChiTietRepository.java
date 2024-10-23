package com.example.assignment2.repository;

import com.example.assignment2.model.SPChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SPChiTietRepository extends JpaRepository<SPChiTiet,Integer> {
}
