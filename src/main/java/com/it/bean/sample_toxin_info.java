package com.it.bean;

public class sample_toxin_info {
    private Integer stiId;

    private String toxinType;

    private Integer state;

    public Integer getStiId() {
        return stiId;
    }

    public void setStiId(Integer stiId) {
        this.stiId = stiId;
    }

    public String getToxinType() {
        return toxinType;
    }

    public void setToxinType(String toxinType) {
        this.toxinType = toxinType == null ? null : toxinType.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

}