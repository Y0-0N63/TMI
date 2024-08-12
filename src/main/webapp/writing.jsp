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

<form class="writing" method="post" action="writingAction.jsp">
    <div class="writing_input">
        <div class="input_sort">
            <select name="subject" id="sort">
                <option value="none">말머리 없음</option>
                <option value="q&a">Q&A</option>
                <option value="notice">공지사항</option>
            </select>
        </div>
        <div class="input_title">
          <textarea
                  id="inputTitle"
                  name="postTitle"
                  placeholder="제목을 작성해주세요."
                  scrolling="no"
          ></textarea>
        </div>
        <div class="input_content">
          <textarea
                  name="postContent"
                  id="inputContent"
                  placeholder="게시글을 작성해주세요."
                  scrolling="no"
          ></textarea>
        </div>
    </div>

    <div class="writing_btn">
        <div class="btn_clip">
            <input type="file" id="fileInput" style="display: none" />
            <img
                    type="file"
                    src="../../img/attach_clip.png"
                    id="clip"
                    alt="clip"
            />
            <div id="fileName">No File Chosen</div>
        </div>
        <div class="btn_upload">
            <button onclick="alert('게시글을 업로드하였습니다.')">업로드</button>
        </div>
        <div class="btn_cancel">
            <button id="cancelBtn" onclick="location.href='./index.html'">
                취소
            </button>
        </div>
    </div>
</form>

<script src="./resource/js/writing.js"></script>
</body>
</html>
