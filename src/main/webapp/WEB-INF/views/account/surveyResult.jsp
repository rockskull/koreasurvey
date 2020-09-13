<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<div class="pcoded-content">
    <div class="page-header card">
        <div class="row align-items-end mt-5">
            <div class="col-12">
                <div class="page-header-title">
                    <div class="d-inline">
                        <h3>${answerCount}/<fmt:formatNumber type="number" pattern="0"
                                                             value="${survey.totalcost / survey.unitcost} "/> 명 참여</h3>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="pcoded-inner-content" style="margin-bottom: 40px;">
        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div>
                        <c:if test="${survey.exclude}">
                            <div class="card">
                                <div class="card-header">
                                    <h3>대상을 제한한 설문입니다</h3>
                                </div>
                                <div class="card-body">
                                        <%--									<h5 class="card-title">Special title treatment</h5>--%>
                                    <table class="table">
                                        <tbody>
                                        <c:forEach items="${exclude}" var="item">
                                            <tr>
                                                <th style="width : 10%">
                                                    <c:choose>
                                                        <c:when test="${item.excludeType == 1}">연령대</c:when>
                                                        <c:when test="${item.excludeType == 2}">성별</c:when>
                                                        <c:when test="${item.excludeType == 3}">지역</c:when>
                                                    </c:choose>
                                                </th>
                                                <th style="width : 90%">
                                                    <c:choose>
                                                        <c:when test="${item.excludeValue == 'F'}">여성</c:when>
                                                        <c:when test="${item.excludeValue == 'M'}">남성</c:when>
                                                        <c:when test="${item.excludeValue == '10'}">10대</c:when>
                                                        <c:when test="${item.excludeValue == '20'}">20대</c:when>
                                                        <c:when test="${item.excludeValue == '30'}">30대</c:when>
                                                        <c:when test="${item.excludeValue == '40'}">40대</c:when>
                                                        <c:when test="${item.excludeValue == '50'}">50대</c:when>
                                                        <c:when test="${item.excludeValue == '60+'}">60대 이상</c:when>

                                                        <c:otherwise>${item.excludeValue}</c:otherwise>

                                                    </c:choose>
                                                </th>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:if>
                    </div>

                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home"
                               role="tab" aria-controls="nav-home" aria-selected="true">설문</a>
                            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
                               role="tab" aria-controls="nav-profile" aria-selected="false">결과</a>
                            <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact"
                               role="tab" aria-controls="nav-contact" aria-selected="false">참여자통계</a>
                        </div>
                    </nav>

                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                             aria-labelledby="nav-home-tab">
                            <div class="row" id="surveyArea">
                                <div class="col-xl-12">
                                    <div class="card">
                                        <div class="card-block">
                                            <div class="row">
                                                <div class="col-xl-12">
                                                    <div>
																		<span class="mr-2">
                                                                            ${survey.category }
                                                                        </span>
                                                        <span class="badge badge-inverse-warning">
																			${survey.unitcost } P
																		</span>
                                                    </div>
                                                    <span class="f-w-700 f-26">
                                                        ${survey.title }
                                                    </span>
                                                    <div>
                                                        <p class="text-muted m-t-15">${survey.detail }</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <c:forEach items="${questions}" var="q">
                                                <div class="card q-card">
                                                    <div class="card-header">
                                                        <h5>${q.title }</h5>
                                                        <input type="hidden" class="q-id" value="${q.id }"/>
                                                        <input type="hidden" class="q-type" value="${q.type }"/>
                                                    </div>
                                                    <div class="card-block">
                                                        <h4 class="sub-title">${q.question }</h4>
                                                        <c:if test="${q.type eq 0}">
                                                            <div class="row form-radio">
                                                                <c:forEach items="${q.options }" var="option">
                                                                    <div class="radio radio-inline p-20">
                                                                        <label>
                                                                            <input type="radio" name="q-${q.id}"
                                                                                   id="q-${q.id}"
                                                                                   class="option"
                                                                                   value="${option.option }">
                                                                            <i class="helper"></i>${option.option }
                                                                        </label>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${q.type eq 1}">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <textarea class="answer form-control"></textarea>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                    <div class="card-footer">
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                            <div id="answer-result">
								<c:forEach items="${questions}" var="q">
									<div class="card q-card">
										<div class="card-header">
											<h5>${q.title }</h5>
											<p>${q.question }</p>
										</div>

										<div class="card-block result" data-q-id="${q.id}" data-q-type="${q.type}">
											<canvas id="c-${q.id}"></canvas>
											<div class="list"></div>
										</div>
										<div class="card-footer">
										</div>
									</div>
								</c:forEach>
							</div>


                        </div>
                        <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                            ...
                        </div>
                    </div>

                    <div class="text-center">
                        <a href="<c:url value="/account/surveys/" />">
                            <button class="btn btn-primary">확인</button>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<c:set var="js" scope="request">
    <script>
		var $answer = $("#answer-result");
		var questions = [];
		<c:forEach items="${questions}" var="item">
			questions.push({
				"id" : ${item.id},
				"title" : '${item.title}',
				"question" : '${item.question}',
				"type" : ${item.type}
			})

		</c:forEach>

		var answers = {};
		<c:forEach items="${answers}" var="item">
			if (answers[${item.questionid}] === undefined) {
				answers[${item.questionid}] = [];
			}
			answers[${item.questionid}].push({
				"answer" : "${item.answer}",
				"count" : ${item.count},
				"questionid" : ${item.questionid}
			});
		</c:forEach>

		window.chartColors = {
			red: 'rgb(255, 99, 132)',
			orange: 'rgb(255, 159, 64)',
			yellow: 'rgb(255, 205, 86)',
			green: 'rgb(75, 192, 192)',
			blue: 'rgb(54, 162, 235)',
			purple: 'rgb(153, 102, 255)',
			grey: 'rgb(201, 203, 207)'
		};


		function makeData(data) {
			const labels = [];
			const datasets = [];
			var color = Chart.helpers.color;

			for (let i = 0; i < data.length; i++) {
				labels.push(data[i].answer);
				console.log(data[i]);
				console.log(data[i].answer);
				datasets.push({
					label: data[i].answer,
					backgroundColor: color(window.chartColors.purple).alpha(0.5).rgbString(),
					borderColor: window.chartColors.purple,
					borderWidth: 1,
					data: [
						data[i].count,
					]
				});
			}

			return {
				labels: labels,
				datasets: datasets
			};
		}


		function makeResultType0(selecotr, result, qId) {
			var ctx = document.getElementById('c-' + qId).getContext('2d');
			window.myHorizontalBar = new Chart(ctx, {
				type: 'horizontalBar',
				data: makeData(result),
				options: {
					// Elements options apply to all of the options unless overridden in a dataset
					// In this case, we are setting the border of each horizontal bar to be 2px wide
					elements: {
						rectangle: {
							borderWidth: 2,
						}
					},
					responsive: true,
					legend: {
						position: 'right',
					}
				}
			});

		}

		function makeResultType1(selecotr, result) {
			var $ul = $("<ul />").addClass("list-group");
			for (let i = 0; i < result.length; i++) {
				console.log(result[i]);
				$ul.append(
						$("<li>").addClass("list-group-item").addClass("list-group-item-secondary").text(result[i].answer)
				);
			}
			selecotr.html($ul);
		}

		$(".result").each(function (item) {
			var current = $(this);
			console.log(current.find(".list")[0]);
			switch (current.data("q-type")) {
				case 1:
					makeResultType1(current, answers[current.data("q-id")]);
					break;
				case 0:
					makeResultType0(current, answers[current.data("q-id")], current.data("q-id"));
					break;

			}
		})

