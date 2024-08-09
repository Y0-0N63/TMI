<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bbs.bbsDAO" %>
<%@ page import="bbs.bbs" %>
<%@ page import="java.util.Vector" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./resource/css/community.css">
    <title>게시판</title>
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
    int totalPost = bbsdao.getTotal();
    String tempStart = request.getParameter("bbs");

    int startPage = 0;
    int pageCount = 30;

    if(tempStart!=null){
        startPage = (Integer.parseInt(tempStart)-1)*pageCount;
    }

    Vector<bbs> posts = bbsdao.getPosts(startPage, pageCount);
    int totalPages = (int)Math.ceil((double)totalPost / pageCount);
%>

<form class="community" method="post">
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
        <button id="writeBtn">글 작성하기</button>

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
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <%
            for (int i=0; i<posts.size(); i++) {
        %>
        <tr>
            <td><%= posts.get(i).getPostNum() %></td>
            <td><a href="#"> <%= posts.get(i).getPostTitle() %></a></td>
            <td><%= posts.get(i).getAuthorName() %></td>
            <td><%= posts.get(i).getPostTime() %></td>
            <td><%= posts.get(i).getViewCount() %></td>
        </tr>
        <%
            }
        %>
    </table>

    <div class="page">
        <%
            for (int i = 1; i <= totalPages; i++) {
        %>
        <a href="community.jsp?bbs=<%= i %>" class="num"><%= i %></a>
        <%
            }
        %>
    </div>
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
