package kr.quantumsoft.koreasurvey.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @RequestMapping("")
    public ModelAndView index() {
        return new ModelAndView("admin/index");
    }

    @RequestMapping("users")
    public ModelAndView users() {
        return new ModelAndView("admin/users");
    }

}
