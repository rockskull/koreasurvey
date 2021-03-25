<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false"%>
<div class="pcoded-content">
	<div class="page-header card">
		<!-- <div class="row align-items-end">
			<div class="col-lg-8">
				<div class="page-header-title">
					<i class="feather icon-user bg-c-blue"></i>
					<div class="d-inline">
						<h5>새로운 설문지 작성</h5>
						<span>새로운 설문지를 작성합니다.</span>
					</div>
				</div>
			</div>
		</div> -->
	</div>
	<div class="pcoded-inner-content">
		<div class="main-body">
			<div class="page-wrapper">
				<div class="page-body">

					<div class="row">
						<div class="col-xl-12">
							<div class="card">
								<div class="card-header">
									<h5>설문지 편집</h5>
								</div>
								<div class="card-block">
									<h4 class="sub-title">설문지의 기본 정보를 입력합니다.</h4>
									<div id="doc">
										<input type="hidden" name="id" id="id" value="${survey.id }" />
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">설문 제목</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="title" value="${survey.title }" />
											</div>
										</div>
										<!-- <div class="form-group row">
											<label class="col-sm-2 col-form-label">설문 분류</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="category" />
											</div>
										</div> -->
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">설문 소개</label>
											<div class="col-sm-10">
												<textarea name="detail" cols="5" class="form-control" placeholder="설명을 입력하십시오.">${survey.detail }</textarea>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">문항당 배당액</label>
											<div class="col-sm-2">
												<div class="input-group input-group-button mb-0">
													<div class="input-group-prepend"><button id="costMinus" class="btn btn-primary" type="button"><i class="fa fa-minus"></i></button></div>
													<input type="text" class="form-control" id="unitcost" name="unitcost" readonly="readonly" value="${survey.unitcost }" />
													<div class="input-group-append"><button id="costPlus" class="btn btn-primary" type="button"><i class="fa fa-plus"></i></button></div>
												</div>
												<p class="mb-0">최소 변경단위는 10p입니다.</p>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">설문 참여 인원</label>
											<div class="col-sm-2">
												<input type="text" class="form-control" id="people" value="<fmt:parseNumber value="${survey.totalcost/(survey.qcount*survey.unitcost) }" />" />
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">설문 총배당액</label>
											<div class="col-sm-2">
												<input type="text" class="form-control" id="totalcost" name="totalcost" readonly="readonly" value="${survey.totalcost}" />	
											</div>
											<div class="col">
												<div class="form-control-static mt-2 f-14 text-right text-success">
													현재 사용 가능 포인트 : <fmt:formatNumber value="${user.point }" maxFractionDigits="3" /> P</fmt>
													<a href="<c:url value="/m/account/charge" />" class="btn btn-primary btn-mini"><i class="fa fa-bolt mr-0"></i></a>
												</div>
											</div>
										</div>
										<!-- <div class="form-group row">
											<label class="col-sm-2 col-form-label">설문 종료 시간</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="to" />
											</div>
										</div> -->
									</div>
									<h4 class="sub-title">설문지의 문항들을 추가하여 입력합니다.</h4>
									<div id="listQuestion">
										<c:forEach items="${listQuestions }" var="question">
										<div class="item">
											<input type="hidden" class="q-id" value="${question.id }" />
											<div class="m-0 question-edit">
												<div class="card">
													<div class="card-block">
														<div class="row">
															<div class="col-sm-4">
																<input type="text" class="form-control form-txt-primary question-title" placeholder="문항 제목을 작성하세요." value="${question.title }" />
															</div>
															<div class="col-sm-4">
																<div class="row">
																	<div class="col">
																		<label class="col-form-label">문항의 유형 :</label>
																	</div>
																	<div class="col">
																		<select class="form-control question-type">
																			<option value="0">객관식</option>
																			<option value="1"<c:if test="${question.type eq 1}"> selected</c:if>>주관식</option>
																		</select>
																	</div>
																</div>
															</div>
														</div>
														<p class="text-muted">문항의 제목과 유형을 선택한 후 내용을 작성하시면 됩니다.</p>
														<div class="row">
															<div class="col-12">
																<textarea rows="5" class="form-control question-content" placeholder="설문 문항을 작성해 주십시오.">${question.question }</textarea>
															</div>
														</div>
														<div class="row mt-4 question-options<c:if test="${question.type eq 1}"> d-none</c:if>">
															<c:forEach items="${question.options }" var="option">
															<div class="col-12">
																<input type="hidden" class="option-id" value="${option.id }" />
																<div class="row form-group">
																	<label class="col-sm-2 col-form-label">선택 항목</label>
																	<div class="col-sm-10 input-group input-group-button">
																		<input type="text" class="form-control form-control-primary option-value" placeholder="선택 문항을 입력하십시오." value="${option.option }" />
																		<div class="input-group-append">
																			<button class="btn btn-primary option-del" type="button"><i class="fa fa-times"></i></button>
																		</div>
																	</div>
																</div>
															</div>
															</c:forEach>
														</div>
														<div class="col-12 text-right add-options-link<c:if test="${question.type eq 1}"> d-none</c:if>">
															<a href="#" class="b-b-primary text-primary add-options">선택 항목 추가</a>
														</div>
													</div>
													<div class="card-footer text-center">
														<!-- <button type="button" class="btn btn-round question-save"><i class="fa fa-archive"></i> 문항 임시 저장</button>
														<button type="button" class="btn btn-round question-cancel"><i class="fa fa-times"></i> 취소</button> -->
														<button type="button" class="btn btn-round question-delete"><i class="fa fa-times"></i> 선택 문항 삭제</button>
													</div>
												</div>
											</div>
											<div class="m-0 question-view d-none">
												<div class="card">
													<div class="card-header">
														<h5 class="view-title">${question.title }</h5>
														<div class="card-header-right">
															<ul class="list-unstyled card-mini-option">
																<li class="first-opt"><i class="feather icon-chevron-left open-card-option"></i></li>
																<li><i class="feather icon-edit edit-card"></i></li>
																<li><i class="feather icon-trash del-card"></i></li>
																<li><i class="feather icon-chevron-left open-card-option"></i></li>
															</ul>
														</div>
													</div>
													<div class="card-block">
													<h4 class="sub-title view-type"><c:if test="${question.type eq 0 }">객관식</c:if><c:if test="${question.type eq 1 }">주관식</c:if> </h4>
													<p class="view-content">${question.question }</p>
													</div>
												</div>
											</div>
										</div>
										</c:forEach>
									</div>
									<div class="text-center">
										<button type="button" class="btn btn-round" id="addQuestion"><i class="fa fa-plus"></i> 새로운 문항 추가</button>
									</div>
								</div>
								<div class="card-footer">
									<div class="text-right">
										<button type="button" id="save" class="btn btn-primary col-sm-12 mb-2">저장하고 닫기</button>
										<button type="button" id="cancel" class="btn col-sm-12 mb-2">취소</button>
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

