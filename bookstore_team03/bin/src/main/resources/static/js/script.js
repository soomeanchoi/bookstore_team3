/////////////////////////// 캐러셀 구현
$('.slide-1').on('click', function() {
  $('.slide-container').css('transform', 'translateX(0px)');
});

$('.slide-2').on('click', function() {
  $('.slide-container').css('transform', 'translateX(-300px)');
});

$('.slide-3').on('click', function() {
  $('.slide-container').css('transform', 'translateX(-600px)');
});

/////////////////////////// 스크롤 구현

//기본이벤트 제거
window.addEventListener("wheel", function(e){
	e.preventDefault();
},{passive : false});

//페이지 선언
var $html = $("html");
var page = 1;
var lastPage = $(".content").length;

//마우스 휠 굴렸을 때 이벤트
$html.animate({scrollTop:0},1);

$(window).on("wheel", function(e){
 
	if($html.is(":animated")) return;
 
	if(e.originalEvent.deltaY > 0){
		if(page== lastPage) return;
 
		page++;
	}else if(e.originalEvent.deltaY < 0){
		if(page == 1) return;
 
		page--;
	}
	var posTop = (page-1) * $(window).height();
 
	$html.animate({scrollTop : posTop});
});





const button = document.querySelector(".menu-drop");

button.addEventListener("click", () => {
  const dropdown = document.querySelector(".drop-cont");
  dropdown.style.display = "block";
});

button.addEventListener("blur", () => {
  const dropdown = document.querySelector(".drop-cont");
  dropdown.style.display = "";
});