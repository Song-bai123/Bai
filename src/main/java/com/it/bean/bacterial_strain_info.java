package com.it.bean;

import java.util.Date;

public class bacterial_strain_info {
    private Integer id;
    //样品id
    private Integer sampleInfoId;
    //样品标号
    private String sampleNum;
    //菌株原始编号
    private String originalNum;
    //文献信息地址
    private String wordAddr;
    //文本地址
    private String txtAddr;
    //图片地址
    private String pictureAddr;

    private Date createTime;

    private Integer isdel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSampleInfoId() {
        return sampleInfoId;
    }

    public void setSampleInfoId(Integer sampleInfoId) {
        this.sampleInfoId = sampleInfoId;
    }

    public String getSampleNum() {
        return sampleNum;
    }

    public void setSampleNum(String sampleNum) {
        this.sampleNum = sampleNum == null ? null : sampleNum.trim();
    }

    public String getOriginalNum() {
        return originalNum;
    }

    public void setOriginalNum(String originalNum) {
        this.originalNum = originalNum == null ? null : originalNum.trim();
    }

    public String getWordAddr() {
        return wordAddr;
    }

    public void setWordAddr(String wordAddr) {
        this.wordAddr = wordAddr == null ? null : wordAddr.trim();
    }

    public String getTxtAddr() {
        return txtAddr;
    }

    public void setTxtAddr(String txtAddr) {
        this.txtAddr = txtAddr == null ? null : txtAddr.trim();
    }

    public String getPictureAddr() {
        return pictureAddr;
    }

    public void setPictureAddr(String pictureAddr) {
        this.pictureAddr = pictureAddr == null ? null : pictureAddr.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }
}