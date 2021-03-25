<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
									<h5>내 설문 현황</h5>
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
													<th>선택</th>
													<!-- <th>순번</th> -->
													<th>설문 제목</th>
													<th>문항 수</th>
													<th>총 배당액</th>
													<th>문항당 배당액</th>
													<th>응답수</th>
													<th>남은 배당액</th>
													<th>종료 시간</th>
													<th>상태</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${list}" var="item" varStatus="status">
												<tr>
													<td><input class="check-item" type="checkbox" data-item-id="${item.id }" /></td>
													<%-- <td>${status.index}</td> --%>
													<td>${item.title }</td>
													<td>${item.qcount } 개</td>
													<td>${item.totalcost } P</td>
													<td>${item.unitcost } P</td>
													<td>${item.answerUserCount } 명</td>
													<td>${item.totalcost-item.qcount*item.unitcost*item.answerUserCount } P</td>
													<td>${item.to }</td>
													<td><span class="text-primary">진행중</span></td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="card-footer row">
									<div class="text-left col-sm-12">
										<a href="<c:url value="/m/account/surveys/new" />" class="btn btn-success col-sm-12 mb-2"><i class="fa fa-magic"></i> 새로운 설문 등록</a>
										<button id="delete" class="btn btn-danger col-sm-12 mb-2"><i class="fa fa-trash-o"></i> 선택 설문 삭제</button>
									</div>
									<div class="text-right col-sm-12">
										<button id="edit" class="btn btn-primary col-sm-12"><i class="fa fa-wrench"></i> 선택 설문 편집</button>
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
		
		location.href="<c:url value="/m/account/surveys/edit" />?surveyId="+$(".check-item").filter(":checked").data("item-id");
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
			
			$.post("<c:url value="/m/account/surveys/deleteSurveys" />", {listSurveyId : JSON.stringify(listDelete)}, function(result) {
				alert("선택한 설문을 삭제하였습니다.");
				
				location.reload();
			});
		}
	});
});
</c:set>