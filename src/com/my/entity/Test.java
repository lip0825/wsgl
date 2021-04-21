package com.my.entity;

public class Test {
    private String s_name;
    private String s_height;
    private String s_weight;
    private String s_bloods;
    private String s_bloodp;
    private String s_lungc;

    public Test() {
    }

    public Test(String s_name,String s_height,String s_weight,String s_bloods,String s_bloodp,String s_lungc) {

        this.s_name = s_name;
        this.s_height = s_height;
        this.s_weight = s_weight;
        this.s_bloods = s_bloods;
        this.s_bloodp = s_bloodp;
        this.s_lungc = s_lungc;

    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public String getS_height() {
        return s_height;
    }

    public void setS_height(String s_height) {
        this.s_height = s_height;
    }

    public String getS_weight() {
        return s_weight;
    }

    public void setS_weight(String s_weight) {
        this.s_weight = s_weight;
    }

    public String getS_bloods() {
        return s_bloods;
    }

    public void setS_bloods(String s_bloods) {
        this.s_bloods = s_bloods;
    }

    public String getS_bloodp() {
        return s_bloodp;
    }

    public void setS_bloodp(String s_bloodp) {
        this.s_bloodp = s_bloodp;
    }

    public String getS_lungc() {
        return s_lungc;
    }

    public void setS_lungc(String s_lungc) {
        this.s_lungc = s_lungc;
    }

    @Override
    public String toString() {
        return "{" +
                "s_name='" + s_name + '\'' +
                ", s_height='" + s_height + '\'' +
                ", s_weight='" + s_weight + '\'' +
                ", s_bloods='" + s_bloods + '\'' +
                ", s_bloodp='" + s_bloodp + '\'' +
                ", s_lungc='" + s_lungc + '\'' +
                '}';
    }
}