//		function makeResult0(question) {
//			for (let i = 0; i < answers[question.id].length; i++) {
//				var answer = answers[question.id][i];
//				console.log(answer);
//
//			}
//		}
//
//		for (let i = 0; i < questions.length; i++) {
//			var question = questions[i];
//			$answer.append(
//
//			);
//
//
//			switch (question.type) {
//				case 0:
//					makeResult0(question);
//					break;
//			}
//
//		}



		/*

        window.chartColors = {
            red: 'rgb(255, 99, 132)',
            orange: 'rgb(255, 159, 64)',
            yellow: 'rgb(255, 205, 86)',
            green: 'rgb(75, 192, 192)',
            blue: 'rgb(54, 162, 235)',
            purple: 'rgb(153, 102, 255)',
            grey: 'rgb(201, 203, 207)'
        };

        $.get("<c:url value="/account/surveys/result/answer"/>/${survey.id}", function (resp) {
            var ctx = document.getElementById('canvas').getContext('2d');
            window.myHorizontalBar = new Chart(ctx, {
                type: 'horizontalBar',
                data: makeData(resp),
                options: {
                    // Elements options apply to all of the options unless overridden in a dataset
                    // In this case, we are setting the border of each horizontal bar to be 2px wide
                    elements: {
                        rectangle: {
                            borderWidth: 2,
                        }
                    },
                    responsive: true,
                    legend: {
                        position: 'right',
                    }
                }
            });
        });
*/

    </script>
</c:set>