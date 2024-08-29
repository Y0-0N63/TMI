package bbs;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

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

    private List<bbs> getPostsByQuery(String sql, Object... params) {
        List<bbs> posts = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
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
        return posts;
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

    public void increaseView(int postNum) {
        String sql = "UPDATE bbs SET viewCount = viewCount + 1 WHERE postNum = ?";
        executeUpdate(sql, postNum);
    }

    public int getTotal() {
        String sql = "SELECT COUNT(*) FROM bbs";
        return executeCountQuery(sql);
    }

    public void updateAuthorName() {
        String getUserNameSql = "SELECT userName FROM user WHERE userId = ?";
        String updateAuthorNameSql = "UPDATE bbs SET authorName = ? WHERE userId = ?";

        try {
            List<bbs> posts = getPostsByQuery("SELECT postNum, userId FROM bbs");
            for (bbs post : posts) {
                PreparedStatement getUserNameStmt = conn.prepareStatement(getUserNameSql);
                getUserNameStmt.setInt(1, post.getUserId());
                ResultSet rsUserName = getUserNameStmt.executeQuery();

                String authorName = "알 수 없음";
                if (rsUserName.next()) {
                    authorName = rsUserName.getString("userName");
                    if (authorName == null || authorName.isEmpty()) {
                        authorName = "알 수 없음";
                    }
                }

                executeUpdate(updateAuthorNameSql, authorName, post.getUserId());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Vector<bbs> getPosts(int start, int limit, String order, String searchKeyword) {
        Vector<bbs> posts = new Vector<>();
        String noticeSql = "SELECT * FROM bbs WHERE subject = 2 ORDER BY postNum DESC LIMIT 0, 10";
        String searchSql = "SELECT * FROM bbs WHERE subject <> 2 AND postTitle LIKE ? ORDER BY " +
                ("popular".equals(order) ? "viewCount DESC, " : "") + "postNum DESC LIMIT ?, ?";
        String regularSql = "SELECT * FROM bbs WHERE subject <> 2 ORDER BY " +
                ("popular".equals(order) ? "viewCount DESC, " : "") + "postNum DESC LIMIT ?, ?";

        posts.addAll(getPostsByQuery(noticeSql));

        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
            searchKeyword = "%" + searchKeyword + "%";
            posts.addAll(getPostsByQuery(searchSql, searchKeyword, start, limit));
        } else {
            posts.addAll(getPostsByQuery(regularSql, start, limit));
        }

        return posts;
    }

    public bbs getPost(int postNum) {
        String sql = "SELECT * FROM bbs WHERE postNum = ?";
        List<bbs> posts = getPostsByQuery(sql, postNum);
        return posts.isEmpty() ? null : posts.get(0);
    }

    public List<bbs> getUserPost(String userId, int start, int limit) {
        String sql = "SELECT * FROM bbs WHERE userId = ? ORDER BY postNum DESC LIMIT ?, ?";
        return getPostsByQuery(sql, userId, start, limit);
    }

    public int getUserPostCount(String userId) {
        String sql = "SELECT COUNT(*) FROM bbs WHERE userId = ?";
        return executeCountQuery(sql, userId);
    }

    private int executeCountQuery(String sql, Object... params) {
        int count = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    private void executeUpdate(String sql, Object... params) {
        try {
            pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
