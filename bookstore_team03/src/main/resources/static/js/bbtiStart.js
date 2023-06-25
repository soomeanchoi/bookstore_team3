const main = document.querySelector("#main");
const qna = document.querySelector("#qna");

var que;
var choose_A;
var choose_B;

var endPoint;



$.ajax({
    url: "/research/kakao1",
    type: "GET",
    success: function (data) {


        que = data.que;
        choose_A = data.choose_A;
        choose_B = data.choose_B;

        // alert(que.length);
        endPoint = que.length;
        // alert(endPoint);
        // alert("hi")

        // alert(que.toString());
        // alert(choose_A.toString());
        // alert(choose_B.toString());

    },
    error: function (xhr, status, error) {
        //요청에 실패한 경우 에러 처리 수행
        console.error("AJAX 요청 실패:", status, error);
    }
})


function addAnswer(answerText, qIdx) {
    var a = document.querySelector('.answerBox');
    var answer = document.createElement('button');
    answer.classList.add('que');
    answer.classList.add('my-3');
    answer.classList.add('py-3');
    answer.classList.add('mx-auto');
    answer.classList.add('fadeIn');

    a.appendChild(answer);
    answer.innerHTML = answerText;
    answer.addEventListener("click", function(){
        var children = document.querySelectorAll('.que');
        for (let i =0; i < children.length; i ++){
            children[i].disabled = true;
            children[i].style.WebkitAnimation = "fadeOut 0.5s";
            children[i].style.animation = "fadeOut 0.5s";
        }
        setTimeout(() => {
            for (let i =0; i < children.length; i ++){
                children[i].style.display = 'none';
            }
            goNext(++qIdx);
        },450)
    }, false);
}

function goNext(qIdx) {
    var q = document.querySelector(".qBox");
    q.innerHTML = que[qIdx];
    addAnswer(choose_A[qIdx] ,qIdx);
    addAnswer(choose_B[qIdx], qIdx);
    var status = document.querySelector('.statusBar');
    status.style.width = (100/endPoint) * (qIdx+1) + '%';

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
