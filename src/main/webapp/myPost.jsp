<%@ page import="bbs.bbsDAO" %>
<%@ page import="bbs.bbs" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./resource/css/community.css">
    <title>내가 쓴 글</title>
</head>
<body>
<iframe
        src="./resource/html/menu.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 100px"
></iframe>

<%
    String userId = "202310498";

    bbsDAO bbsdao = new bbsDAO();
    bbsdao.updateAuthorName();

    int startPage = 0;
    int pageCount = 30;

    int totalPost = bbsdao.getTotal();
    String tempStart = request.getParameter("bbs");

    String order = request.getParameter("order");
    if (order == null || order.isEmpty()) {
        order = "latest";
    }

    List<bbs> userPosts = bbsdao.getUserPost(userId);
    if (userPosts != null) {
%>

<form class="community" method="get">
    <div class="second">
        <button id="writeBtn" onclick="location.href='writing.jsp'">글 작성하기</button>
    </div>

    <hr />

    <table id="board">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <%
            for (int i = 0; i < userPosts.size(); i++) {
        %>
        <tr>
            <td><%= userPosts.get(i).getPostNum() %></td>
            <td>
                <%
                    String subjectPrefix = "";
                    int subject = userPosts.get(i).getSubject();
                    if (subject == 1) {
                        subjectPrefix = "[Q&A] ";
                    } else if (subject == 2) {
                        subjectPrefix = "[공지사항] ";
                    }
                %>
                <a href="post.jsp?postNum=<%= userPosts.get(i).getPostNum() %>">
                    <%= subjectPrefix + userPosts.get(i).getPostTitle() %>
                </a>
            </td>
            <td><%= userPosts.get(i).getAuthorName() %></td>
            <td><%= userPosts.get(i).getPostTime() %></td>
            <td><%= userPosts.get(i).getViewCount() %></td>
        </tr>
        <%
            }
        %>
    </table>

    <%
    } else {
    %>

    <table id="board">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>

        <tr>
            <td colspan="5">작성된 게시글이 없습니다.</td>
        </tr>

        <% } %>

        <script type="text"></script>

<%--    <div class="page">--%>
<%--        <%--%>
<%--            for (int i = 1; i <= totalPages; i++) {--%>
<%--        %>--%>
<%--        <a href="community.jsp?bbs=<%= i %>&order=<%= order %>" class="num"><%= i %></a>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
<%--    </div>--%>
</form>


<span id="studyIcon">📖</span>

<iframe
        src="./resource/html/footer.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 40px"
></iframe>
</body>
</html>
