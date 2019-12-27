package com.it.bean;

public class roles {
    private Integer rid;

    private String role;

    private String chrole;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role == null ? null : role.trim();
    }

    public String getChrole() {
        return chrole;
    }

    public void setChrole(String chrole) {
        this.chrole = chrole == null ? null : chrole.trim();
    }
}