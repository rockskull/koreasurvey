package kr.quantumsoft.koreasurvey.controller;

import kr.quantumsoft.koreasurvey.model.*;
import kr.quantumsoft.koreasurvey.service.*;
import kr.quantumsoft.koreasurvey.utils.ProjectConstants;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

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

    @Autowired
    private SurveyExcludeService surveyExcludeService;


    @RequestMapping("surveys")
    public ModelAndView surveys(@RequestParam(value = "start", required = false) String start,
                                @RequestParam(value = "end", required = false) String end,
                                @RequestParam(value = "title", required = false) String title) {
        HashMap<String, Object> items = new HashMap<String, Object>();
        if (StringUtils.isNotEmpty(start) && StringUtils.isNotEmpty(end)) {
            items.put("start", start);
            items.put("end", end);
        }
        if (StringUtils.isNotEmpty(title)) {
            items.put("title", title);
        }
        items.put("data", surveysService.search(items));
        return new ModelAndView("admin/survey/surveys", items);
    }


    @RequestMapping(value = "surveys/detail/{surveyId}", method = RequestMethod.GET)
    public ModelAndView surveys(@PathVariable int surveyId) {
        HashMap<String, Object> items = new HashMap<String, Object>();
        items.put("survey", surveysService.selectSurveysById(surveyId));
        items.put("regions", ProjectConstants.REGION_STRINGS);
        items.put("exclude", surveysService.getSurveyExcludeListBySurveyId(surveyId));
        return new ModelAndView("admin/survey/detail", items);
    }

    @RequestMapping(value = "surveys/detail/{surveyId}", method = RequestMethod.POST)
    public String surveyEdit(@PathVariable int surveyId, Surveys edit) {
        Surveys surveys = surveysService.selectSurveysById(surveyId);
        surveys.setTitle(edit.getTitle());
        surveys.setDetail(edit.getDetail());
        surveysService.updateSurveys(surveys);
        return "redirect:/admin/surveys/detail/" + surveyId;
    }

    private boolean insertExcludes(Integer excludeType, String data, Integer surveyId) {
        if (StringUtils.isEmpty(data)) {
            return false;
        }
        boolean ret = false;
        for (String value : data.split(",")) {
            if (value.equals("all")) {
                continue;
            }
            ret = true;
            SurveyExclude surveyExclude = new SurveyExclude();
            surveyExclude.setExcludeType(excludeType);
            surveyExclude.setExcludeValue(value);
            surveyExclude.setSurveyId(surveyId);
            surveyExclude.setCreated(new Date());
            surveyExcludeService.insertExclude(surveyExclude);
        }
        return ret;
    }
    @ResponseBody
    @RequestMapping(value = "surveys/exclude/{surveyId}", method = RequestMethod.POST)
    public boolean surveyExcludeEdit(@PathVariable int surveyId, Surveys doc) {
        Surveys surveys = surveysService.selectSurveysById(surveyId);
        if (surveys == null) {
            return false;
        }
        surveyExcludeService.deleteExcludeBySurveyId(surveyId);
        //TODO : Delete From SurveyExclude
        //
        this.insertExcludes(ProjectConstants.SURVEY_EXCLUDE_TYPE_GENDER, doc.getGender(), surveyId);
        this.insertExcludes(ProjectConstants.SURVEY_EXCLUDE_TYPE_AGE, doc.getAge(), surveyId);
        this.insertExcludes(ProjectConstants.SURVEY_EXCLUDE_TYPE_REGION, doc.getRegion(), surveyId);
        return true;
    }


    @RequestMapping("")
    public String index() {
        return "redirect:/admin/user/list";
    }

    @ResponseBody
    @RequestMapping("user/change-status")
    public boolean changeUserStatus(@RequestParam("user-id") final Integer userId) {
        Users user = userService.selectUserById(userId);
        if (user == null) {
            return false;
        }
        user.setActive(!user.isActive());
        userService.updateUser(user);
        return true;
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
                              @RequestParam(value = "user-status", required = false) Boolean userStatus,
                              @RequestParam(value = "end", required = false) String end,
                              @RequestParam(value = "email", required = false) String email) {
        Map<String, Object> items = new HashMap<String, Object>();
        items.put("data", userService.search(email, start, end, userStatus));
        items.put("start", start);
        items.put("end", end);
        items.put("email", email);
        items.put("user-status", userStatus);

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
