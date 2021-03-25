<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false"%>
					<div class="pcoded-content">
						<div class="page-header card" style="margin-bottom:0;">
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
						
						<div class="pcoded-inner-content" style="padding-top:20px;">
							<div class="main-body">
								<div class="page-wrapper">
									<div class="page-body">
									
										<div class="row">
										<div class="col-md-6 col-lg-4">
											<div class="card card-block user-card" style="padding: 0 15px;">
												<ul class="basic-list">
												<c:forEach items="${list }" var="item">
													<li>
														<h6><a href="<c:url value="/m/board/view" />?board=${boardName}&id=${item.id}">> ${item.title }</a></h6>
													</li>
												</c:forEach>
												</ul>
											</div>
										</div>
										<div class="col-md-6 col-lg-4">
											<div class="card card-block">
												<ul class="pagination justify-content-center" style="margin: 10px auto 0 auto;">
													<li class="page-item">
														<a class="page-link" href="<c:url value="/m/board/?board=${boardName}&page=${page.prevPageNo}" />" tabindex="-1">Previous</a>
													</li>
													<c:forEach var="i" begin="${page.startPageNo}" end="${page.endPageNo}" step="1">
														<c:choose>
															<c:when test="${i eq page.pageNo}">
													<li class="page-item"><a class="page-link" href="#">${i}</a></li>
															</c:when>
															<c:otherwise>
													<li class="page-item"><a class="page-link" href="<c:url value="/m/board/?board=${boardName}&page=${i}" />">${i}</a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<li class="page-item">
														<a class="page-link" href="<c:url value="/m/board/?board=${boardName}&page=${page.nextPageNo}" />">Next</a>
													</li>
												</ul>
											</div>
										</div>
										<div class="col-md-6 col-lg-4">
											<a class="btn btn-primary col-sm" href="<c:url value="/m/board/new" />?board=${boardName }"><i class="fa fa-edit"></i> 새 글 작성</a>
										</div>
										<div style="height: 90px"></div>
											<!-- <div class="col-xl-12">
												<div class="card">
													<div class="card-block cursor-pointer" data-survey-id="0">
														<div class="row">
															<div class="col-xl-12">
																<div>
																	<span class="mr-2">
																		사회/정치 분야
																	</span>
																	<span class="badge badge-inverse-warning">
																		- P
																	</span>
																</div>
																<span class="f-w-700 f-26">
																	현재 가장 좋아하는 단체장은 누구인가요?
																<span class="text-c-green m-l-10 f-16">1.69% 진행</span><span class="text-c-red m-l-10 f-16">2020-07-15까지 진행</span></span>
															</div>
														</div>
													</div>
												</div>
											</div> -->	
											
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
<c:set var="javascript" scope="request">
var startPage = 0;
var loadingAjax = false;

$(function() {
	$.post("getSurveyList", {start: startPage}, function(list) {
		var addhtml = "";
		list.forEach(function(item) {
			addhtml += "<div class=\"col-xl-12\">";
			addhtml += "<div class=\"card\">";
			addhtml += "<div class=\"card-block cursor-pointer\" data-survey-id=\""+item.id+"\" data-survey-join=\""+item.isJoined+"\">";
			addhtml += "<div class=\"row\">";
			addhtml += "<div class=\"col-xl-12\">";
			addhtml += "<div>";
			if(item.category != null) {
				//addhtml += "<span class=\"mr-2\">"+item.category+"</span>";
			}
			addhtml += "<span class=\"badge badge-inverse-warning\">"+item.unitcost*item.qcount+" P</span>";
			addhtml += "</div>";
			addhtml += "<span class=\"f-w-700 f-26\">";
			addhtml += item.title;
			addhtml += "<span class=\"text-c-green m-l-10 f-16\">"+((item.answerUserCount/(item.totalcost/(item.unitcost*item.qcount)))*100).toFixed(2)+"% 진행</span>";
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
		
		$("#surveyArea").append(addhtml);
		
		$(".cursor-pointer").click(function() {
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
		
		startPage = 10;
	});
	
	$(window).on("scroll", function() {
		var scrollHeight = $(document).height();
		var scrollPosition = $(window).height() + $(window).scrollTop();
		if ((scrollHeight - scrollPosition) / scrollHeight === 0 && !loadingAjax) {
			loadingAjax = true;
	    	
	    	$.post("getSurveyList", {start: startPage}, function(list) {
				var addhtml = "";
				list.forEach(function(item) {
					addhtml += "<div class=\"col-xl-12\">";
					addhtml += "<div class=\"card proj-progress-card\">";
					addhtml += "<div class=\"card-block cursor-pointer\" data-survey-id=\""+item.id+"\">";
					addhtml += "<div class=\"row\">";
					addhtml += "<div class=\"col-xl-12\">";
					addhtml += "<div>";
					addhtml += "<span class=\"mr-2\">"+item.category+"</span>";
					addhtml += "<span class=\"badge badge-inverse-warning\">"+item.unitcost+" P</span>";
					addhtml += "</div>";
					addhtml += "<span class=\"f-w-700 f-26\">";
					addhtml += item.title;
					addhtml += "<span class=\"text-c-green m-l-10 f-16\">"+((item.answerUserCount/(item.totalcost/(item.unitcost*item.qcount)))*100).toFixed(2)+"% 진행</span>";
					addhtml += "<span class=\"text-c-red m-l-10 f-16\">"+item.to.substring(0,10)+"까지 진행</span>";
					addhtml += "</span>";
					addhtml += "</div>";
					addhtml += "</div>";
					addhtml += "</div>";
					addhtml += "</div>";
					addhtml += "</div>";
				});
				
				$("#surveyArea").append(addhtml);
				
				$(".cursor-pointer").unbind();
				
				$(".cursor-pointer").click(function() {
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
				
				startPage += 10;
				
				loadingAjax = false;
			});
		}
	});
});
</c:set>
