    <%@ page import="bbs.bbsDAO" %>
    <%@ page import="bbs.bbs" %>
    <%@ page import="java.util.List" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>
    <head>
        <link rel="stylesheet" type="text/css" href="resource/css/bbs.css">
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
        bbsDAO bbsdao = new bbsDAO();
        bbsdao.updateAuthorName();

        String userId = "203310498";
        int limit = 30;
        int pageNum = 1;

        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }

        int start = (pageNum - 1) * limit;
        List<bbs> userPosts = bbsdao.getUserPost(userId, start, limit);
        int totalPosts = bbsdao.getUserPostCount(userId);
        int totalPages = (int) Math.ceil((double) totalPosts / limit);

        if (userPosts != null && !userPosts.isEmpty()) {
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

        <div class="page">
            <%
                for (int i = 1; i <= totalPages; i++) {
            %>
            <a href="myPost.jsp?pageNum=<%= i %>" class="num"><%= i %></a>
            <%
                }
            %>
        </div>
    <%
        } else {
    %>
        <table class="board">
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
        </table>

        <%
            }
        %>
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
