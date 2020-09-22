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
                    <c:when test="${data.recommanderid != 0}"><a
                            href="/admin/user/detail/${data.recommanderid}">${data.recommanderemail}</a></c:when>
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

<div id="surveys">
    <h1>설문 등록 내역</h1>

    <table class="table table-hover m-b-0">
        <thead>
        <tr>
            <%--													<th>선택</th>--%>
            <!-- <th>순번</th> -->
            <th>설문 번호</th>
            <th>설문 제목</th>
            <th>문항 수</th>
            <th>총 배당액</th>
            <th>인당 배당액</th>
            <th>응답수</th>
            <th>남은 배당액</th>
            <th>상태</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${surveys}" var="item" varStatus="status">
            <tr class="survey" data-survey-id="${item.id}">
                    <%--													<td><input class="check-item" type="checkbox" data-item-id="${item.id }" /></td>--%>
                <td><a target="_blank" href="<c:url value="/account/surveys/result/${item.id}" />"> ${item.id}</a></td>
                <td>${item.title }</td>
                <td>${item.qcount } 개</td>
                <td>${item.totalcost } P</td>
                <td>${item.unitcost } P</td>
                <td>${item.answerUserCount } / <fmt:formatNumber type="number" pattern="0"
                                                                 value="${item.totalcost / item.unitcost} "/>명
                </td>
                <td>${item.totalcost-item.qcount*item.unitcost*item.answerUserCount } P</td>
                <td><span class="text-primary">

														<c:choose>
                                                            <c:when test="${item.status == 0}">
                                                                종료
                                                            </c:when>
                                                            <c:when test="${item.status == 1}">
                                                                진행
                                                            </c:when>
                                                            <c:when test="${item.status == 2}">
                                                                중지
                                                            </c:when>
                                                            <c:when test="${item.status == 3}">
                                                                차단
                                                            </c:when>

                                                            <c:otherwise>
                                                                알수없음
                                                            </c:otherwise>
                                                        </c:choose>
													</span></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div>
    <c:if test="${data.active}">
        <button class="btn btn-danger" id="user-btn" style="width: 100%;" type="button" data-user-id="${data.id}">사용 정지</button>
    </c:if>
    <c:if test="${data.active == false}">
        <button class="btn btn-primary" id="user-btn" style="width: 100%;" type="button" data-user-id="${data.id}">사용</button>
    </c:if>
</div>
<c:set var="javascript" scope="request">
    <script>
        $("#user-btn").click(function () {
            // console.log( );
            $.post("<c:url value="/admin/user/change-status" />",{
                "user-id" : $(this).data("user-id")
            }, function () {
                alert("수정이 완료되었습니다");
                location.reload();
            }).fail(function () {
                alert("오류가 발생하였습니다");
            })
        })
    </script>
</c:set>