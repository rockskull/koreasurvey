<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<h1>설문관리</h1>

<form method="get">
    <div class="col-md-12">
        <div class="form-group">
            <label for="start">등록기간</label>
            <div class="input-group date" data-provide="datepicker" id="start">
                <input type="text" class="form-control datepicker" name="start" placeholder="시작일" value="${start}">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-th"></span>
                </div>
            </div>

            <div class="input-group date" data-provide="datepicker" id="end">
                <input type="text" class="form-control datepicker" name="end" placeholder="종료일" value="${end}">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-th"></span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>설문 상태</label>
            <label class="checkbox-inline">
                <input type="checkbox" value="-1" name="status"> 검수중
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" value="1" name="status"> 중지
            </label>

            <label class="checkbox-inline">
                <input type="checkbox" value="2" name="status"> 종료
            </label>
        </div>

        <div class="form-group">
            <label>제목</label>
            <input type="text" class="form-control" name="title" value="${title}">
        </div>
    </div>
    <div class="text-right">
        <button class="btn btn-default">초기화</button>
        <button class="btn btn-primary" type="submit">검색</button>
    </div>
</form>
<div>
    <table class="table table-condensed">
        <thead>
            <tr>
                <td></td>
                <td>NO.</td>
                <td>설문제목</td>
                <td>문항수</td>
                <td>총배당액</td>
                <td>인당배당액</td>
                <td>응답수</td>
                <td>남은배당액</td>
                <td>등록일</td>
                <td>설문상태</td>

            </tr>
        </thead>
        <tbody>
        <c:if test="${data.size() == 0}">
            <tr>
                <td colspan="5">정보가 없습니다.</td>
            </tr>
        </c:if>
        <c:forEach items="${data}" var="item">
            <tr>
                <td>
                    <c:if test="${item.status == -1}">
                        <button class="btn btn-primary btn-sm" data-id="${item.id}">검수 완료</button>
                    </c:if>
                </td>
                <td>
                    <a href="<c:url value="/admin/surveys/detail/${item.id}" />">
                            ${item.id}
                    </a>
                </td>
                <td>${item.title }</td>
                <td>${item.qcount } 개</td>
                <td>${item.totalcost } P</td>
                <td>${item.unitcost } P</td>
                <td>${item.answerUserCount } / <fmt:formatNumber type="number"  pattern="0" value="${item.totalcost / item.unitcost} " />명</td>
                <td>${item.totalcost-item.qcount*item.unitcost*item.answerUserCount } P</td>
                <td><fmt:formatDate pattern="YYYY-MM-dd" value="${item.created}"></fmt:formatDate></td>
                <td>
                    <c:choose>
                        <c:when test="${item.status == -1}">
                            검수중
                        </c:when>
                        <c:when test="${item.status == 0}">
                            종료
                        </c:when>
                        <c:when test="${item.status == 1}">
                            진행
                        </c:when>
                        <c:when test="${item.status == 2}">
                            중지
                        </c:when>
                        <c:otherwise>
                            차단
                        </c:otherwise>

                    </c:choose>
                </td>

            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

<script>
    $.fn.datepicker.defaults.format = "yyyy-mm-dd";
    $(".datepicker").datepicker({
        format: 'yyyy-mm-dd'
    });
    $("td button").click(function () {
        // console.log( );
        $.post("<c:url value="/admin/surveys/inspection/" />" + $(this).data("id"),{
            "user-id" : $(this).data("user-id")
        }, function () {
            alert("수정이 완료되었습니다");
            location.reload();
        }).fail(function () {
            alert("오류가 발생하였습니다");
        })
    })
</script>