package com.it.bean;

public class address_city {
    private Integer cId;

    private String cCode;

    private String cName;

    private String provincecode;

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcCode() {
        return cCode;
    }

    public void setcCode(String cCode) {
        this.cCode = cCode == null ? null : cCode.trim();
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName == null ? null : cName.trim();
    }

    public String getProvincecode() {
        return provincecode;
    }

    public void setProvincecode(String provincecode) {
        this.provincecode = provincecode == null ? null : provincecode.trim();
    }
}