<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<div class="pcoded-content">
<div class="page-header card">
    <!-- <div class="row align-items-end">
        <div class="col-lg-8">
            <div class="page-header-title">
                <i class="feather icon-user bg-c-blue"></i>
                <div class="d-inline">
                    <h5>내 정보 관리</h5>
                    <span>필요한 내 정보에 추가, 변경, 관리할 수 있습니다.</span>
                </div>
            </div>
        </div>
    </div> -->
</div>
<div class="pcoded-inner-content">
    <div class="main-body">
        <div class="page-wrapper">
            <div class="page-body">

                <div class="row">
                    <div class="col-xl-6">
                        <div class="card">
                            <div class="card-header">
                                <h5>내 포인트 현황</h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col">
                                        <!-- <h6>총 포인트</h6> -->
                                        <div class="f-w-700 f-24 text-center mb-3"><fmt:formatNumber
                                                value="${user.point }" maxFractionDigits="3"/> P
                                            <c:if test="${diff lt 0 }"><span
                                                    class="text-c-blue m-l-10 f-14"><fmt:formatNumber value="${diff }"
                                                                                                      maxFractionDigits="3"/></span></c:if>
                                            <c:if test="${diff gt 0 }"><span
                                                    class="text-c-red m-l-10 f-14">+<fmt:formatNumber value="${diff }"
                                                                                                      maxFractionDigits="3"/></span></c:if>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <button type="button" id="withdraw" class="btn btn-info col-sm mb-2"><i
                                                class="fa fa-won"></i> 출금
                                        </button>
                                        <button type="button" id="charge" class="btn btn-primary col-sm"><i
                                                class="fa fa-bolt"></i> 충전
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-6">
                        <div class="card">
                            <div class="card-header">
                                <h5>친구 초대 </h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <button type="button" class="btn btn-primary col-sm mb-2" data-toggle="modal"
                                                data-target="#exampleModal">친구 초대하기
                                        </button>
                                        <p>초대한 친구가 설문에 참여할 때마다 적립금이 쌓입니다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5>수입/지출 현황</h5>
                            </div>
                            <div class="card-block">
                                <div class="table-responsive">
                                    <table class="table table-hover m-b-0" id="trading">
                                        <thead>
                                        <tr>
                                            <th>날짜</th>
                                            <th>금액</th>
                                            <th>방법</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                    <div style="margin-top: 10px;">
                                        <button class="btn btn-default" id="more" style="width : 100%">+ 더보기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5>최근 참여한 설문</h5>
                                <div class="card-header-right">
                                    <ul class="list-unstyled card-option">
                                        <li class="first-opt"><i class="feather icon-chevron-left open-card-option"></i>
                                        </li>
                                        <li><i class="feather icon-maximize full-card"></i></li>
                                        <li><i class="feather icon-minus minimize-card"></i></li>
                                        <li><i class="feather icon-refresh-cw reload-card"></i></li>
                                        <li><i class="feather icon-trash close-card"></i></li>
                                        <li><i class="feather icon-chevron-left open-card-option"></i></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-block p-b-0">
                                <div class="table-responsive">
                                    <table class="table table-hover m-b-0">
                                        <thead>
                                        <tr>
                                            <th>설문 제목</th>
                                            <th>문항당 배당액</th>
                                            <th>총 배당액</th>
                                            <th>상태</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${joined }" var="joinItem">
                                            <tr>
                                                <td>${joinItem.title }</td>
                                                <td>${joinItem.unitcost } P</td>
                                                <td>${joinItem.unitcost } P</td>
                                                <td><span class="text-primary">
															<c:choose>
                                                                <c:when test="${joinItem.status == 0}">
                                                                    종료
                                                                </c:when>
                                                                <c:when test="${joinItem.status == 1}">
                                                                    진행
                                                                </c:when>
                                                                <c:when test="${joinItem.status == 2}">
                                                                    중지
                                                                </c:when>
                                                                <c:when test="${joinItem.status == 3}">
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
                            </div>
                            <div class="card-footer">
                                <div class="text-right">
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">

                <img class="img-fluid" src="<c:url value="/resources/images/basic-logo.png"  />" alt="Logo">
                <%--					<h5 class="modal-title" id="exampleModalLabel">친구초대 링크 </h5>--%>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <c:set var="req" value="${pageContext.request}"/>

                <p>링크를 복사한 후 친구에게 전달하세요. </br>
                    초대한 친구가 설문에 참여할 때마다 적립금이 쌓입니다.</p>
                <%--					<input class="form-control" disabled>--%>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="copy-invite-link"
                           value="${req.scheme}://${req.serverName}:${req.serverPort}<c:url value="/account/join?email=${user.email}"  />"
                           disabled>
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="copy-invite-link-btn">초대링크 복사
                        </button>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <%--					<button type="button" class="btn btn-primary">Save changes</button>--%>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="withdraw-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">

                <img class="img-fluid" src="<c:url value="/resources/images/basic-logo.png"  />" alt="Logo">
                <%--					<h5 class="modal-title" id="exampleModalLabel">친구초대 링크 </h5>--%>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>출금을 신청하시면 입력해주신 입금계좌로 입금해드립니다.(최대 2-3 영업일 소요)</p>
                <div class="form-group">
                    <label for="withdrawal-amount">출금 금액</label>
                    <input type="number" class="form-control" id="withdrawal-amount" name="withdraw" aria-describedby="withdrawal-amount-help">
                    <small id="withdrawal-amount-help" class="form-text text-muted">출금 가능 금액 : ${user.point}원</small>
                </div>
                <div class="form-group">
                    <label for="bank-address">입금 계좌</label>
                    <div class="input-group mb-3">
                        <div class="input-group-append">
                            <select class="custom-select" name="bank">
                                <option value="">선택</option>
                                <c:forEach items="${banks}" var="item">
                                    <option value="${item}">${item}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <input type="text" class="form-control" name="bank-address" id="bank-address">
                    </div>

                </div>
                <div class="form-group">
                    <label for="account-holder">예금주</label>
                    <input type="text" class="form-control" id="account-holder" name="account-holder" aria-describedby="withdrawal-amount-help">
                </div>
                <div>
                    <p>계좌번호 입력 실수, 예금주 오류로 인한 사고에 Korea Survey는 책임지지 않습니다. </br>
                        보통예금계좌만 등록해주세요.(CMA, 가상계좌, 적금 등은 이체 불가 )</p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="withdraw-btn">출금신청</button>
            </div>
        </div>
    </div>
