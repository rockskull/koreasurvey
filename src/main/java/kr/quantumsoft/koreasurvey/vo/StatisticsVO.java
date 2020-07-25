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
package kr.quantumsoft.koreasurvey.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**  
 * @Class Name : StatisticsVO.java
 * @Project Name : koreasurvey
 * @Description : 
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 1. 23.                     최초생성
 * 
 * @author QuantumSoft Inc.
 * @since 2015. 8.
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by QuantumSoft Inc. All right reserved.
 */
public class StatisticsVO {
	private List<String> graphDate = new ArrayList<String>();
	private List<Integer> graphTotalMember = new ArrayList<Integer>();
	private List<Integer> graphNewMember = new ArrayList<Integer>();
	private List<Integer> graphVotedMember = new ArrayList<Integer>();
	private String totalMember;
	private String newMember;
	private String votedMember;
	private List<Integer> graphAge = new ArrayList<Integer>();
	private HashMap<Integer, Integer> mapData = new HashMap<Integer, Integer>();
	private Integer man;
	private Integer woman;
	public List<String> getGraphDate() {
		return graphDate;
	}
	public void setGraphDate(List<String> graphDate) {
		this.graphDate = graphDate;
	}
	public List<Integer> getGraphTotalMember() {
		return graphTotalMember;
	}
	public void setGraphTotalMember(List<Integer> graphTotalMember) {
		this.graphTotalMember = graphTotalMember;
	}
	public List<Integer> getGraphNewMember() {
		return graphNewMember;
	}
	public void setGraphNewMember(List<Integer> graphNewMember) {
		this.graphNewMember = graphNewMember;
	}
	public List<Integer> getGraphVotedMember() {
		return graphVotedMember;
	}
	public void setGraphVotedMember(List<Integer> graphVotedMember) {
		this.graphVotedMember = graphVotedMember;
	}
	public String getTotalMember() {
		return totalMember;
	}
	public void setTotalMember(String totalMember) {
		this.totalMember = totalMember;
	}
	public String getNewMember() {
		return newMember;
	}
	public void setNewMember(String newMember) {
		this.newMember = newMember;
	}
	public String getVotedMember() {
		return votedMember;
	}
	public void setVotedMember(String votedMember) {
		this.votedMember = votedMember;
	}
	public List<Integer> getGraphAge() {
		return graphAge;
	}
	public void setGraphAge(List<Integer> graphAge) {
		this.graphAge = graphAge;
	}
	public HashMap<Integer, Integer> getMapData() {
		return mapData;
	}
	public void setMapData(HashMap<Integer, Integer> mapData) {
		this.mapData = mapData;
	}
	public Integer getMan() {
		return man;
	}
	public void setMan(Integer man) {
		this.man = man;
	}
	public Integer getWoman() {
		return woman;
	}
	public void setWoman(Integer woman) {
		this.woman = woman;
	}
}
