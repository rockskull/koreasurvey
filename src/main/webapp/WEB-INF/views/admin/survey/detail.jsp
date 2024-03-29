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
        <hr/>


        <table class="table">
            <tbody>
            <tr>
                <th>설문 작성자</th>
                <td colspan="3"><a href="<c:url value="/admin/user/detail/${survey.userid}" /> ">${survey.useremail}</a>
                </td>
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
    <hr/>

    <div id="exclude">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">연령대</label>
            <div class="btn-group-toggle" data-toggle="buttons" id="age">
                <input type="checkbox" name="age" value="all"> 전체
                <c:forTokens var="item" items="10,20,30,40,50,60+" delims=",">
                    <c:set var="checked" value="false"/>
                    <c:forEach var="exItem" items="${exclude}">
                        <c:if test="${exItem.excludeValue == item}">
                            <c:set var="checked" value="true"/>

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
                    <c:set var="checked" value="false"/>
                    <c:forEach var="exItem" items="${exclude}">
                        <c:if test="${exItem.excludeValue == item}">
                            <c:set var="checked" value="true"/>
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
                    <c:set var="checked" value="false"/>
                    <c:forEach var="exItem" items="${exclude}">
                        <c:if test="${exItem.excludeValue == item}">
                            <c:set var="checked" value="true"/>
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

<div>
    <h3>문항정보</h3>
    <div class="text-right">
        <button class="btn btn-primary" id="add-question">문항 추가</button>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th style="width : 75%">
                문항제목
            </th>
            <th style="width : 10%">
                문항유형
            </th>
            <th style="width: 15%">
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${questions}" var="item">
            <tr>
                <td>${item.title}</td>
                <td>
                    <c:choose>
                        <c:when test="${item.type == 0}">
                            객관식
                        </c:when>
                        <c:when test="${item.type == 1}">
                            주관식
                        </c:when>
                    </c:choose>
                </td>
                <td>
                    <button class="btn btn-default btn-sm question-modify-modal" data-q-type="${item.type}"
                            data-q-id="${item.id}">문항수정
                    </button>
                    <button class="btn btn-danger btn-sm question-delete-btn" data-q-id="${item.id}">삭제</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>

    </table>
</div>

<div class="modal fade" id="question-modify-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">문항 수정</h4>
            </div>
            <div class="modal-body">
                <input type="hidden" id="question-id">
                <div class="form-group">
                    <label>문항 제목</label>
                    <input type="text" class="form-control" name="title">
                </div>
                <div class="form-group">
                    <label>문항 유형</label>
                    <p id="q-type"></p>
                </div>

                <div id="modal-type-1" style="display: none">
                    <div class="form-group">
                        <label>주관식</label>
                        <textarea type="text" name="question" class="form-control"></textarea>
                    </div>
                </div>

                <div id="modal-type-0" style="display: none">
                    <label>항목</label>
                    <a href="#" id="add-question-option">선택 항목 추가</a>
                    <div id="modal-question"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="modify-question-btn">저장</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="question-add-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">문항 추가</h4>
            </div>
            <div class="modal-body">
                <%--                <input type="hidden" id="question-id">--%>
                <div class="form-group">
                    <label>문항 제목</label>
                    <input type="text" class="form-control" name="title">
                </div>
                <div class="form-group">
                    <label>문항 유형</label>
                    <select class="form-control" name="type">
                        <option value="1">주관식</option>
                        <option value="0">객관식</option>
                    </select>
                </div>
                <div class="modal-type-0" style="display:none">
                    <label>객관식</label>
                    <a href="#" class="add-question-option">선택 항목 추가</a>
                    <div class="content"></div>
                </div>

                <div class="modal-type-1" style="display:none">
                    <label>주관식</label>
                    <div class="content"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="save-question-btn">저장</button>
            </div>
        </div>
    </div>
</div>


