package com.example.assignment2.service;

import com.example.assignment2.model.KichThuoc;
import com.example.assignment2.repository.KichThuocRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class KichThuocService {
    @Autowired
    KichThuocRepository kichThuocRepository;

    public List<KichThuoc> getAll() {
        return kichThuocRepository.findAll();
    }

    public void add(KichThuoc hoaDon) {
        kichThuocRepository.save(hoaDon);
    }

    public void update(KichThuoc hoaDon) {
        kichThuocRepository.save(hoaDon);
    }

    public void delete(Integer id) {
        kichThuocRepository.deleteById(id);
    }

    public KichThuoc findById(Integer id) {
        return kichThuocRepository.findById(id).get();
    }
}
