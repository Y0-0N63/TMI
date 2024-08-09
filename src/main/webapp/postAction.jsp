<%@ page import="reply.replyDAO" %>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 보여주기 및 댓글 작성 액션</title>
</head>
<body>
<%
    PrintWriter script = response.getWriter();
    userDAO userdao = new userDAO();
    replyDAO replydao = new replyDAO();

    String postNumber = request.getParameter("postNum");
    String reContent = request.getParameter("reContent");

    System.out.println("postNum: " + postNumber);
    System.out.println("reContent: " + reContent);

    if (postNumber != null && !postNumber.isEmpty() && reContent != null && !reContent.isEmpty()) {
        try {
            int num = Integer.parseInt(postNumber);
            // 수정!!!!!!!!!!!!!!!!
            int userId = 202310498;
            Date reTime = new Date();
            String reName = userdao.getUserName(userId);
            java.sql.Date sqlDate = new java.sql.Date(reTime.getTime());

            boolean success = replydao.insertReply(num, userId, reContent, sqlDate);
            if (success) {
                response.sendRedirect("post.jsp?postNum=" + num);
            } else {
                response.sendRedirect("post.jsp?postNum=" + num + "&error=1");
            }
        } catch (NumberFormatException e) {
            script.println("<script>");
            script.println("alert('존재하지 않는 게시글입니다..');");
            script.println("location.href='community.jsp';");
            script.println("</script>");
        }
    } else {
        response.sendRedirect("post.jsp?postNum=" + postNumber + "&error=2");
    }
%>
</body>
</html>
