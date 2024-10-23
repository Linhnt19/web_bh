package com.example.assignment2.controller;

import com.example.assignment2.model.NhanVien;
import com.example.assignment2.service.NhanVienService;
import com.example.assignment2.service.SPChiTietService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/assignment")
public class LoginController {
    @Autowired
    NhanVienService svNV;

    @GetMapping({
            "/login",
            "/signin"
    })
    public String login() {
        return "login";
    }

    @GetMapping("/signup")
    public String formSignup() {
        return "signup";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest req) {
        req.getSession().removeAttribute("username");
        return "redirect:login";
    }

    public boolean checkSignin(@RequestParam("username") String username, @RequestParam("password") String password, Model model) {
        boolean err = false;
        if (username.equals("")) {
            model.addAttribute("msgLG1", "Moi nhap username");
            err = true;
        }
        if (password.equals("")) {
            model.addAttribute("msgLG2", "Moi nhap password");
            err = true;
        }
        if (err) {
            return true;
        } else
            return false;
    }

    public boolean checkSignup(NhanVien nhanVien, Model model) {
        boolean err = false;
        if (nhanVien.getTen().equals("")) {
            model.addAttribute("msgSU2", "Moi nhap name");
            err = true;
        }
        if (nhanVien.getMaNV().equals("")) {
            model.addAttribute("msgSU3", "Moi nhap code");
            err = true;
        }
        if (nhanVien.getTenDangNhap().equals("")) {
            model.addAttribute("msgSU4", "Moi nhap username");
            err = true;
        }
        if (nhanVien.getMatKhau().equals("")) {
            model.addAttribute("msgSU5", "Moi nhap password");
            err = true;
        }
        if (nhanVien.getTrangThai() == null) {
            model.addAttribute("msgSU6", "Moi chon vai tro");
            err = true;
        }

        if (err) {
            return true;
        } else
            return false;
    }

    @PostMapping("/signin")
    public String signin(@RequestParam("username") String username, @RequestParam("password") String password, Model model, HttpServletRequest req) {
        if (checkSignin(username, password, model)) {
            return "login";
        } else {
            if (svNV.checkLogin(username, password)) {
                NhanVien nv = svNV.findNVBytenDN(username);
                req.getSession().setAttribute("idNV",nv.getId());
                if (nv.getTrangThai() == false) {
                    req.getSession().setAttribute("check", null);
                } else {
                    req.getSession().setAttribute("check", 1);
                }
                return "redirect:home";
            } else
                model.addAttribute("msgLG3", "Tai khoan khong chinh xac");
            return "login";
        }
    }

    @PostMapping("/signup")
    public String signup(NhanVien nv, Model model) {
        if (checkSignup(nv, model)) {
            return "signup";
        } else {
            if (svNV.checkTKSignup(nv.getTenDangNhap())) {
                model.addAttribute("msgSU7", "Username da ton tai");
                return "signup";
            } else
                svNV.add(nv);
            return "redirect:signin";
        }
    }

}
