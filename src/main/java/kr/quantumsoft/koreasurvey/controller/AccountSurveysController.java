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

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import kr.quantumsoft.koreasurvey.model.*;
import kr.quantumsoft.koreasurvey.service.*;
import kr.quantumsoft.koreasurvey.utils.SpringSecurityUtil;
import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.quantumsoft.koreasurvey.utils.ProjectConstants;

/**
 * @author QuantumSoft Inc.
 * @version 1.0
 * @Class Name : SurveysController.java
 * @Project Name : koreasurvey
 * @Description :
 * @Modification Information
 * @
 * @ 수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 4. 13.                     최초생성
 * @see Copyright (C) by QuantumSoft Inc. All right reserved.
 * @since 2015. 8.
 */
@Controller
@RequestMapping(value = "/account/surveys")
public class AccountSurveysController {
    private static final Logger logger = LoggerFactory.getLogger(AccountSurveysController.class);
    private static final Integer COUNTS_ITEMS = 20;

    @Autowired
    SurveysService surveyService;

    @Autowired
    QuestionsService questionService;

    @Autowired
    OptionsService optionService;

    @Autowired
    AnswersService answerService;

    @Autowired
    UsersService usersService;

    @Autowired
    TradingsService tradingService;

    @Autowired
    SurveyExcludeService surveyExcludeService;

    @ResponseBody
    @RequestMapping(value = "/exit-survey", method = RequestMethod.POST)
    public void exit(@RequestParam("survey-id") int surveyId, Authentication auth) {
        Users user = SpringSecurityUtil.getUserFromAuth(auth);
        if (user == null) {
            throw new RuntimeException("");
        }
        surveyService.exitSurvey(surveyId, user);
        return;
    }

    @ResponseBody
    @RequestMapping("/result/answer/{surveyId}")
    public List<Answers> getAnswerResult(@PathVariable Integer surveyId, Authentication authentication) {
//        model.addAttribute("answerResult", );

        Surveys surveys = surveyService.selectSurveysById(surveyId);
        if (surveys == null) {
            throw new RuntimeException("");
        }
        Users user = SpringSecurityUtil.getUserFromAuth(authentication);

        if (user == null || surveys.getUserid().equals(user.getId()) == false) {
            throw new RuntimeException("");
        }
        Answers param = new Answers();
        param.setSurveyid(surveys.getId());
        param.setQuestiontype(ProjectConstants.ANSWER_TYPE_MULTI_CHOICE);
        List<Answers> answersList = answerService.selectCountBySurveyIdGroupByQuestion(param);
        for (Answers answers : answersList) {
            Questions question = questionService.selectQuestionsById(answers.getQuestionid());
            answers.setQuestionTitle(question.getTitle());

        }
        return answersList;

    }

    @RequestMapping("/result/{surveyId}")
    public String index(@PathVariable Integer surveyId, Model model, Authentication authentication) {
        Surveys surveys = surveyService.selectSurveysById(surveyId);
        if (surveys == null) {
            throw new RuntimeException("");
        }
        Users user = SpringSecurityUtil.getUserFromAuth(authentication);

        if (user == null || surveys.getUserid().equals(user.getId()) == false) {
            throw new RuntimeException("");
        }
        Integer answerCount = answerService.countAnswersUsers(surveyId);

        List<SurveyExclude> excludeList = surveyService.getSurveyExcludeListBySurveyId(surveyId);
        model.addAttribute("survey", surveys);
        model.addAttribute("exclude", excludeList);
        model.addAttribute("answerCount", answerCount);
        model.addAttribute("questions", questionService.selectQuestionsBySurveyId(surveyId));
        return "surveyResult";
    }


    @RequestMapping(value = {"", "/"})
    public String index(Model model, Authentication auth) {
        Users user = (Users) auth.getPrincipal();
        Users dbUser = usersService.selectUserById(user.getId());
        user.setPoint(dbUser.getPoint());

        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("userid", user.getId());
        param.put("offset", 0);
        param.put("limit", COUNTS_ITEMS);

        List<Surveys> listSurveys = surveyService.selectSurveysByUserId(param);


        model.addAttribute("user", user);
        model.addAttribute("list", listSurveys);
        return "surveyList";
    }

