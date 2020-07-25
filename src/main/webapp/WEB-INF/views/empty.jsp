<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<div class="pcoded-content">
	<div class="page-header card mt-4">
		<div class="row align-items-end">
			<div class="col-lg-8">
				<div class="page-header-title">
					<i class="feather icon-user bg-c-blue"></i>
					<div class="d-inline">
						<h5>내 정보 관리</h5>
						<span>필요한 내 정보에 추가, 변경, 관리할 수 있습니다.</span>
					</div>
				</div>
			</div>
		</div>
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
										<div class="col-xl-12">
											<h6>총 포인트</h6>
											<h5 class="f-w-700">1,234<span class="text-c-green m-l-10">+30</span></h5>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-xl-6">
							<div class="card">
								<div class="card-header">
									<h5>최근 포인트 현황</h5>
								</div>
								<div class="card-block">
									<div class="row">
										<div class="col-xl-12">
											<h6>총 포인트</h6>
											<h5 class="f-w-700">1,234<span class="text-c-green m-l-10">+30</span></h5>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-12">
							<div class="card table-card">
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
													<th>순번</th>
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
												<tr>
													<td>1</td>
													<td>테스트 설문</td>
													<td>5 개</td>
													<td>1,000,000 원</td>
													<td>100원</td>
													<td>100건</td>
													<td>990,000원</td>
													<td>무제한</td>
													<td><span class="text-primary">진행 중</span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="card-footer">
									<div class="text-right">
										<a href="<c:url value="/account/surveys" />" class=" b-b-primary text-primary">내 설문 자세히 보기...</a>
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
