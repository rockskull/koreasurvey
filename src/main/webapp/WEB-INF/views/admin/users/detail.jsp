<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<div id="userinfo">
    <h1>회원정보</h1>
    <c:if test="${data.active == false}">
        <div class="alert alert-danger" role="alert">사용 정지</div>
    </c:if>
    <table class="table">
        <tbody>
        <tr>
            <td>계정(이메일)</td>
            <td>${data.email}</td>
            <td>등록일</td>
            <td><fmt:formatDate pattern="YYYY-MM-dd HH:mm" value="${data.created}"></fmt:formatDate></td>
        </tr>
        <tr>
            <td>출생년도</td>
            <td><input class="form-control" value="${data.age}"></td>
            <td>성별</td>
            <td>
                <select class="form-control">
                    <option  ${data.gender eq '남성' ? 'selected' : ''}>남</option>
                    <option ${data.gender eq '여성' ? 'selected' : ''}>여</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>지역</td>
            <td>
                <select class="form-control">
                    <c:forEach items="${regions}" var="item">
                        <option ${item eq data.area ? 'selected' : ''}>${item}</option>
                    </c:forEach>

                </select>
            </td>
            <td>추천인</td>
            <td>
                <c:choose>
                    <c:when test="${data.recommanderid != 0}"><a href="/admin/user/detail/${data.recommanderid}">${data.recommanderemail}</a></c:when>
                    <c:otherwise>없음</c:otherwise>
                </c:choose>
            </td>
            <td></td>
        </tr>

        </tbody>

    </table>
</div>

<div id="point">
    <div>
        <h1>포인트 현황</h1>
    </div>
    <table class="table">
        <tbody>
            <tr>
                <td>현재 포인트</td>
                <td colspan="3">${data.point}</td>
            </tr>
            <tr>
                <td>총 적립 포인트</td>
                <td>-1</td>
                <td>총 출금 포인트</td>
                <td>-1</td>

            </tr>
        </tbody>
    </table>
</div>