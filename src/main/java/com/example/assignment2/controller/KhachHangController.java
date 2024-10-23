package com.example.assignment2.controller;

import com.example.assignment2.model.KhachHang;
import com.example.assignment2.service.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/assignment")
public class KhachHangController {
    @Autowired
    KhachHangService sv;

    @GetMapping("/khach-hang")
    public String khachHang(Model model) {
        model.addAttribute("ds", sv.getAll());
        return "khach_hang/khach_hang";
    }

    public boolean check(KhachHang kh, Model model) {
        boolean err = false;

        if (kh.getTen().equals("")) {
            model.addAttribute("msgSU2", "Moi nhap name");
            err = true;
        }
        if (kh.getMaKH().equals("")) {
            model.addAttribute("msgSU3", "Moi nhap code");
            err = true;
        }
        if (kh.getSdt().equals("")) {
            model.addAttribute("msgSU4", "Moi nhap number phone");
            err = true;
        }
        if (kh.getTrangThai() == null) {
            model.addAttribute("msgSU5", "Moi chon role");
            err = true;
        }

        if (err) {
            return true;
        } else
            return false;
    }

    @PostMapping("/khach-hang")
    public String addKhachHang(KhachHang kh, Model model) {
        if (check(kh, model)) {
            model.addAttribute("ds", sv.getAll());
            return "khach_hang/khach_hang";
        } else
            sv.add(kh);
        return "redirect:khach-hang";
    }

    @GetMapping("/khach-hang/update/{id}")
    public String formUpdate(Model model, @PathVariable("id") Integer id) {
        KhachHang kh = sv.findById(id);
        model.addAttribute("kh", kh);
        return "khach_hang/form_update";
    }

    @PostMapping("/khach-hang/update")
    public String updateKhachHang(KhachHang kh, Model model) {
        if (check(kh, model)) {
            return "khach_hang/form_update";
        } else
            sv.update(kh);
        return "redirect:/assignment/khach-hang";
    }

    @GetMapping("/khach-hang/delete")
    public String delete(@RequestParam("id") Integer id) {
        sv.delete(id);
        return "redirect:/assignment/khach-hang";
    }
}
