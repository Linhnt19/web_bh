package com.example.assignment2.service;
import com.example.assignment2.model.HoaDonChiTiet;
import com.example.assignment2.model.SPChiTiet;
import com.example.assignment2.repository.HDCTRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class HDCTService {
    @Autowired
    HDCTRepository hdctRepository;
    @Autowired
    SPChiTietService spChiTietRepository;
    public List<HoaDonChiTiet> getAll() {
        return hdctRepository.findAll();
    }

    public void add(HoaDonChiTiet hsct) {
        hdctRepository.save(hsct);
    }

    public void update(HoaDonChiTiet hsct) {
        hdctRepository.save(hsct);
    }

    public void delete(Integer id) {
        hdctRepository.deleteById(id);
    }

    public HoaDonChiTiet findById(Integer id) {
        return hdctRepository.findById(id).get();
    }
    // hoa don chi tiet all
    public List<HoaDonChiTiet> getHDCTTTList(Integer idHD) {
        List<HoaDonChiTiet> listNew = new ArrayList<>();
        for (HoaDonChiTiet hoaDonChiTiet : hdctRepository.findAll()) {
            if (hoaDonChiTiet.getHoaDon().getId() == idHD) {
                listNew.add(hoaDonChiTiet);
            }
        }
        return listNew;
    }
    //hoa don chi tiet chua tt
    public List<HoaDonChiTiet> getHDCTChuaTTList(Integer idHD) {
        Boolean trangThai = false;
        List<HoaDonChiTiet> listNew = new ArrayList<>();
        for (HoaDonChiTiet hoaDonChiTiet : hdctRepository.findAll()) {
            if (hoaDonChiTiet.getTrangThai() == trangThai && hoaDonChiTiet.getHoaDon().getId() == idHD) {
                listNew.add(hoaDonChiTiet);
            }
        }
        return listNew;
    }
    //check spct gio hang mua trung san pham
    public boolean checkGioHang(Integer idSPCT,Integer idHoaDon){
        Boolean trangThai=false;
        for (HoaDonChiTiet hoaDonChiTiet : hdctRepository.findAll()) {
            if (hoaDonChiTiet.getSpChiTiet().getId()==idSPCT&&hoaDonChiTiet.getHoaDon().getId()==idHoaDon&& hoaDonChiTiet.getTrangThai()==trangThai){
                return true;
            }
        }
        return false;
    }
    //gop spct
    public void updateSoLuong(Integer idSPCT,Integer idHoaDon,Integer soLuongMua){
        Boolean trangThai=false;
        for (HoaDonChiTiet hoaDonChiTiet : hdctRepository.findAll()) {
            if (hoaDonChiTiet.getSpChiTiet().getId()==idSPCT&&hoaDonChiTiet.getHoaDon().getId()==idHoaDon&& hoaDonChiTiet.getTrangThai()==trangThai){
                hoaDonChiTiet.setSoLuong(hoaDonChiTiet.getSoLuong()+soLuongMua);
                hdctRepository.save(hoaDonChiTiet);
            }
        }
    }

    public void updateSLKhiGHDoi(Integer idSPCT,Integer idHDCT,Integer soLuongMua){
        SPChiTiet spct =spChiTietRepository.findById(idSPCT);
        Integer slNew=0;
        Boolean trangThai=false;
        for (HoaDonChiTiet hoaDonChiTiet : hdctRepository.findAll() ) {
            if (hoaDonChiTiet.getSpChiTiet().getId()==idSPCT&&hoaDonChiTiet.getHoaDon().getId()==idHDCT&& hoaDonChiTiet.getTrangThai()==trangThai){
                if (hoaDonChiTiet.getSoLuong()>=soLuongMua){
                    slNew=hoaDonChiTiet.getSoLuong()-soLuongMua;
                    spct.setSoLuong(spct.getSoLuong()+slNew);
                }else {
                    slNew = soLuongMua - hoaDonChiTiet.getSoLuong();
                    spct.setSoLuong(spct.getSoLuong() - slNew);
                }
                spChiTietRepository.update(spct);
                hoaDonChiTiet.setSoLuong(soLuongMua);
                hdctRepository.save(hoaDonChiTiet);
            }
        }

    }
    //update khi thanh toan
    public void updateKhiTT(Integer idHD){
        Boolean trangThai =false;
        for (HoaDonChiTiet hoaDonChiTiet : hdctRepository.findAll() ) {
            if (hoaDonChiTiet.getHoaDon().getId()==idHD&& hoaDonChiTiet.getTrangThai()==trangThai){
                hoaDonChiTiet.setTrangThai(true);
                hdctRepository.save(hoaDonChiTiet);
            }
        }
    }
    public void updateKhiHuy(Integer idSPCT,Integer idHD){
        SPChiTiet spct =spChiTietRepository.findById(idSPCT);
        Boolean trangThai=false;
        for (HoaDonChiTiet hoaDonChiTiet : hdctRepository.findAll() ) {
            if (hoaDonChiTiet.getHoaDon().getId()==idHD&&hoaDonChiTiet.getSpChiTiet().getId()==idSPCT&& hoaDonChiTiet.getTrangThai()==trangThai){
                spct.setSoLuong(spct.getSoLuong()+hoaDonChiTiet.getSoLuong());
                hoaDonChiTiet.setTrangThai(null);
                spChiTietRepository.update(spct);
                hdctRepository.save(hoaDonChiTiet);
            }
        }
    }

    // update sp khi huy hoa don
    public void updateKhiHuyHD(Integer idHD){

        Boolean trangThai=false;
        for (HoaDonChiTiet hoaDonChiTiet : hdctRepository.findAll() ) {
            if (hoaDonChiTiet.getHoaDon().getId()==idHD&& hoaDonChiTiet.getTrangThai()==trangThai){
                SPChiTiet spct =spChiTietRepository.findById(hoaDonChiTiet.getSpChiTiet().getId());
                spct.setSoLuong(spct.getSoLuong()+hoaDonChiTiet.getSoLuong());
                hoaDonChiTiet.setTrangThai(null);
                spChiTietRepository.update(spct);
                hdctRepository.save(hoaDonChiTiet);
            }
        }
    }

}
