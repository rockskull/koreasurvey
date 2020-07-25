package kr.quantumsoft.koreasurvey.controller;

import kr.quantumsoft.koreasurvey.model.Tradings;
import kr.quantumsoft.koreasurvey.model.Users;
import kr.quantumsoft.koreasurvey.service.TradingsService;
import kr.quantumsoft.koreasurvey.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private UsersService userService;

    @Autowired
    private TradingsService tradingsService;



    @RequestMapping("")
    public ModelAndView index() {
        return new ModelAndView("admin/index");
    }

    @RequestMapping("user/list")
    public ModelAndView users(@RequestParam("start") String start,
                              @RequestParam("end") String end,
                              @RequestParam("email") String email) {
        Map<String, Object> items = new HashMap<String, Object>();
        items.put("data", userService.search(email, start, end));
        items.put("start", start);
        items.put("end", end);
        items.put("email", email);

        return new ModelAndView("admin/users/list", items);
    }

    @RequestMapping("user/detail/{index}")
    public ModelAndView detail(@PathVariable int index) {
        Users user = userService.selectUserById(index);
        if (user == null) {
            throw new RuntimeException("");
        }
        HashMap<String, Object> tradingParam = new HashMap<String, Object>();
        tradingParam.put("userid", user.getId());
        List<Tradings> tradingsList = tradingsService.selectTradingsByUserId(tradingParam);
        if (tradingsList.size() != 0) {

        }
        Map<String, Object> items = new HashMap<String, Object>();
        items.put("data", user);
        return new ModelAndView("admin/users/detail", items);
    }

}
