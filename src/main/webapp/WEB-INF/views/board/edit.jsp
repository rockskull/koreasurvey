<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false"%>
					<div class="pcoded-content">
						<div class="page-header card">
							<div class="row align-items-end m-t-30">
								<div class="col-lg-8">
									<div class="page-header-title">
										<!-- <i class="feather icon-layers bg-c-blue"></i> -->
										<div class="d-inline">
											<h5>새로운 게시물 작성</h5>
											<span></span>
										</div>
									</div>
								</div>
								<%-- <div class="col-lg-4">
									<div class="page-header-breadcrumb">
										<ul class=" breadcrumb breadcrumb-title">
											<li class="breadcrumb-item">
												<a href="<c:url value="/" />"><i class="feather icon-home"></i></a>
											</li>
										</ul>
									</div>
								</div> --%>
							</div>
						</div>
						
						<div class="pcoded-inner-content">
							<div class="main-body">
								<div class="page-wrapper">
									<div class="page-body">
									
										<div class="row">
											<div class="col-xl-12">
												<div class="card">
													<form:form commandName="editItem">
													<form:hidden path="boardName" />
													<div class="card-block">
														<div class="row">
															<div class="col-xl-12">
																<p>
																	게시물 제목
																</p>
																<div>
																	<form:input path="title" cssClass="form-control" />
																</div>
															</div>
														</div>
														<div class="row p-t-10">
															<div class="col-xl-12">
																<p>
																	게시물 내용
																</p>
																<div>
																	<form:textarea path="content" cssClass="form-control" rows="7" />
																</div>
															</div>
														</div>
														<div class="row p-t-10">
															<div class="col-xl-12">
																<button type="submit" class="btn btn-primary col-sm"><i class="fa fa-edit"></i> 수정 완료</button>
															</div>
														</div>
													</div>
													</form:form>
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
	$("#editItem").submit(function() {
		if($("#title").val() == "") {
			alert("제목을 입력해 주십시오.");
			return false;
		}
		
		if($("#content").val() == "") {
			alert("내용을 입력해 주십시오.");
			return false;
		}
		
		return true;
	});
});
</c:set>
