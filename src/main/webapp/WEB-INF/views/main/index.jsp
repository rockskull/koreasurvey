<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false"%>
					<div class="pcoded-content">
						<div class="page-header card">
						<%-- <div class="row align-items-end">
								<div class="col-lg-8">
									<div class="page-header-title">
										<i class="feather icon-layers bg-c-blue"></i>
										<div class="d-inline">
											<h5>현재 진행 중 인 설문들</h5>
											<span>현재 진행되고 있는 설문 목록을 확인할 수 있습니다.</span>
										</div>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="page-header-breadcrumb">
										<ul class=" breadcrumb breadcrumb-title">
											<li class="breadcrumb-item">
												<a href="<c:url value="/" />"><i class="feather icon-home"></i></a>
											</li>
										</ul>
									</div>
								</div>
							</div> --%>
						</div>
						
						<div class="pcoded-inner-content">
							<div class="main-body">
								<div class="page-wrapper">
									<div class="page-body">

										<div class="row" id="surveyArea" style="margin-bottom: 30px;">

										 <div class="col-xl-12">
												<div class="card">
													<div class="card-block cursor-pointer">
														<div class="row">
															<div class="col-xl-12">
																<c:if test="${empty user }">
																	<h1>참여 가능한 조사</h1>
																	<p>조사에 참여하고 적립금을 쌓으세요.</p>
																</c:if>
																<c:if test="${not empty user }">
																	<div class="row">
																		<div class="col-xl-9" style="margin-bottom: 10px">
																			<h3>내 포인트 현황</h3>
																			<p>조사에 참여하거나 초대한 친구가 설문에 참여할 때마다 적립금이 쌓이고, 10,000원 이상 쌓이면 출금하실 수 있습니다.</p>
																			<div>
																				<h4><c:out value="${user.point}"></c:out>P</h4>
																			</div>
																			<a href="<c:url value="/account" />" style="display: inline-block;width: 50%">
																				<button class="btn btn-info" style="width : 100%">출금</button>
																			</a>

																			<a href="<c:url value="/account" />" style="display: inline;">
																				<button class="btn btn-primary" style="width : 48%">친구 초대하기</button>
																			</a>

																		</div>

																		<div class="col-xl-3">


																			<div id="notice-section">
																				<h3>공지사항 <a href="<c:url value="/notice" />">더보기</a></h3>
																				<table class="table notice_main">
																					<tbody>
																					<c:forEach items="${notices}" var="noticeItem">
																						<tr>
																							<td><c:out value="${noticeItem.title}"></c:out></td>
																							<td>
																								<fmt:formatDate var="resultRegDt" value="${noticeItem.created}" pattern="yyyy-MM-dd"/>
																								<c:out value="${resultRegDt}"></c:out></td>
																						</tr>
																					</c:forEach>
																					</tbody>
																				</table>
																			</div>

																			<div style="text-align: center">
																				<h3>도움이 필요하신가요?</h3>
																				<h4>1544-0000</h4>
																				<p>
																					평일 오전 10시 ~ 오후 6시<br>
																					(점심시간 13~14시)
																				</p>

																			</div>
																		</div>
																	</div>

																</c:if>
															</div>
														</div>
													</div>
												</div>
											</div>
											
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
<c:set var="javascript" scope="request">
var startPage = 0;
var loadingAjax = false;
function makeDom(list) {
	var addhtml = "";
	list.forEach(function(item) {

		addhtml += "<div class=\"col-xl-12\">";
		addhtml += "<div class=\"card\">";
		console.log(item);
		if (item.isJoined) {
			addhtml += "<div class=\"card-block cursor-pointer\" >";
		} else {
			addhtml += "<div class=\"survey card-block cursor-pointer\" data-survey-id=\""+item.id+"\" data-survey-join=\""+item.isJoined+"\">";

		}
		addhtml += "<div class=\"row\">";
		addhtml += "<div class=\"col-xl-12\">";
		addhtml += "<div>";
		if(item.category != null) {
		//addhtml += "<span class=\"mr-2\">"+item.category+"</span>";
		}
		addhtml += "<span class=\"badge badge-inverse-warning\">"+item.unitcost+" P</span>";
		if (item.isJoined) {
		addhtml += "<span class=\"badge badge-inverse-success\">참여완료</span>";
		}

		addhtml += "</div>";
		addhtml += "<span class=\"f-w-700 f-26\">";
		addhtml += item.title;
		addhtml += "<span class=\"text-c-green m-l-10 f-16\">"+((item.answerUserCount/(item.totalcost/(item.unitcost)))*100).toFixed(2)+"% 진행</span>";
		if(item.to != null) {
		//addhtml += "<span class=\"text-c-red m-l-10 f-16\">"+item.to.substring(0,10)+"까지 진행</span>";
		}
		addhtml += "</span>";
		addhtml += "</div>";
		addhtml += "</div>";
		addhtml += "</div>";
		addhtml += "</div>";
		addhtml += "</div>";
	});

	return addhtml;
}

$(function() {

	$(document).on("click", ".survey", function() {
		<c:if test="${empty user }">alert("로그인이 필요한 서비스 입니다.");</c:if>
		<c:if test="${not empty user }">
			if($(this).data("survey-id") === 0) {
				location.href = "mainTop";
			} else {
				if($(this).data("survey-join")) {
					alert("이미 참여한 설문입니다.");
				} else {
					location.href = "surveys/?surveyId="+$(this).data("survey-id");
				}
			}
		</c:if>
	});
	$.post("getSurveyList", {start: startPage}, function(list) {

		$("#surveyArea").append(makeDom(list));
		startPage = 10;
	});
	
	$(window).on("scroll", function() {
		var scrollHeight = $(document).height();
		var scrollPosition = $(window).height() + $(window).scrollTop();
		if ((scrollHeight - scrollPosition) / scrollHeight === 0 && !loadingAjax) {
			loadingAjax = true;
	    	
	    	$.post("getSurveyList", {start: startPage}, function(list) {
				$("#surveyArea").append(makeDom(list));
				startPage += 10;
				
				loadingAjax = false;
			});
		}
	});
});
</c:set>
