package com.example.assignment2.service;

import com.example.assignment2.model.KhachHang;
import com.example.assignment2.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class KhachHangService {
    @Autowired
    KhachHangRepository khachHangRepository;

    public List<KhachHang> getAll() {
        return khachHangRepository.findAll();
    }

    public void add(KhachHang hoaDon) {
        khachHangRepository.save(hoaDon);
    }

    public void update(KhachHang hoaDon) {
        khachHangRepository.save(hoaDon);
    }

    public void delete(Integer id) {
        khachHangRepository.deleteById(id);
    }

    public KhachHang findById(Integer id) {
        return khachHangRepository.findById(id).get();
    }
}
