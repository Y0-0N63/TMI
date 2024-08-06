package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {
    public Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public userDAO() {
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

    public ResultSet getUserId(String userId) throws Exception{
        String sql = "SELECT userPwd FROM user WHERE userId = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        return pstmt.executeQuery();
    }
}
