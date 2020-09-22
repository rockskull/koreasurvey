package kr.quantumsoft.koreasurvey.controller;

import kr.quantumsoft.koreasurvey.model.Notice;
import kr.quantumsoft.koreasurvey.model.Surveys;
import kr.quantumsoft.koreasurvey.model.Tradings;
import kr.quantumsoft.koreasurvey.model.Users;
import kr.quantumsoft.koreasurvey.service.NoticeService;
import kr.quantumsoft.koreasurvey.service.SurveysService;
import kr.quantumsoft.koreasurvey.service.TradingsService;
import kr.quantumsoft.koreasurvey.service.UsersService;
import kr.quantumsoft.koreasurvey.utils.ProjectConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
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

    @Autowired
    private SurveysService surveysService;


    @Autowired
    private NoticeService noticeService;


    @RequestMapping("")
    public ModelAndView index() {
        return new ModelAndView("admin/index");
    }

    @RequestMapping("notice/list")
    public ModelAndView notices() {
        Map<String, Object> items = new HashMap<String, Object>();
        items.put("items", noticeService.getNoticeAll());
        return new ModelAndView("admin/notice/list", items);
    }

    @RequestMapping(value = "notice/edit/{index}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable int index) {
        Map<String, Object> items = new HashMap<String, Object>();

        items.put("notice", noticeService.getNoticeById(index));
        return new ModelAndView("admin/notice/edit", items);
    }

    @RequestMapping(value = "notice/edit", method = RequestMethod.POST)
    public void editRun(@RequestParam("index") int index,
                        @RequestParam("title") final String title,
                        @RequestParam("content") final String content,
                        @RequestParam("show") final boolean show) {
        Notice notice = noticeService.getNoticeById(index);
        if (notice == null) {
            throw new RuntimeException("");
        }
        notice.setTitle(title);
        notice.setContent(content);
        notice.setActive(show);
        noticeService.update(notice);
    }

    @RequestMapping("user/list")
    public ModelAndView users(@RequestParam(value = "start", required = false) String start,
                              @RequestParam(value = "end", required = false) String end,
                              @RequestParam(value = "email", required = false) String email) {
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
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("userid", user.getId());
        param.put("offset", 0);
        param.put("limit", 20);

        List<Surveys> listSurveys = surveysService.selectSurveysByUserId(param);
        Map<String, Object> items = new HashMap<String, Object>();
        items.put("surveys", listSurveys);
        items.put("data", user);
        items.put("regions", ProjectConstants.REGION_STRINGS);
        return new ModelAndView("admin/users/detail", items);
    }

}
