<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/beauate/ucommon/include.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" scope="request"/>
<fmt:parseNumber
    value="${ now.time / (1000*60*60*24) }"
    integerOnly="true" var="nowDays" scope="request"/>
<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1280"/>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BEAUATE</title>
<link rel="stylesheet" type="text/css" href="${cssPath}/contents.css"/>
<link rel="stylesheet" type="text/css" href="${cssPath}/contents-my1.css"/>
<script type="text/javascript" src="${scriptPath}/jquery.min.js"></script>
<script type="text/javascript" src="${scriptPath}/jquery.modal.min.js"></script>
<script type="text/javascript" src="${scriptPath}/swiper.min.js"></script>
<script type="text/javascript" src="${scriptPath}/ui.front.js"></script>
<script type="text/javascript" src="${scriptPath}/library.js"></script>
</head>
<body>
<div id="wrap" class="offline">
	<div id="skip">
		<a href="#container">본문 내용 바로가기</a>
	</div>
	<!-- header -->
	<div id="header">
		<jsp:include page="/WEB-INF/jsp/beauate/ucommon/top.jsp" flush="false" />
	</div>
	<!-- //header -->
	<div id="container">

		<!-- content -->
		<div class="content">
			<div class="page-title">
				<div class="content-inner">
					<h2 class="title">
						<c:choose>
						<c:when test="${classCtSt==1}">
						<img src="${imagePath}/txt/tit_hairclass.png" alt="hair class">
						</c:when>
						<c:when test="${classCtSt==2}">
						<img src="${imagePath}/txt/tit_hairclass.png" alt="hair class">
						</c:when>
						<c:when test="${classCtSt==3}">
						<img src="${imagePath}/txt/tit_hairclass.png" alt="hair class">
						</c:when>
						<c:when test="${classCtSt==4}">
						<img src="${imagePath}/txt/tit_hairclass.png" alt="hair class">
						</c:when>
						<c:when test="${classCtSt==5}">
						<img src="${imagePath}/txt/tit_hairclass.png" alt="hair class">
						</c:when>
						<c:when test="${classCtSt==6}">
						<img src="${imagePath}/txt/tit_hairclass.png" alt="hair class">
						</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
					</h2>
				</div>
			</div>
			<!-- 뷰티 type  -->
			<div class="content-inner">
				<div class="beauty-list">
					<h3>뷰티전문가를 만나보세요</h3>
					<ul>
					<c:if test="${fn:length(classCategoryList)>0}">
						<c:forEach var="classCategory" items="${classCategoryList}" begin="0" end="${fn:length(classCategoryList)-1}">
							<li><a href="${basePath}/class/a/t/classList.do?classCtSt=${classCategory.mclsCd}"">${classCategory.mclsNm}</a></li>
						</c:forEach>
					</c:if>
					</ul>
				</div>
			</div>
			<!--//뷰티 type -->
			<!-- 스페셜  -->
			<div class="content-inner">
				<div class="specialmentor">
					<h3>special mentor 스페셜 뷰아떼 멘토</h3>
					<div class="specialmentor-inner">
						<div class="cont-left">
							<div class="mentor-list">
							<c:if test="${fn:length(categorySpecialMentoList)>0}">
								<!-- Swiper -->
							   <div class="swiper-container">
							    <div class="swiper-wrapper">
							<c:forEach var="categorySpecialMentor" items="${categorySpecialMentoList}" begin="0" end="${fn:length(categorySpecialMentoList)-1}" varStatus="status">
							      <div class="swiper-slide">
									<a href="#">
										<div class="mentor-link">
											<p class="txt-name">${categorySpecialMentor.txtName}</p>
											<p class="txt-msg01">${categorySpecialMentor.txtMsg1}</p>
											<p class="txt-msg02">${categorySpecialMentor.txtMsg22}</p>
										</div>
									</a>
							      </div>
						    </c:forEach>
							    </div>
							    <div class="swiper-info">
									 <div class="swiper-button-prev"></div>
									 <div class="swiper-pagination"></div>
									 <div class="swiper-button-next"></div>
							    </div>
							  </div>
							  <script tyle="text/javascript">
							    var swiper = new Swiper('.mentor-list .swiper-container', {
							      pagination: {
							        el: '.swiper-pagination',
							        type: 'fraction',
							      },
							      navigation: {
							        nextEl: '.swiper-button-next',
							        prevEl: '.swiper-button-prev',
							      },
							    });
							  </script>
							</div><!-- mentor-list -->
							</c:if>
							<div class="link-mentor">
								<a href="#">
									<span class="txt01">멘토지원</span>
									<span class="txt02">세미나 등록을 원하시면</span>
								</a>
							</div>
						</div>
						<div class="cont-right">
							<ul class="product-list-01" data-column="2">
								<c:if test="${fn:length(classListTop)>0}">
									<c:forEach var="cls" items="${classListTop}" begin="0" end="${fn:length(classListTop)-1}">
									<fmt:parseDate var="parsedClsSDt" value="${cls.classStartDt}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
									<fmt:formatDate var="etcDtStr" value="${parsedClsSDt}" pattern="yyyy-MM-dd(E)" />
								    <fmt:parseNumber
								    value="${ parsedClsSDt.time / (1000*60*60*24) }"
								    integerOnly="true" var="classDays" scope="request"/>
									<c:set var="img" value=""/>
								    <c:if test="${fn:length(cls.classFileList)>0}">
										<c:forEach var="clsImg" items="${cls.classFileList}" begin="0" end="${fn:length(cls.classFileList)-1}">
											<c:if test="${clsImg.fileCn=='M1'}">
												<c:set var="path" value="${fn:split(clsImg.fileStreCours, '/')}" />
												<c:set var="path" value="${path[fn:length(path)-1]}" />
												<c:set var="path" value="${fn:replace(path,'\\\\','/')}" />
												<c:set var="img" value="${uploadPath}${path}/${clsImg.streFileNm}"/>
											</c:if>
										</c:forEach>
									</c:if>
									<li>
										<a href="${basePath}/class/a/t/classDetail.do?classId=${cls.classId}">
											<div class="thumb">
												<img src="${img}" alt="" />
												<c:choose>
													<c:when test="${cls.classStNm != null && cls.classStNm !='' }">
														<c:choose>
															<c:when test="${cls.classStNm  == '오픈전' || cls.classStNm  == '오픈중' || cls.classStNm  == '신청마감'}">
																<c:choose>
																<c:when test="${classDays-nowDays<=7 and classDays-nowDays>0}">
																	<div class="count"><span>${classDays-nowDays}일 남았어요!</span></div>
																</c:when>
																<c:otherwise>
																</c:otherwise>
																</c:choose>
															</c:when>
															<c:when test="${cls.classStNm  == '종료'}">
																<div class="soldout">${cls.classStNm}</div>
																<div class="soldout-txt">${cls.classStNm}</div>
															</c:when>
															<c:otherwise>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<c:choose>
														<c:when test="${classDays-nowDays<=7 and classDays-nowDays >0}">
															<div class="count"><span>${classDays-nowDays}일 남았어요!</span></div>
														</c:when>
														<c:when test="${classDays-nowDays<0}">
															<div class="soldout"></div>
															<div class="soldout-txt">신청마감</div>
														</c:when>
														<c:otherwise>
														</c:otherwise>
														</c:choose>
													</c:otherwise>
											</c:choose>
											</div>
											<div class="title">${cls.classAreaStNm}</div>
											<div class="desc">${cls.classTitle}</div>
											<div class="etc">
												<span>개강일</span>
												<span>${etcDtStr}</span>
											</div>
										</a>
									</li>
									</c:forEach>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--//스페셜 -->
			<!-- best hair class   -->
			<div class="besthair">
				<div class="content-inner">
					<div class="besthair-title">
						<h3>
						<c:choose>
						<c:when test="${classCtSt==1}">
						Hair
						</c:when>
						<c:when test="${classCtSt==2}">
						MakeUp
						</c:when>
						<c:when test="${classCtSt==3}">
						Eyelashes
						</c:when>
						<c:when test="${classCtSt==4}">
						Waxing
						</c:when>
						<c:when test="${classCtSt==5}">
						Nail
						</c:when>
						<c:when test="${classCtSt==6}">
						Etc
						</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
						Class </h3>
						<span class="stxt">지금 뷰아떼에서 핫한 멘토 수업을 만나보세요</span>
						<span class="stitle-best">BEST</span>
					</div>
					<div class="besthair-list">
					 <!-- swiper -->
					  <div class="swiper-container">
						<div class="swiper-wrapper">
						<c:if test="${fn.length(categoryBestClassList)>0}">
							<c:forEach var="cls" items="${categoryBestClassList}" begin="0" end="${fn:length(categoryBestClassList)-1}">
							<c:if test="${status.count == 1}">
							  <div class="swiper-slide">
							    <ul class="product-list-02" data-column="4">
							</c:if>
							<li>
								<a href="#">
									<div class="thumb">
									<c:choose>
									<c:when test="${specialMento.bannerFileNm == null or specialMento.bannerFileNm == ''}">
										<img src="${imagePath}${specialMento.bannerFileNm}" alt="" />
									</c:when>
									<c:otherwise>
										<img src="${specialMento.bannerUrl}" alt="" />
									</c:otherwise>
									</c:choose>
									</div>
								</a>
							</li>
							<c:choose>
							<c:when test="${status.count mod 4==0}">
							    </ul>
							  </div>
							<c:if test="${status.count!=fn:length(categoryBestClassList)}">
							  <div class="swiper-slide">
							    <ul class="product-list-02" data-column="4">
							</c:if>
							</c:when>
							<c:when test="${status.count mod 4!=0 and status.count==fn:length(categoryBestClassList)}">
							    </ul>
							  </div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
							</c:choose>
						  </c:forEach>
						  </c:if>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					  </div>
					  <script type="text/javascript">
						var swiper = new Swiper('.besthair-list .swiper-container', {
						  navigation: {
							nextEl: '.swiper-button-next',
							prevEl: '.swiper-button-prev',
						  },
						});
					  </script>
					</div>
				</div>
			</div>
			<!--//best hair class  -->
			<!-- hurruy up -->
			<div class="content-inner">
				<div class="hurruyup">
					<h3>hurruyup class 마감임박</h3>
					<ul class="product-list-01" data-column="4">
						<c:if test="${fn:length(classListHurry)>0}">
						<c:forEach var="cls" items="${classListHurry}" begin="0" end="${fn:length(classListHurry)-1}">
						<fmt:parseDate var="parsedClsSDt" value="${cls.classStartDt}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
						<fmt:formatDate var="etcDtStr" value="${parsedClsSDt}" pattern="yyyy-MM-dd(E)" />
					    <fmt:parseNumber
					    value="${ parsedClsSDt.time / (1000*60*60*24) }"
					    integerOnly="true" var="classDays" scope="request"/>
					    <c:set var="img" value=""/>
					    <c:if test="${fn:length(cls.classFileList)>0}">
							<c:forEach var="clsImg" items="${cls.classFileList}" begin="0" end="${fn:length(cls.classFileList)-1}">
								<c:if test="${clsImg.fileCn=='M1' }">
									<c:set var="path" value="${fn:split(clsImg.fileStreCours, '/')}" />
									<c:set var="path" value="${path[fn:length(path)-1]}" />
									<c:set var="path" value="${fn:replace(path,'\\\\','/')}" />
									<c:set var="img" value="${uploadPath}${path}/${clsImg.streFileNm}"/>
								</c:if>
							</c:forEach>
						</c:if>
							<li>
								<a href="${basePath}/class/a/t/classDetail.do?classId=${cls.classId}">
									<div class="thumb">
										<img src="${img}" alt="" />
											<c:choose>
												<c:when test="${cls.classStNm != null && cls.classStNm !='' }">
													<c:choose>
														<c:when test="${cls.classStNm  == '오픈전' || cls.classStNm  == '오픈중' || cls.classStNm  == '신청마감'}">
															<c:choose>
															<c:when test="${classDays-nowDays<=7 and classDays-nowDays>0}">
																<div class="count"><span>${classDays-nowDays}일 남았어요!</span></div>
															</c:when>
															<c:otherwise>
															</c:otherwise>
															</c:choose>
														</c:when>
														<c:when test="${cls.classStNm  == '종료'}">
															<div class="soldout">${cls.classStNm}</div>
															<div class="soldout-txt">${cls.classStNm}</div>
														</c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<c:choose>
													<c:when test="${classDays-nowDays<=7 and classDays-nowDays >0}">
														<div class="count"><span>${classDays-nowDays}일 남았어요!</span></div>
													</c:when>
													<c:when test="${classDays-nowDays<0}">
														<div class="soldout"></div>
														<div class="soldout-txt">신청마감</div>
													</c:when>
													<c:otherwise>
													</c:otherwise>
													</c:choose>
												</c:otherwise>
										</c:choose>
									</div>
									<div class="title">${cls.classAreaStNm}</div>
									<div class="desc">${cls.classTitle}</div>
									<div class="etc">
										<span>개강일</span>
										<span>${etcDtStr}</span>
									</div>
								</a>
							</li>
					    </c:forEach>
					    </c:if>
					</ul>
				</div>
			</div>
			<!-- //hurruy up -->
			<!-- slider banner -->
			<c:if test="${fn:length(longBannerList)>0}">
			<div class="slider-banner">
				<div class="content-inner">
				   <!-- Swiper -->
				   <div class="swiper-container">
				    <div class="swiper-wrapper">
					<c:forEach var="banner" items="${longBannerList}" begin="0" end="${fn:length(longBannerList)-1}">
				      <div class="swiper-slide">
						<c:choose>
						<c:when test="${specialMento.bannerFileNm == null or specialMento.bannerFileNm == ''}">
						<img src="${imagePath}${specialMento.bannerFileNm}" alt="" />
						</c:when>
						<c:otherwise>
						<img src="${specialMento.bannerUrl}" alt="" />
						</c:otherwise>
						</c:choose>
				      </div>
				      </c:forEach>
				    </div>
				    <div class="swiper-info">
						 <div class="swiper-button-prev"></div>
						 <div class="swiper-pagination"></div>
						 <div class="swiper-button-next"></div>
				    </div>
				  </div>
				  <script tyle="text/javascript">
				    var swiper = new Swiper('.slider-banner .swiper-container', {
				      pagination: {
				        el: '.swiper-pagination',
				        type: 'fraction',
				      },
				      navigation: {
				        nextEl: '.swiper-button-next',
				        prevEl: '.swiper-button-prev',
				      },
				    });
				  </script>
				</div>
			</div>
			</c:if>
			<!-- slider banner -->
			<!-- 검색결과 -->
			<div id="classBottomList" class="content-inner">
				<div class="sr">부분 영역 페이징처리 때문에 form 엘리먼트를 추가함. 퍼블리싱 수정 필요.</div>
				<form:form commandName="classVO" name="classBottomList" method="post" action="${basePath}/class/a/t/classListDtl.do">
		            <form:hidden path="pageIndex" id="pageIndex" />
		            <form:hidden path="sortSubject"/>
		            <form:hidden path="sortDescend"/>
		            <form:hidden path="classCtSt" value="${classCtSt}"/>
					<h3>전체</h3>
					<div class="sort-list">
						<form:select path="classAreaSt" style="width:90px;" id="classAreaSt">
							<option value="0">전체</option>
							<form:options items="${classAreaList}" itemLabel="mclsNm"  itemValue="mclsCd"/>
						</form:select>
					</div>
				</form:form>
				<dummy>
				<jsp:include page="/WEB-INF/jsp/beauate/class/lists/classBottomList.jsp" flush="false" />
				</dummy>
			</div>
			<!-- //검색결과 -->
		</div>
		<!-- //content -->


	</div>
	<!-- //container -->
	<script>
	function fn_ajaxList(pageNo){
		var forms = document.classBottomList;
		var listUrl = forms.action;
		forms.pageIndex.value = pageNo;
		var inputs = $('input',forms);
		var param = {};
		inputs.each(function(){
			param[this.name] = $(this).val();
		});
		var selects = $('select',forms);
		selects.each(function(){
			param[this.name] = $(this).val();
		});
		$.ajax({						
			type: 'POST',						
			url : listUrl,						
			data: param,						
			dataType: "html",						
			success: function(data){
				$("#classBottomList>dummy").empty();
				$("#classBottomList>dummy").append(data);				
			}					
		});		
	};
	$(document).ready(function($){
		$("#classBottomList select").on('change', function(e) {
			var forms = document.classBottomList;
			fn_ajaxList(forms.pageIndex.value);
	    });
	});
	</script>
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/beauate/ucommon/footer.jsp"%>
	<!-- //footer -->
</div>
</body>
</html>
