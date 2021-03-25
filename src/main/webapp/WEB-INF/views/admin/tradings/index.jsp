<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<h1>적립금 관리</h1>

<form method="get">
    <div class="col-md-12">
        <div class="form-group">
            <label for="start">등록기간</label>
            <div class="input-group date" data-provide="datepicker" id="start">
                <input type="text" class="form-control datepicker" name="start" placeholder="시작일" value="${start}" autocomplete="off">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-th"></span>
                </div>
            </div>

            <div class="input-group date" data-provide="datepicker" id="end">
                <input type="text" class="form-control datepicker" name="end" placeholder="종료일" value="${end}" autocomplete="off">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-th"></span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>종류</label>
            <label class="checkbox-inline">
                <input type="checkbox" value="0" name="status"> 적립
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" value="1" name="status"> 출금
            </label>
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

            <td>종류</td>
            <td>금액</td>
            <td>계정이메일</td>
            <td>등록일</td>
            <td>계좌번호</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${data}" var="item">
            <tr>
                <td>
                    <c:if test="${item.withdraw != null && item.withdraw.status == 0}">
                        <button class="btn btn-primary btn-sm bank-check-btn" data-id="${item.withdraw.id}" type="button">입금완료</button>
                    </c:if>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${item.type == -1}">
                            <c:if test="${item.withdraw != null}">
                                출금
                                <c:if test="${item.withdraw.status == 0}">
                                    - 진행중
                                </c:if>

                            </c:if>
                            <c:if test="${item.withdraw == null}">
                                <c:if test="${item.amount > 0}">
                                    설문환급
                                </c:if>

                                <c:if test="${item.amount < 0}">
                                    설문작성
                                </c:if>
                            </c:if>
                        </c:when>
                        <c:when test="${item.type == 0}">
                            현금충전
                        </c:when>
                        <c:when test="${item.type == 1}">
                            테스트 충전
                        </c:when>
                        <c:when test="${item.type == 2}">
                            설문배당
                        </c:when>

                    </c:choose>
                </td>
                <td>${item.amount}</td>
                <td>${item.user.email}</td>
                <td><fmt:formatDate pattern="YYYY-MM-dd" value="${item.created}"></fmt:formatDate></td>
                <td>
                    <c:if test="${item.withdraw != null && item.withdraw.status == 0}">
                        진행중 (${item.withdraw.bank} ${item.withdraw.address} ${item.withdraw.accountHolder})
                    </c:if>
                    <c:if test="${item.withdraw != null && item.withdraw.status == 1}">
                        <p class="text-c-red">완료</p>
                    </c:if>
                    <c:if test="${item.withdraw == null}">
                        -
                    </c:if>

                </td>

            </tr>
        </c:forEach>

        </tbody>
    </table>
    <div class="text-center">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <c:if test="${page == 1}">
                    <li class="page-item"><a class="page-link" href="#">이전</a></li>
                </c:if>

                <c:if test="${page != 1}">
                    <li class="page-item"><a class="page-link" href="<c:url value="/admin/tradings?page=${page-1}&start=${start}&end=${end}" />">이전</a></li>
                </c:if>
                <li class="page-item active"><a class="page-link" href="#">${page}</a> </li>

                <li class="page-item"><a class="page-link" href="<c:url value="/admin/tradings?page=${page+1}&start=${start}&end=${end}" />">다음</a></li>
            </ul>
        </nav>

    </div>

</div>

<script>
    $.fn.datepicker.defaults.format = "yyyy-mm-dd";
    $(".datepicker").datepicker({
        format: 'yyyy-mm-dd'
    });

    $(".bank-check-btn").click(function () {
        const id = $(this).data("id");
        if (confirm("입금을 완료하였습니까?")) {
            $.post("<c:url value="/admin/tradings/bank-deposit" />",{
                "id" : id
            }, function () {
                alert("입금 처리가 완료되었습니다");
                location.reload();
            }).fail(function () {
                alert("오류가 발생하였습니다");
            })

        }
    });
</script>