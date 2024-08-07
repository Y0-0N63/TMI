package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

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
}
