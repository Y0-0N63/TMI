<%@ page contentType="text/html;charset=UTF-8" language="java" buffer="none"%>
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

    if (user.getUserId() == null || user.getUserPwd() == null || user.getUserEmail() == null || user.getUserName() == null) {
        script.println("<script>");
        script.println("alert('학번과 비밀번호, 이름을 입력해주세요.');");
        script.println("history.back()");
        script.println("</script>");
    } else {
        // try-catch 사용하지 않고 리턴값을 바탕으로 if-else를 걸어서 판단하깅
        try {
            userdao.join(user);
            script.println("<script>");
            script.println("alert('회원가입이 완료되었습니다.');");
            script.println("location.href='main.jsp';");
            script.println("</script>");
        } catch (Exception e) {
            script.println("<script>");
            script.println("alert('회원가입에 실패했습니다: " + e.getMessage() + "');");
            script.println("history.back()");
            script.println("</script>");
        }
    }
%>
</body>
</html>
