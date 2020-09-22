<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<h1>공지사항 관리</h1>

<div>
    <table class="table">
        <thead>
        <tr>
            <th style="width : 90%">제목</th>
            <th style="width: 10%">삭제</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${items}" var="item">
                <tr>
                    <td>
                        <a href="<c:url value="/admin/notice/edit/${item.id}"/>">
                                ${item.title}
                        </a>
                    </td>
                    <td>
                        <button class="btn btn-danger">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
