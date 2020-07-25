<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<tiles:insertAttribute name="header" />
<body>
<tiles:insertAttribute name="top" />
<tiles:insertAttribute name="contents" />
<tiles:insertAttribute name="footer" />
<tiles:insertAttribute name="scripter" />
</body>
</html>