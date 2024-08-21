<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="./resource/css/join.css">
</head>
<body>
<iframe
        src="./resource/html/menu.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 100px"
></iframe>

<form class="join" method="post" action="joinAction.jsp">
    <div class="join_input">
        <input name="userId" id="inputNum" type="text" placeholder="학번을 입력하세요" />
    </div>
    <div class="join_input">
        <input name="userName" id="inputName" type="text" placeholder="이름을 입력하세요" />
    </div>
    <div class="join_input">
        <input
                name="userPwd"
                id="inputPwd"
                type="password"
                placeholder="비밀번호을 입력하세요"
        />
    </div>
    <div class="join_input">
        <input
                name="userEmail"
                id="inputEmail"
                type="text"
                placeholder="이메일 주소를 입력하세요"
        />
    </div>
    <div class="join_input">
        <input
                id="inputConfirm"
                type="text"
                placeholder="인증번호 4자리를 입력하세요"
        />
    </div>
    <div class="join_btn">
        <button
                id="joinBtn"
                type="submit"
        >
            가입하기
        </button>
        <button
                id="cancelBtn"
                type="button"
                onclick="location.href='main.jsp'"
        >
            취소
        </button>
    </div>
</form>

<iframe
        src="./resource/html/footer.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 80px"
></iframe>
</body>
</html>
