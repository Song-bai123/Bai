package com.it.bean;

public class sample_toxin {
    private Integer stId;
    //毒素id
    private Integer stiId;
    //毒素含量
    private Float toxinCount;
    //样品信息id
    private Integer sampleInfoId;

    private sample_toxin_info sti;

    public sample_toxin_info getSti() {
        return sti;
    }

    public void setSti(sample_toxin_info sti) {
        this.sti = sti;
    }

    public Integer getStId() {
        return stId;
    }

    public void setStId(Integer stId) {
        this.stId = stId;
    }

    public Integer getStiId() {
        return stiId;
    }

    public void setStiId(Integer stiId) {
        this.stiId = stiId;
    }

    public Float getToxinCount() {
        return toxinCount;
    }

    public void setToxinCount(Float toxinCount) {
        this.toxinCount = toxinCount;
    }

    public Integer getSampleInfoId() {
        return sampleInfoId;
    }

    public void setSampleInfoId(Integer sampleInfoId) {
        this.sampleInfoId = sampleInfoId;
    }
}