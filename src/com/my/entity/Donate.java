package com.my.entity;

public class Donate {
    private String s_no;
    private String s_name;
    private String b_quantity;
    private String b_no;
    private String b_time;

    public Donate() {
    }

    public Donate(String s_no,String s_name,String b_quantity,String b_no,String b_time) {
        this.s_no = s_no;
        this.s_name = s_name;
        this.b_quantity = b_quantity;
        this.b_no = b_no;
        this.b_time = b_time;
    }

    public String getS_no() {
        return s_no;
    }

    public void setS_no(String s_no) {
        this.s_no = s_no;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public String getB_quantity() {
        return b_quantity;
    }

    public void setB_quantity(String b_quantity) {
        this.b_quantity = b_quantity;
    }

    public String getB_no() {
        return b_no;
    }

    public void setB_no(String b_no) {
        this.b_no = b_no;
    }

    public String getB_time() {
        return b_time;
    }

    public void setB_time(String b_time) {
        this.b_time = b_time;
    }

    @Override
    public String toString() {
        return "{" +
                "s_no=" + s_no +
                ", s_name='" + s_name + '\'' +
                ", b_quantity='" + b_quantity + '\'' +
                ", b_no='" + b_no + '\'' +
                ", b_time='" + b_time + '\'' +
                '}';
    }
}
