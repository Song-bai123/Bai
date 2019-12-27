package com.it.bean;

public class crop_species {
    private Integer csId;

    private String csCropSpecies;

    private Integer csCropCategoryId;

    private Integer csState;

    public Integer getCsId() {
        return csId;
    }

    public void setCsId(Integer csId) {
        this.csId = csId;
    }

    public String getCsCropSpecies() {
        return csCropSpecies;
    }

    public void setCsCropSpecies(String csCropSpecies) {
        this.csCropSpecies = csCropSpecies == null ? null : csCropSpecies.trim();
    }

    public Integer getCsCropCategoryId() {
        return csCropCategoryId;
    }

    public void setCsCropCategoryId(Integer csCropCategoryId) {
        this.csCropCategoryId = csCropCategoryId;
    }

    public Integer getCsState() {
        return csState;
    }

    public void setCsState(Integer csState) {
        this.csState = csState;
    }
}