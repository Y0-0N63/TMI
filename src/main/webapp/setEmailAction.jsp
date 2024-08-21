<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.user" scope="page"></jsp:useBean>

<%
    userDAO userdao = new userDAO();
    PrintWriter script = response.getWriter();

    String currentEmail = request.getParameter("currentEmail");
    String newEmail = request.getParameter("newEmail");
    String currentPwd = request.getParameter("currentPwd");

    // !!!로그인한 사용자 학번 가져와야 함!!!
    String userId = "202310498";

    System.out.println("inputPwd: " + currentPwd);
    System.out.println("newEmail: " + newEmail);

    if (currentPwd != null && !currentPwd.isEmpty() && newEmail != null && !newEmail.isEmpty()) {
        if (!userdao.verifyPwd(userId, currentPwd)){
            script.println("<script>");
            script.println("alert('비밀번호를 다시 입력해주세요.');");
            script.println("history.back()");
            script.println("</script>");
            return;
        }

        boolean success = userdao.setEmail(userId, newEmail);
        if (success) {
            script.println("<script>");
            script.println("alert('이메일 주소가 성공적으로 변경되었습니다.');");
            script.println("location.href='main.jsp';");
            script.println("</script>");
        } else {
            script.println("<script>");
            script.println("alert('이메일 주소 변경에 실패했습니다.');");
            script.println("location.href='main.jsp';");
            script.println("</script>");
        }
    } else {
        script.println("<script>");
        script.println("alert('모든 항목을 입력해주세요.');");
        script.println("history.back()");
        script.println("</script>");
    }
%>