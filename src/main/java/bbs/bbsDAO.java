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


    public Vector<bbs> getPosts(int start, int limit) {
        String sql = "SELECT * FROM bbs ORDER BY postNum DESC LIMIT ?, ?";
        Vector<bbs> posts = new Vector<bbs>();

        try {
            pstmt = conn.prepareStatement(sql);
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
                posts.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return posts;
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
}
