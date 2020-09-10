<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page session="false"%>
<div class="pcoded-content">
	<div class="page-header card">
		<!-- <div class="row align-items-end">
			<div class="col-lg-8">
				<div class="page-header-title">
					<i class="feather icon-user bg-c-blue"></i>
					<div class="d-inline">
						<h5>내 설문 관리</h5>
						<span>설문 정보에 추가, 변경, 관리할 수 있습니다.</span>
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
						
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h3>내 설문 현황</h3>
									<div class="card-header-right">
										<ul class="list-unstyled card-option">
											<li class="first-opt"><i class="feather icon-chevron-left open-card-option"></i></li>
											<li><i class="feather icon-maximize full-card"></i></li>
							 				<li><i class="feather icon-minus minimize-card"></i></li>
											<li><i class="feather icon-refresh-cw reload-card"></i></li>
											<li><i class="feather icon-trash close-card"></i></li>
											<li><i class="feather icon-chevron-left open-card-option"></i></li>
										</ul>
									</div>
								</div>
								<div class="card-block p-b-0">
									<div class="table-responsive">
										<table class="table table-hover m-b-0">
											<thead>
												<tr>
<%--													<th>선택</th>--%>
													<!-- <th>순번</th> -->
													<th>설문 번호</th>
													<th>설문 제목</th>
													<th>문항 수</th>
													<th>총 배당액</th>
													<th>인당 배당액</th>
													<th>응답수</th>
													<th>남은 배당액</th>
													<th>그만 두기</th>
													<th>상태</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${list}" var="item" varStatus="status">
												<tr class="survey" data-survey-id="${item.id}">
<%--													<td><input class="check-item" type="checkbox" data-item-id="${item.id }" /></td>--%>
													 <td>${item.id}</td>
													<td>${item.title }</td>
													<td>${item.qcount } 개</td>
													<td>${item.totalcost } P</td>
													<td>${item.unitcost } P</td>
													<td>${item.answerUserCount } / <fmt:formatNumber type="number"  pattern="0" value="${item.totalcost / item.unitcost} " />명</td>
													<td>${item.totalcost-item.qcount*item.unitcost*item.answerUserCount } P</td>
													<td>
														<c:choose>
															<c:when test = "${item.status == 1}">
																<button class="btn btn-danger btn-sm exit-btn"
																		data-point="${item.totalcost-item.qcount*item.unitcost*item.answerUserCount }"
																		data-item-id="${item.id}">그만두기</button></td>
															</c:when>
															<c:otherwise>
																<button class="btn btn-danger btn-sm"  disabled>그만두기</button></td>
															</c:otherwise>
														</c:choose>

													<td><span class="text-primary">

														<c:choose>
															<c:when test = "${item.status == 0}">
																종료
															</c:when>
															<c:when test = "${item.status == 1}">
																진행
															</c:when>
															<c:when test = "${item.status == 2}">
																중지
															</c:when>
															<c:when test = "${item.status == 3}">
																차단
															</c:when>

															<c:otherwise>
																알수없음
															</c:otherwise>
														</c:choose>
													</span></td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="card-footer row">
									<div class="text-left col-sm-12">
										<a href="<c:url value="/account/surveys/new" />" class="btn btn-success col-sm-12 mb-2"><i class="fa fa-magic"></i> 새로운 설문 등록</a>
<%--										<button id="delete" class="btn btn-danger col-sm-12 mb-2"><i class="fa fa-trash-o"></i> 선택 설문 삭제</button>--%>
									</div>
									<div class="text-left col-sm-12">
										<p>등록된 설문은 수정하실 수 없습니다. 문의사항이 있으시면 0000-0000로 연락주세요.</p>
									</div>
<%--									<div class="text-right col-sm-12">--%>
<%--										<button id="edit" class="btn btn-primary col-sm-12"><i class="fa fa-wrench"></i> 선택 설문 편집</button>--%>
<%--									</div>--%>
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
	$("#edit").click(function() {
		if($(".check-item").filter(":checked").length == 0) {
			alert("편집할 설문을 선택해 주십시오.");
			return;
		}
		
		if($(".check-item").filter(":checked").length > 1) {
			alert("한번에 하나의 설문만을 편집할 수 있습니다.");
			return;
		}
		
		location.href="<c:url value="/account/surveys/edit" />?surveyId="+$(".check-item").filter(":checked").data("item-id");
	});
	
	$("#delete").click(function() {
		if($(".check-item").filter(":checked").length == 0) {
			alert("삭제할 설문을 선택해 주십시오.");
			return;
		}
		
		if(confirm("선택한 설문을 모두 삭제하시겠습니까?")) {
			var listDelete = [];
			
			$(".check-item").filter(":checked").each(function(i) {
				listDelete.push($(this).data("item-id"));
			});
			
			$.post("<c:url value="/account/surveys/deleteSurveys" />", {listSurveyId : JSON.stringify(listDelete)}, function(result) {
				alert("선택한 설문을 삭제하였습니다.");
				location.reload();
			});
		}
	});
});
</c:set>

<c:set var="js" scope="request">
	<script>
		$(".exit-btn").click(function () {
		    var itemId = $(this).data("item-id");
		    var point = $(this).data("point");
			if (confirm("설문을 그만두고 " + point + "P를 돌려받으시겠습니까?")) {
			    $.post("surveys/exit-survey", {"survey-id" : itemId}, function (resp) {
					alert("처리가 완료되었습니다");
					location.reload();
				}).fail(function() {
					alert("오류가 발생하였습니다");
				})
			}
		});
		$(".survey").click(function () {
			location.href = "<c:url value="/account/surveys/result"/>/" + $(this).data("survey-id");
		})
	</script>
</c:set>