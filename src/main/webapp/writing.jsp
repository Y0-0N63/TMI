<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 작성</title>
    <link rel="stylesheet" type="text/css" href="./resource/css/writing.css">
</head>
<body>
<iframe
        src="./resource/html/menu2.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 100px"
></iframe>

<form class="container" method="post" action="writingAction.jsp">
    <div class="writing">
        <select name="subject" id="sort">
            <option value="none">말머리 없음</option>
            <option value="q&a">Q&A</option>
            <option value="notice">공지사항</option>
        </select>
        <br />
        <textarea
                name="postTitle"
                id="inputTitle"
                placeholder="제목을 작성해주세요."
                scrolling="no"
        ></textarea>
        <br />
        <textarea
                name="postContent"
                id="inputContent"
                placeholder="게시글을 작성해주세요."
                scrolling="no"
        ></textarea>
        <br />
    </div>

    <div class="btn">
        <img src="/TMI/img/clip.png" id="clip" />
        <input type="file" id="fileInput" name="fileInput" class="hidden-file-input" />
        <span id="fileName">첨부 파일 없음</span>
        <br />
        <button id="inqBtn" type="submit">
            업로드
        </button>
        <button id="cancelBtn" type="button" onclick="location.href='main.jsp'">
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

<script src="./resource/js/writing.js"></script>
</body>
</html>