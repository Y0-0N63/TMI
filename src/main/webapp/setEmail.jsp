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

<div class="setEmail">
    <div class="setEmail_input">
        <input type="text" placeholder="새로운 이메일 주소를 입력하세요." />
    </div>
    <div class="setEmail_input">
        <input
                id="inputNewPwd"
                type="text"
                placeholder="비밀번호를 입력하세요"
        />
    </div>

    <div class="setEmail_btn">
        <button id="setBtn" onclick="alert('이메일이 재설정되었습니다.')">
            이메일 변경
        </button>
    </div>
</div>
</body>

</html>
