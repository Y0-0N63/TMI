package reply;

import java.util.Date;

public class reply {
    private Integer reNum;
    private Integer postNum;

    public Integer getReNum() {
        return reNum;
    }

    public void setReNum(Integer reNum) {
        this.reNum = reNum;
    }

    public Integer getPostNum() {
        return postNum;
    }

    public void setPostNum(Integer postNum) {
        this.postNum = postNum;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getReName() {
        return reName;
    }

    public void setReName(String reName) {
        this.reName = reName;
    }

    public String getReContent() {
        return reContent;
    }

    public void setReContent(String reContent) {
        this.reContent = reContent;
    }

    public Date getReTime() {
        return reTime;
    }

    public void setReTime(Date reTime) {
        this.reTime = reTime;
    }

    private Integer userId;
    private String reName;
    private String reContent;
    private Date reTime;
}
