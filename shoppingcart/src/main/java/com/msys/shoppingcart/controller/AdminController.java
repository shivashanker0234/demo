package com.msys.shoppingcart.controller;

import com.msys.shoppingcart.model.Admin;
import com.msys.shoppingcart.service.AdminService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
public class AdminController {
    private AdminService adminService;

    @GetMapping("/adminLogin")
    public String loginProcess(final Model model, final Admin admin, HttpServletRequest request) {
        final boolean isValid = adminService.login(admin);
        if (isValid) {

            final String id = (String) request.getSession().getAttribute("id");
            if (id == null) {
                request.getSession().setAttribute("id", admin.getId());
            }
            model.addAttribute("id", admin.getId());
            return "product";

        } else
            model.addAttribute("message", "Id or Password Wrong");
        return "admin";
    }
}
