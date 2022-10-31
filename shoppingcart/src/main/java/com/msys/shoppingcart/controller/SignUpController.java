package com.msys.shoppingcart.controller;

import com.msys.shoppingcart.dao.CartItemDao;
import com.msys.shoppingcart.model.SignUp;
import com.msys.shoppingcart.service.SignUpService;
import lombok.AllArgsConstructor;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
public class SignUpController {
    final SignUpService signUpService;
    final CartItemDao cartItemDao;
    private final static Logger logger = Logger.getLogger(SignUpController.class);

    @GetMapping("/register")
    public String registerUser(final Model model, final SignUp signUp, HttpServletRequest request) throws Exception {
        final int countUser = signUpService.addUser(signUp);
        if (countUser == 0) {
            request.getSession().setAttribute("emailAddress", signUp.getEmailAddress());
            cartItemDao.createCart(signUp.getEmailAddress());
            model.addAttribute("message", "user Registered successfully");
            model.addAttribute("welcomeMessage", "Hey welcome to Shopping Cart '" + signUp.getUserName() + "'");
            return "welcome";
        }
        logger.warn("User Already exist");
        model.addAttribute("alertMessage", "Already This email is registered");
        return "index";
    }

    @PostMapping("/updateProfile")
    public String updateProfile(final SignUp signUp, final Model model) {
        signUpService.updateProfile(signUp);
        logger.info("Profile Updated Successfully");
        model.addAttribute("updateMessage", "Profile has been updated successfully");
        return "payment";
    }

    @GetMapping("/fetchUser")
    public String getUser(final Model model, final HttpSession session) {
        final String emailAddress = (String) session.getAttribute("emailAddress");
        final SignUp user = signUpService.fetchUser(emailAddress);
        model.addAttribute("user", user);
        return "updateProfile";
    }

    @GetMapping("/logout")
    public String logout(final Model model, final HttpServletRequest request) {
        final HttpSession session = request.getSession();
        session.invalidate();
        logger.info("Logout successful");
        model.addAttribute("logoutMessage", "logout successful");
        return "index";
    }
}
