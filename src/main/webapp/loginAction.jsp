<%@ page contentType="text/html;charset=UTF-8" language="java" buffer="none" %>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="user" class="user.user" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userId"></jsp:setProperty>
<jsp:setProperty name="user" property="userPwd"></jsp:setProperty>

<html>
<head>
    <title>로그인 액션</title>
</head>
<body>
<%
    String userId = request.getParameter("userId");
    String userPwd = request.getParameter("userPwd");

    userDAO userdao = new userDAO();
    PrintWriter script = response.getWriter();
    ResultSet rs = null;

    if (userId != null && userPwd != null){
        try {
            rs = userdao.getUserId(userId);
            if (rs.next()){
                String dbPwd = rs.getString("userPwd");
                if(dbPwd.equals(userPwd)){
                    script.println("<script>");
                    script.println("alert('성공적으로 로그인했습니다.');");
                    script.println("location.href = 'main.jsp';");
                    script.println("</script>");
                } else {
                    script.println("<script>");
                    script.println("alert('비밀번호를 다시 입력해주세요.');");
                    script.println("history.back();");
                    script.println("</script>");
                }
            } else {
                script.println("<script>");
                script.println("alert('존재하지 않는 학번입니다.');");
                script.println("history.back();");
                script.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            script.println("<script>");
            script.println("alert('서버 오류가 발생했습니다.');");
            script.println("history.back();");
            script.println("</script>");
        } finally {
            if (rs != null) rs.close();
            if (userdao != null) userdao.conn.close();
        }
    } else {
        script.println("<script>");
        script.println("alert('학번과 비밀번호를 모두 입력해주세요.');");
        script.println("history.back();");
        script.println("</script>");
    }
%>
</body>
</html>
