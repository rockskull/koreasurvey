package kr.quantumsoft.koreasurvey.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.quantumsoft.koreasurvey.model.Answers;
import kr.quantumsoft.koreasurvey.model.Surveys;
import kr.quantumsoft.koreasurvey.model.Users;
import kr.quantumsoft.koreasurvey.service.AnswersService;
import kr.quantumsoft.koreasurvey.service.MetropolitanService;
import kr.quantumsoft.koreasurvey.service.SurveysService;
import kr.quantumsoft.koreasurvey.service.UsersService;
import kr.quantumsoft.koreasurvey.vo.StatisticsVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/m")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	MetropolitanService metroService;
	
	@Autowired
	UsersService userService;
	
	@Autowired
	SurveysService surveyService;
	
	@Autowired
	AnswersService answerService;
	
	public static final List<HashMap<String, String>> listHeaders = Arrays.asList(
			new HashMap<String, String>() {{
				put("id", "11");	// 1
				put("name", "박원순");
				put("descript", "서울특별시장");
				put("filename", "seoul");
			}},
			new HashMap<String, String>() {{
				put("id", "26");	// 2
				put("name", "오거돈");
				put("descript", "부산광역시장");
				put("filename", "busan");
			}},
			new HashMap<String, String>() {{
				put("id", "27");	// 3
				put("name", "권영진");
				put("descript", "대구광역시장");
				put("filename", "daegu");
			}},
			new HashMap<String, String>() {{
				put("id", "28");	// 4
				put("name", "박남준");
				put("descript", "인천광역시장");
				put("filename", "incheon");
			}},
			new HashMap<String, String>() {{
				put("id", "29");	// 5
				put("name", "이용섭");
				put("descript", "광주광역시장");
				put("filename", "gwangju");
			}},
			new HashMap<String, String>() {{
				put("id", "30");	// 6
				put("name", "허태정");
				put("descript", "대전광역시장");
				put("filename", "daejeon");
			}},
			new HashMap<String, String>() {{
				put("id", "31");	// 7
				put("name", "송철호");
				put("descript", "울산광역시장");
				put("filename", "ulsan");
			}},
			new HashMap<String, String>() {{
				put("id", "41");	// 8
				put("name", "이재명");
				put("descript", "경기도지사");
				put("filename", "gg");
			}},
			new HashMap<String, String>() {{
				put("id", "42");	// 9
				put("name", "최문순");
				put("descript", "강원도지사");
				put("filename", "gangwon");
			}},
			new HashMap<String, String>() {{
				put("id", "43");	// 10
				put("name", "이시종");
				put("descript", "충청북도지사");
				put("filename", "chungbuk");
			}},
			new HashMap<String, String>() {{
				put("id", "44");	// 11
				put("name", "양승조");
				put("descript", "충청남도지사");
				put("filename", "chungnam");
			}},
			new HashMap<String, String>() {{
				put("id", "45");	// 12
				put("name", "송하진");
				put("descript", "전라북도지사");
				put("filename", "jeonbuk");
			}},
			new HashMap<String, String>() {{
				put("id", "45");	// 13
				put("name", "김영록");
				put("descript", "전라남도지사");
				put("filename", "jeonnam");
			}},
			new HashMap<String, String>() {{
				put("id", "47");	// 14
				put("name", "이철우");
				put("descript", "경상북도지사");
				put("filename", "gb");
			}},
			new HashMap<String, String>() {{
				put("id", "48");	// 15
				put("name", "김경수");
				put("descript", "경상남도지사");
				put("filename", "gyeongnam");
			}},
			new HashMap<String, String>() {{
				put("id", "49");	// 16
				put("name", "원희룡");
				put("descript", "제주특별자치도지사");
				put("filename", "jeju");
			}}
			);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/", ""}, method = RequestMethod.GET)
	public String home(Device device, HttpServletRequest request, Locale locale, Model model, Authentication auth) {
		Device dddd = DeviceUtils.getCurrentDevice(request);
		Users user = null;
		Integer isSelection = null;
		
		if(auth != null) {
			user = (Users)auth.getPrincipal();
			Users dbUser = userService.selectUserById(user.getId());
			user.setPoint(dbUser.getPoint());
			
			HashMap<String, Object> param = new HashMap<String, Object>();
			
			Calendar c = Calendar.getInstance();
			c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			c.set(Calendar.HOUR_OF_DAY, 0);
			c.set(Calendar.MINUTE, 0);
			c.set(Calendar.SECOND, 0);
			param.put("start", c.getTime());
			
			c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
			c.set(Calendar.HOUR_OF_DAY, 23);
			c.set(Calendar.MINUTE, 59);
			c.set(Calendar.SECOND, 30);
			c.add(Calendar.DATE, 7);
			param.put("end", c.getTime());
			
			param.put("userid", user.getId());
			
			isSelection = metroService.selectByUserid(param);
		}
		
		List<HashMap<String, String>> tmpHeaderList = listHeaders;
		
		Collections.shuffle(tmpHeaderList);
		
		/*logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );*/
		model.addAttribute("headers", tmpHeaderList);
		model.addAttribute("user", user);
		model.addAttribute("isSelection", isSelection);
		
		return "home";
	}
	
	@RequestMapping(value = "/mainTop", method = RequestMethod.GET)
	public String mainTop(Locale locale, Model model, Authentication auth) {
		Users user = null;
		Integer isSelection = null;
		
		if(auth != null) {
			user = (Users)auth.getPrincipal();
			
			HashMap<String, Object> param = new HashMap<String, Object>();
			
			Calendar c = Calendar.getInstance();
			c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			c.set(Calendar.HOUR_OF_DAY, 0);
			c.set(Calendar.MINUTE, 0);
			c.set(Calendar.SECOND, 0);
			param.put("start", c.getTime());
			
			c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
			c.set(Calendar.HOUR_OF_DAY, 23);
			c.set(Calendar.MINUTE, 59);
			c.set(Calendar.SECOND, 30);
			c.add(Calendar.DATE, 7);
			param.put("end", c.getTime());
			
			param.put("userid", user.getId());
			
			isSelection = metroService.selectByUserid(param);
		}
		
		List<HashMap<String, String>> tmpHeaderList = listHeaders;
		
		Collections.shuffle(tmpHeaderList);
		
		/*logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );*/
		model.addAttribute("headers", tmpHeaderList);
		model.addAttribute("user", user);
		model.addAttribute("isSelection", isSelection);
		
		return "mainTop";
	}
	
	@ResponseBody
	@RequestMapping(value="/getSurveyList", method=RequestMethod.POST)
	public List<Surveys> getList(Integer start, Authentication auth) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("offset", start);
		
		List<Surveys> resultSurveys = surveyService.selectSurveysforAjax(param);
		
		if(auth != null) {
			Users user = (Users)auth.getPrincipal();
			
			List<Answers> joinedList = answerService.selectAnswersByUserIdGroupBySurveyId(user.getId());
			
			for (Answers answer : joinedList) {
				for (Surveys survey : resultSurveys) {
					if(answer.getSurveyid() == survey.getId()) {
						survey.setIsJoined(true);
						break;
					}
				}
			}
			
			for(Surveys surveyItem : resultSurveys) {
				Integer countUsers = answerService.countAnswersUsers(surveyItem.getId());
				if(countUsers == null) countUsers = 0;
				surveyItem.setAnswerUserCount(countUsers);
			}
		}
		
		return resultSurveys;
	}
	
	@ResponseBody
	@RequestMapping(value="/selection", method=RequestMethod.GET)
	public String selection(String id, Authentication auth) {
		Users user = (Users)auth.getPrincipal();
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("userid", user.getId());
		param.put("useremail", user.getEmail());
		param.put("headerid", Integer.valueOf(id));
		
		metroService.insertMetropolitan(param);
		
		return "ok";
	}
	
	@RequestMapping(value="/statistics")
	public String statistics(Model model, Authentication auth) {
		Users user = null;
		DecimalFormat formatter = new DecimalFormat("###,###");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(auth != null) {
			user = (Users)auth.getPrincipal();
		}
		
		model.addAttribute("user", user);
		
		// 오늘 날짜 얻기
		Calendar today = Calendar.getInstance();
		
		// 월요일 정보 얻기
		Calendar monday = Calendar.getInstance();
		monday.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		monday.set(Calendar.HOUR_OF_DAY, 0);
		monday.set(Calendar.MINUTE, 0);
		monday.set(Calendar.SECOND, 0);
		
		StatisticsVO vo = new StatisticsVO();
		
		// 회원 그래프
		for(int i=0; i<7; i++) {
			Calendar targetDay = (Calendar) monday.clone();
			targetDay.add(Calendar.DATE, i);
			
			if(today.compareTo(targetDay) > 0) {
				HashMap<String, Date> param = new HashMap<String, Date>();
				param.put("start", targetDay.getTime());
				
				targetDay.set(Calendar.HOUR_OF_DAY, 23);
				targetDay.set(Calendar.MINUTE, 59);
				targetDay.set(Calendar.SECOND, 59);
				
				param.put("end", targetDay.getTime());
				
				vo.getGraphDate().add(sdf.format(targetDay.getTime()));
				vo.getGraphTotalMember().add(userService.countTotalUserToToday(targetDay.getTime()));
				vo.getGraphNewMember().add(userService.countNewUserByRange(param));
				vo.getGraphVotedMember().add(metroService.countVoteUserByRange(param));
			} else {
				vo.getGraphDate().add(sdf.format(targetDay.getTime()));
				vo.getGraphTotalMember().add(null);
				vo.getGraphNewMember().add(null);
				vo.getGraphVotedMember().add(null);
			}
		}
		
		// 회원통계
		vo.setTotalMember(formatter.format(userService.countTotalUser()));
		vo.setNewMember(formatter.format(userService.countNewUser(monday.getTime())));
		vo.setVotedMember(formatter.format(metroService.countVotedUser(monday.getTime())));
		
		// 나이통계자료
		int thisYear = monday.get(Calendar.YEAR);
		for(int i=10; i<80; i=i+10) {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("startDate", monday.getTime());
			param.put("endDate", today.getTime());
			param.put("startYear", thisYear-10-i);
			param.put("endYear", thisYear-i);
			
			vo.getGraphAge().add(metroService.countVoteUserByAgeRange(param));
		}
		
		// 지역 통계
		HashMap<Integer, String> areaCode = new HashMap<Integer, String>();
		//ArrayList<Integer>  areaCode = new ArrayList<Integer>();
		areaCode.put(11, "서울특별시");	// 서울
		areaCode.put(26, "부산광역시");	// 부산
		areaCode.put(27, "대구광역시");	// 대구
		areaCode.put(28, "인천광역시");	// 인천
		areaCode.put(29, "광주광역시");	// 광주
		areaCode.put(30, "대전광역시");	// 대전
		areaCode.put(31, "울산광역시");	// 울산
		areaCode.put(41, "경기도");	// 경기 
		areaCode.put(42, "강원도");	// 강원
		areaCode.put(43, "충청북도");	// 충북
		areaCode.put(44, "충청남도");	// 충남
		areaCode.put(45, "전라북도");	// 전북
		areaCode.put(46, "전라남도");	// 전남
		areaCode.put(47, "경상북도");	// 경북
		areaCode.put(48, "경상남도");	// 경남
		areaCode.put(49, "제주특별자치도");	// 제주
		
		for(Integer areaKey : areaCode.keySet()) {
		//for(int i=0;i<areaCode.size(); i++) {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("startDate", monday.getTime());
			param.put("endDate", today.getTime());
			param.put("area", areaCode.get(areaKey));
			
			vo.getMapData().put(areaKey, metroService.countVoteUserByArea(param));
		}
		
		// 성별 통계
		HashMap<String, Object> genderParam = new HashMap<String, Object>();
		genderParam.put("startDate", monday.getTime());
		genderParam.put("endDate", today.getTime());
		genderParam.put("gender", "남성");
		
		vo.setMan(metroService.countVoteUserByGender(genderParam));
		
		genderParam.put("gender", "여성");
		
		vo.setWoman(metroService.countVoteUserByGender(genderParam));
		
		model.addAttribute("stat", vo);
		
		return "statistics";
	}
	
	@ResponseBody
	@RequestMapping(value="getAreaData")
	public List<HashMap<String, Object>> getAreaData(String areaId) {
		// 오늘 날짜 얻기
		Calendar today = Calendar.getInstance();
		
		// 월요일 정보 얻기
		Calendar monday = Calendar.getInstance();
		monday.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		monday.set(Calendar.HOUR_OF_DAY, 0);
		monday.set(Calendar.MINUTE, 0);
		monday.set(Calendar.SECOND, 0);
		
		// 지역 통계
		HashMap<Integer, String> areaCode = new HashMap<Integer, String>();
		areaCode.put(11, "서울특별시");	// 서울
		areaCode.put(26, "부산광역시");	// 부산
		areaCode.put(27, "대구광역시");	// 대구
		areaCode.put(28, "인천광역시");	// 인천
		areaCode.put(29, "광주광역시");	// 광주
		areaCode.put(30, "대전광역시");	// 대전
		areaCode.put(31, "울산광역시");	// 울산
		areaCode.put(41, "경기도");	// 경기 
		areaCode.put(42, "강원도");	// 강원
		areaCode.put(43, "충청북도");	// 충북
		areaCode.put(44, "충청남도");	// 충남
		areaCode.put(45, "전라북도");	// 전북
		areaCode.put(46, "전라남도");	// 전남
		areaCode.put(47, "경상북도");	// 경북
		areaCode.put(48, "경상남도");	// 경남
		areaCode.put(49, "제주특별자치도");	// 제주
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("startDate", monday.getTime());
		param.put("endDate", today.getTime());
		if(areaId != null) {
			param.put("area", areaCode.get(Integer.valueOf(areaId)));
		}
		
		List<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		for(HashMap<String, String> header : listHeaders) {
			HashMap<String, Object> resultItem = new HashMap<String, Object>();
			
			param.put("header", header.get("id"));
			
			Integer count = metroService.countVoteUserByMetroFromArea(param);
			
			resultItem.put("name", header.get("name"));
			resultItem.put("count", count);
			
			if(count > 0) {
				result.add(resultItem);
			}
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="setFirebaseToken")
	public void setFirebaseToken(HttpSession session, String token) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String strSessionid = session.getId();
		if(auth.getName().compareTo("anonymousUser") != 0) {
			// 로그인 되어 있음.
			Users user = (Users)auth.getPrincipal();
			user.setFirebasetoken(token);
			
			userService.updateUserToken(user);
		}
	}
}
