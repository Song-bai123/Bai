package com.it.bean;

public class address_province {
    private Integer pId;

    private String pCode;

    private String pName;

    private String chinaname;

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode == null ? null : pCode.trim();
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

    public String getChinaname() {
        return chinaname;
    }

    public void setChinaname(String chinaname) {
        this.chinaname = chinaname == null ? null : chinaname.trim();
    }
}