package com.example.trsystem.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {

    @GetMapping("/redirect")
    public String redirectAfterLogin(Authentication authentication) {
        String role = authentication.getAuthorities().toString();
        if (role.contains("ADMIN")) {
            return "redirect:/admin/admin_dashboard";
        } else if (role.contains("TEKNISI")) {
            return "redirect:/teknisi/teknisi_dashboard";
        }
        return "redirect:/login?error";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }
}
