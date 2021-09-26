<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="uri" value="${pageContext.request.requestURI}" />
<!--  메인 , 수업목록, 장바구니, 수정하기(tutorpage),  메시지 프로필(tutorprofile) -->
<tr>
	<td colspan="2">
		<c:if test="${post.visible==0 }">
			<div style="position: relative;">
				<span style="position: absolute; z-index: 3; left: 30px; top: 80px; font-weight: bolder; line-height: 180%; color: #FF5E00"> 판매중단, <br /> <c:choose>
						<c:when test="${fn:contains(uri, 'tutorpage')}">
							삭제요청된 수업으로 진행중인 거래가 있는지 확인후 삭제 처리됩니다.
						</c:when>
						<c:otherwise>
							판매자가 판매 중단을 신청한 수업입니다.
						</c:otherwise>
					</c:choose>
				</span>
			</div>
		</c:if>
	</td>
</tr>
<c:choose>
	<c:when test="${post.visible!=0 }">
		<tr style="width: 100%">
	</c:when>
	<c:otherwise>
		<tr style="opacity: 0.2;">
	</c:otherwise>
</c:choose>
<td>
	<a href="<c:url value="./boardread?postId=${post.id}"/>">
		<div id="pst" style="vertical-align: top; padding: 0px; margin: 20px 10px; position: relative">
			<c:if test="${post.certify==1}">
				<span style="padding: 4px; font-size: 12px; color: white; background: orange; border-radius: 10px; position: absolute; font-family: 'JejuGothic';">인증완료</span>
			</c:if>
			<img src="<c:url value='/img/representImg/${post.represent}' />" style="width: 180px; height: 180px; magin-top: 0px; border-radius: 20px;" alt="수업대표이미지" />
		</div>
	</a>
</td>
<td style="vertical-align: top; padding-top: 30px; width: 100%;">
	<a href="<c:url value="./boardread?postId=${post.id}"/>" style="text-decoration: none;">
		<div id="categories">${post.subcate}</div>
		<div id="name">
			${post.nickname}(${post.birth}, ${post.sexual})&nbsp;&nbsp;경력
			<c:if test="${post.career!=0}">${post.career}년</c:if>
			<c:if test="${post.career==0}">1년미만</c:if>
		</div> <c:choose>
			<c:when test="${post.academy ne '' and post.academy != null}">
				<div id="universe">${post.academy}&nbsp;${post.academyd}</div>
			</c:when>
			<c:otherwise>
				<div id="universe">${post.universe}&nbsp;${post.univsub}</div>
			</c:otherwise>
		</c:choose>
		<div id="title">${post.title}</div>
	</a>
	<div id="price">${post.subCate0}
		${post.price3}원
		<c:if test="${post.subCate1 !='nonevalue' }">/ ${post.subCate1} ${post.opt1price3}원</c:if>
		<c:if test="${post.subCate2!='nonevalue' }">/ ${post.subCate2} ${post.opt2price3}원</c:if>
		<c:if test="${post.subCate3!='nonevalue' }">
			<br /> ${post.subCate3} ${post.opt3price3}원</c:if>
		<c:if test="${post.subCate4!='nonevalue' }">/ ${post.subCate4} ${post.opt4price3}원</c:if>
	</div>
</td>
</tr>
<tr>
	<c:choose>
		<c:when test="${fn:contains(uri, 'myWishList')}">
			<td colspan="2">
		</c:when>
		<c:when test="${fn:contains(uri, 'tutorpage')}">
			<td colspan="2">
		</c:when>
		<c:otherwise>
			<td colspan="2" style="border-bottom: 1px solid gray; padding-bottom: 20px;">
		</c:otherwise>
	</c:choose>
	<div class="price-detail">
		<table class="price-detail-table hide">
			<c:if test="${post.priNegotiation == 'yes' }">
				<tr>
					<td colspan="4" style="font-size:14px; color:orange;">상담 후 수업방식 및 수업(가격)협의 가능</td>
				</tr>
			</c:if>
			<tr>
				<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.subCate0}</td>
				<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.price1}</td>
				<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.price2}수업</td>
				<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.price3}원</td>
			</tr>
			<c:if test="${post.subCate1!='nonevalue' }">
				<tr>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.subCate1}</td>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.opt1price1}</td>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.opt1price2}수업</td>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.opt1price3}원</td>
				</tr>
			</c:if>
			<c:if test="${post.subCate2!='nonevalue' }">
				<tr>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.subCate2}</td>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.opt2price1}</td>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.opt2price2}수업</td>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.opt2price3}원</td>
				</tr>
			</c:if>
			<c:if test="${post.subCate3!='nonevalue' }">
				<tr>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.subCate3}</td>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.opt3price1}</td>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.opt3price2}수업</td>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.opt3price3}원</td>
				</tr>
			</c:if>
			<c:if test="${post.subCate4!='nonevalue' }">
				<tr>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.subCate4}</td>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.opt4price1}</td>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.opt4price2}수업</td>
					<td style="padding-bottom: 0px; border: 0px; line-height: 100%">${post.opt4price3}원</td>
				</tr>
			</c:if>
		</table>
		<div style="text-align: center; padding-top: 4px; clear: both;">
			<span class="price-detail-btn">가격상세보기 &#9660;</span>
		</div>
	</div>
	</td>
</tr>

<!-- 장바구니 -->
<c:if test="${fn:contains(uri, 'myWishList')}">
	<tr>
		<td colspan="2" style="border-bottom: 1px solid gray; padding-bottom: 40px;">
			<div style="text-align: right;">
				<a href="./deletewish?postId=${post.id}" class="post-href" style="text-decoration: none;"><span class="mywish-delete">삭제하기</span></a>
			</div>
		</td>
	</tr>
</c:if>

<!-- tutorpage 수정하기 -->
<c:if test="${fn:contains(uri, 'tutorpage')}">
	<tr>
		<td colspan="2" style="padding-bottom: 20px; border-bottom: 1px solid gray; text-align: right;">
			<c:if test="${post.visible==1 }">
				<div style="padding: 0px;">
					<span class="tutorpage-update">수정하기<input type="text" class="idval" style="display: none;" value="${post.id}"></span> &nbsp;&nbsp; <a class="tutorpage-delete" href="./deletelesson?id=${post.id} " style="text-decoration: none;"> <span class="tutor-delete-css">삭제하기</span>
					</a>
				</div>
			</c:if>
		</td>
	</tr>
</c:if>

