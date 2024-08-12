package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class userDAO {
    private Connection conn;
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

    public boolean login(String userId, String userPwd) {
        String sql = "SELECT userPwd FROM user WHERE userId = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()){
                String dbPwd = rs.getString("userPwd");
                return dbPwd.equals(userPwd);
            } else {
                // 존재하지 않는 학번
                return false;
            }
        } catch (Exception e){
            e.printStackTrace();
            // DB 오류
            return false;
        }
    }

    public boolean join(user user) {
        String sql = "INSERT INTO user (isDeleted, userType, userId, userComment, userEmail, userName, userPwd) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, user.getIsDeleted() == null ? 0 : user.getIsDeleted());
            pstmt.setInt(2, user.getUserType() == null ? 0 : user.getUserType());
            pstmt.setString(3, user.getUserId());
            pstmt.setString(4, user.getUserComment() == null ? "" : user.getUserComment());
            pstmt.setString(5, user.getUserEmail());
            pstmt.setString(6, user.getUserName());
            pstmt.setString(7, user.getUserPwd());

            System.out.println("Executing SQL: " + pstmt.toString());
            int rowsAffected = pstmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public boolean verifyPwd(String userId, String currentPwd){
        String sql = "SELECT userPwd FROM user WHERE userId = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String existingPwd = rs.getString("userPwd");
                return existingPwd.equals(currentPwd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean setPwd(String userId, String newPwd) {
        String sql = "UPDATE user SET userPwd = ? WHERE userId = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newPwd);
            pstmt.setString(2, userId);
            pstmt.executeUpdate();
            return true;
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public String getUserName(int userId) {
        String userName = "알 수 없음";
        String sql = "SELECT userName FROM user WHERE userId = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                userName = rs.getString("userName");
                if (userName == null || userName.isEmpty()) {
                    userName = "알 수 없음";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userName;
    }

    public user getUserInfo(String userId) {
        String sql = "SELECT * FROM user WHERE userId = ?";
        user userInfo = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                userInfo = new user();
                userInfo.setUserId(rs.getString("userId"));
                userInfo.setUserName(rs.getString("userName"));
                userInfo.setUserEmail(rs.getString("userEmail"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userInfo;
    }

    public List<user> getUserType(int userType, int generation){
        List<user> users = new ArrayList<>();
        String sql = "SELECT * FROM user WHERE userType = ? AND generation = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userType);
            pstmt.setInt(2, generation);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                user user = new user();
                user.setUserId(rs.getString("userId"));
                user.setUserName(rs.getString("userName"));
                user.setUserEmail(rs.getString("userEmail"));
                user.setUserPwd(rs.getString("userPwd"));
                user.setUserType(rs.getInt("userType"));
                user.setIsDeleted(rs.getInt("isDeleted"));
                user.setUserComment(rs.getString("userComment"));
                user.setGeneration(rs.getInt("generation"));
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
}