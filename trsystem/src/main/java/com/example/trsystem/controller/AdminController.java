package com.example.trsystem.controller;

import com.example.trsystem.model.Hardware;
import com.example.trsystem.model.StandarWaktu;
import com.example.trsystem.model.User;
import com.example.trsystem.service.HardwareService;
import com.example.trsystem.service.RekapPerawatanService;
import com.example.trsystem.service.StandarWaktuService;
import com.example.trsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
    
    @Autowired
    private UserService userService;

    @Autowired
    private HardwareService hardwareService;

    @Autowired
    private StandarWaktuService swService;

    @Autowired
    private RekapPerawatanService rekapService;

    @GetMapping("/admin/admin_dashboard")
    public String adminDashboard() {
        return "admin/admin_dashboard";
    }

    @GetMapping("/admin/admin_user")
    public String adminUser(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("userList", userService.getAllUsers());
        return "admin/admin_user";
    }

    @PostMapping("/admin/admin_user/tambah")
    public String tambahUser(@RequestParam String nama,
                             @RequestParam String username,
                             @RequestParam String password,
                             @RequestParam String role) {
        userService.createUser(nama, username, password, role);
        return "redirect:/admin/admin_user";
    }

    @PostMapping("/admin/admin_user/edit/{id}")
    public String editUser(@PathVariable Long id,
                           @RequestParam String nama,
                           @RequestParam String username,
                           @RequestParam String role) {
        userService.updateUser(id, nama, username, role);
        return "redirect:/admin/admin_user";
    }

    @PostMapping("/admin/admin_user/hapus/{id}")
    public String hapusUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return "redirect:/admin/admin_user";
    }

    @GetMapping("/admin/admin_hardware")
    public String adminHardware(Model model) {
        model.addAttribute("hardwareBaru", new Hardware());
        model.addAttribute("hardwareList", hardwareService.getAllHardware());
        return "admin/admin_hardware";
    }

    @PostMapping("/admin/admin_hardware/tambah")
    public String tambahHardware(@RequestParam String hardwareId,
                                 @RequestParam String nama,
                                 @RequestParam String tipe,
                                 @RequestParam String kategori) {
        hardwareService.createHardware(hardwareId, nama, tipe, kategori);
        return "redirect:/admin/admin_hardware";
    }

    @PostMapping("/admin/admin_hardware/edit/{id}")
    public String editHardware(@PathVariable Long id,
                               @RequestParam String hardwareId,
                               @RequestParam String nama,
                               @RequestParam String tipe,
                               @RequestParam String kategori) {
        hardwareService.updateHardware(id, hardwareId, nama, tipe, kategori);
        return "redirect:/admin/admin_hardware";
    }

    @PostMapping("/admin/admin_hardware/hapus/{id}")
    public String hapusHardware(@PathVariable Long id) {
        hardwareService.deleteHardware(id);
        return "redirect:/admin/admin_hardware";
    }

    @GetMapping("/admin/admin_standarwaktu")
    public String adminStandarWaktu(Model model) {
        model.addAttribute("standarwaktu", new StandarWaktu());
        model.addAttribute("listSw", swService.getAllSw());
        return "admin/admin_standarwaktu";
    }

    @PostMapping("/admin/admin_standarwaktu/tambah")
    public String tambahStandarWaktu(@RequestParam String deskripsi,
                                     @RequestParam Integer waktu) {
        swService.createStandarWaktu(deskripsi, waktu);
        return "redirect:/admin/admin_standarwaktu";
    }

    @PostMapping("/admin/admin_standarwaktu/edit/{id}")
    public String editStandarWaktu(@PathVariable Long id,
                               @RequestParam String deskripsi,
                                @RequestParam Integer waktu) {
        swService.updateStandarWaktu(id, deskripsi, waktu);
        return "redirect:/admin/admin_standarwaktu";
    }

    @PostMapping("/admin/admin_standarwaktu/hapus/{id}")
    public String hapusStandarWaktu(@PathVariable Long id) {
        swService.deleteStandarWaktu(id);
        return "redirect:/admin/admin_standarwaktu";
    }

    @GetMapping("/admin/admin_rekap")
    public String adminRekap(Model model) {
        model.addAttribute("rekapList", rekapService.getAllRekap());
        return "admin/admin_rekap";
    }
}