<%@ page contentType="text/html;charset=UTF-8" buffer="none" %>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.user" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userId" param="userId"></jsp:setProperty>
<jsp:setProperty name="user" property="userName" param="userName"></jsp:setProperty>
<jsp:setProperty name="user" property="userPwd" param="userPwd"></jsp:setProperty>
<jsp:setProperty name="user" property="userEmail" param="userEmail"></jsp:setProperty>

<html>
<head>
    <title>회원가입 액션</title>
</head>
<body>
<%
    userDAO userdao = new userDAO();
    PrintWriter script = response.getWriter();

    System.out.println("UserId: " + user.getUserId());
    System.out.println("UserName: " + user.getUserName());
    System.out.println("UserPwd: " + user.getUserPwd());
    System.out.println("UserEmail: " + user.getUserEmail());

    if (user.getUserId() != null && user.getUserName() != null && user.getUserPwd() != null && user.getUserEmail() != null) {
        boolean success = userdao.join(user);
        if (success) {
            script.println("<script>");
            script.println("alert('회원가입이 완료되었습니다.');");
            script.println("location.href='main.jsp';");
            script.println("</script>");
        } else {
            script.println("<script>");
            script.println("alert('회원가입에 실패했습니다.');");
            script.println("history.back();");
            script.println("</script>");
        }
    } else {
        script.println("<script>");
        script.println("alert('모든 항목을 입력해주세요.');");
        script.println("history.back();");
        script.println("</script>");
    }
%>
</body>
</html>
