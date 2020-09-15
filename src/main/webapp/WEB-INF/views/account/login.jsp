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
					<form class="md-float-material form-material" id="loginForm" action="<c:url value="/account/loginProcess" />" method="post">
						<div class="text-center">
							<img src="<c:url value="/resources/images/basic-logo.png" />" alt="logo.png">
						</div>
						<div class="auth-box card">
							<div class="card-block">
								<div class="row m-b-20">
									<div class="col-md-12">
										<h3 class="text-center txt-primary">로그인</h3>
									</div>
								</div>
								<p class="text-muted text-center p-b-5">일반회원으로 로그인 합니다.</p>
								<div class="form-group form-primary">
									<input type="text" name="email" id="email" class="form-control" required="">
									<span class="form-bar"></span>
									<label class="float-label">이메일</label>
								</div>
								<div class="form-group form-primary">
									<input type="password" name="password" id="password" class="form-control" required="">
									<span class="form-bar"></span>
									<label class="float-label">패스워드</label>
								</div>
								<div class="row m-t-25 text-left">
									<div class="col-12">
										<div class="checkbox-fade fade-in-primary">
											<!-- <label>
												<input type="checkbox" value="">
												<span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
												<span class="text-inverse">로그인 유지</span>
											</label> -->
										</div>
										<div class="forgot-phone text-right float-right">
											<a href="#"  data-toggle="modal"
											   data-target="#find-password-modal" class="text-right f-w-600">패스워드 찾기</a>
										</div>
									</div>
								</div>
								<div class="row m-t-30">
									<div class="col-md-12">
										<button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">
											로그인
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
	<div class="modal fade" id="find-password-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">

					<img class="img-fluid" src="<c:url value="/resources/images/basic-logo.png"  />" alt="Logo">
					<%--					<h5 class="modal-title" id="exampleModalLabel">친구초대 링크 </h5>--%>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="form-group" id="now-password">
						<label for="now-password">이메일 주소</label>
						<input type="email" class="form-control"  aria-describedby="emailHelp" placeholder="비밀번호 찾기를 할 이메일을 입력해주세요." id="find-password-email">
						<small class="form-text" ></small>
					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="modal-password-find-btn">비밀번호 찾기</button>
					<%--					<button type="button" class="btn btn-primary">Save changes</button>--%>
				</div>
			</div>
		</div>
	</div>


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
<c:if test="${param.status eq 'fail' }">
	alert("이메일이나 패스워드를 확인해주십시오.");
</c:if>
	$("#email, #password").focusin(function() {
		$(this).addClass("fill");
	}).focusout(function() {
		if($(this).val() == "") {
			$(this).removeClass("fill");
		}
	});

	//feather.replace();
	$("#loginForm").submit(function() {
		if($("#email").val() == "") {
			alert("이메일을 입력해 주십시오.");
			return;
		}
		
		if($("#password").val() == "") {
			alert("암호를 입력해 주십시오.");
			return;
		}
		
		$("#loginForm").submit();
	});
});
</script>

<script>
	$("#modal-password-find-btn").click(function () {
		$.post("<c:url value="/account/find-password" />", {
			"email" : $("#find-password-email").val()
		}, function (ret) {
			console.log(ret);
			if (ret) {
				alert("이메일로 임시 비밀번호가 발송되었습니다.");
			} else {
				alert("존재하지 않는 계정 정보 입니다.");
			}
		}).fail(function () {
			alert("오류가 발생하였습니다.\n잠시 후 다시시도 해주세요.");
		})
	});
</script>
</body>

</html>
