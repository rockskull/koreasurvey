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
				<form:form commandName="join" cssClass="md-float-material form-material">
					<div class="text-center">
						<img src="<c:url value="/resources/images/basic-logo.png" />" alt="logo.png">
					</div>
					<div class="auth-box card">
						<div class="card-block">
							<div class="row m-b-20">
								<div class="col-md-12">
									<h3 class="text-center txt-primary">회원 가입</h3>
								</div>
							</div>
							<p class="text-muted text-center p-b-5">일반 회원으로 가입합니다.</p>
							<div class="form-group form-primary">
								<form:input path="email" cssClass="form-control" /> <span class="form-bar"></span> <label class="float-label">이메일을 입력하십시오.</label>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group form-primary">
										<form:password path="password" cssClass="form-control"/> <span class="form-bar"></span> <label class="float-label">암호</label>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group form-primary">
										<input type="password" id="confirm-password" class="form-control" required=""> <span class="form-bar"></span> <label class="float-label">암호 확인</label>
									</div>
								</div>
							</div>
							<div class="form-group form-primary">
								<form:select path="age" cssClass="form-control fill">
									<form:option value="출생년을 선택해주세요." />
									<c:forEach begin="1920" end="2019" varStatus="status">
										<c:set var="year" value="${status.index }"></c:set>
										<form:option value="${year }" label="${year }년" />
									</c:forEach>
								</form:select>
							</div>
							<div class="form-group form-primary">
								<form:select path="gender" cssClass="form-control fill">
									<form:option value="성별을 선택해주세요." />
									<form:option value="여성" />
									<form:option value="남성" />
								</form:select>
							</div>
							<div class="form-group form-primary">
								<form:select path="area" cssClass="form-control fill">
									<form:option value="지역을 선택해주세요." />
									<form:option value="서울특별시" />
									<form:option value="부산광역시" />
									<form:option value="대구광역시" />
									<form:option value="인천광역시" />
									<form:option value="광주광역시" />
									<form:option value="대전광역시" />
									<form:option value="울산광역시" />
									<form:option value="경기도" />
									<form:option value="강원도" />
									<form:option value="충청북도" />
									<form:option value="충청남도" />
									<form:option value="전라북도" />
									<form:option value="전라남도" />
									<form:option value="경상북도" />
									<form:option value="경상남도" />
									<form:option value="제주특별자치도" />
								</form:select>
							</div>
							<div class="form-group form-primary">
								<input id="recommanderemail" name="recommanderemail" class="form-control" type="text" value="<c:out value="${email}"/>" > <span class="form-bar"></span> <label class="float-label">추천인 이메일을 입력해 주십시오.</label>
							</div>
							<div class="form-group">

								<div class="accordion" id="accordionExample">
									<div class="card">
										<div class="card-header" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
											<div>
												<input type="checkbox" name="privacy-agree"> 개인정보 처리 약관
											</div>
										</div>

										<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
											<div class="card-body" style="max-height: 200px; overflow: scroll;">
												<%@ include file="privacy.jsp" %>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row m-t-30">
								<div class="col-md-12">
									<button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">회원 가입</button>
								</div>
							</div>
							<hr />
							<div class="row">
								<div class="col-md-12">
									<!-- <p class="text-inverse text-left m-b-0">Thank you.</p> -->
									<p class="text-inverse text-left">
										<a href="<c:url value="/" />"><b>메인페이지로</b></a>
									</p>
								</div>
								<!-- <div class="col-md-2">
                                    <img src="../files/assets/images/auth/Logo-small-bottom.png" alt="small-logo.png">
                                </div> -->
							</div>
						</div>
					</div>
				</form:form>

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
			if ($("input[name=privacy-agree]").is(":checked") == false) {
				alert("개인정보 약관에 동의하지 않으면 서비스를 사용 할 수 없습니다.");
				return false;
			}
			if($("#email").val() == "") {
				alert("이메일을 입력해 주십시오.");
				return false;
			}

			if($("#password").val() == "") {
				alert("암호를 입력해 주십시오.");
				return false;
			}

			if($("#password").val() != $("#confirm-password").val()) {
				alert("입력하신 암호가 일치하지 않습니다.");
				return false;
			}

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

		$("#recommanderemail").autocomplete({
			source: function(request, response) {
				// request.item
				$.ajax({
					url: "searchEmail",
					data: {
						term: request.term
					},
					success: function(data) {
						response(data);
					}
				});
			},
			minLength: 2
		});
	});
</script>
</body>

</html>
