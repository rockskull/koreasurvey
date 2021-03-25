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
											<h5>${item.title }</h5>
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
													<div class="card-block">
														<div class="row p-t-10">
															<div class="col-xl-12">
																<div style="min-height: 200px;">
																	${item.content }
																</div>
															</div>
														</div>
														<div class="row p-t-10">
															<div class="col-xl-12">
																<button type="button" id="list" class="btn btn-primary col-sm mb-2"><i class="fa fa-edit"></i> 목록으로 돌아가기</button>
																<button type="button" id="edit" class="btn btn-success col-sm mb-2"><i class="fa fa-edit"></i> 수정하기</button>
																<button type="button" id="delete" class="btn btn-danger col-sm"><i class="fa fa-edit"></i> 삭제하기</button>
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
					</div>
<c:url var="listUrl" value="/m/board/" />
<c:url var="editUrl" value="/m/board/edit" />
<c:url var="deleteUrl" value="/m/board/delete" />
<c:set var="javascript" scope="request">
$(function() {
	$("#list").click(function() {
		location.href="${listUrl }?board=${item.boardName }";
	});
	
	$("#edit").click(function() {
		location.href="${editUrl}?board=${item.boardName }&id=${item.id }";
	});
	
	$("#delete").click(function() {
		if(confirm("정말로 게시물을 삭제하시겠습니까?")) {
			location.href="${deleteUrl}?board=${item.boardName }&id=${item.id }";
		}
	});
});
</c:set>
