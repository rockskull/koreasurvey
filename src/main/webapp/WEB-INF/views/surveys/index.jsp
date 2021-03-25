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
									
										<div class="row" id="surveyArea">
											<div class="col-xl-12">
												<div class="card">
													<div class="card-block">
														<div class="row">
															<div class="col-xl-12">
																<div>
																	<span class="mr-2">
																		${surveyInfo.category }
																	</span>
																	<span class="badge badge-inverse-warning">
																		${surveyInfo.unitcost } P
																	</span>
																</div>
																<span class="f-w-700 f-26">
																	${surveyInfo.title }
																</span>
																<div>
																	<p class="text-muted m-t-15">${surveyInfo.detail }</p>
																</div>
															</div>
														</div>
														
														<c:forEach items="${listQuestions}" var="q">
														<div class="card q-card">
															<div class="card-header">
																<h5>${q.title }</h5>
																<input type="hidden" class="q-id" value="${q.id }" />
																<input type="hidden" class="q-type" value="${q.type }" />
															</div>
															<div class="card-block">
																<h4 class="sub-title">${q.question }</h4>
																<c:if test="${q.type eq 0}">
																<div class="row form-radio d-block">
																	<c:forEach items="${q.options }" var="option">
																	<div class="radio radio-inline m-l-20 m-t-10 p-r-20 b-b-gray<c:if test="${not empty option.selected }"> radio-disable</c:if>">
																		<label>
																			<input type="radio" name="q-${q.id}" id="q-${q.id}" class="option" value="${option.option }"<c:if test="${option.selected }"> checked</c:if><c:if test="${not empty option.selected }"> disabled</c:if>>
																			<i class="helper"></i>${option.option }
																			<c:if test="${not empty option.selected }"><div>
																				<div class="progress progress-xs" style="width:${(option.voteCount/q.totalVoteCount)*50 }%;float: left;margin-top: 10px;margin-right: 7px;">
																					<div class="progress-bar progress-bar-emrald" style="width:100%"></div>
																				</div>
																				<div class="text-pink" style="margin-left: 5px;font-size: 14px;"><fmt:formatNumber minIntegerDigits="1" value="${(option.voteCount/q.totalVoteCount)*100 }" pattern=".0" />% (${option.voteCount } 표)</div>
																			</div></c:if>
																		</label>
																	</div>
																	</c:forEach>
																</div>
																</c:if>
																<c:if test="${q.type eq 1}">
																<div class="row">
																	<div class="col">
																		<textarea class="answer form-control"<c:if test="${not empty q.answerValue }"> readonly</c:if>>${q.answerValue }</textarea>
																	</div>
																</div>
																</c:if>
															</div>
															<div class="card-footer">
															</div>
														</div>
														</c:forEach>
													</div>
													
													<div class="card-footer text-center">
														<button type="button" id="complete" class="btn btn-primary<c:if test="${not empty listQuestions[0].options[0].selected }"> d-none</c:if>">설문 완료</button>
														<button type="button" id="cancle" class="btn">돌아가기</button>
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
$(function() {
	$("#cancle").click(function() {
		location.href="/koreasurvey";
	});
	
	$("#complete").click(function() {
		var questionBlock = $(".q-card");
		var listAnswer = new Array();
		
		for(var i=0; i < questionBlock.length; i++) {
			if($(questionBlock.get(i)).find(".q-type").val() === "0") {
				if(typeof $(questionBlock.get(i)).find("input[name='q-"+$(questionBlock.get(i)).find(".q-id").val()+"']:checked").val() === "undefined")
				{
					alert("선택 설문항 중 선택되지 않은 문항이 있습니다. 모두 작성해 주세요.");
					return false;
				}
			}
		}
		
		for(var i=0; i < questionBlock.length; i++) {
			var answerText;
			
			if($(questionBlock.get(i)).find(".q-type").val() === "0") {
				answerText = $(questionBlock.get(i)).find("input[name='q-"+$(questionBlock.get(i)).find(".q-id").val()+"']:checked").val();
			} else {
				answerText = $(questionBlock.get(i)).find(".answer").val();
			}
			
			var answerObj = {
				surveyid: ${surveyInfo.id },
				questionid: $(questionBlock.get(i)).find(".q-id").val(),
				questioncontent: $(questionBlock.get(i)).find(".sub-title").html(),
				questiontype: $(questionBlock.get(i)).find(".q-type").val(),
				answer: answerText,
				rewardpoint: ${surveyInfo.unitcost }
			}
			
			listAnswer.push(answerObj);
		}
		
		$.post("submitAnswer", {reqJson : JSON.stringify(listAnswer)}, function(result) {
			//alert("설문 조사를 완료하였습니다.");
			
			location.reload();
			//location.href="<c:url value="/" />";
		});
	});
});
</c:set>
