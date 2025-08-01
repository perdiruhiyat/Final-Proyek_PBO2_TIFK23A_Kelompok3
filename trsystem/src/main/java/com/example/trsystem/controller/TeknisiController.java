package com.example.trsystem.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.trsystem.model.Hardware;
import com.example.trsystem.model.RekapPerawatan;
import com.example.trsystem.model.User;
import com.example.trsystem.repository.HardwareRepository;
import com.example.trsystem.repository.RekapPerawatanRepository;
import com.example.trsystem.service.HardwareService;
import com.example.trsystem.service.RekapPerawatanService;
import com.example.trsystem.service.StandarWaktuService;
import com.example.trsystem.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class TeknisiController {
    @Autowired
    private UserService userService;

    @Autowired
    private HardwareService hardwareService;

    @Autowired
    private HardwareRepository hwRepo;

    @Autowired
    private RekapPerawatanService rekapService;

    @Autowired
    private RekapPerawatanRepository repoRekap;

    @Autowired
    private StandarWaktuService swService;

    @GetMapping("/teknisi/teknisi_dashboard")
    public String teknisiDashboard(Model model, Principal principal) {
        String username = principal.getName();
        User user = userService.getUserByUsername(username);
        long totalRekap = repoRekap.countByTeknisi(user);

        model.addAttribute("totalRekap", totalRekap);
        model.addAttribute("nama", user.getNama());

        long totalTepatWaktu = rekapService.countByStatusAndTeknisi("Tepat Waktu", user);
        long totalTerlambat = rekapService.countByStatusAndTeknisi("Terlambat", user);

        model.addAttribute("totalTepatWaktu", totalTepatWaktu);
        model.addAttribute("totalTerlambat", totalTerlambat);
         
        Map<String, Long> rekapPerBulan = rekapService.getRekapPerMonthByTeknisi(user);
        model.addAttribute("rekapPerBulan", rekapPerBulan);
        return "teknisi/teknisi_dashboard";
    }
    
    @GetMapping("/teknisi/teknisi_hardware")
    public String teknisiHardware(Model model, Principal principal) {
        String username = principal.getName();
        User user = userService.getUserByUsername(username);
        List<Hardware> hardwareList = hwRepo.findByOrderByHardwareIdAsc();
        model.addAttribute("nama", user.getNama());
        model.addAttribute("hardwareList", hardwareList);
        return "teknisi/teknisi_hardware";
    }

    @GetMapping("/teknisi/teknisi_rekap")
    public String teknisiRekap(Model model, Principal principal) {
        String username = principal.getName();
        User user = userService.getUserByUsername(username);

        model.addAttribute("rekapBaru", new RekapPerawatan());
        model.addAttribute("user", user);
        model.addAttribute("nama", user.getNama());
        model.addAttribute("hardwareList", hardwareService.getAllHardware());
        model.addAttribute("rekapList", rekapService.getRekapByTeknisi(user));
        model.addAttribute("listSw", swService.getAllSw());
        return "teknisi/teknisi_rekap";
    }

    @PostMapping("teknisi/teknisi_rekap/tambah")
    public String tambahRekap(@ModelAttribute("rekapBaru") RekapPerawatan rekap, Principal principal) {
        String username = principal.getName();
        User user = userService.getUserByUsername(username);

        rekap.setTeknisi(user);
        rekapService.save(rekap);
        return "redirect:/teknisi/teknisi_rekap";
    }

    @PostMapping("/teknisi/teknisi_rekap/edit/{id}")
    public String updateRekap(@ModelAttribute("rekapBaru") RekapPerawatan rekap, Principal principal) {
        String username = principal.getName();
        User user = userService.getUserByUsername(username);
        rekap.setTeknisi(user);
        rekapService.save(rekap);
        return "redirect:/teknisi/teknisi_rekap";
    }


    @PostMapping("/teknisi/teknisi_rekap/hapus/{id}")
    public String deleteRekap(@PathVariable Long id) {
        rekapService.delete(id);
        return "redirect:/teknisi/teknisi_rekap";
    }
    
}
