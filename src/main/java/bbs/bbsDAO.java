package bbs;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class bbsDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public bbsDAO(){
        try {
            String dbURL = "jdbc:mysql://localhost:3306/tmi?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
            String dbID = "boyun";
            String dbPassword = "0603";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 게시글 작성
    public boolean insertPost(bbs post){
        String sql = "INSERT INTO bbs (userId, postTitle, subject, postContent, postTime) VALUES (?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, post.getUserId());
            pstmt.setString(2, post.getPostTitle());
            pstmt.setInt(3, post.getSubject());
            pstmt.setString(4, post.getPostContent());
            pstmt.setTimestamp(5, new java.sql.Timestamp(post.getPostTime().getTime()));
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 조회수 증가
    public void increaseView(int postNum) {
        String sql = "UPDATE bbs SET viewCount = viewCount + 1 WHERE postNum = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postNum);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 현재 게시글 전체 개수 가져오기
    public int getTotal() {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM bbs";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }

    // 작성자 이름 갖고오기
    public void updateAuthorName() {
        String getUserNameSql = "SELECT userName FROM user WHERE userId = ?";
        String updateAuthorNameSql = "UPDATE bbs SET authorName =? WHERE userId = ?";

        try {
            String selectPostsSql = "SELECT postNum, userId FROM bbs";
            pstmt = conn.prepareStatement(selectPostsSql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int postNum = rs.getInt("postNum");
                int userId = rs.getInt("userId");

                PreparedStatement getUerName = conn.prepareStatement(getUserNameSql);
                getUerName.setInt(1, userId);
                ResultSet rsUserName = getUerName.executeQuery();

                String authorName = "알 수 없음";
                if (rsUserName.next()) {
                    authorName = rsUserName.getString("userName");
                    if (authorName == null || authorName.isEmpty()) {
                        authorName = "알 수 없음";
                    }
                }

                PreparedStatement pstmtUpdateAuthor = conn.prepareStatement(updateAuthorNameSql);
                pstmtUpdateAuthor.setString(1, authorName);
                pstmtUpdateAuthor.setInt(2, userId);
                pstmtUpdateAuthor.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 게시글 출력
    public Vector<bbs> getPosts(int start, int limit, String order, String searchKeyword) {
        Vector<bbs> posts = new Vector<>();
        String sql;

        // 검색어 있을 경우
        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
            searchKeyword = "%" + searchKeyword + "%";

            // 공지사항 고정
            sql = "SELECT * FROM bbs WHERE subject = 2 AND postTitle LIKE ? ORDER BY postNum DESC LIMIT 0, 10";
            String sqlRegular = "SELECT * FROM bbs WHERE subject <> 2 AND postTitle LIKE ? ORDER BY "
                    + ("popular".equals(order) ? "viewCount DESC, " : "")
                    + "postNum DESC LIMIT ?, ?";

            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, searchKeyword);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    bbs post = new bbs();
                    post.setPostNum(rs.getInt("postNum"));
                    post.setUserId(rs.getInt("userId"));
                    post.setPostTitle(rs.getString("postTitle"));
                    post.setSubject(rs.getInt("subject"));
                    post.setPostContent(rs.getString("postContent"));
                    post.setPostTime(rs.getDate("postTime"));
                    post.setViewCount(rs.getInt("viewCount"));
                    post.setAuthorName(rs.getString("authorName"));
                    posts.add(post);
                }

                pstmt = conn.prepareStatement(sqlRegular);
                pstmt.setString(1, searchKeyword);
                pstmt.setInt(2, start);
                pstmt.setInt(3, limit);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    bbs post = new bbs();
                    post.setPostNum(rs.getInt("postNum"));
                    post.setUserId(rs.getInt("userId"));
                    post.setPostTitle(rs.getString("postTitle"));
                    post.setSubject(rs.getInt("subject"));
                    post.setPostContent(rs.getString("postContent"));
                    post.setPostTime(rs.getDate("postTime"));
                    post.setViewCount(rs.getInt("viewCount"));
                    post.setAuthorName(rs.getString("authorName"));
                    posts.add(post);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
        // 인기순
        if ("popular".equals(order)) {
            // 공지사항이면 상단 고정
            sql = "SELECT * FROM bbs WHERE subject = 2 ORDER BY postNum DESC LIMIT 0, 10";
            String sqlRegular = "SELECT * FROM bbs WHERE subject <> 2 ORDER BY viewCount DESC, postNum DESC LIMIT ?, ?";
            try {
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    bbs post = new bbs();
                    post.setPostNum(rs.getInt("postNum"));
                    post.setUserId(rs.getInt("userId"));
                    post.setPostTitle(rs.getString("postTitle"));
                    post.setSubject(rs.getInt("subject"));
                    post.setPostContent(rs.getString("postContent"));
                    post.setPostTime(rs.getDate("postTime"));
                    post.setViewCount(rs.getInt("viewCount"));
                    post.setAuthorName(rs.getString("authorName"));
                    posts.add(post);
                }

                pstmt = conn.prepareStatement(sqlRegular);
                pstmt.setInt(1, start);
                pstmt.setInt(2, limit);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    bbs post = new bbs();
                    post.setPostNum(rs.getInt("postNum"));
                    post.setUserId(rs.getInt("userId"));
                    post.setPostTitle(rs.getString("postTitle"));
                    post.setSubject(rs.getInt("subject"));
                    post.setPostContent(rs.getString("postContent"));
                    post.setPostTime(rs.getDate("postTime"));
                    post.setViewCount(rs.getInt("viewCount"));
                    post.setAuthorName(rs.getString("authorName"));
                    posts.add(post);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            // 최신순
        } else {
            // 공지사항이면 상단 고정
            sql = "SELECT * FROM bbs WHERE subject = 2 ORDER BY postNum DESC LIMIT 0, 10";
            String sqlRegular = "SELECT * FROM bbs WHERE subject <> 2 ORDER BY postNum DESC LIMIT ?, ?";
            try {
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    bbs post = new bbs();
                    post.setPostNum(rs.getInt("postNum"));
                    post.setUserId(rs.getInt("userId"));
                    post.setPostTitle(rs.getString("postTitle"));
                    post.setSubject(rs.getInt("subject"));
                    post.setPostContent(rs.getString("postContent"));
                    post.setPostTime(rs.getDate("postTime"));
                    post.setViewCount(rs.getInt("viewCount"));
                    post.setAuthorName(rs.getString("authorName"));
                    posts.add(post);
                }

                pstmt = conn.prepareStatement(sqlRegular);
                pstmt.setInt(1, start);
                pstmt.setInt(2, limit);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    bbs post = new bbs();
                    post.setPostNum(rs.getInt("postNum"));
                    post.setUserId(rs.getInt("userId"));
                    post.setPostTitle(rs.getString("postTitle"));
                    post.setSubject(rs.getInt("subject"));
                    post.setPostContent(rs.getString("postContent"));
                    post.setPostTime(rs.getDate("postTime"));
                    post.setViewCount(rs.getInt("viewCount"));
                    post.setAuthorName(rs.getString("authorName"));
                    posts.add(post);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        }
        return posts;
    }



    public bbs getPost(int postNum) {
        String sql = "SELECT * FROM bbs WHERE postNum = ?";
        bbs post = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postNum);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                post = new bbs();
                post.setPostNum(rs.getInt("postNum"));
                post.setPostTitle(rs.getString("postTitle"));
                post.setPostContent(rs.getString("postContent"));
                post.setSubject(rs.getInt("subject"));
                post.setPostTime(rs.getTimestamp("postTime"));
                post.setViewCount(rs.getInt("viewCount"));
                post.setAuthorName(rs.getString("authorName"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

    public List<bbs> getUserPost(String userId, int start, int limit) {
        List<bbs> userPosts = new ArrayList<>();
        String sql = "SELECT * FROM bbs WHERE userId = ? ORDER BY postNum DESC LIMIT ?, ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setInt(2, start);
            pstmt.setInt(3, limit);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                bbs bbs = new bbs();
                bbs.setPostNum(rs.getInt("postNum"));
                bbs.setPostTitle(rs.getString("postTitle"));
                bbs.setPostContent(rs.getString("postContent"));
                bbs.setSubject(rs.getInt("subject"));
                bbs.setPostTime(rs.getTimestamp("postTime"));
                bbs.setViewCount(rs.getInt("viewCount"));
                bbs.setAuthorName(rs.getString("authorName"));

                userPosts.add(bbs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userPosts;
    }

    public int getUserPostCount(String userId) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM bbs WHERE userId = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}