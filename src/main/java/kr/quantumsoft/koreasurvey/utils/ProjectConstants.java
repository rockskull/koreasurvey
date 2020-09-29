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
package kr.quantumsoft.koreasurvey.utils;

import org.apache.commons.lang.math.IntRange;

import java.util.Arrays;
import java.util.List;

/**
 * @author QuantumSoft Inc.
 * @version 1.0
 * @Class Name : ProjectConstants.java
 * @Project Name : koreasurvey
 * @Description :
 * @Modification Information
 * @
 * @ 수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 5. 28.                     최초생성
 * @see Copyright (C) by QuantumSoft Inc. All right reserved.
 * @since 2015. 8.
 */
public class ProjectConstants {
    public static final Double MY_POINT_RATE = 6.0;
    public static final Double PARENT_POINT_RATE = 2.0;

    public static final Integer SURVEY_STATE_CLOSE = 0;    // 설문 종료 상태
    public static final Integer SURVEY_STATE_RUNNING = 1; // 설문 진행 중
    public static final Integer SURVEY_STATE_SUSPEND = 2; // 설문 중지
    public static final Integer SURVEY_STATE_BLOCK = 3; // 설문 차단

    public static final Integer TRADING_USE = -1;
    public static final Integer TRADING_CASH = 0;
    public static final Integer TRADING_CARD = 1;
    public static final Integer TRADING_SUBMIT = 2;
    public static final Integer TRADING_RECOMMANDE = 3;

    public static final Integer ANSWER_TYPE_MULTI_CHOICE = 0;
    public static final Integer ANSWER_SHORT_ANSWER = 0;


    public static final List<String> REGION_STRINGS = Arrays.asList("서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시", "대전광역시", "울산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주특별자치도");
    public static final int[] AGE_RANGES = new IntRange(1920, 2020).toArray();
    public static final Integer SURVEY_EXCLUDE_TYPE_AGE = 1;
    public static final Integer SURVEY_EXCLUDE_TYPE_REGION = 2;
    public static final Integer SURVEY_EXCLUDE_TYPE_GENDER = 3;

    public static final String ADMIN_FLAG = "ADMIN";
}
