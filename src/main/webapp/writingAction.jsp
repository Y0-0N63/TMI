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
    bbsDAO bbsdao = new bbsDAO();

    String postTitle = request.getParameter("postTitle");
    String postContent = request.getParameter("postContent");
    String sortString = request.getParameter("subject");
    int subject = 0;

    System.out.println("postTitle: " + postTitle);
    System.out.println("postContent: " + postContent);
    System.out.println("sortString: " + sortString);

    if (sortString != null && !sortString.isEmpty()) {
        try {
            subject = Integer.parseInt(sortString);
        } catch (NumberFormatException e) {
            // 기본값으로 설정
            subject = 0;
        }
    }

    if ("q&a".equals(sortString)) {
        subject = 1;
    } else if ("notice".equals(sortString)) {
        subject = 2;
    }

    // 수정!!!!!!!!!!
    int userId = 202310498;

    Date postTime = new Date();

    if (postTitle != null && !postTitle.isEmpty() && postContent != null && !postContent.isEmpty()) {
        bbs post = new bbs();
        post.setUserId(userId);
        post.setPostTitle(postTitle);
        post.setPostContent(postContent);
        post.setSubject(subject);
        post.setPostTime(postTime);

        boolean success = bbsdao.insertPost(post);

        if (success) {
            script.println("<script>");
            script.println("alert('게시글이 작성되었습니다.');");
            script.println("location.href='community.jsp';");
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