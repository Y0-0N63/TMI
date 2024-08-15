<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./resource/css/fullcalendar.css">
<link rel="stylesheet" type="text/css" href="./resource/css/timegrid.css">
<link rel="stylesheet" type="text/css" href="./resource/css/calendar.css">

<script src="./resource/js/fullcalendar.js"></script>
<script src="./resource/js/interaction.js"></script>
<script src="./resource/js/daygrid.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            plugins: ['interaction', 'dayGrid'],
            header: {
                left: 'prev,next',
                center: 'title',
                right: 'today',
            },
            defaultDate: '2024-08-15',
            navLinks: true,
            businessHours: true,
            editable: true,
            events: [
                {
                    title: '신정',
                    start: '2024-01-01',
                    end: '2024-01-01',
                    type: 'etc',
                },
                {
                    title: '시무식',
                    start: '2024-01-02',
                    end: '2024-01-02',
                    type: 'adm',
                },
                {
                    title: '정시 원서 접수',
                    start: '2024-01-03',
                    end: '2024-01-15',
                    type: 'univ',
                },
                {
                    title: '휴(복)학, 전과 신청기간',
                    start: '2024-01-22',
                    end: '2024-01-26',
                    type: 'univ',
                },
                {
                    title: '정시 면접',
                    start: '2024-01-25',
                    end: '2024-01-25',
                    type: 'univ',
                },
                {
                    title: '전기 학위 수여식',
                    start: '2024-02-06',
                    end: '2024-02-06',
                    type: 'univ',
                },
                {
                    title: '설날',
                    start: '2024-02-09',
                    end: '2024-02-12',
                    type: 'etc',
                },
                {
                    title: '1학기 재학생 등록기간',
                    start: '2024-02-19',
                    end: '2024-02-23',
                    type: 'univ',
                },
                {
                    title: '신입생 비전세움 및 입학식',
                    start: '2024-02-22',
                    end: '2024-02-22',
                    type: 'univ',
                },
                {
                    title: '교수회의 및 헌신회',
                    start: '2024-02-22',
                    end: '2024-02-23',
                    type: 'adm',
                },
                {
                    title: '삼일절',
                    start: '2024-03-01',
                    end: '2024-03-01',
                    type: 'etc',
                },
                {
                    title: '1학기 개강',
                    start: '2024-03-04',
                    end: '2024-03-04',
                    type: 'univ',
                },
                {
                    title: '1학기 수강신청 변경 기간',
                    start: '2024-03-04',
                    end: '2024-03-08',
                    type: 'univ',
                },
                {
                    title: '개교기념일(88주년)',
                    start: '2024-04-01',
                    end: '2024-04-01',
                    type: 'univ',
                },
                {
                    title: '춘계인성교육주간(건강회복주간)',
                    start: '2024-04-08',
                    end: '2024-04-12',
                    type: 'univ',
                },
                {
                    title: '22대 국회의원 선거',
                    start: '2024-04-10',
                    end: '2024-04-10',
                    type: 'etc',
                },
                {
                    title: '중간고사 기간',
                    start: '2024-04-22',
                    end: '2024-04-26',
                    type: 'univ',
                },
                {
                    title: '근로자의 날(개교기념일 대체 임시휴무)',
                    start: '2024-05-01',
                    end: '2024-05-01',
                    type: 'etc',
                },
                {
                    title: '어린이날',
                    start: '2024-05-05',
                    end: '2024-05-05',
                    type: 'etc',
                },
                {
                    title: '어린이날 대체휴일',
                    start: '2024-05-06',
                    end: '2024-05-06',
                    type: 'etc',
                },
                {
                    title: '체육대회',
                    start: '2024-05-09',
                    end: '2024-05-09',
                    type: 'univ',
                },
                {
                    title: '부처님오신날',
                    start: '2024-05-15',
                    end: '2024-05-15',
                    type: 'etc',
                },
                {
                    title: '하계 계절학기 등록 기간',
                    start: '2024-05-27',
                    end: '2024-05-31',
                    type: 'univ',
                },
                {
                    title: '현충일',
                    start: '2024-06-06',
                    end: '2024-06-06',
                    type: 'etc',
                },
                {
                    title: '보강 및 기말고사기간',
                    start: '2024-06-10',
                    end: '2024-06-16',
                    type: 'univ',
                },
                {
                    title: '1학기 성적입력 기간',
                    start: '2024-06-11',
                    end: '2024-06-19',
                    type: 'univ',
                },
                {
                    title: '하계 계절학기 개강',
                    start: '2024-06-17',
                    end: '2024-06-17',
                    type: 'univ',
                },
                {
                    title: '재입학 신청 기간',
                    start: '2024-06-17',
                    end: '2024-06-21',
                    type: 'univ',
                },
                {
                    title: '1학기 성적 확인 및 이의신청 기간',
                    start: '2024-06-20',
                    end: '2024-06-24',
                    type: 'univ',
                },
                {
                    title: '휴(복)학, 전과 신청 기간',
                    start: '2024-07-22',
                    end: '2024-07-26',
                    type: 'univ',
                },
                {
                    title: '후기 학위 수여',
                    start: '2024-08-05',
                    end: '2024-08-05',
                    type: 'univ',
                },
                {
                    title: '광복절',
                    start: '2024-08-15',
                    end: '2024-08-15',
                    type: 'etc',
                },
                {
                    title: '2학기 수강신청 기간',
                    start: '2024-08-19',
                    end: '2024-08-23',
                    type: 'univ',
                },
                {
                    title: '교수회의 및 헌신회',
                    start: '2024-08-22',
                    end: '2024-08-23',
                    type: 'adm',
                },
                {
                    title: '2학기 재학생 등록 기간',
                    start: '2024-08-26',
                    end: '2024-08-30',
                    type: 'univ',
                },
                {
                    title: '2학기 개강',
                    start: '2024-09-02',
                    end: '2024-09-02',
                    type: 'univ',
                },
                {
                    title: '2학기 수강신청 변경 기간',
                    start: '2024-09-02',
                    end: '2024-09-06',
                    type: 'univ',
                },
                {
                    title: '수시1차 원서접수',
                    start: '2024-09-09',
                    end: '2024-09-09',
                    type: 'univ',
                },
                {
                    title: '추석',
                    start: '2024-09-16',
                    end: '2024-09-18',
                    type: 'etc',
                },
                {
                    title: '축제',
                    start: '2024-09-26',
                    end: '2024-09-26',
                    type: 'univ',
                },
                {
                    title: '추계 인성교육 주간(건강회복주간)',
                    start: '2024-09-30',
                    end: '2024-10-04',
                    type: 'univ',
                },
                {
                    title: '개천절',
                    start: '2024-10-03',
                    end: '2024-10-03',
                    type: 'etc',
                },
                {
                    title: '한글날',
                    start: '2024-10-09',
                    end: '2024-10-09',
                    type: 'etc',
                },
                {
                    title: '수시1차 면접',
                    start: '2024-10-11',
                    end: '2024-10-11',
                    type: 'univ',
                },
                {
                    title: '중간고사 기간',
                    start: '2024-10-21',
                    end: '2024-10-25',
                    type: 'univ',
                },
                {
                    title: '수시2차 원서접수',
                    start: '2024-11-08',
                    end: '2024-11-08',
                    type: 'univ',
                },
                {
                    title: '동계 계절학기 등록 기간',
                    start: '2024-11-25',
                    end: '2024-11-29',
                    type: 'univ',
                },
                {
                    title: '수시2차 면접',
                    start: '2024-11-29',
                    end: '2024-11-29',
                    type: 'univ',
                },
                {
                    title: '보강 및 기말고사기간',
                    start: '2024-12-02',
                    end: '2024-12-06',
                    type: 'univ',
                },
                {
                    title: '2학기 성적입력 기간',
                    start: '2024-12-03',
                    end: '2024-12-10',
                    type: 'univ',
                },
                {
                    title: '재입학 신청 기간',
                    start: '2024-12-09',
                    end: '2024-12-13',
                    type: 'univ',
                },
                {
                    title: '동계 계절학기 개강',
                    start: '2024-12-11',
                    end: '2024-12-11',
                    type: 'univ',
                },
                {
                    title: '2학기 성적 확인 및 이의신청 기간',
                    start: '2024-12-11',
                    end: '2024-12-13',
                    type: 'univ',
                },
                {
                    title: '겨울방학',
                    start: '2024-12-11',
                    end: '2025-01-03',
                    type: 'univ',
                },
                {
                    title: '성탄절',
                    start: '2024-12-25',
                    end: '2024-12-25',
                    type: 'etc',
                },
            ],
        });

        calendar.render();
    });
</script>
    <title>Calendar</title>
</head>
<body>
<iframe
        src="./resource/html/menu2.html"
        frameborder="0"
        scrolling="no"
        style="width: 100%; height: 100px"
></iframe>

<div class="container">
    <div id="calendar"></div>
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