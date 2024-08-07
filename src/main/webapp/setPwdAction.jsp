<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.SQLException" %>
<%
    String currentPwd = request.getParameter("currentPwd");
    String newPwd = request.getParameter("newPwd");
    String newPwdAgain = request.getParameter("newPwdAgain");
    // !!!로그인한 사용자 학번 가져와야 함!!!
    String userId = "202310498";

    PrintWriter script = response.getWriter();
    userDAO userdao = new userDAO();

    if (currentPwd == null || newPwd == null || newPwdAgain == null) {
        script.println("<script>");
        script.println("alert('현재 비밀번호, 새로운 비밀번호를 모두 입력해주세요.');");
        script.println("history.back()");
        script.println("</script>");
    } else if (!newPwd.equals(newPwdAgain)) {
        script.println("<script>");
        script.println("alert('비밀번호를 다시 입력해주세요.');");
        script.println("history.back()");
        script.println("</script>");
    } else {
        boolean validCurrentPwd = userdao.login(userId, currentPwd);
        if (validCurrentPwd) {
            boolean setNewPwd = userdao.setPwd(userId, newPwd);
            if (setNewPwd) {
                script.println("<script>");
                script.println("alert('비밀번호가 성공적으로 변경되었습니다.');");
                script.println("location.href = 'main.jsp';");
                script.println("</script>");
            } else {
                script.println("<script>");
                script.println("alert('비밀번호 변경에 실패했습니다.');");
                script.println("history.back()");
                script.println("</script>");
            }
        } else {
            script.println("<script>");
            script.println("alert('현재 비밀번호가 올바르지 않습니다.');");
            script.println("history.back()");
            script.println("</script>");
        }
    }
%>
