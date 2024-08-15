package schedule;

import java.sql.*;

public class scheduleDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public ResultSet getSchedule(){
        String sql = "SELECT * FROM schedules";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    public boolean insertSchedule(String START_Y, String START_M, String START_D, String START_DY, String END_Y, String END_M, String END_D, String END_DY, String SCH_TYPE, String SUBJECT, String DEPT_TYPE) {
        String sql = "INSERT INTO reply (START_Y, START_M, START_D, START_DY, END_Y, END_M, END_D, END_DY, SCH_TYPE, SUBJECT, DEPT_TYPE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, START_Y);
            pstmt.setString(2, START_M);
            pstmt.setString(3, START_D);
            pstmt.setString(4, START_DY);
            pstmt.setString(5, END_Y);
            pstmt.setString(6, END_M);
            pstmt.setString(7, END_D);
            pstmt.setString(8, END_DY);
            pstmt.setString(9, SCH_TYPE);
            pstmt.setString(10, SUBJECT);
            pstmt.setString(11, DEPT_TYPE);
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
