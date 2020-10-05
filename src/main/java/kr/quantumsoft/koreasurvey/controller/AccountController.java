/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package kr.quantumsoft.koreasurvey.controller;

import kr.quantumsoft.koreasurvey.model.*;
import kr.quantumsoft.koreasurvey.service.*;
import kr.quantumsoft.koreasurvey.utils.CommonUtils;
import kr.quantumsoft.koreasurvey.utils.ProjectConstants;
import kr.quantumsoft.koreasurvey.utils.ProjectUtils;
import kr.quantumsoft.koreasurvey.utils.SpringSecurityUtil;
import org.apache.commons.lang.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.internet.MimeMessage;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author QuantumSoft Inc.
 * @version 1.0
 * @Class Name : AccountController.java
 * @Project Name : koreasurvey
 * @Description :
 * @Modification Information
 * @
 * @ 수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2019. 12. 19.                     최초생성
 * @see Copyright (C) by QuantumSoft Inc. All right reserved.
 * @since 2015. 8.
 */
@Controller
@RequestMapping(value = "/account")
public class AccountController {

    private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Autowired
    private UsersService userService;

    @Autowired
    private TradingsService tradingService;

    @Autowired
    private SurveysService surveyService;

    @Autowired
    private AnswersService answersService;

    @Autowired
    private JavaMailSenderImpl mailSender;

    @Autowired
    private WithDrawsService withDrawsService;

    //    @Autowired
//    private Environment env;
    @Value("${smtp.email}")
    private String fromEmail;

    @ResponseBody
    @RequestMapping(value = "/withdraw")
    public void withdraw(@RequestParam("bank") final String bank,
                         @RequestParam("account-holder") final String accountHolder,
                         @RequestParam("bank-address") final String address,
                         @RequestParam("withdraw") final Integer money,
                         Authentication auth) {
        Users sessionUser = (Users) auth.getPrincipal();

        Users user = userService.selectUserById(sessionUser.getId());
        user.setPoint(user.getPoint() - money);
        userService.updateUser(user);

        Withdraw withdraw = new Withdraw();
        withdraw.setAccountHolder(accountHolder);
        withdraw.setBank(bank);
        withdraw.setUserid(user.getId());
        withdraw.setWithdraw(money);
        withdraw.setStatus(ProjectConstants.WITHDRAWS_RUNNING);
        withdraw.setAddress(address);
        withDrawsService.insert(withdraw);

        Tradings tradings = new Tradings();
        tradings.setWithdrawsid(withdraw.getId());
        tradings.setAmount(-money);
        tradings.setUserid(user.getId());
        tradings.setType(ProjectConstants.TRADING_USE);

        tradingService.insertTradings(tradings);
        //TODO :
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "account/login";
    }

    @ResponseBody
    @RequestMapping("/join/check-email")
    public boolean checkEmail(@RequestParam("email") final String email) {
        return userService.selectUserByEmail(email) == null;
    }

    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String getJoin(Model model, @RequestParam(value = "email", required = false) String email) {
        model.addAttribute("join", new Users());
        model.addAttribute("email", email);
        return "account/join";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyUserInfo(Users user, Authentication authentication) {
        Users selectuser = userService.selectUserById(SpringSecurityUtil.getUserFromAuth(authentication).getId());
        selectuser.setAge(user.getAge());
        selectuser.setArea(user.getArea());
        selectuser.setGender(user.getGender());
        userService.updateUser(selectuser);
        return "redirect:/account/modify";
    }

    @ResponseBody
    @RequestMapping(value = "/find-password", method = RequestMethod.POST)
    public boolean findPassword(@RequestParam("email") final String email) {
        final Users user = userService.selectUserByEmail(email);
        if (user == null) {
            return false;
        }
        final String newPassword = RandomStringUtils.randomAlphabetic(10);
        user.setPassword(passwordEncoder.encode(newPassword));
        userService.updateUser(user);
        final MimeMessagePreparator preparator = new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                helper.setFrom(fromEmail);
                helper.setTo(user.getEmail());
                helper.setSubject("[큐플] 비밀번호 찾기 메일 입니다.");
                helper.setText(String.format("안녕하세요 큐플입니다.</br>" +
                        "비밀번호 분실로 인해 새로운 비밀번호를 송부 드립니다.</br>" +
                        "귀하의 새 비밀번호는 </br>" +
                        "%s</br>" +
                        "입니다.</br>" +
                        "로그인 후 비밀번호 변경 부탁 드리겠습니다.</br>" +
                        "감사합니다.", newPassword), true);
            }
        };

