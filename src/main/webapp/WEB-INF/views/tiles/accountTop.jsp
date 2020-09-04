<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><div class="sidebar">
<body>

	<div class="loader-bg">
		<div class="loader-bar"></div>
	</div>

	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<nav class="navbar header-navbar pcoded-header">
				<div class="navbar-wrapper">
					<div class="navbar-logo">
						<a href="<c:url value="/" />">
							<img class="img-fluid" src="<c:url value="/resources/images/basic-logo.png" />" alt="Logo" />
						</a>
						<div class="mobile-options waves-effect waves-light mt-3">
						<c:if test="${empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }">
							<a href="<c:url value="/account/login" />">로그인</a>
						</c:if>
						<c:if test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }">
							<span class="text-primary pr-3"><fmt:formatNumber value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.point }" maxFractionDigits="3" /> P</span>
						</c:if>
							<!-- <i class="feather icon-more-horizontal"></i> -->
						</div>
					</div>
				</div>
			</nav>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
