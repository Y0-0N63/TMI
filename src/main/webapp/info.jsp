<%@ page import="user.userDAO" %>
<%@ page import="user.user" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내 정보</title>
    <link rel="stylesheet" type="text/css" href="./resource/css/info.css">
</head>
<body>
<iframe
        src="./resource/html/menu.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 100px"
></iframe>

<%
    // !!수정!!
    // String userId = (String) session.getAttribute("userId");
//
//    if (userId == null || userId.trim().isEmpty()) {
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter writer = response.getWriter();
//        writer.println("<script>alert('로그인'); location.href='./login.html';</script>");
//        writer.close();
//        return;
//    }

    String userId = "202310498";

    // 사용자 정보 조회
    userDAO userdao = new userDAO();
    user userInfo = userdao.getUserInfo(userId);

    if (userInfo != null) {
%>

<div class="info">
    <div class="profile">
        <table>
            <tbody>
            <tr>
                <th rowspan="2"><img src="/TMI/img/person.png" /></th>
                <td class="title"><%= userInfo.getUserName() %></td>
            </tr>
            <tr>
                <td class="func">23학번</td>
            </tr>
            <tr>
                <td class="title">이메일</td>
                <td class="func">
                    <%= userInfo.getUserEmail() %>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="title">
                    <a href="./setPwd.html">비밀번호 변경</a>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="title">
                    <a href="./setEmail.html">이메일 변경</a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="mng">
        <div class="title">커뮤니티 관리</div>
        <div class="func">게시판 관리</div>
        <div class="func">이용 제한 내역</div>
    </div>
    <div class="use">
        <div class="title">이용 안내</div>
        <div class="func"><a href="./inquiry.html">문의하기</a></div>
        <div class="func">로그아웃</div>
        <div class="func"><a href="./cancel.html">회원탈퇴</a></div>
    </div>
</div>

<%
} else {
%>
<script type="text/javascript">
    alert('사용자 정보를 찾을 수 없습니다.');
    location.href = './login.html';
</script>
<%
    }
%>

<iframe
        src="./resource/html/footer.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 50px"
></iframe>
</body>
</html>
