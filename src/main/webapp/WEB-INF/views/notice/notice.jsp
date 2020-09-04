<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false"%>
<style>
    html,body,div,p,img,span,a,em,strong,pre,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,tbody,thead,tfoot,tr,th,td,form,fieldset,legend,caption,input,textarea,button,select,object,video,iframe{margin:0;padding:0}
    ul,ol,li{list-style:none}
    i{font-style:normal}
    .notice li{position:relative;background:#fff;font-size:15px;font-family:"NotoSansCJKkr";border-bottom:1px solid #E5E5E5;cursor:pointer}
    .notice li .title{text-decoration:none;color:#141414;overflow:hidden;white-space:nowrap;word-break:break-all;text-overflow:ellipsis;width:80%;padding:12px 15px}
    .notice li .title .new{display:inline-block;background:#51C90D;font-size:8px;color:#fff;vertical-align:1px;border-radius:1px;padding:1px 3px;margin-right:3px}
    .notice li .title .date{display:block;font-size:12px;color:#bdbdbd;margin-top:2px}
    .notice li .title .status{position:absolute;right:20px;top:27px;display:block;background:url("../images/btn_list_close.png") no-repeat;width:12px;height:12px;background-size:12px 12px}
    .notice li .content{display:none;font-size:13px;color:#7f7f7f;line-height:19px;background:#F6F6F6;letter-spacing:-0.5px;padding:15px}
    .notice li .content .detail{display:inline-block;color:#00f;margin-top:10px}
    .notice li.on{-webkit-tap-highlight-color:rgba(0, 0, 0, 0)}
    .notice li.on .title .status{background-image:url("../images/btn_list_open.png")}
    .notice li.on .content{display:block}
    .notice .more{display:block;text-align:center;text-decoration:none;border-radius:20px;font-size:13px;width:80px;height:33px;line-height:35px;color:#7f7f7f;border:1px solid #E1E1E1;margin:20px auto 10px}
    .notice .more span{display:inline-block;background:url("../images/btn_list_open_s.png") no-repeat;vertical-align:1px;width:8px;height:8px;background-size:8px 8px;margin-left:8px}
</style>
<div class="pcoded-content">
    <div class="page-header card">
        <div class="row align-items-end mt-5">
            <div class="col-12">
                <div class="page-header-title">
                    <div class="d-inline text-center">
                        <h1>공지사항</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="pcoded-inner-content">
        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="notice">
                        <ul id="list_parent">
                            <c:forEach items="${notices}" var="item">
                                <li>
                                    <div class="title">
                                        <span class="text"><c:out value="${item.title}"/></span>
                                        <span class="date">
                                            <fmt:formatDate var="resultRegDt" value="${item.created}" pattern="yyyy.MM.dd"/>
                                            ${resultRegDt}
                                        </span><span class="status"></span>
                                    </div>
                                    <div class="content">
                                            ${item.content}
                                    </div>
                                </li>
                            </c:forEach>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:set var="javascript" scope="request">
    function getCookie(cName) {
        cName = cName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cName);
        var cValue = '';
        if (start != -1) {
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if (end == -1) end = cookieData.length;
        cValue = cookieData.substring(start, end);
        }
        return unescape(cValue);
    }

    function setCookie(cName, cValue, cYear) {
        var expire = new Date();
        expire.setYear(expire.getYear() + cYear);
        cookies = cName + '=' + escape(cValue) + '; path=/ '; // �쒓� 源⑥쭚�� 留됯린�꾪빐 escape(cValue)瑜� �⑸땲��.
        if (typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
        document.cookie = cookies;
    }


    $(function() {
        $(".title").click(function() {
            if ($(this).parent().hasClass("on")) {
                $(this).parent().removeClass("on");
            } else {
                $(".notice li").removeClass("on");
                $(this).parent().toggleClass("on");
                var div = $(this).parent()[0].getElementsByClassName("title")[0];
                console.log(div);
                var newSpan = div.getElementsByClassName("new")[0];
                console.log(newSpan);
                if (newSpan != null) {
                    div.removeChild(newSpan);
                }
                var text = $(this).parent()[0].getElementsByClassName("text")[0].innerHTML;
                setCookie(SHA256(text), 'visit', 1);
            }
        });
    });
</c:set>