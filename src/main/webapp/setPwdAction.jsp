<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.user" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userPwd" param="userPwd"></jsp:setProperty>
<jsp:setProperty name="user" property="userId" param="userId"></jsp:setProperty>

<%
    userDAO userdao = new userDAO();
    PrintWriter script = response.getWriter();

    String currentPwd = request.getParameter("currentPwd");
    String newPwd = request.getParameter("newPwd");
    String newPwdAgain = request.getParameter("newPwdAgain");
    // !!!로그인한 사용자 학번 가져와야 함!!!
    String userId = "202310498";

    System.out.println("currentPwd: " + currentPwd);
    System.out.println("newPwd: " + newPwd);
    System.out.println("newPwdAgain: " + newPwdAgain);

    if (currentPwd != null && !currentPwd.isEmpty() && newPwd != null && !newPwd.isEmpty() && newPwdAgain != null && !newPwdAgain.isEmpty()) {
        if (!userdao.verifyPwd(userId, currentPwd)){
            script.println("<script>");
            script.println("alert('현재 비밀번호를 다시 입력해주세요.');");
            script.println("history.back()");
            script.println("</script>");
            return;
        }
        boolean success = userdao.setPwd(userId, newPwd);
        if (success) {
            script.println("<script>");
            script.println("alert('비밀번호가 성공적으로 변경되었습니다.');");
            script.println("location.href='main.jsp';");
            script.println("</script>");
        } else {
            script.println("<script>");
            script.println("alert('비밀번호 변경에 실패했습니다.');");
            script.println("history.back()");
            script.println("</script>");
        }
    } else {
        script.println("<script>");
        script.println("alert('모든 항목을 입력해주세요.');");
        script.println("history.back()");
        script.println("</script>");
    }
%>
