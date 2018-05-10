package com.ana.entity.impl;

import java.io.Serializable;

public class EventJSON implements Serializable {


    private String id;
    private String title;
    private String details;
    private String imgpath;
    private String start;
    private String end;
    private String timeRemain;
    private String schoolname;
    private String entityid;


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


    public String getStart() {
        return start;
    }

    public String getEnd() {
        return end;
    }

    public String getTimeRemain() {
        return timeRemain;
    }

    public String getSchoolname() {
        return schoolname;
    }

    public String getEntityid() {
        return entityid;
    }

    public EventJSON(){

    }

    public void build(String id, String title,String details, String imgpath,String start,String end, String timeRemain,String schoolname, String entityid) {
        this.id=id;
        this.title=title;
        this.details=details;
        this.imgpath=imgpath;
        this.start=start;
        this.end=end;
        this.timeRemain=timeRemain;
        this.schoolname=(schoolname != null && schoolname.length() > 0) ? schoolname : " ";
        this.entityid=(entityid != null && entityid.length() > 0) ? entityid : " ";
    }
}
