package com.example.assignment2.controller;

import com.example.assignment2.service.HDCTService;
import com.example.assignment2.service.HoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/assignment")
public class HoaDonController {
    @Autowired
    HoaDonService hoaDonService;

    @Autowired
    HDCTService hdctService;
    @GetMapping("/hoa-don")
    public String hienThi(Model model) {
        model.addAttribute("hd", hoaDonService.getAll());
        model.addAttribute("hdct", hdctService.getAll());
        return "hoa_don/form_hd";
    }
    @GetMapping("/hoa-don/{id}")
    public String hienThihdct(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("hdct", hdctService.getHDCTTTList(id));
        model.addAttribute("hd", hoaDonService.getAll());
        return "hoa_don/form_hd";
    }
}
