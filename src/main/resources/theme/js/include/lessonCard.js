/**
 * 메인 , 수업목록, 장바구니, 수정하기(tutorpage),  메시지 프로필(tutorprofile) , 모바일 공통 js 
 */
	$(document).on("click", ".price-detail-btn", function() {
		$(".price-detail-btn").html('가격상세보기 &#9660;');
		if ($(this).closest(".price-detail").find(".price-detail-table").hasClass('hide')) {
			$('.price-detail-table').addClass("hide");
			$(this).closest(".price-detail").find(".price-detail-table").removeClass("hide");
			$(this).html('가격상세보기 &#9650;');
		} else {
			$('.price-detail-table').addClass("hide");
			$(this).closest(".price-detail").find(".price-detail-table").addClass("hide");
		}
	});