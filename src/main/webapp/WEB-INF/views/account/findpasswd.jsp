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
					<form class="md-float-material form-material" id="findForm" action="<c:url value="/account/findPassword" />" method="post">
						<div class="text-center">
							<img src="<c:url value="/resources/images/basic-logo.png" />" alt="logo.png">
						</div>
						<div class="auth-box card">
							<div class="card-block">
								<div class="row m-b-20">
									<div class="col-md-12">
										<h3 class="text-center txt-primary">패스워드 찾기</h3>
									</div>
								</div>
								<p class="text-muted text-center p-b-5">가입당시 이메일을 입력하십시오.</p>
								<div class="form-group form-primary">
									<input type="text" name="email" id="email" class="form-control" required="">
									<span class="form-bar"></span>
									<label class="float-label">이메일</label>
								</div>
								<div class="row m-t-30">
									<div class="col-md-12">
										<button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">
											패스워드 찾기
										</button>
									</div>
								</div>
									<p class="text-inverse text-left">계정이 없으신가요? 지금 <a href="<c:url value="/account/join" />" class="text-primary"><strong>가입 </strong></a>하세요!</p>
							</div>
						</div>
					</form>
						<%-- <div class="text-center">
							<img src="<c:url value="/resources/images/basic-logo.png" />" alt="logo.png">
						</div> --%>
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
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

<script src="<c:url value="/resources/js/script.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#email").focusin(function() {
		$(this).addClass("fill");
	}).focusout(function() {
		if($(this).val() == "") {
			$(this).removeClass("fill");
		}
	});

	$("#findForm").submit(function() {
		if($("#email").val() == "") {
			alert("이메일을 입력해 주십시오.");
			return;
		}
		
		$("#findForm").submit();
	});
});
</script>
</body>

</html>
