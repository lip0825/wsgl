package com.my.entity;

public class Illness {
    private String i_name;
    private String i_type;
    private String i_chuanran;
    private String i_symptom;

    public Illness() {
    }

    public Illness(String i_name, String i_type, String i_chuanran, String i_symptom) {
        this.i_name = i_name;
        this.i_type = i_type;
        this.i_chuanran = i_chuanran;
        this.i_symptom = i_symptom;

    }

    public String getI_name() {
        return i_name;
    }

    public void setI_name(String i_name) {
        this.i_name = i_name;
    }

    public String getI_type() {
        return i_type;
    }

    public void setI_type(String i_type) {
        this.i_type = i_type;
    }

    public String getI_chuanran() {
        return i_chuanran;
    }

    public void setI_chuanran(String i_chuanran) {
        this.i_chuanran = i_chuanran;
    }

    public String getI_symptom() {
        return i_symptom;
    }

    public void setI_symptom(String i_symptom) {
        this.i_symptom = i_symptom;
    }

    @Override
    public String toString() {
        return "{" +
                "i_name='" + i_name + '\'' +
                ", i_type='" + i_type + '\'' +
                ", i_chuanran='" + i_chuanran + '\'' +
                ", i_symptom='" + i_symptom + '\'' +
                '}';
    }
}
