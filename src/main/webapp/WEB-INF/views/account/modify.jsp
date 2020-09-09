<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<title>코리아 써베이 | Korea survey</title>

	<!--[if lt IE 10]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->

	<meta charset="utf-8">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

	<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/x-icon">

	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Quicksand:500,700" rel="stylesheet">

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css" />">

	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/pages.css" />">
</head>
<body themebg-pattern="theme1">
<div class="theme-loader">
	<div class="loader-track">
		<div class="preloader-wrapper">
			<div class="spinner-layer spinner-blue">
				<div class="circle-clipper left">
					<div class="circle"></div>
				</div>
				<div class="gap-patch">
					<div class="circle"></div>
				</div>
				<div class="circle-clipper right">
					<div class="circle"></div>
				</div>
			</div>
			<div class="spinner-layer spinner-red">
				<div class="circle-clipper left">
					<div class="circle"></div>
				</div>
				<div class="gap-patch">
					<div class="circle"></div>
				</div>
				<div class="circle-clipper right">
					<div class="circle"></div>
				</div>
			</div>
			<div class="spinner-layer spinner-yellow">
				<div class="circle-clipper left">
					<div class="circle"></div>
				</div>
				<div class="gap-patch">
					<div class="circle"></div>
				</div>
				<div class="circle-clipper right">
					<div class="circle"></div>
				</div>
			</div>
			<div class="spinner-layer spinner-green">
				<div class="circle-clipper left">
					<div class="circle"></div>
				</div>
				<div class="gap-patch">
					<div class="circle"></div>
				</div>
				<div class="circle-clipper right">
					<div class="circle"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<section class="login-block">

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<form id="join" class="md-float-material form-material" action="<c:url value="/account/modify" />" method="post">
					<div class="text-center">
						<img src="/koreasurvey/resources/images/basic-logo.png" alt="logo.png">
					</div>
					<div class="auth-box card">
						<div class="card-block">
							<div class="row m-b-20">
								<div class="col-md-12">
									<h3 class="text-center txt-primary">내 정보 변경</h3>
								</div>
							</div>
<%--							<p class="text-muted text-center p-b-5">일반 회원으로 가입합니다.</p>--%>
							<div class="form-group form-primary">
								<input id="email" name="email" class="form-control" type="text" value="${user.email}" disabled>
							</div>
							<div class="form-group form-primary">
								<button class="btn btn-primary" style="width : 100%">비밀번호 변경 </button>
<%--								<input id="pas" name="email" class="form-control" type="text" value="${user.email}" disabled>--%>
							</div>
							<div class="form-group form-primary">
								<select id="age" name="age" class="form-control fill">
									<option value="출생년을 선택해주세요.">출생년을 선택해주세요.</option>
									<c:forEach items="${ageList}" var="age">
										<c:if test="${age == user.age}">
											<option value="${age}" selected>${age}</option>
										</c:if>
										<c:if test="${age != user.age}">
											<option value="${age}">${age}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="form-group form-primary">
								<select id="gender" name="gender" class="form-control fill">
									<option value="성별을 선택해주세요.">성별을 선택해주세요.</option>
									<option value="여성" selected="${user.gender == '여성'}">여성</option>
									<option value="남성" selected="${user.gender == '남성'}">남성</option>
								</select>
							</div>
							<div class="form-group form-primary">
								<select id="area" name="area" class="form-control fill">
									<option value="지역을 선택해주세요.">지역을 선택해주세요.</option>
									<c:forEach items="${areaList}" var="item">
										<c:if test="${item == user.area}">
											<option value="${item}" selected="${item == user.area}">${item}</option>
										</c:if>
										<c:if test="${item != user.area}">
											<option value="${item}" >${item}</option>
										</c:if>
									</c:forEach>

								</select>
							</div>
							<div class="row m-t-30">
								<div class="col-md-12">
									<button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">변경하기</button>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-12">
									<!-- <p class="text-inverse text-left m-b-0">Thank you.</p> -->
									<p class="text-inverse text-left">
									</p>
								</div>
								<!-- <div class="col-md-2">
                                    <img src="../files/assets/images/auth/Logo-small-bottom.png" alt="small-logo.png">
                                </div> -->
							</div>
						</div>
					</div>
				</form>

			</div>

		</div>

	</div>

</section>

<!--[if lt IE 10]>
<div class="ie-warning">
	<h1>Warning!!</h1>
	<p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
	<div class="iew-container">
		<ul class="iew-download">
			<li>
				<a href="http://www.google.com/chrome/">
					<img src="../files/assets/images/browser/chrome.png" alt="Chrome">
					<div>Chrome</div>
				</a>
			</li>
			<li>
				<a href="https://www.mozilla.org/en-US/firefox/new/">
					<img src="../files/assets/images/browser/firefox.png" alt="Firefox">
					<div>Firefox</div>
				</a>
			</li>
			<li>
				<a href="http://www.opera.com">
					<img src="../files/assets/images/browser/opera.png" alt="Opera">
					<div>Opera</div>
				</a>
			</li>
			<li>
				<a href="https://www.apple.com/safari/">
					<img src="../files/assets/images/browser/safari.png" alt="Safari">
					<div>Safari</div>
				</a>
			</li>
			<li>
				<a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
					<img src="../files/assets/images/browser/ie.png" alt="">
					<div>IE (9 & above)</div>
				</a>
			</li>
		</ul>
	</div>
	<p>Sorry for the inconvenience!</p>
</div>
<![endif]-->


<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.slimscroll.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/waves.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

<script src="<c:url value="/resources/js/script.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#email, #password, #confirm-password").focusin(function() {
			$(this).addClass("fill");
		}).focusout(function() {
			if($(this).val() == "") {
				$(this).removeClass("fill");
			}
		});
		//feather.replace();

		$("#join").submit(function() {
			// alert();
			// return false;
			// if ()


			if($("#age").val() == "연령대를 선택해주세요.") {
				alert("연령대를 선택해주십시오.");
				return false;
			}

			if($("#gender").val() == "성별을 선택해주세요.") {
				alert("성별을 선택해주세요.");
				return false;
			}

			if($("#area").val() == "지역을 선택해주세요.") {
				alert("지역을 선택해주세요.");
				return false;
			}

			return true;
		});
	});
</script>
</body>

</html>