</div>
<c:set var="javascript" scope="request">
    function copyToClipboard(id) {
    var copyText = document.getElementById(id);
    copyText.select();
    document.execCommand("Copy");
    }


    $(function() {
    $("#copy-invite-link-btn").click(function() {
    alert("클립보드에 복사되었습니다");
    console.log($("#copy-invite-link").val());
    copyToClipboard("copy-invite-link");
    });

    $("#charge").click(function() {
    alert("충전 가능 기간이 아닙니다.\n관리자에게 문의하십시오.");
    });
    });
</c:set>
<c:set var="js" scope="request">
    <script src="<c:url value="/resources/js/moment.js" />"></script>
    <script>

        $("#withdraw-btn").click(function () {
            const withdraw = $("input[name=withdraw]").val();
            const bankAddress = $("input[name=bank-address]").val();
            const bankOption = $("select[name=bank]").val();
            const accountHolder = $("input[name=account-holder]").val();
            if (point < withdraw) {
                alert("출금 가능 금액을 초과 하였습니다.");
                return false;
            }
            if (bankOption.length == 0) {
                alert("입금 계좌를 선택하세요");
                return false;
            }
            $.post("<c:url value="/account/withdraw" />", {
                "withdraw" : withdraw,
                "bank-address" : bankAddress,
                "bank" : bankOption,
                "account-holder" : accountHolder
            }, function () {
                alert("출금 신청이 완료되었습니다");
                location.reload();
            }).fail(function () {
                alert("오류가 발생하였습니다. 잠시후 다시시도해주세요.");
            });
            console.log(withdraw, bankAddress, bankOption, accountHolder);

        });
        const point = ${user.point};

        $("#withdraw").click(function() {
            if (point <= 10000) {
                alert("만원 단위로 출금 가능합니다.");
                return false;
            }
            $("#withdraw-modal").modal("show");
        });

    </script>
    <script>

        function getTradingType(item) {
            let returnText = "";
            console.log(item);
            switch (item.type) {
                case -1:
                    if (item.withdraw !== null) {
                        returnText = "출금" + (item.withdraw.status == 0 ? " - 진행중" : "");
                    } else {
                        returnText = item.amount > 0 ? "설문 환급" : "설문 작성";
                    }
                    break;
                case 0:
                    returnText = "현금 충전";
                    break;
                case 1:
                    returnText = "테스트 충전";
                    break;
                case 2:
                    returnText = "설문 배당 </br> " + (item.recommanderemail !== null ? item.recommanderemail : "");
                    break;
                default:
                    returnText = "알수없음";

                    break;
            }
            return returnText;
        }

        let page = 1;
		const $moreBtn = $("#more");
        function makeTradings() {
            $.get('<c:url value="/account/tradings"/>', {"page": page}, function (resp) {
                console.log(resp);
                resp.forEach(item => {
                    const $tr = $("<tr />");
                    $tr.append($("<td />").text(moment(item.created).format("yyyy-MM-DD")));
                    $tr.append($("<td />").text((item.amount > 0 ? "+" : "") + item.amount).addClass(item.amount > 0 ? "text-c-red" : "text-c-blue"));
                    $tr.append($("<td />").html(getTradingType(item)));

                    $("#trading tbody").append($tr);
                })
                page++;
                if (resp.length != 5) {
					$moreBtn.remove();
				}
            }).fail(function () {
                alert("오류가 발생하였습니다");
            })
        }

        $(document).ready(function () {
            makeTradings();
			$moreBtn.click(function () {
                makeTradings();
            });
        })
    </script>
</c:set>