package com.msys.shoppingcart.controller;

import com.msys.shoppingcart.model.Login;
import com.msys.shoppingcart.model.SignUp;
import com.msys.shoppingcart.service.SignUpService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;

@Controller
@AllArgsConstructor
public class LoginController {
    final SignUpService signUpService;
    static final Logger logger = Logger.getLogger(LoginController.class);

    @GetMapping("/login")
    public String loginProcess(final Model model, final Login login, final HttpServletRequest request) throws Exception {
        final boolean isValid = signUpService.validateUser(login);
        if (isValid) {
            final String emailAddress = (String) request.getSession().getAttribute("emailAddress");
            if (emailAddress == null) {
                request.getSession().setAttribute("emailAddress", login.getEmailAddress());
            }
            model.addAttribute("emailAddress", login.getEmailAddress());
            logger.info("Entered email address and password");
            logger.info("Redirected to home page");
            return "redirect:/fetchProduct";
        } else {
            model.addAttribute("message", "username or password is wrong!!");
            logger.error("Entered wrong credentials");
            logger.info("Redirect to login page ");
            return "index";
        }
    }
}



