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
					<i class="feather icon-battery-charging bg-c-blue"></i>
					<div class="d-inline">
						<h5>포인트 결재</h5>
						<span>포인트를 결재하고 내가 원하는 설문을 시작하세요.</span>
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
											<h6>총 포인트</h6>
											<div class="f-w-700 f-40 text-success"><fmt:formatNumber value="${user.point }" maxFractionDigits="3" /> P
											<c:if test="${diff lt 0 }"><span class="text-c-blue m-l-10 f-14"><fmt:formatNumber value="${diff }" maxFractionDigits="3" /></span></c:if>
											<c:if test="${diff gt 0 }"><span class="text-c-red m-l-10 f-14">+<fmt:formatNumber value="${diff }" maxFractionDigits="3" /></span></c:if>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- <div class="col-xl-6">
							<div class="card">
								<div class="card-header">
									<h5>포인트 결재하기</h5>
								</div>
								<div class="card-block">
									<div class="row">
										<div class="col-xl-12">
											<p>현재 포인트 결재는 임시 테스트로 작동 중 입니다.</p>
											<p>원하시는 포인트를 입력하십시오.</p>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-12">
											<form method="post">
												<input name="amount" type="text" class="form-control" />
												<button class="btn btn-primary col-12 mt-3"><i class="fa fa-bolt"></i> 충전하기</button>
											</form>
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
