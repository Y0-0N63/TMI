<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>캘린더</title>
    <link rel="stylesheet" type="text/css" href="./resource/css/calendar.css">
</head>
<body>
<iframe
        src="./resource/html/menu2.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 100px"
></iframe>

<div class="container">
    <div class="calendar">
        <div class="calendar_header">
            <div class="year-month"></div>
            <div class="calendar_nav">
                <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
                <button class="nav-btn go-today" onclick="goToday()">Today</button>
                <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
            </div>
            <div class="calendar_main">
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
        <script src="./resource/js/calendar.js"></script>
    </div>

    <div class="confirm">
        <div class="confirm_voca">
            <div class="voca_title">이번 주 단어 제출</div>
            <div class="voca_day">
                <div class="daily">화</div>
                <div class="daily">목</div>
                <div class="daily">토</div>
                <div class="daily">일</div>
            </div>
        </div>

        <div class="confirm_weekly-time">
            <div class="weekly-time_title">이번 주 총 공부 시간</div>
            <div class="weekly-time_content">00H 00M</div>
        </div>

        <div class="dayily-time_title">
            <div class="dayily-time_title">오늘의 공부 시간</div>
            <div class="dayily-time_content">00H 00M</div>
        </div>
    </div>
</div>

<span id="studyIcon">📖</span>
</body>
</html>
