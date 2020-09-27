<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<h1>공지사항 등록</h1>
<form action="<c:url value="/admin/notice/edit/" />" method="post" id="notice-edit">
    <div class="form-group">
        <label for="notice-title">제목</label>
        <input type="text" class="form-control" id="notice-title" name="title" aria-describedby="withdrawal-amount-help" value="${notice.title}">
    </div>
    <div>
        <label for="content">내용</label>
        <textarea id="content">${notice.content}</textarea>
    </div>
    <div class="form-group">
        <label for="show-notice-toggle">공지사항 노출</label>
        <div>
            <c:if test="${notice.active}">
                <input type="checkbox" data-toggle="toggle" data-size="sm" id="show-notice-toggle" name="show"  checked>
            </c:if>
            <c:if test="${notice.active == false}">
                <input type="checkbox" data-toggle="toggle" data-size="sm" id="show-notice-toggle" name="show" >
            </c:if>

        </div>
    </div>
    <div class="text-right">
        <button class="btn btn-primary" type="submit">확인</button>
        <button class="btn btn-default">취소</button>
    </div>
</form>
<c:set var="javascript" scope="request">
    <script>
        CKEDITOR.replace("content")
    </script>
    <script>
        $("#notice-edit").submit(function () {
            $.post("<c:url  value="/admin/notice/edit"/>", {
                "index" : ${notice.id},
                "title" : $("input[name=title]").val(),
                "content" : CKEDITOR.instances.content.getData(),
                "show" : $("#show-notice-toggle:checked").val() === "on"
            }, function () {
                alert("처리가 완료되었습니다");
                location.href = "<c:url value="/admin/notice/list">"
            }).fail(function () {
                alert("처리중 오류가 발생하였습니다");
            })
            console.log("Content", CKEDITOR.instances.content.getData());
            $("#result").val(CKEDITOR.instances.content.getData());
            return false;
        });
    </script>
</c:set>
