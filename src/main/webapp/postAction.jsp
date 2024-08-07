<%@ page import="java.util.Date" %>
<%@ page import="reply.replyDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 보여주기 및 댓글 작성 액션</title>
</head>
<body>
<%
    String postNumStr = request.getParameter("postNum");
    String reContent = request.getParameter("reContent");

    if (postNumStr != null && reContent != null && !reContent.trim().isEmpty()) {
        int postNum = Integer.parseInt(postNumStr);

        // 실제 사용자 정보로 수정하기!!!
        int userId = 202310498;
        String reName = "최보윤";

        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

        replyDAO replyDao = new replyDAO();
        boolean success = replyDao.insertReply(postNum, userId, reName, reContent, sqlDate);

        if (success) {
            response.sendRedirect("post.jsp?postNum=" + postNum);
        } else {
            response.sendRedirect("post.jsp?postNum=" + postNum + "&error=1");
        }
    } else {
        response.sendRedirect("post.jsp?postNum=" + postNumStr + "&error=2");
    }
%>

</body>
</html>
