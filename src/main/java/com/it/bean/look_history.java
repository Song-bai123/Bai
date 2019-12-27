package com.it.bean;

import java.util.Date;

public class look_history {
    private Integer lId;

    private Integer sampleId;

    private Integer userId;

    private Date createTime;

    public Integer getlId() {
        return lId;
    }

    public void setlId(Integer lId) {
        this.lId = lId;
    }

    public Integer getSampleId() {
        return sampleId;
    }

    public void setSampleId(Integer sampleId) {
        this.sampleId = sampleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}