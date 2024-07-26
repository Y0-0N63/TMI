package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

    public void login(String userId, String userPwd) throws Exception {
        String sql = "SELECT userPwd FROM user WHERE userId = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String dbPwd = rs.getString("userPwd");
            if (!dbPwd.equals(userPwd)) {
                throw new Exception("비밀번호를 다시 입력해주세요.");
            }
            // 학번 존재 X
        } else {
            throw new Exception("존재하지 않는 학번입니다.");
        }
    }

    public void join(user user) throws Exception {
        String checkSql = "SELECT userId FROM user WHERE userId = ?";
        pstmt = conn.prepareStatement(checkSql);
        pstmt.setString(1, user.getUserId());
        rs = pstmt.executeQuery();
        // 여기서 try-catch 사용하기
        // 쿼리문 실행 전에도 에러 발생해서 중단될 수 있음
        if (rs.next()) {
            throw new Exception("이미 존재하는 학번입니다.");
        }

        String sql = "Insert INTO user (isDeleted, userType, userId, userComment, userEmail, userName, userPwd) VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, user.getIsDeleted() == null ? 0 : user.getIsDeleted());
        pstmt.setInt(2, user.getUserType() == null ? 0 : user.getUserType());
        pstmt.setString(3, user.getUserId());
        pstmt.setString(4, user.getUserComment() == null ? "" : user.getUserComment());
        pstmt.setString(5, user.getUserEmail());
        pstmt.setString(6, user.getUserName());
        pstmt.setString(7, user.getUserPwd());
        pstmt.executeUpdate();
    }

    public void setPwd(String userId, String newPwd) throws Exception {
        String sql = "UPDATE user SET userPwd = ? WHERE userId = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, newPwd);
        pstmt.setString(2, userId);
        pstmt.executeUpdate();
    }
}
