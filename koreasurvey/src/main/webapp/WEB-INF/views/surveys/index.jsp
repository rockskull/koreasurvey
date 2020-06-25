<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
					<div class="pcoded-content">
						<div class="page-header card">
							<%-- <div class="row align-items-end">
								<div class="col-lg-8">
									<div class="page-header-title">
										<i class="feather icon-layers bg-c-blue"></i>
										<div class="d-inline">
											<h5>현재 진행 중 인 설문들</h5>
											<span>현재 진행되고 있는 설문 목록을 확인할 수 있습니다.</span>
										</div>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="page-header-breadcrumb">
										<ul class=" breadcrumb breadcrumb-title">
											<li class="breadcrumb-item">
												<a href="<c:url value="/" />"><i class="feather icon-home"></i></a>
											</li>
										</ul>
									</div>
								</div>
							</div> --%>
						</div>
						
						<div class="pcoded-inner-content">
							<div class="main-body">
								<div class="page-wrapper">
									<div class="page-body">
									
										<div class="row" id="surveyArea">
											<div class="col-xl-12">
												<div class="card">
													<div class="card-block">
														<div class="row">
															<div class="col-xl-12">
																<div>
																	<span class="mr-2">
																		${surveyInfo.category }
																	</span>
																	<span class="badge badge-inverse-warning">
																		${surveyInfo.unitcost } P
																	</span>
																</div>
																<span class="f-w-700 f-26">
																	${surveyInfo.title }
																</span>
																<div>
																	<p class="text-muted m-t-15">${surveyInfo.detail }</p>
																</div>
															</div>
														</div>
														
														<c:forEach items="${listQuestions}" var="q">
														<div class="card q-card">
															<div class="card-header">
																<h5>${q.title }</h5>
																<input type="hidden" class="q-id" value="${q.id }" />
																<input type="hidden" class="q-type" value="${q.type }" />
															</div>
															<div class="card-block">
																<h4 class="sub-title">${q.question }</h4>
																<c:if test="${q.type eq 0}">
																<div class="row form-radio">
																	<c:forEach items="${q.options }" var="option">
																	<div class="radio radio-inline p-20">
																		<label>
																			<input type="radio" name="q-${q.id}" id="q-${q.id}" class="option" value="${option.option }">
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
													
													<div class="card-footer text-center">
														<button type="button" id="complete" class="btn btn-primary">설문 완료</button>
														<button type="button" id="cancle" class="btn">취소</button>
													</div>
												</div>
											</div>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
<c:set var="javascript" scope="request">
$(function() {
	/*tinymce.init({selector:'textarea',
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
			});*/
			
	$("#cancle").click(function() {
		location.href="/koreasurvey";
	});
	
	$("#complete").click(function() {
		var questionBlock = $(".q-card");
		var listAnswer = new Array();
		
		for(var i=0; i < questionBlock.length; i++) {
			if($(questionBlock.get(i)).find(".q-type").val() === "0") {
				if(typeof $(questionBlock.get(i)).find("input[name='q-"+$(questionBlock.get(i)).find(".q-id").val()+"']:checked").val() === "undefined")
				{
					alert("선택 설문항 중 선택되지 않은 문항이 있습니다. 모두 작성해 주세요.");
					return false;
				}
			}
		}
		
		for(var i=0; i < questionBlock.length; i++) {
			var answerText;
			
			if($(questionBlock.get(i)).find(".q-type").val() === "0") {
				answerText = $(questionBlock.get(i)).find("input[name='q-"+$(questionBlock.get(i)).find(".q-id").val()+"']:checked").val();
			} else {
				answerText = $(questionBlock.get(i)).find(".answer").val();
			}
			
			var answerObj = {
				surveyid: ${surveyInfo.id },
				questionid: $(questionBlock.get(i)).find(".q-id").val(),
				questioncontent: $(questionBlock.get(i)).find(".sub-title").html(),
				questiontype: $(questionBlock.get(i)).find(".q-type").val(),
				answer: answerText,
				rewardpoint: ${surveyInfo.unitcost }
			}
			
			listAnswer.push(answerObj);
		}
		
		$.post("submitAnswer", {reqJson : JSON.stringify(listAnswer)}, function(result) {
			alert("설문 조사를 완료하였습니다.");
			
			location.href="<c:url value="/" />";
		});
	});
});
</c:set>
