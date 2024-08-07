<%@ page import="bbs.bbsDAO" %>
<%@ page import="reply.replyDAO" %>
<%@ page import="bbs.bbs" %>
<%@ page import="reply.reply" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>
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

<%
    String postNumStr = request.getParameter("postNum");

    // 게시글 번호가 없거나 비어있는 경우
    if (postNumStr == null || postNumStr.trim().isEmpty()) {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        writer.println("<script>alert('게시글 번호가 없습니다.'); location.href='./post.html';</script>");
        writer.close();
        return;
    }

    int postNum;
    try {
        postNum = Integer.parseInt(postNumStr);
    } catch (NumberFormatException e) {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        writer.println("<script>alert('잘못된 게시글 번호입니다.'); location.href='./post.html';</script>");
        writer.close();
        return;
    }

    // 게시글 조회
    bbsDAO dao = new bbsDAO();
    bbs post = dao.getPost(postNum);

    if (post != null) {
        // 조회수 증가
        dao.incrementViewCount(postNum);

        // 댓글 조회
        replyDAO replydao = new replyDAO();
        List<reply> comments = replydao.getReplies(postNum);
%>

<form action="postAction.jsp" method="post" class="container">
    <div class="writing">
        <div id="sort"><%= post.getSubject() %></div>
        <br />
        <div id="inputTitle"><%= post.getPostTitle() %></div>
        <br />
        <br />
        <div id="inputContent"><%= post.getPostContent() %></div>
        <br />
        <div id="viewCount">조회수: <%= post.getViewCount() %></div> <!-- 조회수 표시 -->
    </div>

    <div class="comment">
        <% for (reply comment : comments) { %>
        <div id="writer"><%= comment.getReName() %></div>
        <br />
        <div id="cmtContent"><%= comment.getReContent() %></div>
        <br />
        <% } %>
    </div>

    <div class="writeCmt">
        <input id="inputCmt" name="reContent" placeholder="댓글 작성하기" />
        <input type="hidden" name="postNum" value="<%= postNum %>" />
        <button type="submit" id="cmtBtn">
            등록하기
        </button>
        <button id="cancelBtn" type="button" onclick="location.href='./post.html'">
            나가기
        </button>
    </div>
</form>

<%
} else {
%>
<script type="text/javascript">
    alert('게시글을 찾을 수 없습니다.');
    location.href = './post.html';
</script>
<%
    }
%>

<iframe
        src="./resource/html/footer.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 80px"
></iframe>
</body>
</html>
