<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./resource/css/post.css">
    <title>게시글 보여주기 및 댓글 작성</title>
</head>
<body>
<iframe
        src="./resource/html/menu2.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 100px"
></iframe>

<form action="postAction.jsp" method="post" class="container">
    <div class="writing">
        <div id="sort"></div>
        <br />
        <div id="inputTitle" scrolling="no"></div>
        <br />
        <br />
        <div id="inputContent" scrolling="no">
        </div>
        <br />
    </div>

    <div class="comment">
        <div id="writer"></div>
        <br />
        <div id="cmtContent">
        </div>
    </div>

    <div class="writeCmt">
        <input id="inputCmt" placeholder="댓글 작성하기" />
        <button id="cmtBtn" onclick="alert('댓글을 업로드하였습니다.')">
            등록하기
        </button>
        <button id="cancelBtn" onclick="location.href='./post.html'">
            나가기
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