        mailSender.send(preparator);
        return true;
    }

    @ResponseBody
    @RequestMapping(value = "/modify-password", method = RequestMethod.POST)
    public boolean modifyPassword(@RequestParam("now-password") String nowPassword,
                                  @RequestParam("new-password") String newPassword,
                                  Authentication authentication) {
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        Users selectuser = userService.selectUserById(SpringSecurityUtil.getUserFromAuth(authentication).getId());
        if (selectuser == null) {
            return false;
        }
        if (passwordEncoder.matches(nowPassword, selectuser.getPassword()) == false) {
            return false;
        }
        selectuser.setPassword(passwordEncoder.encode(newPassword));
        userService.updateUser(selectuser);
        return true;
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String getModify(Model model, Authentication authentication) {
        model.addAttribute("join", new Users());
        model.addAttribute("areaList", ProjectConstants.REGION_STRINGS);
        model.addAttribute("ageList", ProjectConstants.AGE_RANGES);


        model.addAttribute("user", userService.selectUserById(SpringSecurityUtil.getUserFromAuth(authentication).getId()));
        return "account/modify";
    }


    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String postJoin(Users user) {
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        // 추천인 추가.
        if (!user.getRecommanderemail().isEmpty()) {
            Users recommanderUser = userService.selectUserByEmail(user.getRecommanderemail());

            if (recommanderUser != null) {
                user.setRecommanderid(recommanderUser.getId());
            }
        }

        userService.insertUsers(user);

        return "account/joinComplete";
    }

    @ResponseBody
    @RequestMapping(value = "/searchEmail")
    public List<String> searchEmail(String term) {
        List<String> listEmail = new ArrayList<String>();
        List<Users> userList = userService.searchUsersByEmail(term);

        for (int i = 0; i < userList.size(); i++) {
            if (i < 6) {
                listEmail.add(userList.get(i).getEmail());
            } else {
                break;
            }
        }

        return listEmail;
    }

    @ResponseBody
    @RequestMapping("/tradings")
    public List<Tradings> tradings(Authentication auth, @RequestParam("page") int page) {
        Users user = SpringSecurityUtil.getUserFromAuth(auth);
        return tradingService.selectTradingsByUserId(user.getId(), page, 5);
    }

    @RequestMapping(value = {"", "/"})
    public String index(Model model, Authentication auth) {
        Users user = (Users) auth.getPrincipal();
        Users dbUser = userService.selectUserById(user.getId());
        user.setPoint(dbUser.getPoint());

        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("userid", user.getId());
        param.put("from", CommonUtils.getDateString(-7));
        param.put("to", CommonUtils.getDateString(0) + " 23:00:00");

        List<Tradings> tradings = tradingService.selectTradingsByUserId(param);

        Integer diff = ProjectUtils.calcDiffrential(tradings);

        //LIMIT #{offset}, #{limit}
        param.put("offset", 0);
        param.put("limit", 5);

        List<Answers> joinedList = answersService.selectAnswersByUserIdGroupBySurveyId(user.getId());

        List<Surveys> joinedSurveys = new ArrayList<Surveys>();

        for (Answers answerItem : joinedList) {
            joinedSurveys.add(surveyService.selectSurveysById(answerItem.getSurveyid()));
        }
        model.addAttribute("banks", ProjectConstants.BANKS);
        model.addAttribute("diff", diff);
        model.addAttribute("tradings", tradings);
        model.addAttribute("joined", joinedSurveys);
        model.addAttribute("user", user);
        return "account";
    }

    @RequestMapping(value = "/charge")
    public String getCharge(Model model, Authentication auth) {
        Users user = (Users) auth.getPrincipal();

        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("userid", user.getId());
        param.put("from", CommonUtils.getDateString(-7));
        param.put("to", CommonUtils.getDateString(0) + " 23:00:00");

        List<Tradings> tradings = tradingService.selectTradingsByUserId(param);

        Integer diff = ProjectUtils.calcDiffrential(tradings);

        model.addAttribute("diff", diff);
        model.addAttribute("user", user);
        return "charge";
    }

    @RequestMapping(value = "/charge", method = RequestMethod.POST)
    public String postCharge(Integer amount, Authentication auth) {
        Users user = (Users) auth.getPrincipal();

        Tradings trading = new Tradings();
        trading.setUserid(user.getId());
        trading.setType(1);
        trading.setAmount(amount);

        tradingService.insertTradings(trading);

        user.setPoint(user.getPoint() + amount);

        userService.updateUser(user);

        return "redirect:/account";
    }
}
