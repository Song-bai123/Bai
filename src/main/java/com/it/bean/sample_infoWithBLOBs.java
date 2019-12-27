package com.it.bean;

import java.util.Date;
import java.util.List;

public class sample_infoWithBLOBs extends sample_info {
    private String seasonal;

    private String description;

    public String getSeasonal() {
        return seasonal;
    }

    public void setSeasonal(String seasonal) {
        this.seasonal = seasonal == null ? null : seasonal.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}