<c:set scope="request" var="javascript">
    <script>
        $("#add-question").click(function () {
            questionTypeChangeEventHandler();
            $("#question-add-modal").modal("show");
        });
        $("#question-add-modal select[name=type]").change(questionTypeChangeEventHandler);

        function questionTypeChangeEventHandler() {
            $("#question-add-modal .modal-type-1").hide();
            $("#question-add-modal .modal-type-0").hide();

            $("#question-add-modal .modal-type-1 .content").html("");
            $("#question-add-modal .modal-type-0 .content").html("");

            const type = $("#question-add-modal select[name=type] option:selected").val();
            if (type == 0) {
                //todo : Add Textarea

                $("#question-add-modal .modal-type-0").show();

                $("#question-add-modal .modal-type-0 .content").append(getQuestion(0, ""));
            } else {
                $("#question-add-modal .modal-type-1").show();
                $("#question-add-modal .modal-type-1 .content").append(
                    $("<textarea>").addClass("form-control")
                )
            }
        }

        $("#question-add-modal .add-question-option").click(function () {
            $("#question-add-modal .modal-type-0 .content").append(getQuestion(0, ""));
        });

        function getCheckedButtonValue($selector) {
            var exclude = [];
            $selector.each(function () {
                exclude.push($(this).val());
            });
            return exclude;
        }

        $("input[value=all]").click(function () {
            $("input[name=" + $(this).attr("name") + "]").each(function () {
                $(this).attr("checked", true);
            })
        });

        function getQuestion(id, option) {
            const $parent = $("<div>").addClass("form-group").addClass("option-edit");
            const $input = $("<input>").addClass("form-control").val(option);
            $parent.append($input);
            $parent.append($("<p>").append(
                $("<a>").text("삭제하기").attr("href", "#").attr("data-option-id", id)
            ));
            $parent.attr("data-option-id", id);
            return $parent;
        }

        $(".question-modify-modal").click(function () {
            const qId = $(this).data("q-id");
            $("#modal-type-0").hide();
            $("#modal-type-1").hide();
            $("#modal-type-0 #modal-question").html("");
            $("#question-id").val(qId);
            $.get("<c:url value="/admin/surveys/question/" />" + qId, function (resp) {
                console.log(qId, "=>", resp);
                $("#question-modify-modal input[name=title]").val(resp.title);
                $("#question-modify-modal textarea[name=question]").text(resp.question);
                $("#question-modify-modal #modal-type-" + resp.type).show();
                $("#question-modify-modal #q-type").text(resp.type === 1 ? "주관식" : "객관식");
                console.log(resp.options);
                //TODO : Add Option
                for (let i = 0; i < resp.options.length; i++) {
                    const $item = resp.options[i];
                    $("#modal-type-0 #modal-question").append(getQuestion($item.id, $item.option));
                }

                $("#question-modify-modal").modal("show");
            }).fail(function () {
                alert("호출에 실패하였습니다.\n잠시후 다시 시도하세요.");
            });
        });
        $("#submit-exclude-btn").click(function () {
            var parameter = {
                "age": getCheckedButtonValue($("#age input:checked")).join(","),
                "gender": getCheckedButtonValue($("#gender input:checked")).join(","),
                "region": getCheckedButtonValue($("#region input:checked")).join(","),
            };
            $.post("<c:url value="/admin/surveys/exclude/${survey.id}" />", parameter, function () {
                alert("처리가 완료 되었습니다.")
                location.reload();
            }).fail(function () {
                alert("오류가 발생하였습니다");
            })
            console.log(parameter);
        });
        $(document).on("click", ".option-edit a", function (e) {
            e.preventDefault();
            const optionId = $(this).data("option-id");
            if ($(".option-edit a").length == 1) {
                alert("항목이 한가지만 남았을때는 삭제 할 수 없습니다");
                return false;
            }
            const $root = $(this).parent().parent();
            if (optionId !== 0) {

                if (confirm("항목을 삭제해도 이미 해당 항목을 선택한 설문 결과는 남아있습니다. 진행하시겠습니까?")) {
                    $.post("<c:url value="/admin/surveys/question/option/" />" + optionId + "/delete", function () {
                        $root.remove();

                    }).fail(function () {
                        alert("오류가 발생하였습니다");
                    })
                }
            } else {
                $root.remove();

            }
            return false;
        });
        $("#add-question-option").click(function () {
            $("#modal-type-0 #modal-question").append(getQuestion(0, ""));
        });
        $(".question-delete-btn").click(function () {
            if (confirm("항목을 삭제해도 이미 해당 항목을 선택한 설문 결과는 남아있습니다. 진행하시겠습니까?")) {
                $.post("<c:url value="/admin/surveys/question/" />" + $(this).data("q-id") + "/delete", function () {
                    alert("삭제에 성공하였습니다.");
                    location.reload();
                }).fail(function () {
                    alert("오류가 발생하였습니다");
                });

            }
        });

        $("#save-question-btn").click(function () {
            const parameter = {};
            const options = [];
            $("#question-add-modal .modal-type-0 input").each(function () {
                const $option = $(this).val();
                options.push({
                    "option": $option,
                    "id": 0
                });
            });
            parameter["options"] = options;
            parameter["title"] = $("#question-add-modal input[name=title]").val();
            parameter["question"] = $("#question-add-modal textarea[name=question]").text();
            parameter["type"] = $("#question-add-modal select[name=type] option:selected").val();
            console.log(parameter);
            $.ajax({
                url: "<c:url value="/admin/surveys/question/${survey.id}"/>/create",
                type: "post",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(parameter),
                // dataType: "json",
                success: function (data) {
                    alert("수정이 완료되었습니다");
                    location.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR, textStatus, errorThrown);
                    alert("수정에 실패하였습니다.");

                }
            });

        });

        $("#modify-question-btn").click(function () {
            const parameter = {};
            const options = [];
            $("#modal-type-0 input").each(function () {
                const $option = $(this).val();
                const $optionId = $(this).parent().data("option-id");
                if ($option.length == 0) {
                    return true;
                }
                options.push({
                    "option": $option,
                    "id": $optionId
                });
            });
            parameter["options"] = options;
            parameter["title"] = $("input[name=title]").val();
            parameter["question"] = $("textarea[name=question]").text();
            console.log(parameter);

            $.ajax({
                url: "<c:url value="/admin/surveys/question/"/>" + $("#question-id").val() + "/edit",
                type: "post",
                accept: "application/json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(parameter),
                dataType: "json",
                success: function (data) {
                    alert("수정이 완료되었습니다");
                    location.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("수정에 실패하였습니다.");

                }
            });
        });
    </script>
</c:set>