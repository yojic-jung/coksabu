<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="uri" value="${pageContext.request.requestURI}" />

<div id="img-convert" class="hide" style="text-align: center; width: 100%; position: fixed; left: 0px; top: 0px; background: rgb(255, 255, 255, .5); height: 100%; z-index: 10;">
	<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 70%; font-family: 'JejuGothic'; font-size: 35px; font-weight: bold;">
		<img src="<c:url value='/resources/img/Gear-0.2s-200px.svg?a=2' /> " />
		<div>heic이미지를 jpg로 변환중입니다...</div>
		<div>잠시만 기다려주세요....</div>
	</div>
</div>

<!-- 수업만들기, 수업 수정하기 -->

<form:form commandName="card" method="post" enctype="multipart/form-data" onSubmit="return checkLesson(this)">
	<c:if test="${fn:contains(uri, 'update')}">
		<input name="id" type="hidden" value="${lesson.id}" />
	</c:if>
	<input name="email" type="hidden" value="<%=(String) session.getAttribute("email")%>" />
	<!-- 선생님 소개 -->
	<div class="teacher-intr">
		<div style="margin:20px 0 100px 0; line-height: 180%;">
			수업은 최대 5과목까지 등록 가능합니다.<br /> 많은 수업을 등록 할수록 선생님의 수업이 많은 학생들에게 노출될 가능성이 높습니다!

			<table class="lesson-table" style="width: 100%; border-spacing: 0px 20px;">
				<tr>
					<td colspan="3" style="color:orange;font-weight:bold;padding-top:30px;">제공수업1(필수)</td>
				</tr>
				<tr>
					<td colspan="3">
						<select name="cate0" class="service-cate0" id="service-cate0">
							<option value="nonevalue">--선택--</option>
							<option>수학</option>
							<option>외국어</option>
							<option>국어</option>
							<option>사회</option>
							<option>과학</option>
							<option>예체능</option>
							<option>입시(자소서/논술/면접)</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="seg-cate0" colspan="3">
						<c:choose>
							<c:when test="${fn:contains(uri, 'update')}">
								<select style="display: inline-block" disabled>
							</c:when>
							<c:otherwise>
								<select name="subCate0" style="display: inline-block" disabled>
							</c:otherwise>
						</c:choose>
						<option value="nonevalue">선택없음</option>
						</select>
						<select>
							<option>초등수학</option>
							<option>중등수학</option>
							<option>고등수학</option>
							<option>문과수학</option>
							<option>이과수학</option>
							<option>수학경시</option>
						</select>
						<select>
							<option>초등영어</option>
							<option>중등영어</option>
							<option>고등영어</option>
							<option>수능영어</option>
							<option>영어회화</option>
							<option>toeic/tofle/teps</option>
							<option>중국어</option>
							<option>일본어</option>
						</select>
						<select>
							<option>초등국어</option>
							<option>중등국어</option>
							<option>고등국어</option>
							<option>수능국어</option>
						</select>
						<select>
							<option>초등사회</option>
							<option>중등사회</option>
							<option>고등사회</option>
							<option>생활과윤리</option>
							<option>사회문화</option>
							<option>한국지리</option>
							<option>세계지리</option>
							<option>윤리와사상</option>
							<option>동아시아사</option>
							<option>법과정치</option>
							<option>세계사</option>
							<option>경제</option>
							<option>한국사</option>
						</select>
						<select>
							<option>초등과학</option>
							<option>중등과학</option>
							<option>고등과학</option>
							<option>물리</option>
							<option>화학</option>
							<option>생명과학</option>
							<option>지구과학</option>
							<option>물리2</option>
							<option>화학2</option>
							<option>생명과학2</option>
							<option>지구과학2</option>
						</select>
						<select>
							<option>미술</option>
							<option>유아미술</option>
							<option>초등미술</option>
							<option>중등미술</option>
							<option>고등미술</option>
							<option>성인미술</option>
							<option>음악</option>
							<option>악기</option>
							<option>성악</option>
							<option>국악</option>
							<option>체육</option>
						</select>
						<select>
							<option>자소서첨삭</option>
							<option>입시컨설팅</option>
							<option>면접</option>
							<option>수학논술</option>
							<option>인문논술</option>
							<option>국어논술</option>
							<option>과학논술</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<select name="price1" class="price-standard0">
							<option>한달 12회</option>
							<option>한달 8회</option>
							<option>한달 4회</option>
						</select>
					</td>
					<td>
						<select name="price2" class="price-time">
							<option>60분</option>
							<option>90분</option>
							<option>2시간</option>
							<option>2시간 30분</option>
							<option>3시간</option>
							<option>4시간</option>
						</select>
					</td>
					<td>
						<input name="price3" style="text-align: right;" class="price-pri1" type="text" id="price3" placeholder="숫자만 입력" value="${lesson.price3}" />
						원
					</td>
				</tr>


				<tr>
					<td colspan="3" style="color:orange;font-weight:bold;padding-top:30px;">제공수업2(선택)</td>
				</tr>
				<tr>
					<td colspan="3">
						<select name="cate1" class="service-cate1" id="service-cate1">
							<option value="nonevalue">--선택--</option>
							<option>수학</option>
							<option>외국어</option>
							<option>국어</option>
							<option>사회</option>
							<option>과학</option>
							<option>예체능</option>
							<option>입시(자소서/논술/면접)</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="seg-cate1" colspan="3">
						<c:choose>
							<c:when test="${fn:contains(uri, 'update')}">
								<select style="display: inline-block" disabled>
							</c:when>
							<c:otherwise>
								<select name="subCate1" style="display: inline-block" disabled>
							</c:otherwise>
						</c:choose>

						<option value="nonevalue">선택없음</option>
						</select>
						<select>
							<option>초등수학</option>
							<option>중등수학</option>
							<option>고등수학</option>
							<option>문과수학</option>
							<option>이과수학</option>
							<option>수학경시</option>
						</select>
						<select>
							<option>초등영어</option>
							<option>중등영어</option>
							<option>고등영어</option>
							<option>수능영어</option>
							<option>영어회화</option>
							<option>toeic/tofle/teps</option>
							<option>중국어</option>
							<option>일본어</option>
						</select>
						<select>
							<option>초등국어</option>
							<option>중등국어</option>
							<option>고등국어</option>
							<option>수능국어</option>
						</select>
						<select>
							<option>초등사회</option>
							<option>중등사회</option>
							<option>고등사회</option>
							<option>생활과윤리</option>
							<option>사회문화</option>
							<option>한국지리</option>
							<option>세계지리</option>
							<option>윤리와사상</option>
							<option>동아시아사</option>
							<option>법과정치</option>
							<option>세계사</option>
							<option>경제</option>
							<option>한국사</option>
						</select>
						<select>
							<option>초등과학</option>
							<option>중등과학</option>
							<option>고등과학</option>
							<option>물리</option>
							<option>화학</option>
							<option>생명과학</option>
							<option>지구과학</option>
							<option>물리2</option>
							<option>화학2</option>
							<option>생명과학2</option>
							<option>지구과학2</option>
						</select>
						<select>
							<option>미술</option>
							<option>유아미술</option>
							<option>초등미술</option>
							<option>중등미술</option>
							<option>고등미술</option>
							<option>성인미술</option>
							<option>음악</option>
							<option>악기</option>
							<option>성악</option>
							<option>국악</option>
							<option>체육</option>
						</select>
						<select>
							<option>자소서첨삭</option>
							<option>입시컨설팅</option>
							<option>면접</option>
							<option>수학논술</option>
							<option>인문논술</option>
							<option>국어논술</option>
							<option>과학논술</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<select name="opt1price1" class="price-standard1">
							<option>한달 12회</option>
							<option>한달 8회</option>
							<option>한달 4회</option>
						</select>
					</td>
					<td>
						<select name="opt1price2" class="price-time">
							<option>60분</option>
							<option>90분</option>
							<option>2시간</option>
							<option>2시간 30분</option>
							<option>3시간</option>
							<option>4시간</option>
						</select>
					</td>
					<td>
						<input name="opt1price3" style="text-align: right;" class="price-pri1" type="text" id="opt1price3" placeholder="숫자만 입력" value="${lesson.opt1price3}" />
						원
					</td>
				</tr>



				<tr>
					<td colspan="3" style="color:orange;font-weight:bold;padding-top:30px;">제공수업3(선택)</td>
				</tr>
				<tr>
					<td colspan="3">
						<select name="cate2" class="service-cate2" id="service-cate2">
							<option value="nonevalue">--선택--</option>
							<option>수학</option>
							<option>외국어</option>
							<option>국어</option>
							<option>사회</option>
							<option>과학</option>
							<option>예체능</option>
							<option>입시(자소서/논술/면접)</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="seg-cate2" colspan="3">
						<c:choose>
							<c:when test="${fn:contains(uri, 'update')}">
								<select style="display: inline-block" disabled>
							</c:when>
							<c:otherwise>
								<select name="subCate2" style="display: inline-block" disabled>
							</c:otherwise>
						</c:choose>
						<option value="nonevalue">선택없음</option>
						</select>
						<select>
							<option>초등수학</option>
							<option>중등수학</option>
							<option>고등수학</option>
							<option>문과수학</option>
							<option>이과수학</option>
							<option>수학경시</option>
						</select>
						<select>
							<option>초등영어</option>
							<option>중등영어</option>
							<option>고등영어</option>
							<option>수능영어</option>
							<option>영어회화</option>
							<option>toeic/tofle/teps</option>
							<option>중국어</option>
							<option>일본어</option>
						</select>
						<select>
							<option>초등국어</option>
							<option>중등국어</option>
							<option>고등국어</option>
							<option>수능국어</option>
						</select>
						<select>
							<option>초등사회</option>
							<option>중등사회</option>
							<option>고등사회</option>
							<option>생활과윤리</option>
							<option>사회문화</option>
							<option>한국지리</option>
							<option>세계지리</option>
							<option>윤리와사상</option>
							<option>동아시아사</option>
							<option>법과정치</option>
							<option>세계사</option>
							<option>경제</option>
							<option>한국사</option>
						</select>
						<select>
							<option>초등과학</option>
							<option>중등과학</option>
							<option>고등과학</option>
							<option>물리</option>
							<option>화학</option>
							<option>생명과학</option>
							<option>지구과학</option>
							<option>물리2</option>
							<option>화학2</option>
							<option>생명과학2</option>
							<option>지구과학2</option>
						</select>
						<select>
							<option>미술</option>
							<option>유아미술</option>
							<option>초등미술</option>
							<option>중등미술</option>
							<option>고등미술</option>
							<option>성인미술</option>
							<option>음악</option>
							<option>악기</option>
							<option>성악</option>
							<option>국악</option>
							<option>체육</option>
						</select>
						<select>
							<option>자소서첨삭</option>
							<option>입시컨설팅</option>
							<option>면접</option>
							<option>수학논술</option>
							<option>인문논술</option>
							<option>국어논술</option>
							<option>과학논술</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<select name="opt2price1" class="price-standard2">
							<option>한달 12회</option>
							<option>한달 8회</option>
							<option>한달 4회</option>
						</select>
					</td>
					<td>
						<select name="opt2price2" class="price-time">
							<option>60분</option>
							<option>90분</option>
							<option>2시간</option>
							<option>2시간 30분</option>
							<option>3시간</option>
							<option>4시간</option>
						</select>
					</td>
					<td>
						<input name="opt2price3" style="text-align: right;" class="price-pri1" type="text" id="opt2price3" placeholder="숫자만 입력" value="${lesson.opt2price3}" />
						원
					</td>
				</tr>

				<tr>
					<td colspan="3" class="opt3-tr" style="color:orange;font-weight:bold;padding-top:30px;">제공수업4(선택)</td>
				</tr>
				<tr>
					<td colspan="3" class="opt3-tr">
						<select name="cate3" class="service-cate3" id="service-cate3">
							<option value="nonevalue">--선택--</option>
							<option>수학</option>
							<option>외국어</option>
							<option>국어</option>
							<option>사회</option>
							<option>과학</option>
							<option>예체능</option>
							<option>입시(자소서/논술/면접)</option>
						</select>
					</td>
				</tr>
				<tr class="opt3-tr">
					<td class="seg-cate3" colspan="3">
						<c:choose>
							<c:when test="${fn:contains(uri, 'update')}">
								<select style="display: inline-block" disabled>
							</c:when>
							<c:otherwise>
								<select name="subCate3" style="display: inline-block" disabled>
							</c:otherwise>
						</c:choose>
						<option value="nonevalue">선택없음</option>
						</select>
						<select>
							<option>초등수학</option>
							<option>중등수학</option>
							<option>고등수학</option>
							<option>문과수학</option>
							<option>이과수학</option>
							<option>수학경시</option>
						</select>
						<select>
							<option>초등영어</option>
							<option>중등영어</option>
							<option>고등영어</option>
							<option>수능영어</option>
							<option>영어회화</option>
							<option>toeic/tofle/teps</option>
							<option>중국어</option>
							<option>일본어</option>
						</select>
						<select>
							<option>초등국어</option>
							<option>중등국어</option>
							<option>고등국어</option>
							<option>수능국어</option>
						</select>
						<select>
							<option>초등사회</option>
							<option>중등사회</option>
							<option>고등사회</option>
							<option>생활과윤리</option>
							<option>사회문화</option>
							<option>한국지리</option>
							<option>세계지리</option>
							<option>윤리와사상</option>
							<option>동아시아사</option>
							<option>법과정치</option>
							<option>세계사</option>
							<option>경제</option>
							<option>한국사</option>
						</select>
						<select>
							<option>초등과학</option>
							<option>중등과학</option>
							<option>고등과학</option>
							<option>물리</option>
							<option>화학</option>
							<option>생명과학</option>
							<option>지구과학</option>
							<option>물리2</option>
							<option>화학2</option>
							<option>생명과학2</option>
							<option>지구과학2</option>
						</select>
						<select>
							<option>미술</option>
							<option>유아미술</option>
							<option>초등미술</option>
							<option>중등미술</option>
							<option>고등미술</option>
							<option>성인미술</option>
							<option>음악</option>
							<option>악기</option>
							<option>성악</option>
							<option>국악</option>
							<option>체육</option>
						</select>
						<select>
							<option>자소서첨삭</option>
							<option>입시컨설팅</option>
							<option>면접</option>
							<option>수학논술</option>
							<option>인문논술</option>
							<option>국어논술</option>
							<option>과학논술</option>
						</select>
					</td>
				</tr>
				<tr class="opt3-tr">
					<td>
						<select name="opt3price1" class="price-standard3">
							<option>한달 12회</option>
							<option>한달 8회</option>
							<option>한달 4회</option>
						</select>
					</td>
					<td>
						<select name="opt3price2" class="price-time">
							<option>60분</option>
							<option>90분</option>
							<option>2시간</option>
							<option>2시간 30분</option>
							<option>3시간</option>
							<option>4시간</option>
						</select>
					</td>
					<td>
						<input name="opt3price3" style="text-align: right;" class="price-pri1" type="text" id="opt3price3" placeholder="숫자만 입력" value="${lesson.opt3price3}" />
						원
					</td>
				</tr>



				<tr class="opt4-tr">
					<td colspan="3" style="color:orange;font-weight:bold;padding-top:30px;">제공수업5(선택)</td>
				</tr>
				<tr class="opt4-tr">
					<td colspan="3">
						<select name="cate4" class="service-cate4" id="service-cate4">
							<option value="nonevalue">--선택--</option>
							<option>수학</option>
							<option>외국어</option>
							<option>국어</option>
							<option>사회</option>
							<option>과학</option>
							<option>예체능</option>
							<option>입시(자소서/논술/면접)</option>
						</select>
					</td>
				</tr>
				<tr class="opt4-tr">
					<td class="seg-cate4" colspan="3">
						<c:choose>
							<c:when test="${fn:contains(uri, 'update')}">
								<select style="display: inline-block" disabled>
							</c:when>
							<c:otherwise>
								<select name="subCate4" style="display: inline-block" disabled>
							</c:otherwise>
						</c:choose>

						<option value="nonevalue">선택없음</option>
						</select>
						<select>
							<option>초등수학</option>
							<option>중등수학</option>
							<option>고등수학</option>
							<option>문과수학</option>
							<option>이과수학</option>
							<option>수학경시</option>
						</select>
						<select>
							<option>초등영어</option>
							<option>중등영어</option>
							<option>고등영어</option>
							<option>수능영어</option>
							<option>영어회화</option>
							<option>toeic/tofle/teps</option>
							<option>중국어</option>
							<option>일본어</option>
						</select>
						<select>
							<option>초등국어</option>
							<option>중등국어</option>
							<option>고등국어</option>
							<option>수능국어</option>
						</select>
						<select>
							<option>초등사회</option>
							<option>중등사회</option>
							<option>고등사회</option>
							<option>생활과윤리</option>
							<option>사회문화</option>
							<option>한국지리</option>
							<option>세계지리</option>
							<option>윤리와사상</option>
							<option>동아시아사</option>
							<option>법과정치</option>
							<option>세계사</option>
							<option>경제</option>
							<option>한국사</option>
						</select>
						<select>
							<option>초등과학</option>
							<option>중등과학</option>
							<option>고등과학</option>
							<option>물리</option>
							<option>화학</option>
							<option>생명과학</option>
							<option>지구과학</option>
							<option>물리2</option>
							<option>화학2</option>
							<option>생명과학2</option>
							<option>지구과학2</option>
						</select>
						<select>
							<option>미술</option>
							<option>유아미술</option>
							<option>초등미술</option>
							<option>중등미술</option>
							<option>고등미술</option>
							<option>성인미술</option>
							<option>음악</option>
							<option>악기</option>
							<option>성악</option>
							<option>국악</option>
							<option>체육</option>
						</select>
						<select>
							<option>자소서첨삭</option>
							<option>입시컨설팅</option>
							<option>면접</option>
							<option>수학논술</option>
							<option>인문논술</option>
							<option>국어논술</option>
							<option>과학논술</option>
						</select>
					</td>
				</tr>
				<tr class="opt4-tr">
					<td>
						<select name="opt4price1" class="price-standard4">
							<option>한달 12회</option>
							<option>한달 8회</option>
							<option>한달 4회</option>
						</select>
					</td>
					<td>
						<select name="opt4price2" class="price-time">
							<option>60분</option>
							<option>90분</option>
							<option>2시간</option>
							<option>2시간 30분</option>
							<option>3시간</option>
							<option>4시간</option>
						</select>
					</td>
					<td>
						<input name="opt4price3" style="text-align: right;" class="price-pri1" type="text" id="opt4price3" placeholder="숫자만 입력" value="${lesson.opt4price3}" />
						원
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="text-align: right; margin-top: 50px;">
							<div>
								<span class="service-add" style="font-weight: bold; padding: 20px 40px; border-radius: 10px; background: orange; font-size: 40px; color: white; cursor: pointer;">수업추가등록</span>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>


		<div>
			<div class="btn1 btn">다음단계</div>
		</div>
	</div>

	<!-- 선생님 -->
	<div class="teacher-intr">
		<div style="font-size: 40px;">
			수업 대표 이미지 <br /> <span style="color: gray; font-size: 40px; margin: 15px 0px 15px 0px;">수업을 대표하는 이미지나 선생님 사진을 넣어주세요.</span> <br />
			<c:choose>
				<c:when test="${fn:contains(uri, 'update')}">
					<img id="output" style="width: 400px; height: 400px;" src="<c:url value="/img/representImg/${lesson.represent}" />" alt="수업대표이미지" />
				</c:when>
				<c:otherwise>
					<img id="output" style="width: 400px; height: 400px;" src="<c:url value="/resources/profileImg/pro.png"  />" alt="수업대표이미지" />
				</c:otherwise>
			</c:choose>
			<br /> <img id="imgplus" src="<c:url value="/resources/images/imgplus.png" />" />
			<input type="file" name="represent" id="represent" accept="image/*" style="display: none;" onchange="check(this);loadFile(event)" />
		</div>


		<div style="line-height: 200%; font-size: 40px;">제목</div>
		<span style="color: gray; font-size: 40px;"> 제목을 30글자 미만으로 적어주세요.( <span class="title-length">0</span> /30)
		</span> <br />
		<input name="title" type="text" id="lesson-title" style="margin-top: 10px; width: 100%; padding: 20px; font-size: 50px; border-radius: 20px; border: 3px solid dimgray;" placeholder="수업제목을 30자 내외로 적어주세요." value="${lesson.title}" />

		<div style="height: 400px;"></div>
		<div class="btn-div">
			<span class="prev2 btn">이전단계</span> <span class="btn2 btn">다음단계</span>
		</div>
	</div>

	<!-- 수업 소개 -->
	<div class="teacher-intr">
		<div style="margin-bottom: 20px;">수업 가능 요일</div>
		<div style="margin-bottom: 100px;">
			<span style="color: gray; font-size: 50px; margin-top: 10px;"> <label style="cursor: pointer"> <input type="checkbox" name="day" value="월" /> 월
			</label> &nbsp; <label style="cursor: pointer"> <input type="checkbox" name="day" value="화" /> 화
			</label> &nbsp; <label style="cursor: pointer"> <input type="checkbox" name="day" value="수" /> 수
			</label> &nbsp; <label style="cursor: pointer"> <input type="checkbox" name="day" value="목" /> 목
			</label> &nbsp; <label style="cursor: pointer"> <input type="checkbox" name="day" value="금" /> 금
			</label> &nbsp; <label style="cursor: pointer"> <input type="checkbox" name="day" value="토" /> 토
			</label> &nbsp; <label style="cursor: pointer"> <input type="checkbox" name="day" value="일" /> 일
			</label>
			</span>
		</div>
		<div style="margin-bottom: 20px;">수업 형태</div>
		<div style="margin-bottom: 100px;">
			<span style="color: gray; font-size: 50px; margin-top: 10px;"> <label style="cursor: pointer"> <input type="checkbox" name="gawe" value="개인 과외 가능" /> 개인 과외 가능
			</label> &nbsp; <label style="cursor: pointer"> <input type="checkbox" name="gawe" value="화상 과외 가능" /> 화상 과외 가능
			</label>
			</span>
		</div>
		<div style="margin-bottom: 20px;">시범수업</div>
		<div style="margin-bottom: 100px;">
			<span style="color: gray; font-size: 50px; margin-top: 10px;"> <label style="cursor: pointer"> <input type="checkbox" name="trial" class="free" value="시범수업 무료" /> 시범수업 무료
			</label>
			</span>
		</div>
		<div style="margin-bottom: 20px;">수업 소개</div>
		<div style="margin-bottom: 500px;">
			<span style="color: gray; font-size: 35px; margin-top: 10px"> 수업 형태나 학습목표, 커리큘럼에 대해 <br /> 자세히 적어주세요.( <span class="lesson-length">0</span> /500)
			</span> <br />
			<textarea name="lesson" id="lesson-intr" rows="10" cols="40" style="padding: 15px; font-size: 35px; line-height: 140%; overflow-y: scroll; margin-top: 10px;">${lesson.lesson}</textarea>
		</div>
		<div class="btn-div">
			<span class="prev3 btn">이전단계</span> <span class="btn3 btn">다음단계</span>
		</div>
	</div>


	<!-- 경력사항 -->
	<div class="teacher-intr">
		<div style="margin-bottom: 20px;">선생님 경력</div>
		<span style="color: gray; font-size: 35px;">경력이 없으신 경우 생략가능합니다.</span> <br />
		<div class="career" id="career"></div>
		<div style="width: 350px; margin: 10px auto; font-size: 25px; text-align: right;"></div>
		<div class="career-box"></div>
		<br />

		<div style="margin-bottom: 20px;">선생님 소개</div>
		<div style="margin-bottom: 500px;">
			<span style="color: gray; font-size: 35px; margin-top: 10px"> 선생님의 지도성향이나 학습방식, 경력 등을 <br /> 자세하게 서술해주세요.( <span class="teach-length">0</span> /500)
			</span> <br />
			<textarea id="careerDesc" name="description" rows="10" cols="40" style="padding: 15px; font-size: 35px; line-height: 140%; overflow-y: scroll; margin-top: 10px;">${lesson.description}</textarea>
		</div>
		<div class="btn-div">
			<span class="prev4 btn">이전단계</span> <span class="btn4 btn">다음단계</span>
		</div>
	</div>

	<!-- 미디어 -->
	<div class="teacher-intr" id="teacher-intr">
		<div style="text-align: center; font-family: 'JejuGothic'; font-size: 40px;">
			수업과 관련된 이미지를 등록하여 <br /> 수업을 홍보해보세요. (선택)
		</div>
		<div style="text-align: center; margin: 30px;">
			<span class="img-add">이미지 추가</span> <br /> <br /> <span style="font-size: 35px; color: gray;"> 이미지는 최대 4장까지 업로드 가능합니다. <br /> 이미지 취소를 원할 경우 해당 이미지를 클릭하세요.
			</span>
			<div style="color: gray; font-size: 35px;">(이미지는 20MB이하 파일로 등록해주세요.)</div>
		</div>


		<div class="img-div"></div>

		<div class="uploadDiv">
			<input name="contentimg" type="file" class="multi1" id="multi1" accept="image/*" onchange="check1(this);loadFile1(event);" />
			<input name="contentimg" type="file" class="multi2" id="multi2" accept="image/*" onchange="check22(this);loadFile2(event)" />
			<input name="contentimg" type="file" class="multi3" id="multi3" accept="image/*" onchange="check3(this);loadFile3(event)" />
			<input name="contentimg" type="file" class="multi4" id="multi4" accept="image/*" onchange="check4(this);loadFile4(event)" />
		</div>

		<div>
			<div class="del-div1"></div>
			<div class="del-div2"></div>
			<div class="del-div3"></div>
			<div class="del-div4"></div>
		</div>
		<div>
			<br />
			<div class="btn-div">
				<span class="prev5 btn">이전단계</span> <span class="btn5 btn">다음단계</span>
			</div>
		</div>
	</div>

	<!-- 정책안내 -->
	<div class="teacher-intr" id="teacher-intr">
		<div>콕사부 정책</div>
		<div style="font-size: 25px; line-height: 150%; margin: 20px auto;; border: 1px solid black; padding: 10px;">
			안전거래를 통해 거래가 이루어진 경우 수업료의 5%가 안전결제 서비스 사용료로 부과됩니다. <br /> (직거래시 안전결제 서비스 사용료는 부과되지 않음.) <br /> 서비스의 안전한 거래를 위하여 판매금을 서비스가 종료된 날짜를 기준으로 1-3일 후에 입금됨을 알립니다. <br /> 입금 받을 계좌는 [마이페이지] -> [내 계정 정보 수정하기] 페이지에서 등록 할 수 있습니다.
		</div>
		<br />
		<div>취소 및 환불규정</div>
		<div style="overflow: scroll; font-size: 25px; line-height: 150%; margin: 20px auto 100px auto; height: 600px; border: 1px solid black; padding: 10px;">
			가. 수업 환불기준 원칙 <br /> 학원의 설립/운영 및 과외교습에 관한 법률 제 18조(교습비 등의 반환 등) <br /> - 학원설립, 운영자, 교습자 및 개인과외교습자는 학습자가 수강을 계속할 수 없는 경우 또는 학원의 등록말소, 교습소 폐지 등으로 교습을 계속할 수 없는 경우에는 학습자로부터 받은 교습비를 반환하는 등 학습자를 보호하기 위하여 필요한 조치를 하여야 한다. <br /> <br /> 1. 수업을 제공할 수 없거나, 수업 장소를 제공할 수 없게 된 날 : 이미 납부한 수업비 등을 일한 계산한 금액 환불 <br /> <br /> 2. 수업기간이 1개월 이내의 경우 <br /> - 수업 시작전 : 이미 납부한 수업비 전액 환불 <br /> - 총 수업 시간의 1/3 경과전 : 이미 납부한 수업비의 2/3에 해당액 환불 <br /> - 총 수업 시간의 1/2 경과전 : 이미 납부한 수업비용의 1/2에 해당액 환불 <br /> - 총 수업시간의 1/2 경과후 : 반환하지 않음 <br /> <br /> 3.수업 기간이 1개월을 초과하는 경우 <br /> - 수업 시작전 : 이미 납부한 수업비 전액 환불 <br /> - 수업 시작후 : 반환사유가 발생한 당해 월의 반환 대상 수업비(수업비 징수기간이 1개월 이내인 경우에 따라 산출된 수강료를 말한다)와 나머지 월의 수업비 전액을 합산한 금액 환불 * 총 수업 시간의 수업비 징수기간 중의 총수업시간을 말하며, 반환 금액의 산정은 반환 사유가 발생한 날까지 경과 된 수업시간을 기준으로 함 <br />
		</div>

		<div class="service-table">
			<div style="font-size: 35px; text-align: center;">
				<label>
					<div class="pri-neg-able">
						<input type="radio" class="negotiation-possible" name="priNegotiation" value="yes" />
						가격협의 가능
					</div>
				</label> <label>
					<div class="pri-neg-disable">
						<input type="radio" class="negotiation-notpossible" name="priNegotiation" value="no" />
						가격협의 불가
					</div>
				</label>
			</div>
		</div>

		<div class="btn-div">
			<span class="prev6 btn">이전단계</span>
			<c:choose>
				<c:when test="${fn:contains(uri, 'update')}">
					<label for="save" class="make-lesson">수정하기</label>
					<input id="save" class="save btn" type="submit" value="수정하기" />
				</c:when>
				<c:otherwise>
					<label for="save" class="make-lesson">수업 만들기</label>
					<input id="save" class="save btn" type="submit" value="동의하고 수업 만들기" />
				</c:otherwise>
			</c:choose>
		</div>
	</div>

</form:form>

