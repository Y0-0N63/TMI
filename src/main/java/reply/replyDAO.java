package reply;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class replyDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public replyDAO() {
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

    public boolean insertReply(int postNum, int userId, String reContent, Date reTime) {
        String sql = "INSERT INTO reply (postNum, userId, reContent, reTime) VALUES (?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postNum);
            pstmt.setInt(2, userId);
            pstmt.setString(3, reContent);
            pstmt.setTimestamp(4, new Timestamp(reTime.getTime()));
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<reply> getReplies(int postNum) {
        String sql = "SELECT * FROM reply WHERE postNum = ? ORDER BY reTime DESC";
        List<reply> replies = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postNum);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                reply reply = new reply();
                reply.setReNum(rs.getInt("reNum"));
                reply.setPostNum(rs.getInt("postNum"));
                reply.setUserId(rs.getInt("userId"));
                reply.setReContent(rs.getString("reContent"));
                reply.setReTime(rs.getTimestamp("reTime"));
                replies.add(reply);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return replies;
    }
}
