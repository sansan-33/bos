package com.ana.entity.impl;

import java.io.Serializable;

public class CommentJSON implements Serializable {


    private String id;
    private String title;
    private String details;
    private String imgpath;
    private String categoryid;
    private String lastmodified;
    private String schoolname;
    private String entityid;
    private String ratingStudent;
    private String ratingHomework;
    private String ratingTeacher;
    private String ratingEthos;


    public CommentJSON(){}

    public String getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDetails() {
        return details;
    }

    public String getImgpath() {
        return imgpath;
    }

    public String getCategoryid() {
        return categoryid;
    }

    public String getLastmodified() {
        return lastmodified;
    }

    public String getSchoolname() {
        return schoolname;
    }

    public String getEntityid() {
        return entityid;
    }

    public String getRatingStudent() {
        return ratingStudent;
    }

    public String getRatingHomework() {
        return ratingHomework;
    }

    public String getRatingTeacher() {
        return ratingTeacher;
    }

    public String getRatingEthos() {
        return ratingEthos;
    }

    public void build(String id, String title, String details, String imgpath, String categoryid, String lastmodified, String schoolname, String entityid, String ratingStudent, String ratingHomework, String ratingTeacher, String ratingEthos) {
        this.id=id;
        this.title=title;
        this.details=details;
        this.imgpath=imgpath;
        this.categoryid = categoryid;
        this.lastmodified = lastmodified;
        this.schoolname = schoolname;
        this.entityid = entityid;
        this.ratingEthos = ratingEthos;
        this.ratingHomework = ratingHomework;
        this.ratingStudent = ratingStudent;
        this.ratingTeacher = ratingTeacher;

    }
}
