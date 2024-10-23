package com.example.assignment2.service;

import com.example.assignment2.model.SanPham;
import com.example.assignment2.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SanPhamService {
    @Autowired
    SanPhamRepository sanPhamRepository;

    public List<SanPham> getAll() {
        return sanPhamRepository.findAll();
    }

    public void add(SanPham sanPham) {
        sanPhamRepository.save(sanPham);
    }

    public void update(SanPham sanPham) {
        sanPhamRepository.save(sanPham);
    }

    public void delete(Integer id) {
        sanPhamRepository.deleteById(id);
    }

    public SanPham findById(Integer id) {
        return sanPhamRepository.findById(id).get();
    }
}
