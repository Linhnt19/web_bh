package com.example.assignment2.controller;

import com.example.assignment2.model.KichThuoc;
import com.example.assignment2.model.MauSac;
import com.example.assignment2.model.SPChiTiet;
import com.example.assignment2.model.SanPham;
import com.example.assignment2.service.KichThuocService;
import com.example.assignment2.service.MauSacService;
import com.example.assignment2.service.SPChiTietService;
import com.example.assignment2.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("/assignment")
public class SanPhamController {
    @Autowired
    SanPhamService sanPhamService ;

    @Autowired
    SPChiTietService spChiTietService;

    @Autowired
    MauSacService mauSacService ;

    @Autowired
    KichThuocService kichThuocService ;

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("spChiTietList", spChiTietService.getAll());
        return "home";
    }

    @PostMapping("/home/tim-kiem")
    public String timKiem(@RequestParam("keyword") String keyword, Model model) {
//        List<SPChiTiet> spChiTietList = spChiTietService.findByKeyWord(keyword);
//        model.addAttribute("spChiTietList", spChiTietList);
        return "home";
    }

    @GetMapping("/them-san-pham")
    public String formThemSanPham(Model model) {
        model.addAttribute("spChiTietList", spChiTietService.getAll());
        return "them_san_pham";
    }
    @GetMapping("/home/chi-tiet-san-pham")
    public String chiTiet(Model model) {
        return "chi_tiet_sp";
    }
    @ModelAttribute("sanPhamList")
    List<SanPham> getListSanPham(){
        return sanPhamService.getAll();
    }
    @ModelAttribute("mauSacList")
    List<MauSac> getListMauSac(){
        return mauSacService.getAll();
    }
    @ModelAttribute("kichThuocList")
    List<KichThuoc> getListKichThuoc(){
        return kichThuocService.getAll();
    }

    @PostMapping("them-san-pham")
    public String themSanPham(SanPham sanPham) {

        sanPhamService.add(sanPham);
        return "redirect:/assignment/them-san-pham";
    }

    @PostMapping("them-sp-chi-tiet")
    public String themSPChiTiet(SPChiTiet spChiTiet) {

        spChiTietService.add(spChiTiet);

        return "redirect:/assignment/home";
    }

    @GetMapping("/delete-spct")
    public String delete(@RequestParam("id") Integer id) {
        spChiTietService.delete(id);
        return "redirect:/assignment/home";
    }

    @GetMapping("/update-spct/{id}")
    public String update(Model model,@PathVariable("id") Integer id) {
        model.addAttribute("spct",spChiTietService.findById(id));
        return "sua_san_pham";
    }

    @PostMapping("/update-spct")
    public String update(SPChiTiet spChiTiet) {
        spChiTietService.update(spChiTiet);
        return "redirect:/assignment/home";
    }

    @GetMapping("them-mau-sac")
    public String mS(Model model) {
        model.addAttribute("ds", mauSacService.getAll());
        return "thuoc_tinh/mau_sac";
    }

    @GetMapping("them-kich-thuoc")
    public String kT(Model model) {
        model.addAttribute("ds", kichThuocService.getAll());
        return "thuoc_tinh/kich_thuoc";
    }

    @PostMapping("them-mau-sac")
    public String themMS(MauSac mauSac) {
        mauSacService.add(mauSac);
        return "redirect:them-mau-sac";
    }

    @PostMapping("them-kich-thuoc")
    public String themKT(KichThuoc kichThuoc) {
        kichThuocService.add(kichThuoc);
        return "redirect:them-kich-thuoc";
    }

    @GetMapping("update-kich-thuoc/{id}")
    public String formSuaKT(Model model, @PathVariable("id") Integer id) {
        KichThuoc kt = kichThuocService.findById(id);
        model.addAttribute("kt", kt);
        model.addAttribute("ds", kichThuocService.getAll());
        return "thuoc_tinh/update_kt";
    }

    @GetMapping("update-mau-sac/{id}")
    public String formSuaMS(Model model, @PathVariable("id") Integer id) {
        MauSac ms = mauSacService.findById(id);
        model.addAttribute("ms", ms);
        model.addAttribute("ds", mauSacService.getAll());
        return "thuoc_tinh/update_ms";
    }

    @PostMapping("update-kich-thuoc")
    public String formSuaKT(KichThuoc kichThuoc) {
        kichThuocService.update(kichThuoc);
        return "redirect:them-kich-thuoc";
    }

    @PostMapping("update-mau-sac")
    public String formSuaKT(MauSac mauSac) {
        mauSacService.update(mauSac);
        return "redirect:them-mau-sac";
    }
}
