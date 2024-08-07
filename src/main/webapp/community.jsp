<%@ page import="bbs.bbsDAO" %>
<%@ page import="bbs.bbs" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>커뮤니티</title>
    <link rel="stylesheet" type="text/css" href="./resource/css/community.css">
</head>
<body>
<iframe
        src="./resource/html/menu.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 100px"
></iframe>

<%
    int pageSize = 30;
    int pageNumber = 1;

    String pageParam = request.getParameter("page");
    if (pageParam != null && !pageParam.trim().isEmpty()) {
        try {
            pageNumber = Integer.parseInt(pageParam);
        } catch (NumberFormatException e) {
            pageNumber = 1;
        }
    }

    bbsDAO bbsdao = new bbsDAO();
    List<bbs> posts = bbsdao.getPosts(pageNumber, pageSize);
    int totalPosts = bbsdao.getTotalPostCount();
    int totalPages = (int) Math.ceil(totalPosts / (double) pageSize);
%>

<div class="community">
    <div class="first">
        <div>
            <label for="sort"></label>
            <select name="sort" id="sort">
                <option value="all">전체 게시글</option>
                <option value="q&a">Q&A</option>
                <option value="notice">공지사항</option>
            </select>
        </div>

        <span class="menuItem">
          <input
                  type="text"
                  id="menuSearch"
                  placeholder="검색어를 입력해주세요"
          />
        </span>

        <button id="searchBtn">검색</button>
    </div>

    <div class="second">
        <button id="writeBtn" onclick="location.href='./writing.jsp'">글 작성하기</button>

        <div>
            <label for="order"></label>
            <select name="order" id="order">
                <option value="latest">최신순</option>
                <option value="popular">인기순</option>
            </select>
        </div>
    </div>

    <hr />
    <table id="board">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <% for (bbs post : posts) { %>
        <tr>
            <td><%= post.getPostNum() %></td>
            <td><a href="./post.jsp?postNum=<%= post.getPostNum() %>"><%= post.getPostTitle() %></a></td>
            <td>작성자</td> <!-- Add the actual author information if available -->
            <td><%= new java.text.SimpleDateFormat("yyyy.MM.dd").format(post.getPostTime()) %></td>
            <td>조회수</td> <!-- Add the actual view count if available -->
        </tr>
        <% } %>
        </tbody>
    </table>

    <div class="page">
        <% for (int i = 1; i <= totalPages; i++) { %>
        <div class="num">
            <a href="?page=<%= i %>"><%= i %></a>
        </div>
        <% } %>
    </div>
</div>

<span id="studyIcon">📖</span>

<iframe
        src="./resource/html/footer.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 40px"
></iframe>
</body>
</html>
