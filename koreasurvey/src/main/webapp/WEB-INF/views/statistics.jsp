<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>코리아 써베이 | Korea survey</title>

<!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />

<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />"	type="image/x-icon">

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Quicksand:500,700" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/waves.min.css" />">

<link id="bsdp-css" href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/pages.css" />">
</head>
<body>

	<div class="loader-bg">
		<div class="loader-bar"></div>
	</div>

	<div class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<nav class="navbar header-navbar pcoded-header">
				<div class="navbar-wrapper">
					<div class="navbar-logo">
						<a href="<c:url value="/" />">
							<img class="img-fluid" src="<c:url value="/resources/images/basic-logo.png" />" alt="Logo" />
						</a>
					</div>
					<div class="navbar-container container-fluid">
						<ul class="nav-right">
							<li class="user-profile header-notification">
							<c:if test="${empty user }">
								<div class="dropdown-primary dropdown">
									<div class="dropdown-toggle">
										<img src="<c:url value="/resources/images/unknown-users.png" />" class="img-radius" alt="User-Image">
										<a href="<c:url value="/account/login" />">로그인</a>
									</div>
								</div>
							</c:if>
							<c:if test="${not empty user }">
								<div class="dropdown-primary dropdown">
									<div class="dropdown-toggle" data-toggle="dropdown">
										<img src="<c:url value="/resources/images/unknown-users.png" />" class="img-radius" alt="User-Image">
										<span>${user.email }</span> <i data-feather="chevron-down" width="12" height="12"></i>
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
											<a href="<c:url value="/statistics" />">
												<i data-feather="pie-chart" width="17" height="17"></i>
												Statistics
											</a>
										</li>
										<li>
											<a href="<c:url value="/account/logoutProcess" />">
												<i data-feather="log-out" width="17" height="17"></i>
												Logout
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

					<div class="pcoded-content">

						<div class="page-header card">
							<div class="row align-items-end">
								<div class="col-12">
									<div class="page-header-title">
										<i id="titleIcon" data-feather="pie-chart" class="bg-c-blue" width="40" height="40"></i>
										<div class="d-inline">
											<h5>통계정보</h5>
											<div class="text-muted">현재 선택사항의 통계정보를 확인할 수 있습니다.</div>
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
											<!-- <div class="col-lg-12">
												<div class="card">
													<div class="card-header">
														<h5>조회 날짜</h5>
														<small class="text-muted">조회 날짜를 선택해주세요. 현재 주 단위로 선택할 수 있습니다.</small>
													</div>
													<div class="card-block">
														<p>조회 날짜를 선택하면 해당 주의 통계를 확인할 수 있습니다.</p>
														<input class="form-control" type="text" id="dateSelect" />
													</div>
												</div>
											</div> -->
											<div class="col-md-12 col-xl-6">
												<div class="card sale-card">
													<div class="card-header">
														<h5>회원 통계</h5>
														<small class="text-muted">회원수와 관련된 통계자료를 제공합니다.</small>
													</div>
													<div class="card-block">
														<div id="member-analytics" class="chart-shadow" style="height:300px"></div>
													</div>
												</div>
											</div>
											<div class="col-md-12 col-xl-6">
												<div class="row">
													<div class="col-4">
														<div class="card comp-card">
															<div class="card-body">
																<div class="row align-items-center">
																	<div class="col">
																		<h6 class="m-b-15">총 등록사용자</h6>
																		<h3 class="f-w-700 text-c-blue">${stat.totalMember }</h3>
																	</div> 
																	<div class="col-auto">
																		<i data-feather="users" class="bg-c-blue" width="40" height="40"></i>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="col-4">
														<div class="card comp-card">
															<div class="card-body">
																<div class="row align-items-center">
																	<div class="col">
																		<h6 class="m-b-15">새 가입자 수</h6>
																		<h3 class="f-w-700 text-c-green">${stat.newMember}</h3>
																	</div>
																	<div class="col-auto">
																		<i data-feather="user-plus" class="bg-c-green" width="40" height="40"></i>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="col-4">
														<div class="card comp-card">
															<div class="card-body">
																<div class="row align-items-center">
																	<div class="col">
																		<h6 class="m-b-15">투표 회원수</h6>
																		<h3 class="f-w-700 text-c-yellow">${stat.votedMember }</h3>
																	</div>
																	<div class="col-auto">
																		<i data-feather="check-square" class="bg-c-yellow" width="40" height="40"></i>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="card">
													<div class="card-header">
														<h5>나이별 통계</h5>
														<small class="text-muted">나이별 통계자료를 제공합니다.</small>
													</div>
													<div class="card-body">
														<div class="row">
															<div class="col-12">
																<div id="age" class="chart-shadow" style="height:160px"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-12 col-xl-8">
												<div class="card">
													<div class="card-header">
														<h5>지역별 통계</h5>
														<small class="text-muted">지역별 통계자료를 제공합니다.</small>
													</div>
													<div class="card-body">
														<div class="row">
															<div class="col-sm-6">
																<div id="allocation-map" class="chart-shadow" style="height:250px"></div>
															</div>
															<div class="col-sm-6">
																<div id="allocation-chart" class="chart-shadow" style="height:250px"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-12 col-xl-4">
												<div class="card">
													<div class="card-header">
														<h5>성별 통계</h5>
														<small class="text-muted">성별 통계자료를 제공합니다.</small>
													</div>
													<div class="card-body">
														<div class="row">
															<div class="col-12">
																<div id="gender" class="chart-shadow" style="height:250px"></div>
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
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.slimscroll.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/waves.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap-datepicker.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/amchart/amcharts.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/amchart/ammap.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/amchart/southKoreaLow.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/amchart/serial.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/amchart/pie.min.js" />"></script>

	<%-- <script src="<c:url value="/resources/js/pcoded.min.js" />"></script> --%>
	<script src="<c:url value="/resources/js/script.js" />"></script>
	<script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
	<script type="text/javascript">
	$(function() {
		feather.replace();
		$("#titleIcon").attr("viewBox", "-12 -12 48 48");
		
		//$("#dateSelect").datepicker({language : "ko", format: "yyyy년 mm월 dd일"});
		
		var chart = AmCharts.makeChart("member-analytics", {
			"type": "serial",
			"theme": "light",
			"dataDateFormat": "YYYY-MM-DD",
			"precision": 0,
			"valueAxes": [{ 
				"id": "v1",
				"position": "left",
				"autoGridCount": false/*,
				"labelFunction": function (value) {
					return "$" + Math.round(value) + "M";
					}*/
			},
			{
				"id": "v2",
				"gridAlpha": 0,
				"autoGridCount": false
			}],
			"graphs": [
				{
					"id": "g1",
					"valueAxis": "v2",
					"bullet": "round",
					"bulletBorderAlpha": 1,
					"bulletColor": "#FFFFFF",
					"bulletSize": 8,
					"hideBulletsCount": 50,
					"lineThickness": 3,
					"lineColor": "#4099ff",
					"title": "등록 사용자",
					"useLineColorForBulletBorder": true,
					"valueField": "tuser",
					"balloonText": "[[title]]<br /><b style='font-size: 130%'>[[value]]명</b>"
				},
				{
					"id": "g2",
					"valueAxis": "v2",
					"bullet": "round",
					"bulletBorderAlpha": 1,
					"bulletColor": "#FFFFFF",
					"bulletSize": 8,
					"hideBulletsCount": 50,
					"lineThickness": 3,
					"lineColor": "#2ed8b6",
					"title": "신규사용자",
					"useLineColorForBulletBorder": true,
					"valueField": "nuser",
					"balloonText": "[[title]]<br /><b style='font-size: 130%'>[[value]]명</b>"
				},
				{
					"id": "g3",
					"valueAxis": "v2",
					"bullet": "round",
					"bulletBorderAlpha": 1,
					"bulletColor": "#FFFFFF",
					"bulletSize": 8,
					"hideBulletsCount": 50,
					"lineThickness": 3,
					"lineColor": "#ffb64d",
					"title": "선택한 사용자",
					"useLineColorForBulletBorder": true,
					"valueField": "suser",
					"balloonText": "[[title]]<br /><b style='font-size: 130%'>[[value]]명</b>"
				}
			],
			"chartCursor": {
				"pan": true,
				"valueLineEnabled": true,
				"valueLineBalloonEnabled": true,
				"cursorAlpha": 0,
				"valueLineAlpha": 0.2
			},
			"categoryField": "date",
			"categoryAxis": {
				"parseDates": true,
				"dashLength": 1,
				"minorGridEnabled": true
			},
			"legend": {
				"useGraphSettings": true,
				"position": "top"
			},
			"balloon": {
				"borderThickness": 1,
				"shadowAlpha": 0
			},
			"dataProvider": [
	<c:forEach items="${stat.graphTotalMember }" var="total" varStatus="status">
				{
					"date": "${stat.graphDate[status.index] }"<c:if test="${not empty total }">,
					"tuser": ${total },
					"nuser": ${stat.graphNewMember[status.index] },
					"suser": ${stat.graphVotedMember[status.index] }</c:if>
				},
	</c:forEach>
			]
		});
		
		AmCharts.makeChart("age",{
			"type":"serial",
			"theme":"light",
			"dataDateFormat":"YYYY-MM-DD",
			"precision":0,
			"valueAxes":[{
				"id":"v1",
				"fontSize":0,
				"axisAlpha":0,
				"lineAlpha":0,
				"gridAlpha":0,
				"position":"left",
				"autoGridCount":false/*,
				"labelFunction":function(value){
					return "$"+Math.round(value)+"M";
				}*/
			}],
			"graphs":[{
				"id":"g3",
				"valueAxis":"v1",
				"lineColor":"#2ed8b6",
				"fillColors":"#2ed8b6",
				"fillAlphas":0.3,
				"type":"column",
				"title":"Actual Sales",
				"valueField":"count",
				"columnWidth":0.5,
				"legendValueText":"[[value]]",
				"balloonText":"[[age]]<br /><b style='font-size: 130%'>[[value]]명</b>"}
			],
			"chartCursor":{
				"pan":true,
				"valueLineEnabled":true,
				"valueLineBalloonEnabled":true,
				"cursorAlpha":0,
				"valueLineAlpha":0.2
			},
			"categoryField":"age",
			"categoryAxis":{
				"axisAlpha":0,
				"lineAlpha":0,
				"gridAlpha":0,
				"minorGridEnabled":true,
			},
			"balloon":{
				"borderThickness":1,
				"shadowAlpha":0
			},
			"export":{
				"enabled":true
			},
			"dataProvider":[
	<c:forEach items="${stat.graphAge }" var="age" varStatus="status">
				{
					"age":"${status.count*10}대",
					"count":${age}
				},
	</c:forEach>
			]
		});
		
		var map = AmCharts.makeChart("allocation-map", {
			"type": "map",
			"theme": "light",
			"colorSteps": 10,
			"dataProvider": {
				"map": "southKoreaLow",
				"areas": [
		<c:forEach items="${stat.mapData }" var="map" varStatus="status">
					{
						"id":"KR-${map.key}",
						"value":${map.value}
					},
		</c:forEach>
				]
			},
			"areasSettings": {
				"autoZoom": true,
				"balloonText": "[[title]] : [[value]]명"
			}
		});
		
		map.addListener("clickMapObject", function(e) {
			$.ajax({
				url: "<c:url value="/getAreaData" />",
				type: "get",
				data: {areaId : e.mapObject.id.substring(3, 5)}
			}).done(function (result) {
				if(result.length == 0) {
					$("#allocation-chart").html("<div style=\"text-align:center;\">아직 투표 정보가 없습니다.</div>");
				} else {
					AmCharts.makeChart("allocation-chart", {
						"type": "pie",
						"startDuration": 0,
						"theme": "light",
						"labelRadius": 0,
						"pullOutRadius": 0,
						"labelText": "",
						"colorField": "color",
						"legend": {},
						"dataProvider": result,
						"innerRadius": "70%",
						"valueField": "count",
						"titleField": "name"
					});
				}
			});
		});
		
		map.addListener("homeButtonClicked", function(e) {
			$.ajax({
				url: "<c:url value="/getAreaData" />",
				type: "get"
			}).done(function (result) {
				if(result.length == 0) {
					$("#allocation-chart").html("<div style=\"text-align:center;\">아직 투표 정보가 없습니다.</div>");
				} else {
					AmCharts.makeChart("allocation-chart", {
						"type": "pie",
						"startDuration": 0,
						"theme": "light",
						"labelRadius": 0,
						"pullOutRadius": 0,
						"labelText": "",
						"colorField": "color",
						"legend": {},
						"dataProvider": result,
						"innerRadius": "70%",
						"valueField": "count",
						"titleField": "name"
					});
				}
			});
		});
		
		$.ajax({
			url: "<c:url value="/getAreaData" />",
			type: "get"
		}).done(function (result) {
			if(result.length == 0) {
				$("#allocation-chart").html("<div style=\"text-align:center;\">아직 투표 정보가 없습니다.</div>");
			} else {
				AmCharts.makeChart("allocation-chart", {
					"type": "pie",
					"startDuration": 0,
					"theme": "light",
					"labelRadius": 0,
					"pullOutRadius": 0,
					"labelText": "",
					"colorField": "color",
					"legend": {},
					"dataProvider": result,
					"innerRadius": "70%",
					"valueField": "count",
					"titleField": "name"
				});
			}
		});
		
		var genderChart = AmCharts.makeChart("gender", {
			"type": "pie",
			"startDuration": 0,
			"theme": "light",
			"labelRadius": 0,
			"pullOutRadius": 0,
			"labelText": "",
			"colorField": "color",
			"legend": {},
			"dataProvider": [{
				"gender": "남성",
				"count": ${stat.man},
				"color": "#85C5E3"
			}, {
				"gender": "여성",
				"count": ${stat.woman},
				"color": "#CCA3C4"
			}],
			"valueField": "count",
			"titleField": "gender"
		});
		
		
		
	});
	</script>
</body>
</html>
