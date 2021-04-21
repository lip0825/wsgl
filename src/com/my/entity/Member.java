package com.my.entity;

public class Member {

    private String ID;
    private String w_name;
    private String w_job;
    private String w_type;
    private String w_content;

    public Member(){

    }

    public Member(String w_name,String w_job,String w_type,String w_content){
        this.w_name = w_name;
        this.w_job = w_job;
        this.w_type = w_type;
        this.w_content = w_content;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getW_name() {
        return w_name;
    }

    public void setW_name(String w_name) {
        this.w_name = w_name;
    }

    public String getW_job() {
        return w_job;
    }

    public void setW_job(String w_job) {
        this.w_job = w_job;
    }

    public String getW_type() {
        return w_type;
    }

    public void setW_type(String w_type) {
        this.w_type = w_type;
    }

    public String getW_content() {
        return w_content;
    }

    public void setW_content(String w_content) {
        this.w_content = w_content;
    }

    @Override
    public String toString() {
        return "{" +
                "w_name='" + w_name + '\'' +
                ", w_job='" + w_job + '\'' +
                ", w_type='" + w_type + '\'' +
                ", w_content='" + w_content + '\'' +
                '}';
    }
}
