<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
//<![CDATA[
${javascript}

function setFirebaseToken(token) {
	$.get("<c:url value="/setFirebaseToken" />", {token: token});
}
//]]>
</script>