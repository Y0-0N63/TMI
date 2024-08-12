<%@ page import="user.user" %>
<%@ page import="user.userDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About Us</title>
    <link rel="stylesheet" type="text/css" href="./resource/css/aboutUs.css">
</head>
<body>
<iframe
        src="./resource/html/menu2.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 100px"
></iframe>

<div class="info">
    <div class="info_intro">
        <div class="intro_title">📖동아리 소개</div>
        <div class="intro_content">Toeic In Medical information</div>
    </div>

    <div class="info_activity">
        <div class="activity_title">🔥동아리 활동</div>
        <div class="activity_content">
            우리 동아리는 토익을 공부하는 사람들이 서로 동기부여가 되어 이끌어줘
            원하는 점수에 도달할 수 있도록 도와주는 동아리입니다.
        </div>
    </div>

    <div class="info_current-member">
        <div class="current-member_title">🙋현재 부원 (1기)</div>
        <div class="current-member_content">
            <div class="content_manager">
                <div class="manager_title">운영진</div>
                <div class="manager_list">
                    <%
                        int generation = Integer.parseInt(request.getParameter("generation") != null ? request.getParameter("generation") : "1");
                        userDAO userdao = new userDAO();
                        List<user> managers = userdao.getUserType(1, generation);
                        for (user manager : managers) {
                    %>
                    <div class="list_profile">
                        <div class="profile_img"></div>
                        <div class="profile_text">
                            <span class="text_num">23'</span>
                            &nbsp;&nbsp;
                            <span class="text_namename"><%= manager.getUserName() %></span>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>

            <div class="content_member">
                <div class="member_title">부원</div>
                <div class="member_list">
                    <%
                        List<user> members = userdao.getUserType(0, generation);
                        for (user member : members) {
                    %>
                    <div class="list_item">
                        <div class="profile_img"></div>
                        <div class="profile_text">
                            <span class="text_num">23'</span>
                            &nbsp;&nbsp;
                            <span class="text_namename"><%= member.getUserName() %></span>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>

            <div class="info_select">
                <label for="termSelect" id="termText">이전 기수 보러 가기➡️</label>
                <select id="termSelect" onchange="location.href='aboutUs.jsp?generation=' + this.value;">
                    <option value="1" <%= (generation == 1) ? "selected" : "" %>>1기</option>
                    <option value="2" <%= (generation == 2) ? "selected" : "" %>>2기</option>
                    <option value="3" <%= (generation == 3) ? "selected" : "" %>>3기</option>
                    <option value="4" <%= (generation == 4) ? "selected" : "" %>>4기</option>
                    <option value="5" <%= (generation == 5) ? "selected" : "" %>>5기</option>
                </select>
            </div>

            <span id="studyIcon">📖</span>
        </div>
    </div>
</div>

<iframe
        src="./resource/html/footer.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 100px"
></iframe>
</body>
</html>
