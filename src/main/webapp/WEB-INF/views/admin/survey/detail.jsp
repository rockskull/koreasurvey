<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<div>

    <form method="post">
        <h3>설문정보</h3>
        <div class="text-right">
            <button class="btn btn-primary" type="submit">저장</button>
        </div>

        <table class="table">
            <tbody>
                <tr>
                    <th>설문 작성자</th>
                    <td colspan="3"><a href="<c:url value="/admin/user/detail/${survey.userid}" /> ">${survey.useremail}</a></td>
                </tr>

                <tr>
                    <th>설문 제목</th>
                    <td colspan="3">
                        <input class="form-control" value="${survey.title}" name="title">
                    </td>
                </tr>

                <tr>
                    <th>설문 소개</th>
                    <td colspan="3">
                        <input class="form-control" value="${survey.detail}" name="detail">
                    </td>
                </tr>


                <tr>
                    <th>인당배당액</th>
                    <td>${survey.unitcost } P</td>

                    <th>응답수</th>
                    <td>${survey.answerUserCount}명</td>
                </tr>

                <tr>
                    <th>설문총배당액</th>
                    <td>${survey.totalcost} P</td>

                    <th>남은배당액</th>
                    <td>${survey.totalcost-survey.qcount*survey.unitcost*survey.answerUserCount } P</td>
                </tr>

                <tr>
                    <th>등록일</th>
                    <td><fmt:formatDate pattern="YYYY-MM-dd" value="${survey.created}"></fmt:formatDate></td>

                    <th>검수일</th>
                    <td><fmt:formatDate pattern="YYYY-MM-dd" value="${survey.inspection}"></fmt:formatDate></td>
                </tr>

            </tbody>
        </table>
    </form>
</div>

<div>
    <h3>설문제한</h3>
    <div class="text-right">
        <button class="btn btn-default" type="button">초기화</button>
        <button class="btn btn-primary" type="button" id="submit-exclude-btn">저장</button>
    </div>
    <div id="exclude">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">연령대</label>
            <div class="btn-group-toggle" data-toggle="buttons" id="age">
                <input type="checkbox" name="age" value="all"> 전체
                <c:forTokens var="item" items="10,20,30,40,50,60+" delims=",">
                    <c:set var="checked" value="false" />
                    <c:forEach var="exItem" items="${exclude}">
                        <c:if test="${exItem.excludeValue == item}">
                            <c:set var="checked" value="true" />

                        </c:if>
                    </c:forEach>
                    <c:if test="${checked}">
                        <input type="checkbox" name="age" value="${item}" checked> ${item}대
                    </c:if>
                    <c:if test="${checked == false}">
                        <input type="checkbox" name="age" value="${item}"> ${item}대
                    </c:if>

                </c:forTokens>
            </div>

        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">성별</label>
            <div class="btn-group-toggle" data-toggle="buttons" id="gender">
                <input type="checkbox" name="gender" value="all"> 전체
                <c:forTokens var="item" items="M,F" delims=",">
                    <c:set var="checked" value="false" />
                    <c:forEach var="exItem" items="${exclude}">
                        <c:if test="${exItem.excludeValue == item}">
                            <c:set var="checked" value="true" />
                        </c:if>
                    </c:forEach>
                    <c:if test="${checked}">
                        <input type="checkbox" name="gender" value="${item}" checked> ${item == "M" ? "남성" : "여성"}
                    </c:if>
                    <c:if test="${checked == false}">
                        <input type="checkbox" name="gender" value="${item}"> ${item == "M" ? "남성" : "여성"}
                    </c:if>

                </c:forTokens>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">지역 </label>
            <div class="btn-group-toggle" data-toggle="buttons" id="region">
                <input type="checkbox" name="region" value="all"> 전체

                <c:forEach var="item" items="${regions}">
                    <c:set var="checked" value="false" />
                    <c:forEach var="exItem" items="${exclude}">
                        <c:if test="${exItem.excludeValue == item}">
                            <c:set var="checked" value="true" />
                        </c:if>
                    </c:forEach>
                    <c:if test="${checked}">
                        <input type="checkbox" name="region" value="${item}" checked> ${item}
                    </c:if>
                    <c:if test="${checked == false}">
                        <input type="checkbox" name="region" value="${item}"> ${item}
                    </c:if>

                </c:forEach>

            </div>
        </div>
    </div>


</div>

<c:set scope="request" var="javascript">
    <script>
        function getCheckedButtonValue($selector) {
            var exclude = [];
            $selector.each(function() {
                exclude.push($(this).val());
            });
            return exclude;
        }
        $("input[value=all]").click(function () {
            $("input[name=" + $(this).attr("name") + "]").each(function () {
                $(this).attr("checked", true);
            })
        })
        $("#submit-exclude-btn").click(function () {
            var parameter = {
                "age" : getCheckedButtonValue($("#age input:checked")).join(","),
                "gender" : getCheckedButtonValue($("#gender input:checked")).join(","),
                "region" : getCheckedButtonValue($("#region input:checked")).join(","),
            };
            $.post("<c:url value="/admin/surveys/exclude/${survey.id}" />", parameter, function () {
                alert("처리가 완료 되었습니다.")
                location.reload();
            }).fail(function () {
                alert("오류가 발생하였습니다");
            })
            console.log(parameter);
        });
    </script>
</c:set>