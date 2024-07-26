<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./resource/css/login.css">
    <title>로그인</title>
</head>
<body>
<iframe
        src="./resource/html/menu.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 100px"
></iframe>

<form class="login" method="post" action="loginAction.jsp">
    <div class="login_input">
        <input name="userId" id="inputNum" type="text" placeholder="학번을 입력하세요." />
    </div>
    <div class="login_input">
        <input
                name="userPwd"
                id="inputPwd"
                type="password"
                placeholder="비밀번호를 입력하세요."
        />
    </div>
    <div class="login_button">
        <button id="loginBtn" type="submit" onclick="location.href='./index.html'">
            로그인
        </button>
    </div>
    <div class="login_link">
        <a href="join.jsp">회원가입</a>
        | <a href="getPwd.jsp">비밀번호 찾기</a>
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
