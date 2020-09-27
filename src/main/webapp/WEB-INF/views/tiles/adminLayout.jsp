<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
    <link id="bsdp-css" href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap4-toggle.min.css" />">


    <script src="//code.jquery.com/jquery.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>
    <script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/bootstrap4-toggle.min.js" />"></script>


    <title>관리자</title>
</head>

<body>

<div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a href="/admin" class="navbar-brand">KoreaSurvey Admin</a>
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
            <ul class="nav navbar-nav">
                <li>
                    <a href="<c:url value="/admin/user/list" />">회원관리</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/surveys" />">설문관리</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/point/list" />">적립금관리</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/notice/list" />">공지사항관리</a>
                </li>

            </ul>

<%--            <ul class="nav navbar-nav navbar-right">--%>
<%--                <li><a href="http://builtwithbootstrap.com/" target="_blank">Built With Bootstrap</a></li>--%>
<%--                <li><a href="https://wrapbootstrap.com/?ref=bsw" target="_blank">WrapBootstrap</a></li>--%>
<%--            </ul>--%>

        </div>
    </div>
</div>
<div class="container">
    <div style="margin-top: 60px;">
        <tiles:insertAttribute name="content" />

    </div>
</div>

</body>
${javascript}
</html>
