package com.example.assignment2.service;


import com.example.assignment2.model.MauSac;
import com.example.assignment2.repository.MauSacRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MauSacService {
    @Autowired
    MauSacRepository mauSacRepository;

    public List<MauSac> getAll() {
        return mauSacRepository.findAll();
    }

    public void add(MauSac hoaDon) {
        mauSacRepository.save(hoaDon);
    }

    public void update(MauSac hoaDon) {
        mauSacRepository.save(hoaDon);
    }

    public void delete(Integer id) {
        mauSacRepository.deleteById(id);
    }

    public MauSac findById(Integer id) {
        return mauSacRepository.findById(id).get();
    }
}
