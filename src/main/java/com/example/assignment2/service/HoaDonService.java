package com.example.assignment2.service;

import com.example.assignment2.model.HoaDon;
import com.example.assignment2.repository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class HoaDonService {
    @Autowired
    HoaDonRepository hoaDonRepository;

    public List<HoaDon> getAll() {
        return hoaDonRepository.findAll();
    }

    public void add(HoaDon hoaDon) {
        hoaDonRepository.save(hoaDon);
    }

    public void update(HoaDon hoaDon) {
        hoaDonRepository.save(hoaDon);
    }

    public void delete(Integer id) {
        hoaDonRepository.deleteById(id);
    }

    public HoaDon findById(Integer id) {
        return hoaDonRepository.findById(id).get();
    }

    public List<HoaDon> getHoaDonChuaTT() {
        Boolean trangThai = false;
        List<HoaDon> listNew = new ArrayList<>();
        for (HoaDon hoaDon : hoaDonRepository.findAll()) {
            if (hoaDon.getTrangThai() == trangThai) {
                listNew.add(hoaDon);
            }
        }
        return listNew;
    }
    //update hoa don khi thanh toan vs huy hd
    public void updateTrangThai(Integer idHD,Boolean trangThai){
        HoaDon hoaDon = findById(idHD);
        hoaDon.setTrangThai(trangThai);
        hoaDonRepository.save(hoaDon);
    }

}
