<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
					<div class="pcoded-content">

						<div class="page-header card">
							<div class="row align-items-end mt-5">
								<div class="col-12">
									<div class="page-header-title">
										<div class="d-inline text-center">
											<h1>현재 가장 좋아하는 단체장은 누구인가요?</h1>
											<div class="text-muted">아래 목록의 순서는 랜덤순서로 나타납니다.</div>
											<div class="text-muted">아래의 이미지들은 각 지자체 홍보 사진에서 가져왔습니다.</div>
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
											<div class="col-sm-12">

												<div class="card">
													<!-- <div class="card-header">
														<h5></h5>
													</div> -->
													<div class="card-block">
													<c:forEach items="${headers }" var="member" varStatus="status">
														<c:if test="${status.index%4 eq 0 }">
														<div class="row">
														</c:if>
															<div class="col-lg-12 col-xl-3 mb-5">
																<div class="card-sub">
																	<img class="card-img-top img-fluid" src="<c:url value="/resources/images/card-img/${member.filename }.png" />" alt="Card image cap">
																	<div class="card-block row">
																		<div class="col-6">
																			<h5 class="card-title"><strong>${member.name }</strong></h5>
																			<p class="card-text">
																				${member.descript }
																			</p>
																		</div>
																		<div class="col-6 text-right">
																			<button class="btn btn-out-dashed waves-effect waves-light btn-primary btn-square selectBtn" data-id="${member.id }" data-name="${member.name }">
																				<i data-feather="heart" width="15" height="15"></i>
																				선택
																			</button>
																		</div>
																	</div>
																</div>
															</div>
														<c:if test="${status.index%4 eq 3 }">
														</div>
														</c:if>
													</c:forEach>
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
	$(".selectBtn").click(function() {
		<c:if test="${isSelection eq 0}">
		$.get("selection", {id: $(this).data("id")}, function() {
			location.reload(true);
		});
		</c:if>
		<c:if test="${isSelection gt 0}">
		alert("오늘은 이미 투표하셨습니다.");
		</c:if>
	});
});
</c:set>