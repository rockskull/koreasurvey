<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<tiles:useAttribute name="definition" />
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

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/pages.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/widget.css" />">

<c:if test="${definition eq 'boardList'}">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/list.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/stroll.css" />">
</c:if>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/plugins/feather/css/feather.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/plugins/font-awesome/css/font-awesome.min.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/plugins/themify-icons/themify-icons.css" />">
</head>