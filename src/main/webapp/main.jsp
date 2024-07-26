<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./resource/css/main.css">
    <title>메인 페이지</title>
</head>
<body>
<iframe
        src="./resource/html/menu.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 100px"
></iframe>

<div class="notice">
    <div class="notice" id="noticeBar">📢 공지 예시글</div>
</div>

<div class="container">
    <div class="bbs">
        🔥인기글
        <div class="post">
            <a href="./postEx.html"
            >1️⃣ <span class="boldPost">[공지사항]&nbsp;</span>인기 게시글 제목
                1</a
            >
        </div>
        <div class="post">
            <a href="./postEx.html">2️⃣ 인기 게시글 제목 2</a>
        </div>
        <div class="post">
            <a href="./postEx.html"
            >3️⃣ <span class="boldPost">[Q&A]&nbsp;</span>인기 게시글 제목 3</a
            >
        </div>
        <div class="post">
            <a href="./postEx.html">4️⃣ 인기 게시글 제목 4</a>
        </div>
        <div class="post">
            <a href="./postEx.html">5️⃣ 인기 게시글 제목 5</a>
        </div>
    </div>

    <div class="calendarContainer">
        <div class="calendar">
            <div class="header">
                <div class="year-month"></div>
                <div class="nav">
                    <button class="nav-btn go-prev" onclick="prevMonth()">
                        &lt;
                    </button>
                    <button class="nav-btn go-today" onclick="goToday()">
                        Today
                    </button>
                    <button class="nav-btn go-next" onclick="nextMonth()">
                        &gt;
                    </button>
                </div>
                <div class="main">
                    <div class="days">
                        <div class="day">일</div>
                        <div class="day">월</div>
                        <div class="day">화</div>
                        <div class="day">수</div>
                        <div class="day">목</div>
                        <div class="day">금</div>
                        <div class="day">토</div>
                    </div>
                    <div class="dates"></div>
                </div>
            </div>
            <script src="js/calendar.js"></script>
        </div>
        <br />
        <div>
            <div>
                <div>
                    <span class="scheduleDay">2024.06.06&nbsp;&nbsp;</span>
                    <span class="scheduleContent"
                    ><span class="othersContent">[기타]</span>&nbsp;현충일</span
                    >
                </div>
                <div>
                    <span class="scheduleDay">2024.06.10~16&nbsp;&nbsp;</span>
                    <span class="scheduleContent">
                <span class="schContent">[학사]&nbsp;</span> 보강 및 기말고사
                기간
              </span>
                </div>
                <div>
                    <span class="scheduleDay">2024.06.17&nbsp;&nbsp;</span>
                    <span class="scheduleContent">
                <span class="schContent">[학사]&nbsp;</span> 하계 계절학기 기간
              </span>
                </div>
                <div>
                    <span class="scheduleDay">2024.06.21&nbsp;&nbsp;</span>
                    <span class="scheduleContent">
                <span class="clbContent">[동아리]&nbsp;</span> 모의 토익 응시 및
                그룹별 해설
              </span>
                </div>
                <div>
                    <span class="scheduleDay">2024.06.20~24&nbsp;&nbsp;</span>
                    <span class="scheduleContent">
                <span class="schContent">[학사]&nbsp;</span> 1학기 성적 확인 및
                이의 신청 기간
              </span>
                </div>
            </div>
        </div>
    </div>
</div>

<span id="studyIcon">📖</span>

<iframe
        src="./resource/html/footer.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 50px"
></iframe>
</body>
</html>
