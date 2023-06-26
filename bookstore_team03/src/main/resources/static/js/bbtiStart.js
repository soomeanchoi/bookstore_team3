const main = document.querySelector("#main");
const qna = document.querySelector("#qna");
const result = document.querySelector("#result");
const selected = [];
const question = [];

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

        endPoint = que.length;
    },
    error: function (xhr, status, error) {
        console.error("AJAX 요청 실패:", status, error);
    }
});

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
    answer.addEventListener("click", function() {
        var children = document.querySelectorAll('.que');
        for (let i = 0; i < children.length; i++) {
            children[i].disabled = true;
            children[i].style.WebkitAnimation = "fadeOut 0.5s";
            children[i].style.animation = "fadeOut 0.5s";
        }
        setTimeout(() => {
            for (let i = 0; i < children.length; i++) {
                children[i].style.display = 'none';
            }
            var selectedAnswer = answerText;
            selected.push(selectedAnswer);
            question.push(que[qIdx]); // 선택된 답변과 질문을 각각 저장
            goNext(++qIdx);
        }, 450);
    }, false);
}

function goResult() {
    qna.style.WebkitAnimation = "fadeOut 1s";
    qna.style.animation = "fadeOut 1s";
    setTimeout(() => {
        result.WebkitTransition = "fadeIn 1s";
        result.style.animation = "fadeIn 1s";
        setTimeout(() => {
            qna.style.display = "none";
            result.style.display = "block";
        }, 450);
    }, 500);

    var dataToSend = {
        selected: selected,
        question: question // 선택된 답변과 질문을 함께 전송
    };

    $.ajax({
        url: "/research/resultTest",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(dataToSend),
        success: function(response) {
            // Ajax 요청 성공 시 처리할 코드 작성
            console.log("결과 전송 성공");
        },
        error: function(xhr, status, error) {
            // Ajax 요청 실패 시 처리할 코드 작성
            console.error("결과 전송 실패:", status, error);
        }
    });
}

function goNext(qIdx) {
    if (qIdx === endPoint) {
        goResult();
        return;
    }
    var q = document.querySelector(".qBox");
    q.innerHTML = que[qIdx];
    addAnswer(choose_A[qIdx], qIdx);
    addAnswer(choose_B[qIdx], qIdx);
    var status = document.querySelector('.statusBar');
    status.style.width = (100 / endPoint) * (qIdx + 1) + '%';
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
        }, 450);
        let qIdx = 0;
        goNext(qIdx);
    }, 500);
}
