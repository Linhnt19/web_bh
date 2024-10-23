package com.example.assignment2.service;

import com.example.assignment2.model.SPChiTiet;
import com.example.assignment2.repository.SPChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SPChiTietService {

    @Autowired
    SPChiTietRepository spChiTietRepository;


    public List<SPChiTiet> getAll() {
        return spChiTietRepository.findAll();
    }

    public void add(SPChiTiet spct) {
        spChiTietRepository.save(spct);
    }

    public void update(SPChiTiet spct) {
        spChiTietRepository.save(spct);
    }

    public void delete(Integer id) {
        spChiTietRepository.deleteById(id);
    }

    public SPChiTiet findById(Integer id) {
        return spChiTietRepository.findById(id).get();
    }

    //update so luong sau mua

    public void updateSL(Integer idSPCT,Integer soLuongMua){
        SPChiTiet spct =findById(idSPCT);
        spct.setSoLuong(spct.getSoLuong()-soLuongMua);
        spChiTietRepository.save(spct);
    }

}
