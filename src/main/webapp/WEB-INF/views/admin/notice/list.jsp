<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<h1>회원관리</h1>

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
            <label>계정상태</label>
            <label class="checkbox-inline">
                <input type="checkbox" value="1" name="status"> 정상
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" value="2" name="status"> 중지
            </label>
        </div>

        <div class="form-group">
            <label>이메일</label>
            <input type="email" class="form-control" name="email" value="${email}">
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
            <td>NO.</td>
            <td>계정(이메일)</td>
            <td>등록일</td>
            <td>계정상태</td>
            <td></td>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>

<script>
    $.fn.datepicker.defaults.format = "yyyy-mm-dd";
    $(".datepicker").datepicker({
        format: 'yyyy-mm-dd'
    });
</script>