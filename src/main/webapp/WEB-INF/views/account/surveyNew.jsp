<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false"%>
<div class="pcoded-content">
	<div class="page-header card">
		<!-- <div class="row align-items-end">
			<div class="col-lg-8">
				<div class="page-header-title">
					<i class="feather icon-user bg-c-blue"></i>
					<div class="d-inline">
						<h5>새로운 설문지 작성</h5>
						<span>새로운 설문지를 작성합니다.</span>
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
						<div class="col-xl-12">
							<div class="card">
								<div class="card-header">
									<h5>새로운 설문지</h5>
								</div>
								<div class="card-block">
									<h4 class="sub-title">설문지의 기본 정보를 입력합니다.</h4>
									<div id="doc">
										<input type="hidden" name="id" id="id" />
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">설문 제목</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="title" />
											</div>
										</div>
										<!-- <div class="form-group row">
											<label class="col-sm-2 col-form-label">설문 분류</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="category" />
											</div>
										</div> -->
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">설문 소개</label>
											<div class="col-sm-10">
												<textarea name="detail" cols="5" class="form-control" placeholder="설명을 입력하십시오."></textarea>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">인당 배당액</label>
											<div class="col-sm-2">
												<input type="text" class="form-control" id="unitcost" name="unitcost" />
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">설문 참여 인원</label>
											<div class="col-sm-2">
												<input type="text" class="form-control" id="people" />
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">설문 총배당액</label>
											<div class="col-sm-2">
												<input type="text" class="form-control" id="totalcost" name="totalcost" readonly="readonly" />	
											</div>
											<div class="col">
												<div class="form-control-static mt-2 f-14 text-right text-success">
													현재 사용 가능 포인트 : <fmt:formatNumber value="${user.point }" maxFractionDigits="3" /> P</fmt>
													<a href="<c:url value="/account/charge" />" class="btn btn-primary btn-mini"><i class="fa fa-bolt mr-0"></i></a>
												</div>
											</div>
										</div>
										<!-- <div class="form-group row">
											<label class="col-sm-2 col-form-label">설문 종료 시간</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="to" />
											</div>
										</div> -->
									</div>
									<h4 class="sub-title">설문대상을 제한합니다.
										<input type="checkbox" data-toggle="toggle" data-size="sm" id="exclude-toggle">
									</h4>
									<div id="exclude" style="display: none">
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">연령대</label>
											<div class="btn-group-toggle" data-toggle="buttons" id="age-range">
												<label class="btn btn-primary btn-sm">
													<input type="checkbox" name="age" value="all"> 전체
												</label>
												<label class="btn btn-primary btn-sm">
													<input type="checkbox" name="age" value="10"> 10대
												</label>
												<label class="btn btn-primary btn-sm">
													<input type="checkbox" name="age" value="20"> 20대
												</label>
												<label class="btn btn-primary btn-sm">
													<input type="checkbox" name="age" value="30"> 30대
												</label>
												<label class="btn btn-primary btn-sm">
													<input type="checkbox" name="age" value="40"> 40대
												</label>
												<label class="btn btn-primary btn-sm">
													<input type="checkbox" name="age" value="50"> 50대
												</label>
												<label class="btn btn-primary btn-sm">
													<input type="checkbox" name="age" value="60"> 60대+
												</label>
											</div>
										</div>

										<div class="form-group row">
											<label class="col-sm-2 col-form-label">성별</label>
											<div class="btn-group-toggle" data-toggle="buttons" id="gender">
												<label class="btn btn-primary btn-sm">
													<input type="checkbox" name="gender" value="all"> 전체
												</label>
												<label class="btn btn-primary btn-sm">
													<input type="checkbox" name="gender" value="M"> 남성
												</label>
												<label class="btn btn-primary btn-sm">
													<input type="checkbox" name="gender" value="F"> 여성
												</label>
											</div>
										</div>

										<div class="form-group row">
											<label class="col-sm-2 col-form-label">지역 </label>
											<div class="btn-group-toggle" data-toggle="buttons" id="region">
												<label class="btn btn-primary btn-sm">
													<input type="checkbox" name="region" value="all"> 전체
												</label>
												<c:forEach var="item" items="${regions}">
													<label class="btn btn-primary btn-sm">
														<input type="checkbox" name="region" value="<c:out value="${item}" />" > <c:out value="${item}"></c:out>
													</label>
												</c:forEach>

											</div>
										</div>
									</div>


									<h4 class="sub-title">설문지의 문항들을 추가하여 입력합니다.</h4>
									<div id="listQuestion">
										<div class="item">
											<input type="hidden" class="q-id" />
											<div class="m-0 question-edit">
												<div class="card">
													<div class="card-block">
														<div class="row">
															<div class="col-sm-4">
																<input type="text" class="form-control form-txt-primary question-title" placeholder="문항 제목을 작성하세요." />
															</div>
															<div class="col-sm-4">
																<div class="row">
																	<div class="col">
																		<label class="col-form-label">문항의 유형 :</label>
																	</div>
																	<div class="col">
																		<select class="form-control question-type">
																			<option value="0">객관식</option>
																			<option value="1">주관식</option>
																		</select>
																	</div>
																</div>
															</div>
														</div>
														<p class="text-muted">문항의 제목과 유형을 선택한 후 내용을 작성하시면 됩니다.</p>
														<div class="row">
															<div class="col-12">
																<textarea rows="5" class="form-control question-content d-none" placeholder="설문 문항을 작성해 주십시오."></textarea>
															</div>
														</div>
														<div class="row mt-4 question-options">
															<div class="col-12">
																<div class="row form-group">
																	<label class="col-sm-2 col-form-label">선택 항목</label>
																	<div class="col-sm-10 input-group input-group-button">
																		<input type="text" class="form-control form-control-primary" placeholder="선택 문항을 입력하십시오.">
																		<div class="input-group-append">
																			<button class="btn btn-primary option-del" type="button"><i class="fa fa-times"></i></button>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-12">
																<div class="row form-group">
																	<label class="col-sm-2 col-form-label">선택 항목</label>
																	<div class="col-sm-10 input-group input-group-button">
																		<input type="text" class="form-control form-control-primary" placeholder="선택 문항을 입력하십시오.">
																		<div class="input-group-append">
																			<button class="btn btn-primary option-del" type="button"><i class="fa fa-times"></i></button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-12 text-right add-options-link">
															<a href="#" class="b-b-primary text-primary add-options">선택 항목 추가</a>
														</div>
													</div>
													<div class="card-footer text-center">
														<button type="button" class="btn btn-round question-save"><i class="fa fa-archive"></i> 저장</button>
														<button type="button" class="btn btn-round question-cancel"><i class="fa fa-times"></i> 취소</button>
													</div>
												</div>
											</div>
											<div class="m-0 question-view d-none">
												<div class="card">
													<div class="card-header">
														<h5 class="view-title"></h5>
														<div class="card-header-right">
															<ul class="list-unstyled card-mini-option">
																<li class="first-opt"><i class="feather icon-chevron-left open-card-option"></i></li>
																<li><i class="feather icon-edit edit-card"></i></li>
																<li><i class="feather icon-trash del-card"></i></li>
																<li><i class="feather icon-chevron-left open-card-option"></i></li>
															</ul>
														</div>
													</div>
													<div class="card-block">
													<h4 class="sub-title view-type"></h4>
													<p class="view-content"></p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="text-center">
										<button type="button" class="btn btn-round d-none" id="addQuestion"><i class="fa fa-plus"></i> 새로운 문항 추가</button>
									</div>
								</div>
								<div class="card-footer">
									<div class="text-right">
										<button type="button" id="save" class="btn btn-primary col-sm-12 mb-2">저장하고 닫기</button>
										<button type="button" id="cancel" class="btn col-sm-12 mb-2">취소</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<c:set var="js" scope="request">
	<script>
		$("input[name=age]").change(function() {
			if ($(this).val() === "all") {
				$("input[name=age]").click();
			}
		});

		$("input[name=gender]").change(function() {
			if ($(this).val() === "all") {
				$("input[name=gender]").click();
			}
		});

		$("input[name=region]").change(function() {
			if ($(this).val() === "all") {
				$("input[name=region]").click();
			}
		});


		$("#exclude-toggle").change(function() {
			if ($(this).prop('checked')) {
				$("#exclude").show();
			} else {
				console.log("TODO Reset Event ");
				$("#exclude").hide();
			}

		})

		function updateTotalCost(countItem) {
			var totalcost = Number($("#unitcost").val())*countItem*$("#people").val();

			if(totalcost > ${user.point }) {
				if(confirm("보유한 포인트보다 필요한 포인트의 량이 많습니다. 충전하시겠습니까?")) {
					location.href="<c:url value="/account/charge" />";
				}
			} else {
				$("#totalcost").val(totalcost);
			}
		}

		$(function() {

			$("#people, #unitcost").keyup(function() {
				updateTotalCost($("#listQuestion > .item").length);
			});

			$("#save").click(function() {
				if (confirm("저장 후에는 항목을 수정하실 수 없습니다. 질문과 항목을 모두 확인하셨습니까?") == false) {
					return false;
				}
				console.log($("#doc").find("select, textarea, input").serialize());

				if($("#id").val() === "") {
					$.post("saveSurveyDoc", $("#doc").find("select, textarea, input").serialize(), function(id) {
						$("#id").val(id);

						$("#listQuestion > .item").each(function(i) {
							var currentItem = $(this);
							var questionItem = {
								surveyid : id,
								title : $(this).find(".question-view").find(".view-title").html(),
								question : $(this).find(".question-view").find(".view-content").html(),
								type : $(this).find(".question-edit").find(".question-type").val(),
							};

							$.post("saveQuestion", questionItem, function(questionId) {
								currentItem.find(".q-id").val(questionId);

								if(currentItem.find(".question-edit").find(".question-type").val() === "0") {
									currentItem.find(".question-edit").find(".question-options").children().each(function(i) {
										var optionItem = {
											questionid : questionId,
											option : $(this).find("input").val(),
											type : 0
										};

										$.post("saveOption", optionItem);
									});
								}
							});
						});
					});
				} else {
					$.post("updateSurveyDoc", $("#doc").find("select, textarea, input").serialize(), function() {
						$("#listQuestion > .item").each(function(i) {
							var currentItem = $(this);
							if(currentItem.find(".q-id").val() !== "") {
								var questionItem = {
									id : currentItem.find(".q-id").val(),
									title : currentItem.find(".question-view").find(".view-title").html(),
									question : currentItem.find(".question-view").find(".view-content").html(),
									type : currentItem.find(".question-edit").find(".question-type").val()
								};

								$.post("updateQuestion", questionItem, function() {
									$.post("deleteOptions", {questionId : currentItem.find(".q-id").val()}, function() {
										if(currentItem.find(".question-edit").find(".question-type").val() === "0") {
											currentItem.find(".question-edit").find(".question-options").children().each(function(i) {
												var optionItem = {
													questionid : currentItem.find(".q-id").val(),
													option : $(this).find("input").val(),
													type : 0
												};

												$.post("saveOption", optionItem);
											});
										}
									});
								});
							} else {
								var questionItem = {
									surveyid : $("#id").val(),
									title : currentItem.find(".question-view").find(".view-title").html(),
									question : currentItem.find(".question-view").find(".view-content").html(),
									type : currentItem.find(".question-edit").find(".question-type").val()
								};

								$.post("saveQuestion", questionItem, function(questionId) {
									currentItem.find(".q-id").val(questionId);

									if(currentItem.find(".question-edit").find(".question-type").val() === "0") {
										currentItem.find(".question-edit").find(".question-options").children().each(function(i) {
											var optionItem = {
												questionid : questionId,
												option : $(this).find("input").val(),
												type : 0
											};

											$.post("saveOption", optionItem);
										});
									}
								});
							}
						});
					});
				}

				alert("저장되었습니다.");
				location.href="/koreasurvey/account/surveys/";
			});

			$("#close").click(function() {
				$("#save").trigger("click");
			});

			$("#cancel").click(function() {
				location.href="/koreasurvey/account/surveys/";
			});
			$(document).on("change", ".question-type", function() {
				console.log("q-type",$(this).val());
				console.log($(this).parent().parent().parent().parent().parent().find(".question-content"));
				if($(this).val() === "0") {
					$(this).parent().parent().parent().parent().parent().find(".add-options-link").removeClass("d-none");
					$(this).parent().parent().parent().parent().parent().find(".question-options").removeClass("d-none");
					$(this).parent().parent().parent().parent().parent().find(".question-content").addClass("d-none");

				} else {
					$(this).parent().parent().parent().parent().parent().find(".add-options-link").addClass("d-none");
					$(this).parent().parent().parent().parent().parent().find(".question-options").addClass("d-none");
					$(this).parent().parent().parent().parent().parent().find(".question-content").removeClass("d-none");
				}
			});

			$("#addQuestion").click(function() {
				$.get("/koreasurvey/resources/import.txt", function(result) {
					$("#listQuestion").append(result);

					/* tinymce.init({selector:'textarea',
                      //plugins: 'print preview importcss searchreplace autolink autosave save directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount textpattern noneditable help formatpainter permanentpen charmap mentions linkchecker emoticons',
                      menu: {
                        tc: {
                          title: 'TinyComments',
                          items: 'addcomment showcomments deleteallconversations'
                        }
                      },
                      menubar: 'file edit view insert format tools table tc help',
                      toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist checklist | forecolor backcolor casechange permanentpen formatpainter removeformat | pagebreak | charmap emoticons | fullscreen  preview save | link anchor codesample',
                      content_css: [
                        '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
                        '//www.tiny.cloud/css/codepen.min.css'
                      ],
                      importcss_append: true,
                      height: 100,
                      image_caption: true,
                      quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
                      noneditable_noneditable_class: "mceNonEditable",
                      toolbar_drawer: 'sliding',
                      tinycomments_mode: 'embedded',
                      content_style: ".mymention{ color: gray; }",
                      contextmenu: "link image imagetools table configurepermanentpen"
                    }); */



					$(".add-options").click(function() {
						html = "<div class=\"col-12\">";
						html += "<div class=\"row form-group\">";
						html += "<label class=\"col-sm-2 col-form-label\">선택 항목</label>";
						html += "<div class=\"col-sm-10 input-group input-group-button\">";
						html += "<input type=\"text\" class=\"form-control form-control-primary\" placeholder=\"선택 문항을 입력하십시오.\">";
						html += "<div class=\"input-group-append\">";
						html += "<button class=\"btn btn-primary option-del\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
						html += "</div>";
						html += "</div>";
						html += "</div>";
						html += "</div>";

						$(this).parent().parent().find(".question-options").append(html);

						$(".option-del").click(function() {
							$(this).parent().parent().parent().parent().remove();
						});

						return false;
					});

					$(".question-save").click(function() {
						updateTotalCost($("#listQuestion > .item").length);

						var editBox = $(this).parent().parent().parent().parent().find(".question-edit");
						var viewBox = $(this).parent().parent().parent().parent().find(".question-view");

						if(editBox.find(".question-title").val() === "") {
							alert("문항 제목이 비었습니다. 입력해주세요.");
							return;
						}

						viewBox.find(".view-title").html(editBox.find(".question-title").val());
						if(editBox.find(".question-type").val() === "0") {
							viewBox.find(".view-type").html("객관식");

							if(editBox.find(".question-options").children().length < 2) {
								alert("객관식의 선택항목은 2이상이어야 합니다.");
								return;
							}

							for(var i=0; i < editBox.find(".question-options").children().length; i++) {
								if(editBox.find(".question-options").children().eq(i).find("input").val() === "") {
									alert("선택항목 중 비어있는 항목이 있습니다. 입력해주세요.");
									return;
								}
							}
						} else {
							viewBox.find(".view-type").html("주관식");
						}

						/*editBox.find(".question-content").val(tinyMCE.activeEditor.getContent());
                        viewBox.find(".view-content").html(tinyMCE.activeEditor.getContent());*/
						viewBox.find(".view-content").html(editBox.find(".question-content").val());

						editBox.addClass("d-none");
						viewBox.removeClass("d-none");
						$("#addQuestion").removeClass("d-none");
						$(".card-header-right .card-mini-option").removeClass("d-none");
					});

					$(".card-header-right .card-mini-option .open-card-option").unbind();

					$(".card-header-right .card-mini-option .open-card-option").on('click',function() {
						var $this = $(this);
						if ($this.hasClass('icon-x')) {
							$this.parents('.card-mini-option').animate({
								'width' : '30px',
							});
							$this.parents('.card-mini-option')
									.children('li').children(
									".open-card-option")
									.removeClass("icon-x").fadeIn(
									'slow');
							$this.parents('.card-mini-option')
									.children('li').children(
									".open-card-option")
									.addClass("icon-chevron-left")
									.fadeIn('slow');
							$this.parents('.card-mini-option').children(
									".first-opt").fadeIn();
						} else {
							$this.parents('.card-mini-option').animate({
								'width' : '78px',
							});
							$this.parents('.card-mini-option')
									.children('li').children(
									".open-card-option")
									.addClass("icon-x").fadeIn('slow');
							$this.parents('.card-mini-option')
									.children('li').children(
									".open-card-option")
									.removeClass("icon-chevron-left")
									.fadeIn('slow');
							$this.parents('.card-mini-option').children(
									".first-opt").fadeOut();
						}
					});

					$(".del-card").click(function() {
						if(confirm("해당 문항을 삭제하시겠습니까?")) {
							updateTotalCost($("#listQuestion > .item").length-1);
							$(this).parent().parent().parent().parent().parent().remove();
						}
					});

					$(".edit-card").click(function() {
						$(this).parent().parent().parent().parent().parent().parent().parent().find(".question-edit").removeClass("d-none");
						$(this).parent().parent().parent().parent().parent().parent().parent().find(".question-view").addClass("d-none");
						$("#addQuestion").addClass("d-none");
						$(".card-header-right .card-mini-option").addClass("d-none");

						$(".question-cancel").unbind();
						$(".question-cancel").click(function() {
							$(this).parent().parent().parent().parent().find(".question-edit").addClass("d-none");
							$(this).parent().parent().parent().parent().find(".question-view").removeClass("d-none");

							$("#addQuestion").removeClass("d-none");
							$(".card-header-right .card-mini-option").removeClass("d-none");
						});
					});

					$(".question-cancel").click(function() {
						$(this).parent().parent().parent().parent().remove();
					});

				});

				$("#emptyInfo").addClass("d-none");
				$("#addQuestion").addClass("d-none");
				$(".card-header-right .card-mini-option").addClass("d-none");
			});

			$(".question-type").change(function() {
				if($(this).val() === "0") {
					$(this).parent().parent().parent().parent().parent().find(".add-options-link").removeClass("d-none");
					$(this).parent().parent().parent().parent().parent().find(".question-options").removeClass("d-none");
				} else {
					$(this).parent().parent().parent().parent().parent().find(".add-options-link").addClass("d-none");
					$(this).parent().parent().parent().parent().parent().find(".question-options").addClass("d-none");
				}
			});

			$(".add-options").click(function() {
				html = "<div class=\"col-12\">";
				html += "<div class=\"row form-group\">";
				html += "<label class=\"col-sm-2 col-form-label\">선택 항목</label>";
				html += "<div class=\"col-sm-10 input-group input-group-button\">";
				html += "<input type=\"text\" class=\"form-control form-control-primary\" placeholder=\"선택 문항을 입력하십시오.\">";
				html += "<div class=\"input-group-append\">";
				html += "<button class=\"btn btn-primary option-del\" type=\"button\"><i class=\"fa fa-times\"></i></button>";
				html += "</div>";
				html += "</div>";
				html += "</div>";
				html += "</div>";

				$(this).parent().parent().find(".question-options").append(html);

				$(".option-del").click(function() {
					$(this).parent().parent().parent().parent().remove();
				});

				return false;
			});

			$(".question-save").click(function() {
				updateTotalCost($("#listQuestion > .item").length);

				var editBox = $(this).parent().parent().parent().parent().find(".question-edit");
				var viewBox = $(this).parent().parent().parent().parent().find(".question-view");

				if(editBox.find(".question-title").val() === "") {
					alert("문항 제목이 비었습니다. 입력해주세요.");
					return;
				}

				viewBox.find(".view-title").html(editBox.find(".question-title").val());
				if(editBox.find(".question-type").val() === "0") {
					viewBox.find(".view-type").html("객관식");

					if(editBox.find(".question-options").children().length < 2) {
						alert("객관식의 선택항목은 2이상이어야 합니다.");
						return;
					}

					for(var i=0; i < editBox.find(".question-options").children().length; i++) {
						if(editBox.find(".question-options").children().eq(i).find("input").val() === "") {
							alert("선택항목 중 비어있는 항목이 있습니다. 입력해주세요.");
							return;
						}
					}
				} else {
					viewBox.find(".view-type").html("주관식");
				}

				/*editBox.find(".question-content").val(tinyMCE.activeEditor.getContent());
                viewBox.find(".view-content").html(tinyMCE.activeEditor.getContent());*/
				viewBox.find(".view-content").html(editBox.find(".question-content").val());

				editBox.addClass("d-none");
				viewBox.removeClass("d-none");
				$("#addQuestion").removeClass("d-none");
				$(".card-header-right .card-mini-option").removeClass("d-none");
			});

			$(".card-header-right .card-mini-option .open-card-option").unbind();

			$(".card-header-right .card-mini-option .open-card-option").on('click',function() {
				var $this = $(this);
				if ($this.hasClass('icon-x')) {
					$this.parents('.card-mini-option').animate({
						'width' : '30px',
					});
					$this.parents('.card-mini-option')
							.children('li').children(
							".open-card-option")
							.removeClass("icon-x").fadeIn(
							'slow');
					$this.parents('.card-mini-option')
							.children('li').children(
							".open-card-option")
							.addClass("icon-chevron-left")
							.fadeIn('slow');
					$this.parents('.card-mini-option').children(
							".first-opt").fadeIn();
				} else {
					$this.parents('.card-mini-option').animate({
						'width' : '78px',
					});
					$this.parents('.card-mini-option')
							.children('li').children(
							".open-card-option")
							.addClass("icon-x").fadeIn('slow');
					$this.parents('.card-mini-option')
							.children('li').children(
							".open-card-option")
							.removeClass("icon-chevron-left")
							.fadeIn('slow');
					$this.parents('.card-mini-option').children(
							".first-opt").fadeOut();
				}
			});

			$(".del-card").click(function() {
				if(confirm("해당 문항을 삭제하시겠습니까?")) {
					updateTotalCost($("#listQuestion > .item").length-1);
					$(this).parent().parent().parent().parent().parent().remove();
				}
			});

			$(".edit-card").click(function() {
				$(this).parent().parent().parent().parent().parent().parent().parent().find(".question-edit").removeClass("d-none");
				$(this).parent().parent().parent().parent().parent().parent().parent().find(".question-view").addClass("d-none");
				$("#addQuestion").addClass("d-none");
				$(".card-header-right .card-mini-option").addClass("d-none");

				$(".question-cancel").unbind();
				$(".question-cancel").click(function() {
					$(this).parent().parent().parent().parent().find(".question-edit").addClass("d-none");
					$(this).parent().parent().parent().parent().find(".question-view").removeClass("d-none");

					$("#addQuestion").removeClass("d-none");
					$(".card-header-right .card-mini-option").removeClass("d-none");
				});
			});

			$(".question-cancel").click(function() {
				$(this).parent().parent().parent().parent().remove();
			});

			/* tinymce.init({selector:'textarea',
                      //plugins: 'print preview importcss searchreplace autolink autosave save directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount textpattern noneditable help formatpainter permanentpen charmap mentions linkchecker emoticons',
                      menu: {
                        tc: {
                          title: 'TinyComments',
                          items: 'addcomment showcomments deleteallconversations'
                        }
                      },
                      menubar: 'file edit view insert format tools table tc help',
                      toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist checklist | forecolor backcolor casechange permanentpen formatpainter removeformat | pagebreak | charmap emoticons | fullscreen  preview save | link anchor codesample',
                      content_css: [
                        '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
                        '//www.tiny.cloud/css/codepen.min.css'
                      ],
                      importcss_append: true,
                      height: 100,
                      image_caption: true,
                      quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
                      noneditable_noneditable_class: "mceNonEditable",
                      toolbar_drawer: 'sliding',
                      tinycomments_mode: 'embedded',
                      content_style: ".mymention{ color: gray; }",
                      contextmenu: "link image imagetools table configurepermanentpen"
                    }); */
		});
	</script>
</c:set>