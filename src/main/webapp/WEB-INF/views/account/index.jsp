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
						<h5>내 정보 관리</h5>
						<span>필요한 내 정보에 추가, 변경, 관리할 수 있습니다.</span>
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
						<div class="col-xl-6">
							<div class="card">
								<div class="card-header">
									<h5>내 포인트 현황</h5>
								</div>
								<div class="card-block">
									<div class="row">
										<div class="col">
											<!-- <h6>총 포인트</h6> -->
											<div class="f-w-700 f-24 text-center mb-3"><fmt:formatNumber value="${user.point }" maxFractionDigits="3" /> P
											<c:if test="${diff lt 0 }"><span class="text-c-blue m-l-10 f-14"><fmt:formatNumber value="${diff }" maxFractionDigits="3" /></span></c:if>
											<c:if test="${diff gt 0 }"><span class="text-c-red m-l-10 f-14">+<fmt:formatNumber value="${diff }" maxFractionDigits="3" /></span></c:if>
											</div>
										</div>
										<div class="col-sm-12">
											<button type="button" id="withdraw" class="btn btn-info col-sm mb-2"><i class="fa fa-won"></i> 출금</button>
											<button type="button" id="charge" class="btn btn-primary col-sm"><i class="fa fa-bolt"></i> 충전</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xl-6">
							<div class="card">
								<div class="card-header">
<%--									<h5>내 포인트 현황</h5>--%>
								</div>
								<div class="card-block">
									<div class="row">
										<div class="col-sm-12">
											<button type="button" class="btn btn-primary col-sm mb-2">친구추천</button>
											<p>초대한 친구가 설문에 참여할 때마다 적립금이 쌓입니다.</p>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h5>수입/지출 현황</h5>
								</div>
								<div class="card-block">
									<div class="table-responsive">
										<table class="table table-hover m-b-0">
											<thead>
											<tr>
												<th>날짜</th>
												<th>금액</th>
												<th>방법</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach items="${tradings}" var="tItem">
												<tr>
													<td><fmt:formatDate value="${tItem.created }" pattern="yyyy-MM-dd" /></td>
													<c:if test="${tItem.type lt 0 }">
														<c:if test="${tItem.amount lt 0 }">
															<td class="text-c-blue">${tItem.amount }</td>
															<td>설문 작성</td>
														</c:if>
														<c:if test="${tItem.amount gt 0 }">
															<td class="text-c-red">+${tItem.amount }</td>
															<td>설문 환급</td>
														</c:if>
													</c:if>
													<c:if test="${tItem.type eq 0 }">
														<td class="text-c-red">+${tItem.amount }</td>
														<td>현금 충전</td>
													</c:if>
													<c:if test="${tItem.type eq 1 }">
														<td class="text-c-red">+${tItem.amount }</td>
														<td>테스트 충전</td>
													</c:if>
													<c:if test="${tItem.type eq 2 }">
														<td class="text-c-red">+${tItem.amount }</td>
														<td>설문 배당</td>
													</c:if>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h5>최근 참여한 설문</h5>
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
													<th>설문 제목</th>
													<th>문항당 배당액</th>
													<th>총 배당액</th>
													<th>상태</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${joined }" var="joinItem">
												<tr>
													<td>${joinItem.title }</td>
													<td>${joinItem.unitcost } P</td>
													<td>${joinItem.unitcost } P</td>
													<td><span class="text-primary">진행 중</span></td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="card-footer">
									<div class="text-right">
										
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
	$("#withdraw").click(function() {
		alert("만원 단위로 출금 가능합니다.");
	});
	
	$("#charge").click(function() {
		alert("충전 가능 기간이 아닙니다.\n관리자에게 문의하십시오.");
	});
});
</c:set>