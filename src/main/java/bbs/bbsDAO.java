package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class bbsDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public bbsDAO() {
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

    public boolean insertPost(bbs post) {
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
                post.setAuthorName(getAuthorName(rs.getInt("userId")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

    public String getAuthorName(int userId) {
        String sql = "SELECT userName FROM user WHERE userId = ?";
        String authorName = "작성자";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                authorName = rs.getString("userName");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return authorName;
    }

    public List<bbs> getPosts(int pageNumber, int pageSize) {
        List<bbs> posts = new ArrayList<>();
        String sql = "SELECT * FROM bbs ORDER BY postNum DESC LIMIT ?, ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, (pageNumber - 1) * pageSize);
            pstmt.setInt(2, pageSize);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                bbs post = new bbs();
                post.setPostNum(rs.getInt("postNum"));
                post.setPostTitle(rs.getString("postTitle"));
                post.setPostContent(rs.getString("postContent"));
                post.setSubject(rs.getInt("subject"));
                post.setPostTime(rs.getTimestamp("postTime"));
                post.setViewCount(rs.getInt("viewCount"));
                post.setAuthorName(getAuthorName(rs.getInt("userId")));
                posts.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return posts;
    }

    public void incrementViewCount(int postNum) {
        String sql = "UPDATE bbs SET viewCount = viewCount + 1 WHERE postNum = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postNum);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getTotalPostCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM bbs";
        try {
            pstmt = conn.prepareStatement(sql);
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
