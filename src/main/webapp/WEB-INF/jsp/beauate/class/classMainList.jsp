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
			<div class="off_title">
				<div class="content-inner">
					<h2 class="title"><img src="${imagePath}/txt/tit_hairclass.png" alt="hair class"></h2>
				</div>
			</div>
			<!-- 뷰티 type  -->
			<div class="content-inner">
				<div class="off_list">
					<h3>뷰티전문가를 만나보세요</h3>
                    <p>뷰아떼가 소개하는 다양한 뷰티 오프라인 클래스</p>
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
			<c:if test="${fn:length(specialMentoList)>0}">
			<div class="besthair">
				<div class="content-inner">
				<div class="bestoff-title">
					<h3>off line Class </h3>
						<h3>Hair Class </h3>
						<span class="stxt">지금 뷰아떼에서 핫한 멘토 수업을 만나보세요</span>
						<span class="stitle">BEST</span>
					</div>
					<div class="besthair-list">
					 <!-- swiper -->
					  <div class="swiper-container">
						<div class="swiper-wrapper">
						<c:forEach var="specialMento" items="${specialMentoList}" begin="0" end="${fn:length(specialMentoList)-1}" varStatus="status">
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
						<c:if test="${status.count!=fn:length(specialMentoList)}">
						  <div class="swiper-slide">
						    <ul class="product-list-02" data-column="4">
						</c:if>
						</c:when>
						<c:when test="${status.count mod 4!=0 and status.count==fn:length(specialMentoList)}">
						    </ul>
						  </div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
						</c:forEach>
						</div><!-- swiper-wrapper -->
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					  </div><!-- swiper-container -->
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
			<!--//베스트 클래스 -->
			</c:if>
			<!-- 헤어 -->
			<c:if test="${fn:length(classHairList)>0}">
			<div class="content-inner">
				<div class="off_tit off_hair">
					<h3>오프라인 헤어 클래스</h3>
					<ul class="product-list-01" data-column="4">
						<c:forEach var="cls" items="${classHairList}" begin="0" end="${fn:length(classHairList)-1}">
						<fmt:parseDate var="parsedClsSDt" value="${cls.classStartDt}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
						<fmt:formatDate var="etcDtStr" value="${parsedClsSDt}" pattern="yyyy-MM-dd(E)" />
					    <fmt:parseNumber
					    value="${ parsedClsSDt.time / (1000*60*60*24) }"
					    integerOnly="true" var="classDays" scope="request"/>
					    <c:set var="img" value=""/>
					    <c:if test="${fn:length(cls.classFileList)>0}">
							<c:forEach var="clsImg" items="${cls.classFileList}" begin="0" end="${fn:length(cls.classFileList)-1}">
								<c:if test="${clsImg.fileCn=='M1' }">
								<c:set var="path" value="${fn:split(fileStreCours, '/')}" />
								<c:set var="img" value="${uploadPath}/${path[fn:length(path)-1]}${clsImg.streFileNm}.${clsImg.fileExtsn}"/>
								</c:if>
							</c:forEach>
						</c:if>
							<li>
								<a href="#">
									<div class="thumb">
										<img src="${img}" alt="" />
										<c:choose>
											<c:when test="${classStNm != null && classStNm !='' }">
												<c:choose>
													<c:when test="${classStNm  == '오픈전' || classStNm  == '오픈중'}">
														<c:choose>
														<c:when test="${classDays-nowDays==1}">
															<div class="count"><span>1일 남았어요!</span></div>
														</c:when>
														<c:otherwise>
														</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${classStNm  == '신청마감' || classStNm  == '종료'}">
														<div class="soldout">${classStNm}</div>
														<div class="soldout-txt">${classStNm}</div>
													</c:when>
													<c:otherwise>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<c:choose>
												<c:when test="${classDays-nowDays>0}">
													<div class="count"><span>${classDays-nowDays}일 남았어요!</span></div>
												</c:when>
												<c:when test="${classDays-nowDays>0}">
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
					</ul>
                    <div class="off_more"><a href="#">헤어 클래스 더보기<img src="${imagePath}/libs/img/btn_arrow.png"/></a></div>
				</div>
			</div>
			</c:if>
			<!-- //헤어-->
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
			<!-- 메이크업 -->
			<c:if test="${fn:length(classMakeuprList)>0}">
			<div class="content-inner">
				<div class="off_tit off_makeup">
					<h3>오프라인 메이크업 클래스</h3>
					<ul class="product-list-01" data-column="4">
						<c:forEach var="cls" items="${classMakeuprList}" begin="0" end="${fn:length(classMakeuprList)-1}">
						<fmt:parseDate var="parsedClsSDt" value="${cls.classStartDt}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
						<fmt:formatDate var="etcDtStr" value="${parsedClsSDt}" pattern="yyyy-MM-dd(E)" />
					    <fmt:parseNumber
					    value="${ parsedClsSDt.time / (1000*60*60*24) }"
					    integerOnly="true" var="classDays" scope="request"/>
					    <c:set var="img" value=""/>
					    <c:if test="${fn:length(cls.classFileList)>0}">
							<c:forEach var="clsImg" items="${cls.classFileList}" begin="0" end="${fn:length(cls.classFileList)-1}">
								<c:if test="${clsImg.fileCn=='M1' }">
								<c:set var="path" value="${fn:split(fileStreCours, '/')}" />
								<c:set var="img" value="${uploadPath}/${path[fn:length(path)-1]}${clsImg.streFileNm}.${clsImg.fileExtsn}"/>
								</c:if>
							</c:forEach>
						</c:if>
							<li>
								<a href="#">
									<div class="thumb">
										<img src="${img}" alt="" />
										<c:choose>
											<c:when test="${classStNm != null && classStNm !='' }">
												<c:choose>
													<c:when test="${classStNm  == '오픈전' || classStNm  == '오픈중'}">
														<c:choose>
														<c:when test="${classDays-nowDays==1}">
															<div class="count"><span>1일 남았어요!</span></div>
														</c:when>
														<c:otherwise>
														</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${classStNm  == '신청마감' || classStNm  == '종료'}">
														<div class="soldout">${classStNm}</div>
														<div class="soldout-txt">${classStNm}</div>
													</c:when>
													<c:otherwise>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<c:choose>
												<c:when test="${classDays-nowDays>0}">
													<div class="count"><span>${classDays-nowDays}일 남았어요!</span></div>
												</c:when>
												<c:when test="${classDays-nowDays>0}">
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
					</ul>
                    <div class="off_more"><a href="#">메이크업 클래스 더보기<img src="${imagePath}/libs/img/btn_arrow.png"/></a></div>
				</div>
			</div>
			</c:if>
			<!-- //메이크업-->
			<!-- 검색결과 -->
			<div id="classBottomList" class="content-inner">
				<div class="sr">부분 영역 페이징처리 때문에 form 엘리먼트를 추가함. 퍼블리싱 수정 필요.</div>
				<form:form commandName="classVO" name="classBottomList" method="post" action="${basePath}/class/a/t/classListDtl.do">
		            <form:hidden path="pageIndex" id="pageIndex" />
		            <form:hidden path="sortSubject"/>
		            <form:hidden path="sortDescend"/>
		            <%-- <form:hidden path="classCtSt" value="${classCtSt}"/> --%>
					<h3>전체</h3>
					<div class="sort-list">
						<form:select path="classAreaSt" style="width:90px;" id="classAreaSt">
							<option value="0">전체</option>
							<form:options items="${classAreaList}" itemLabel="mclsNm"  itemValue="mclsCd"/>
						</form:select>
					</div>
				</form:form>
				<c:if test="${fn:length(classListBottom)>0}">
				<dummy>
				<jsp:include page="/WEB-INF/jsp/beauate/class/lists/classBottomList.jsp" flush="false" />
				</dummy>
				</c:if>
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
