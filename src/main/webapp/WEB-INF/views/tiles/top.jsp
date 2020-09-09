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
					<div class="navbar-container container-fluid">
						<ul class="nav-right">
							<li class="user-profile header-notification">
							<c:if test="${empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }">
								<div class="dropdown-primary dropdown">
									<div class="dropdown-toggle">
										<img src="<c:url value="/resources/images/unknown-users.png" />" class="img-radius" alt="User-Image">
										<a href="<c:url value="/account/login" />">로그인</a>
									</div>
								</div>
							</c:if>
							<c:if test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }">
								<div class="dropdown-primary dropdown">
									<div class="dropdown-toggle" data-toggle="dropdown">
										<span class="text-success mr-3">내 포인트 <span class="f-20 text-danger"><fmt:formatNumber value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.point }" maxFractionDigits="3" /> P</span></span>
										<img src="<c:url value="/resources/images/unknown-users.png" />" class="img-radius" alt="User-Image">
										<span>${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.email }</span> <i class="feather icon-chevron-down"></i>
									</div>
									<ul class="show-notification profile-notification dropdown-menu" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
										<!-- <li>
											<a href="#!">
												<i class="feather icon-settings"></i>
												Settings
											</a>
										</li>
										<li>
											<a href="#">
												<i class="feather icon-user"></i>
												Profile
											</a>
										</li>
										<li>
											<a href="email-inbox.html">
												<i class="feather icon-mail"></i>
												My Messages
											</a>
										</li>-->
										<li>
											<a href="<c:url value="/account" />">
												<i class="feather icon-settings"></i>
												내 정보 관리
											</a>
										</li>
										<li>
											<a href="<c:url value="/account/modify" />">
												<i class="feather icon-activity"></i>
												내 정보 수정
											</a>
										</li>
										<li>
											<a href="<c:url value="/account/logoutProcess" />">
												<i class="feather icon-log-out"></i>
												로그아웃
											</a>
										</li>
									</ul>
								</div>
							</c:if>
							</li>
						</ul>
					</div>
				</div>
			</nav>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
