<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./resource/css/setEmail.css">
    <title>이메일 주소 재설정</title>
</head>
<body>
<iframe
        src="./resource/html/menu2.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 100px"
></iframe>

<form class="setEmail" action="setEmailAction.jsp" method="post">
    <div class="setEmail_input">
        <input type="text" name="newEmail" placeholder="새로운 이메일 주소를 입력하세요." />
    </div>
    <div class="setEmail_input">
        <input
                id="inputNewPwd"
                name="currentPwd"
                type="text"
                placeholder="비밀번호를 입력하세요"
        />
    </div>

    <div class="setEmail_btn">
        <button id="setBtn" type="submit">
            이메일 변경
        </button>
    </div>
</form>
</body>

</html>
