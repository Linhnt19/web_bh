package com.example.assignment2.controller;

import com.example.assignment2.model.*;
import com.example.assignment2.service.*;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/assignment")
public class BanHangController {
    @Autowired
    HoaDonService hoaDonService;
    @Autowired
    HDCTService hdctService;
    @Autowired
    SPChiTietService spChiTietService;
    @Autowired
    KhachHangService svKH;
    @Autowired
    NhanVienService svNV;

    @GetMapping("/ban-hang")
    public String formBH(Model model, HttpServletRequest req) {
        model.addAttribute("hd", hoaDonService.getHoaDonChuaTT());
        model.addAttribute("spChiTietList", spChiTietService.getAll());
        LocalDate dateNow = LocalDate.now();
        req.getSession().setAttribute("dateNow", dateNow);
        req.getSession().removeAttribute("idAn");
        return "ban_hang/form_bh";
    }

    @GetMapping("/ban-hang/hoa-don/{id}")
    public String gioHang(Model model, @PathVariable(name = "id", required = false) Optional<Integer> id, HttpServletRequest req) {
        model.addAttribute("hd", hoaDonService.getHoaDonChuaTT());
        model.addAttribute("spChiTietList", spChiTietService.getAll());
        if (id.isPresent()) {
            req.getSession().setAttribute("idAn", id.get());
            System.out.println(id.get());

            //tinh toan tien
            Float tongTien = 0f;
            List<HoaDonChiTiet> hdct = hdctService.getHDCTChuaTTList(id.get());
            for (HoaDonChiTiet donChiTiet : hdct) {
                tongTien += donChiTiet.getDonGia()*donChiTiet.getSoLuong();
            }
            model.addAttribute("tongTien", tongTien);


            req.getSession().setAttribute("hoaDon", hoaDonService.findById(id.get()));
            model.addAttribute("hdct", hdctService.getHDCTChuaTTList(id.get()));
        }
        return "ban_hang/form_bh";
    }

    @ModelAttribute("ds")
    List<KhachHang> getKhachHang() {
        return svKH.getAll();
    }

    @PostMapping("/ban-hang/tao-hoa-don")
    public String toanHoaDon(HoaDon hd) {
        hoaDonService.add(hd);
        return "redirect:/assignment/ban-hang";
    }


    @PostMapping("/ban-hang/them-san-pham")
    public String themHDCT(HoaDonChiTiet hoaDonChiTiet,Model model,
                           @RequestParam("hoaDon") Integer idHD,
                           @RequestParam("spChiTiet") Integer idSP,
                           @RequestParam("soLuong") Integer soLuongMua) {
        if (hdctService.checkGioHang(idSP, idHD)) {
            hdctService.updateSoLuong(idSP, idHD, soLuongMua);
        } else {
            hdctService.add(hoaDonChiTiet);
        }
        spChiTietService.updateSL(idSP,soLuongMua);
        return "redirect:/assignment/ban-hang/hoa-don/" + idHD;
    }

    @PostMapping("/ban-hang/thanh-toan")
    public String thanhToan(@RequestParam("hoaDon") Integer idHD){
        Boolean trangThai =true;
        hoaDonService.updateTrangThai(idHD,trangThai);
        hdctService.updateKhiTT(idHD);
        return "redirect:/assignment/ban-hang";
    }
    @PostMapping("/ban-hang/huy-hoa-don")
    public String huyHoaDon(@RequestParam("hoaDon") Integer idHD){
        Boolean trangThai =null;
        hoaDonService.updateTrangThai(idHD,trangThai);
        hdctService.updateKhiHuyHD(idHD);
        return "redirect:/assignment/ban-hang";
    }
    @PostMapping("/ban-hang/doi-so-luong")
    public String doiSLGioHang(@RequestParam("idHoaDon") Integer idHD,
                               @RequestParam("idSPCT") Integer idSPCT,
                               @RequestParam("soLuongMua") Integer soLuongMua){
        hdctService.updateSLKhiGHDoi(idSPCT,idHD,soLuongMua);
        return "redirect:/assignment/ban-hang/hoa-don/" + idHD;
    }
    @PostMapping("/ban-hang/tra-hang")
    public String traHang(@RequestParam("idHoaDon") Integer idHD,
                          @RequestParam("idSPCT") Integer idSPCT){
        hdctService.updateKhiHuy(idSPCT,idHD);
        return "redirect:/assignment/ban-hang/hoa-don/" + idHD;
    }
}