    @RequestMapping(value = "/new")
    public String getInsert(Model model, Authentication auth) {
        Users user = (Users) auth.getPrincipal();
        Users dbUser = usersService.selectUserById(user.getId());
        user.setPoint(dbUser.getPoint());

        model.addAttribute("new", new Surveys());
        model.addAttribute("user", user);
        model.addAttribute("regions", ProjectConstants.REGION_STRINGS);
        return "surveyNew";
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public String postInsert(Surveys survey, Authentication auth) {
        Users user = (Users) auth.getPrincipal();

        survey.setUseremail(user.getEmail());
        survey.setUserid(user.getId());

        survey.setStatus(ProjectConstants.SURVEY_STATE_RUNNING);
        surveyService.insertSurveys(survey);

        return "redirect:/account/surveys";
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
    @RequestMapping(value = "/saveSurveyDoc", method = RequestMethod.POST)
    public Integer saveSurveyDoc(Surveys doc, Authentication auth) {

        Users user = (Users) auth.getPrincipal();

        doc.setUseremail(user.getEmail());
        doc.setUserid(user.getId());
		/*if(doc.getTo().isEmpty() && doc.getTo() != null) {
			doc.setTo(null);
		}*/
        doc.setStatus(ProjectConstants.SURVEY_STATE_RUNNING);
        surveyService.insertSurveys(doc);
        boolean exclude = this.insertExcludes(ProjectConstants.SURVEY_EXCLUDE_TYPE_GENDER, doc.getGender(), doc.getId()) ||
                this.insertExcludes(ProjectConstants.SURVEY_EXCLUDE_TYPE_AGE, doc.getAge(), doc.getId()) ||
                this.insertExcludes(ProjectConstants.SURVEY_EXCLUDE_TYPE_REGION, doc.getRegion(), doc.getId());
        doc.setExclude(exclude);
        surveyService.updateSurveys(doc);
        user.setPoint(user.getPoint() - doc.getTotalcost());
        usersService.updateUser(user);

        Tradings tradingData = new Tradings();
        tradingData.setAmount(doc.getTotalcost() * -1);
        tradingData.setUserid(user.getId());
        tradingData.setType(ProjectConstants.TRADING_USE);

        tradingService.insertTradings(tradingData);

        return doc.getId();
    }

    @ResponseBody
    @RequestMapping(value = "updateSurveyDoc", method = RequestMethod.POST)
    public Integer updateSurveyDoc(Surveys doc, Authentication auth) {
        Users user = (Users) auth.getPrincipal();
        Surveys previousSurvey = surveyService.selectSurveysById(doc.getId());

        Integer diffCost = previousSurvey.getTotalcost() - doc.getTotalcost();
        if (diffCost != 0) {
            // 배당금의 변화가 있음.
            user.setPoint(user.getPoint() + diffCost);
            usersService.updateUser(user);

            Tradings updateTrading = new Tradings();
            updateTrading.setAmount(diffCost);
            updateTrading.setType(ProjectConstants.TRADING_USE);
            updateTrading.setUserid(user.getId());

            tradingService.insertTradings(updateTrading);
        }

        surveyService.updateSurveys(doc);

        questionService.deleteQuestionBySurveyId(doc.getId());
        return 0;
    }

    @ResponseBody
    @RequestMapping(value = "saveQuestion", method = RequestMethod.POST)
    public Integer saveQuestion(Questions question) {
        questionService.insertQuestions(question);

        return question.getId();
    }

    @ResponseBody
    @RequestMapping(value = "updateQuestion", method = RequestMethod.POST)
    public Integer updateQuestion(Questions question) {
        questionService.updateQuestions(question);

        return 0;
    }

    @ResponseBody
    @RequestMapping(value = "saveOption", method = RequestMethod.POST)
    public Integer saveOption(Options option) {
        optionService.insertOptions(option);

        return option.getId();
    }

    @ResponseBody
    @RequestMapping(value = "updateOption", method = RequestMethod.POST)
    public Integer updateOption(Options option) {
        optionService.updateOptions(option);
        return 0;
    }

    @ResponseBody
    @RequestMapping(value = "deleteOptions", method = RequestMethod.POST)
    public Integer deleteOptions(Integer questionId) {
        optionService.deleteOptionsByQuestionId(questionId);
        return 0;
    }

    @RequestMapping(value = "edit")
    public String editSurvey(Model model, Integer surveyId, Authentication auth) {
        Users user = (Users) auth.getPrincipal();
        Users dbUser = usersService.selectUserById(user.getId());
        user.setPoint(dbUser.getPoint());

        Surveys selectItem = surveyService.selectSurveysById(surveyId);
        List<Questions> listQuestions = questionService.selectQuestionsBySurveyId(surveyId);

        model.addAttribute("survey", selectItem);
        model.addAttribute("listQuestions", listQuestions);
        model.addAttribute("user", user);
        return "surveyEdit";
    }

    @ResponseBody
    @RequestMapping(value = "deleteSurveys", method = RequestMethod.POST)
    public String deleteSurvey(String listSurveyId, Authentication auth) {
        Users user = (Users) auth.getPrincipal();
        ObjectMapper objMapper = new ObjectMapper();
        Integer refundAmount = 0;

        try {
            Integer[] listItem = objMapper.readValue(listSurveyId, Integer[].class);

            for (Integer itemIndex : listItem) {
                Surveys itemSurvey = surveyService.selectSurveysById(itemIndex);

                Integer countUsers = answerService.countAnswersUsers(itemIndex);

                refundAmount += itemSurvey.getTotalcost() - (itemSurvey.getUnitcost() * countUsers);

                surveyService.deleteSurveyById(itemIndex);
            }
        } catch (JsonParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (JsonMappingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        user.setPoint(user.getPoint() + refundAmount);
        usersService.updateUser(user);

        Tradings deleteTrading = new Tradings();
        deleteTrading.setAmount(refundAmount);
        deleteTrading.setType(ProjectConstants.TRADING_USE);
        deleteTrading.setUserid(user.getId());

        tradingService.insertTradings(deleteTrading);

        return "";
    }
}
