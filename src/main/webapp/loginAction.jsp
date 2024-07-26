<%@ page contentType="text/html;charset=UTF-8" language="java" buffer="none" %>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.user" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userId"></jsp:setProperty>
<jsp:setProperty name="user" property="userPwd"></jsp:setProperty>

<html>
<head>
    <title>로그인 액션</title>
</head>
<body>
<%
    if (user.getUserId() != null || user.getUserPwd() != null) {
        userDAO userdao = new userDAO();
        PrintWriter script = response.getWriter();

        try {
            userdao.login(user.getUserId(), user.getUserPwd());
            script.println("<script>");
            script.println("location.href = 'main.jsp';");
            script.println("</script>");
        } catch (Exception e) {
            script.println("<script>");
            script.println("alert('" + e.getMessage() + "');");
            script.println("history.back()");
            script.println("</script>");
        }
    }
%>
</body>
</html>
