const main = document.querySelector("#main");
const qna = document.querySelector("#qna");

var que;
var choose_A;
var choose_B;


$.ajax({
    url: "/research/kakao",
    type: "GET",
    dataType:"json",
    success: function (data) {

        alert();
        que = data.que;
        choose_A = data.choose_A;
        choose_B = data.choose_B;

        // alert("잉");

        console.log("que:", que);
        console.log("choose_A:", choose_A);
        console.log("choose_B:", choose_B);
    },
    error: function (xhr, status, error){
        //요청에 실패한 경우 에러 처리 수행
        console.error("AJAX 요청 실패:", status, error);
    }
})
function goNext(qIdx) {
    var q = document.querySelector(".qBox");
    q.innerHTML = que[qIdx];
}
function begin() {
    main.style.WebkitAnimation = "fadeOut 1s";
    main.style.animation = "fadeOut 1s";
    setTimeout(() => {
        qna.WebkitTransition = "fadeIn 1s";
        qna.style.animation = "fadeIn 1s";
        setTimeout(() => {
            main.style.display = "none";
            qna.style.display = "block";
        },450)
        let qIdx = 0;
        goNext(qIdx);
    },500)

}
