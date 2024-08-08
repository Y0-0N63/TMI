<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bbs.bbsDAO" %>
<%@ page import="bbs.bbs" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
    <title>게시글 작성 액션</title>
</head>
<body>
<%
    PrintWriter script = response.getWriter();
    bbsDAO dao = new bbsDAO();

    // 입력 파라미터 가져오기
    String postTitle = request.getParameter("postTitle");
    String postContent = request.getParameter("postContent");
    String sortString = request.getParameter("sort");
    int subject = 0; // 기본값 설정

    System.out.println("postTitle: " + postTitle);
    System.out.println("postContent: " + postContent);
    System.out.println("sortString: " + sortString);

    // 파라미터 유효성 검사
    if (sortString != null && !sortString.isEmpty()) {
        try {
            subject = Integer.parseInt(sortString);
        } catch (NumberFormatException e) {
            // 기본값으로 설정
            subject = 0;
        }
    }

    // 예시로 임의의 userId 사용, 실제로는 로그인 사용자 ID로 대체 필요!!!
    int userId = 202310498;
    Date postTime = new Date();

    // 입력 값이 유효한지 확인
    if (postTitle != null && !postTitle.isEmpty() && postContent != null && !postContent.isEmpty()) {
        bbs post = new bbs();
        post.setUserId(userId);
        post.setPostTitle(postTitle);
        post.setPostContent(postContent);
        post.setSubject(subject);
        post.setPostTime(postTime);

        boolean success = dao.insertPost(post);

        if (success) {
            script.println("<script>");
            script.println("alert('게시글이 작성되었습니다.');");
            script.println("location.href='m';");
            script.println("</script>");
        } else {
            script.println("<script>");
            script.println("alert('게시글 작성에 실패했습니다.');");
            script.println("history.back();");
            script.println("</script>");
        }
    } else {
        script.println("<script>");
        script.println("alert('제목과 내용을 입력해주세요.');");
        script.println("history.back();");
        script.println("</script>");
    }
%>
</body>
</html>