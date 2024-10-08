<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bbs.bbsDAO" %>
<%@ page import="bbs.bbs" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="resource/css/bbs.css">
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
    bbsdao.updateAuthorName();

    String tempStart = request.getParameter("bbs");
    String order = request.getParameter("order");

    int startPage = 0;
    int pageCount = 30;

    if(tempStart != null){
        startPage = (Integer.parseInt(tempStart) - 1) * pageCount;
    }

    if (order == null || order.isEmpty()) {
        order = "latest";
    }

    // 검색어 처리 -> 게시글 목록 가져오기
    String searchKeyword = request.getParameter("search");
    Vector<bbs> posts = bbsdao.getPosts(startPage, pageCount, order, searchKeyword);

    // 검색어가 있음 -> 전체 게시글 개수 = 검색된 결괏값 수
    int totalPost = searchKeyword != null && !searchKeyword.trim().isEmpty() ? posts.size() : bbsdao.getTotal();
    int totalPages = (int)Math.ceil((double)totalPost / pageCount);
%>

<form class="community" method="get">
    <div class="first">
        <span class="menuItem">
          <input
                  type="text"
                  id="menuSearch"
                  name="search"
                  placeholder="검색어를 입력해주세요"
          />
        </span>

        <button id="searchBtn" type="submit">검색</button>
    </div>

    <div class="second">
        <button id="writeBtn" onclick="location.href='writing.jsp'">글 작성하기</button>

        <div>
            <label for="order"></label>
            <select name="order" id="order" onchange="this.form.submit()">
                <option value="latest" <%= "latest".equals(order) ? "selected" : "" %>>최신순</option>
                <option value="popular" <%= "popular".equals(order) ? "selected" : "" %>>인기순</option>
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
            for (int i = 0; i < posts.size(); i++) {
        %>
        <tr class="<%= posts.get(i).getSubject() == 2 ? "notice" : "" %>">
            <td><%= posts.get(i).getPostNum() %></td>
            <td>
                <%
                    String subjectPrefix = "";
                    int subject = posts.get(i).getSubject();
                    if (subject == 1) {
                        subjectPrefix = "[Q&A] ";
                    } else if (subject == 2) {
                        subjectPrefix = "[공지사항] ";
                    }
                %>
                <a href="post.jsp?postNum=<%= posts.get(i).getPostNum() %>">
                    <%= subjectPrefix + posts.get(i).getPostTitle() %>
                </a>
            </td>
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
            // 현재 URL에 존재하는 검색어와 정렬 조건을 포함하여 링크 생성
            String searchQuery = searchKeyword != null ? "&search=" + URLEncoder.encode(searchKeyword, "UTF-8") : "";
            String orderQuery = order != null ? "&order=" + order : "";

            for (int i = 1; i <= totalPages; i++) {
        %>
        <a href="bbs.jsp?bbs=<%= i %><%= searchQuery %><%= orderQuery %>" class="num"><%= i %></a>
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