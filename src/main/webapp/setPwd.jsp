<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비밀번호 변경 및 재설정</title>
    <link rel="stylesheet" type="text/css" href="./resource/css/setPwd.css">
</head>
<body>
<iframe
        src="./resource/html/menu.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 100px"
></iframe>

<div class="setPwd">
    <form action="setPwdAction.jsp" method="post">
        <div class="setPwd_input">
            <div>
                <input
                        id="inputPwd"
                        name="currentPwd"
                        type="password"
                        placeholder="현재 비밀번호를 입력하세요."
                />
            </div>
            <div>
                <input
                        id="inputNewPwd"
                        name="newPwd"
                        type="password"
                        placeholder="새 비밀번호를 입력하세요."
                />
            </div>
            <div>
                <input
                        id="inputNewPwdAgain"
                        name="newPwdAgain"
                        type="password"
                        placeholder="새 비밀번호를 다시 입력하세요."
                />
            </div>
        </div>
        <div class="setPwd_btn">
            <div>
                <button type="submit">확인</button>
            </div>
            <div>
                <button
                        id="cancelBtn"
                        type="button"
                        onclick="location.href='main.jsp'"
                >취소</button>
            </div>
        </div>
    </form>
</div>

<iframe
        src="./resource/html/footer.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 80px"
></iframe>
</body>
</html>
