<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer-menu-bar z-depth-top-0" style="position: fixed; height: 50px; width: 100%; bottom: 0px; background-color: white;padding: 10px; z-index: 10;">
		<div class="row text-center">
			<c:if test="${empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }">
				<a href="<c:url value="/" />" class="col">
					<i class="ti-home f-16"></i>
					<div class="f-10">홈</div>
				</a>
				<a href="<c:url value="/account/login" />" class="col">
					<i class="ti-write f-16"></i><br />
					<div class="f-10">설문 관리</div>
				</a>
				<a href="<c:url value="/account/login" />" class="col">
					<i class="ti-user f-16"></i><br />
					<div class="f-10">내 정보</div>
				</a>
			</c:if>
			<c:if test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }">
				<a href="<c:url value="/" />" class="col">
					<i class="ti-home f-16"></i>
					<div class="f-10">홈</div>
				</a>
				<a href="<c:url value="/account/surveys" />" class="col">

				<%--				<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id eq 5}">--%>
<%--				<a href="<c:url value="/account/surveys" />" class="col">--%>
<%--				</c:if>--%>
<%--				<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id ne 5}">--%>
<%--				<a href="javascript:alert('설문을 등록할 권한이 없습니다.')" class="col">--%>
<%--				</c:if>--%>
					<i class="ti-write f-16"></i><br />
					<div class="f-10">설문 관리</div>
				</a>
				
				<a href="<c:url value="/account" />" class="col">
					<i class="ti-user f-16"></i><br />
					<div class="f-10">내 정보</div>
				</a>
			</c:if>
		</div>
	</div>
	<!--[if lt IE 10]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>현재 사용 중인 브라우저의 버전이 낮습니다.<br/>아래의 브라우저 중 하나를 사용하여 접속해 주십시오.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="../files/assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="../files/assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="../files/assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="../files/assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="../files/assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>불편을 드려 죄송합니다.</p>
</div>
<![endif]-->
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.slimscroll.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/waves.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap4-toggle.min.js" />"></script>

	<script src="<c:url value="/resources/js/pcoded.min.js" />"></script>
	<script src="<c:url value="/resources/js/horizontal-layout.min.js" />"></script>
	<script src="<c:url value="/resources/js/script.js" />"></script>
	<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>

	<!-- <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script> -->