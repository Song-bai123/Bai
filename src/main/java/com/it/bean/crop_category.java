package com.it.bean;

public class crop_category {
    private Integer ccId;

    private String cropCategory;

    private Integer state;

    public Integer getCcId() {
        return ccId;
    }

    public void setCcId(Integer ccId) {
        this.ccId = ccId;
    }

    public String getCropCategory() {
        return cropCategory;
    }

    public void setCropCategory(String cropCategory) {
        this.cropCategory = cropCategory == null ? null : cropCategory.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}