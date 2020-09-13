package com.batdongsan.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller(value = "homeControllerOfWeb")
public class Login1Controller {
    @RequestMapping(value = "/loging" , method = RequestMethod.GET)
    public ModelAndView loginPage ( HttpServletRequest request) {
        ModelAndView vam = new ModelAndView("dangnhap2");
        return vam;
    }
    @RequestMapping(value = "/dang-xuat" , method = RequestMethod.GET)
    public ModelAndView logoutPage (HttpServletRequest request , HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return new ModelAndView("redirect:/login/");
    }

    @RequestMapping(value = "/accessDenied" , method = RequestMethod.GET)
    public ModelAndView accessDenied () {
        return new ModelAndView("redirect:/login?accessDenied");
    }
}
