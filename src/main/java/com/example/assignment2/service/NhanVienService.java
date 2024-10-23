package com.example.assignment2.service;

import com.example.assignment2.model.NhanVien;

import com.example.assignment2.repository.NhanVienRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NhanVienService {
    @Autowired
    NhanVienRepository nhanVienRepository;
    public List<NhanVien> getAll() {
        return nhanVienRepository.findAll();
    }

    public void add(NhanVien hoaDon) {
        nhanVienRepository.save(hoaDon);
    }

    public void update(NhanVien hoaDon) {
        nhanVienRepository.save(hoaDon);
    }

    public void delete(Integer id) {
        nhanVienRepository.deleteById(id);
    }

    public NhanVien findById(Integer id) {
        return nhanVienRepository.findById(id).get();
    }

    public boolean checkLogin(String username, String password) {
        Optional<NhanVien> nhanVien = nhanVienRepository.findByTenDangNhapAndMatKhau(username, password);
        return nhanVien.isPresent();
    }


    public boolean checkTKSignup(String username) {
        return nhanVienRepository.existsByTenDangNhap(username);
    }

    public NhanVien findNVBytenDN(String username) {
        for (NhanVien nhanVien : nhanVienRepository.findAll()) {
            if (nhanVien.getTenDangNhap().trim().equals(username.trim())) {
                return nhanVien;
            }
        }
        return null;
    }

}
