<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<div class="pcoded-content">
    <div class="page-header card">
        <div class="row align-items-end mt-5">
            <div class="col-12">
                <div class="page-header-title">
                    <div class="d-inline">
						<h3>${answerCount}/<fmt:formatNumber type="number" pattern="0"
															 value="${survey.totalcost / survey.unitcost} "/> 명 참여</h3>

					</div>
                </div>
            </div>
        </div>
    </div>

    <div class="pcoded-inner-content" style="margin-bottom: 20px;">
        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
					<div>
						<c:if test="${survey.exclude}">
							<div class="card">
								<div class="card-header">
									<h3>대상을 제한한 설문입니다</h3>
								</div>
								<div class="card-body">
										<%--									<h5 class="card-title">Special title treatment</h5>--%>
									<table class="table">
										<tbody>
										<c:forEach items="${exclude}" var="item">
											<tr>
												<th style="width : 10%">
													<c:choose>
														<c:when test="${item.excludeType == 1}">연령대</c:when>
														<c:when test="${item.excludeType == 2}">성별</c:when>
														<c:when test="${item.excludeType == 3}">지역</c:when>
													</c:choose>
												</th>
												<th style="width : 90%">${item.excludeValue}</th>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</c:if>
					</div>

					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">설문</a>
							<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">결과</a>
							<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">참여자통계</a>
						</div>
					</nav>

					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
							<div class="row" id="surveyArea">
								<div class="col-xl-12">
									<div class="card">
										<div class="card-block">
											<div class="row">
												<div class="col-xl-12">
													<div>
																		<span class="mr-2">
																			${survey.category }
																		</span>
														<span class="badge badge-inverse-warning">
																			${survey.unitcost } P
																		</span>
													</div>
													<span class="f-w-700 f-26">
														${survey.title }
													</span>
													<div>
														<p class="text-muted m-t-15">${survey.detail }</p>
													</div>
												</div>
											</div>

											<c:forEach items="${questions}" var="q">
												<div class="card q-card">
													<div class="card-header">
														<h5>${q.title }</h5>
														<input type="hidden" class="q-id" value="${q.id }"/>
														<input type="hidden" class="q-type" value="${q.type }"/>
													</div>
													<div class="card-block">
														<h4 class="sub-title">${q.question }</h4>
														<c:if test="${q.type eq 0}">
															<div class="row form-radio">
																<c:forEach items="${q.options }" var="option">
																	<div class="radio radio-inline p-20">
																		<label>
																			<input type="radio" name="q-${q.id}" id="q-${q.id}"
																				   class="option" value="${option.option }">
																			<i class="helper"></i>${option.option }
																		</label>
																	</div>
																</c:forEach>
															</div>
														</c:if>
														<c:if test="${q.type eq 1}">
															<div class="row">
																<div class="col">
																	<textarea class="answer form-control"></textarea>
																</div>
															</div>
														</c:if>
													</div>
													<div class="card-footer">
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>

							</div>
						</div>
						<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">...</div>
						<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>
					</div>


					<div class="tab-content" id="info">
					</div>
                </div>
            </div>
        </div>
    </div>
</div>