function updateTotalCost(countItem) {
	var totalcost = Number($("#unitcost").val())*countItem*$("#people").val();
	
	if(totalcost > ${user.point }) {
		if(confirm("보유한 포인트보다 필요한 포인트의 량이 많습니다. 충전하시겠습니까?")) {
			location.href="<c:url value="/m/account/" />";
		}
	} else {
		$("#totalcost").val(totalcost);
	}
}

$(function() {
	$("#people, #unitcost").keyup(function() {
		updateTotalCost($("#listQuestion > .item").length);
	});
	
	$("#costPlus").click(function() {
		$("#unitcost").val(Number($("#unitcost").val())+10);
		updateTotalCost($("#listQuestion > .item").length);
		if($("#unitcost").val() != 0) {
			$("#costMinus").attr("disabled", false);
		}
	});
	
	$("#costMinus").click(function() {
		$("#unitcost").val(Number($("#unitcost").val())-10);
		updateTotalCost($("#listQuestion > .item").length);
		if($("#unitcost").val() == 0) {
			$("#costMinus").attr("disabled", "disabled");
		}
	});
	
	$("#save").click(function() {
		var surveyObj = {
			id : $("input[name=id]").val(),
			title : $("input[name=title]").val(),
			detail : $("textarea[name=detail]").val(),
			unitcost : $("#unitcost").val(),
			totalcost : $("#totalcost").val(),
			listQuestions : []
		};
		
		var orderId = 1;
		
		$("#listQuestion > .item").each(function(i) {
			if($(this).find(".question-edit").find(".question-title").val().length !== 0) {
				var currentItem = $(this);
				var questionItem = {
					id : currentItem.find(".q-id").val(),
					orderid : orderId++,
					title : $(this).find(".question-edit").find(".question-title").val(),
					question : $(this).find(".question-edit").find(".question-content").val(),
					type : $(this).find(".question-edit").find(".question-type").val(),
					listOption : []
				};
				
				if(currentItem.find(".question-edit").find(".question-type").val() == "0") {
					var optionOrderId = 1;
					
					currentItem.find(".question-edit").find(".question-options").children().each(function(i) {
						questionItem.listOption.push({
							id : $(this).find(".option-id").val(),
							orderid : optionOrderId++,
							option : $(this).find(".option-value").val(),
							type : 0
						});
					});
				}
				
				surveyObj.listQuestions.push(questionItem);
			}
		});
		
		var strObject = JSON.stringify(surveyObj);
		$.post("updateSurveyDoc", {strObject : strObject}, function(id) {
			alert("변경되었습니다.");
			location.href="<c:url value="/m/account/surveys/edit" />?surveyId=${survey.id }";
		});
	});
	
	$("#close").click(function() {
		$("#save").trigger("click");
	});
	
	$("#cancel").click(function() {
		location.href="<c:url value="/m/account/surveys" />";
	});
	
	$("#addQuestion").click(function() {
		$.get("<c:url value="/resources/import.txt" />", function(result) {
			$("#listQuestion").append(result);
			
			$(".question-type").change(function() {
				if($(this).val() === "0") {
					$(this).parent().parent().parent().parent().parent().find(".add-options-link").removeClass("d-none");
					$(this).parent().parent().parent().parent().parent().find(".question-options").removeClass("d-none");
				} else {
					$(this).parent().parent().parent().parent().parent().find(".add-options-link").addClass("d-none");
					$(this).parent().parent().parent().parent().parent().find(".question-options").addClass("d-none");
				}
			});
			
			$(".add-options").click(function() {
				html = "<div class=\"col-12\">";
				html += "<input type=\"hidden\" class=\"option-id\" />"
				html += "<div class=\"row form-group\">";
				html += "<label class=\"col-sm-2 col-form-label\">선택 항목</label>";
				html += "<div class=\"col-sm-10 input-group input-group-button\">";
				html += "<input type=\"text\" class=\"form-control form-control-primary option-value\" placeholder=\"선택 문항을 입력하십시오.\">";
				html += "<div class=\"input-group-append\">";
				html += "<button class=\"btn btn-primary option-del\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
				html += "</div>";
				html += "</div>";
				html += "</div>";
				html += "</div>";
				
				$(this).parent().parent().find(".question-options").append(html);
				
				$(".option-del").click(function() {
					$(this).parent().parent().parent().parent().remove();
				});
				
				return false;
			});
			
			$(".question-save").click(function() {
				updateTotalCost($("#listQuestion > .item").length);
				
				var editBox = $(this).parent().parent().parent().parent().find(".question-edit");
				var viewBox = $(this).parent().parent().parent().parent().find(".question-view");
				
				if(editBox.find(".question-title").val() === "") {
					alert("문항 제목이 비었습니다. 입력해주세요.");
					return;
				}
				
				viewBox.find(".view-title").html(editBox.find(".question-title").val());
				if(editBox.find(".question-type").val() === "0") {
					viewBox.find(".view-type").html("객관식");
					
					if(editBox.find(".question-options").children().length < 2) {
						alert("객관식의 선택항목은 2이상이어야 합니다.");
						return;
					}
					
					for(var i=0; i < editBox.find(".question-options").children().length; i++) {
						if(editBox.find(".question-options").children().eq(i).find("input").val() === "") {
							alert("선택항목 중 비어있는 항목이 있습니다. 입력해주세요.");
							return;
						}
					}
				} else {
					viewBox.find(".view-type").html("주관식");
				}
				
				/*editBox.find(".question-content").val(tinyMCE.activeEditor.getContent());
				viewBox.find(".view-content").html(tinyMCE.activeEditor.getContent());*/
				viewBox.find(".view-content").html(editBox.find(".question-content").val());
				
				editBox.addClass("d-none");
				viewBox.removeClass("d-none");
				$("#addQuestion").removeClass("d-none");
				$(".card-header-right .card-mini-option").removeClass("d-none");
			});
			
			$(".card-header-right .card-mini-option .open-card-option").unbind();
			
			$(".card-header-right .card-mini-option .open-card-option").on('click',function() {
				var $this = $(this);
				if ($this.hasClass('icon-x')) {
					$this.parents('.card-mini-option').animate({
						'width' : '30px',
					});
					$this.parents('.card-mini-option')
							.children('li').children(
									".open-card-option")
							.removeClass("icon-x").fadeIn(
									'slow');
					$this.parents('.card-mini-option')
							.children('li').children(
									".open-card-option")
							.addClass("icon-chevron-left")
							.fadeIn('slow');
					$this.parents('.card-mini-option').children(
							".first-opt").fadeIn();
				} else {
					$this.parents('.card-mini-option').animate({
						'width' : '78px',
					});
					$this.parents('.card-mini-option')
							.children('li').children(
									".open-card-option")
							.addClass("icon-x").fadeIn('slow');
					$this.parents('.card-mini-option')
							.children('li').children(
									".open-card-option")
							.removeClass("icon-chevron-left")
							.fadeIn('slow');
					$this.parents('.card-mini-option').children(
							".first-opt").fadeOut();
				}
			});
			
			$(".question-delete").click(function() {
				if(confirm("해당 문항을 삭제하시겠습니까?")) {
					updateTotalCost($("#listQuestion > .item").length-1);
					$(this).parent().parent().parent().parent().remove();
				}
			});
			
			$(".edit-card").click(function() {
				$(this).parent().parent().parent().parent().parent().parent().parent().find(".question-edit").removeClass("d-none");
				$(this).parent().parent().parent().parent().parent().parent().parent().find(".question-view").addClass("d-none");
				$("#addQuestion").addClass("d-none");
				$(".card-header-right .card-mini-option").addClass("d-none");
				
				$(".question-cancel").unbind();
				$(".question-cancel").click(function() {
					$(this).parent().parent().parent().parent().find(".question-edit").addClass("d-none");
					$(this).parent().parent().parent().parent().find(".question-view").removeClass("d-none");
					
					$("#addQuestion").removeClass("d-none");
					$(".card-header-right .card-mini-option").removeClass("d-none");
				});
			});
			
			$(".question-cancel").click(function() {
				$(this).parent().parent().parent().parent().remove();
			});
			
			alert("총 문항수가 "+$("#listQuestion > .item").length+"개로 설문에 사용할 총금액이 변경되었습니다.");
			updateTotalCost($("#listQuestion > .item").length);
		
		});
		
		$("#emptyInfo").addClass("d-none");
		//$("#addQuestion").addClass("d-none");
		$(".card-header-right .card-mini-option").addClass("d-none");
		
		// 추가된 item에 포커싱
		//$("#listQuestion .item:last-child").find(".question-title").focus();
	});
	
	$(".question-type").change(function() {
		if($(this).val() === "0") {
			$(this).parent().parent().parent().parent().parent().find(".add-options-link").removeClass("d-none");
			$(this).parent().parent().parent().parent().parent().find(".question-options").removeClass("d-none");
		} else {
			$(this).parent().parent().parent().parent().parent().find(".add-options-link").addClass("d-none");
			$(this).parent().parent().parent().parent().parent().find(".question-options").addClass("d-none");
		}
	});
	
	$(".add-options").click(function() {
		html = "<div class=\"col-12\">";
		html += "<input type=\"hidden\" class=\"option-id\" />"
		html += "<div class=\"row form-group\">";
		html += "<label class=\"col-sm-2 col-form-label\">선택 항목</label>";
		html += "<div class=\"col-sm-10 input-group input-group-button\">";
		html += "<input type=\"text\" class=\"form-control form-control-primary option-value\" placeholder=\"선택 문항을 입력하십시오.\">";
		html += "<div class=\"input-group-append\">";
		html += "<button class=\"btn btn-primary option-del\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		$(this).parent().parent().find(".question-options").append(html);
		
		$(".option-del").click(function() {
			$(this).parent().parent().parent().parent().remove();
		});
		
		return false;
	});
	
	$(".question-save").click(function() {
		updateTotalCost($("#listQuestion > .item").length);
		
		var editBox = $(this).parent().parent().parent().parent().find(".question-edit");
		var viewBox = $(this).parent().parent().parent().parent().find(".question-view");
		
		if(editBox.find(".question-title").val() === "") {
			alert("문항 제목이 비었습니다. 입력해주세요.");
			return;
		}
		
		viewBox.find(".view-title").html(editBox.find(".question-title").val());
		if(editBox.find(".question-type").val() === "0") {
			viewBox.find(".view-type").html("객관식");
			
			if(editBox.find(".question-options").children().length < 2) {
				alert("객관식의 선택항목은 2이상이어야 합니다.");
				return;
			}
			
			for(var i=0; i < editBox.find(".question-options").children().length; i++) {
				if(editBox.find(".question-options").children().eq(i).find("input").val() === "") {
					alert("선택항목 중 비어있는 항목이 있습니다. 입력해주세요.");
					return;
				}
			}
		} else {
			viewBox.find(".view-type").html("주관식");
		}
		
		/*editBox.find(".question-content").val(tinyMCE.activeEditor.getContent());
		viewBox.find(".view-content").html(tinyMCE.activeEditor.getContent());*/
		viewBox.find(".view-content").html(editBox.find(".question-content").val());
		
		editBox.addClass("d-none");
		viewBox.removeClass("d-none");
		$("#addQuestion").removeClass("d-none");
		$(".card-header-right .card-mini-option").removeClass("d-none");
	});
	
	$(".card-header-right .card-mini-option .open-card-option").unbind();
	
	$(".card-header-right .card-mini-option .open-card-option").on('click',function() {
		var $this = $(this);
		if ($this.hasClass('icon-x')) {
			$this.parents('.card-mini-option').animate({
				'width' : '30px',
			});
			$this.parents('.card-mini-option')
					.children('li').children(
							".open-card-option")
					.removeClass("icon-x").fadeIn(
							'slow');
			$this.parents('.card-mini-option')
					.children('li').children(
							".open-card-option")
					.addClass("icon-chevron-left")
					.fadeIn('slow');
			$this.parents('.card-mini-option').children(
					".first-opt").fadeIn();
		} else {
			$this.parents('.card-mini-option').animate({
				'width' : '78px',
			});
			$this.parents('.card-mini-option')
					.children('li').children(
							".open-card-option")
					.addClass("icon-x").fadeIn('slow');
			$this.parents('.card-mini-option')
					.children('li').children(
							".open-card-option")
					.removeClass("icon-chevron-left")
					.fadeIn('slow');
			$this.parents('.card-mini-option').children(
					".first-opt").fadeOut();
		}
	});
	
	$(".question-delete").click(function() {
		if(confirm("해당 문항을 삭제하시겠습니까?")) {
			updateTotalCost($("#listQuestion > .item").length - 1);
			$(this).parent().parent().parent().parent().remove();
		}
	});
	
	$(".edit-card").click(function() {
		$(this).parent().parent().parent().parent().parent().parent().parent().find(".question-edit").removeClass("d-none");
		$(this).parent().parent().parent().parent().parent().parent().parent().find(".question-view").addClass("d-none");
		$("#addQuestion").addClass("d-none");
		$(".card-header-right .card-mini-option").addClass("d-none");
		
		$(".question-cancel").unbind();
		$(".question-cancel").click(function() {
			$(this).parent().parent().parent().parent().find(".question-edit").addClass("d-none");
			$(this).parent().parent().parent().parent().find(".question-view").removeClass("d-none");
			
			$("#addQuestion").removeClass("d-none");
			$(".card-header-right .card-mini-option").removeClass("d-none");
		});
	});
	
	$(".question-cancel").click(function() {
		$(this).parent().parent().parent().parent().remove();
	});
});
</c:set>
