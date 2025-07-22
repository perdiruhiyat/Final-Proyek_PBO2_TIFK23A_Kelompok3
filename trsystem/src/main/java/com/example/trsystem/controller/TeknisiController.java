package com.example.trsystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class TeknisiController {
    @GetMapping("/teknisi/teknisi_dashboard")
    public String teknisiDashboard() {
        return "teknisi/teknisi_dashboard";
    }
    
}
