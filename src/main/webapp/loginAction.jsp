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
    userDAO userdao = new userDAO();
    PrintWriter script = response.getWriter();

    String userId = request.getParameter("userId");
    String userPwd = request.getParameter("userPwd");

    System.out.println("userId: " + userId);
    System.out.println("userPwd: " + userPwd);


    if (userId != null && !userId.isEmpty() && userPwd != null && !userPwd.isEmpty()) {
        boolean success = userdao.login(userId, userPwd);
        if (success){
            script.println("<script>");
            script.println("location.href = 'main.jsp';");
            script.println("</script>");
        } else {
            script.println("<script>");
            script.println("alert('학번과 비밀번호를 다시 입력해주세요.');");
            script.println("history.back()");
            script.println("</script>");
        }
    } else {
        script.println("<script>");
        script.println("alert('아이디와 비밀번호를 입력해주세요.');");
        script.println("history.back()");
        script.println("</script>");
    }
%>
</body>
</html>
