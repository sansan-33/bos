package com.ana.entity.impl;

import java.io.Serializable;

public class ImageJSON implements Serializable {


    private String id;
    private String title;
    private String imgpath;
    private String categoryid;
    private String entityid;
    private String lastmodified;

    public ImageJSON(){}

    public String getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getImgpath() {
        return imgpath;
    }

    public String getCategoryid() {
        return categoryid;
    }

    public String getEntityid() {
        return entityid;
    }

    public String getLastmodified() {
        return lastmodified;
    }

    public void build(String id, String title, String imgpath, String categoryid, String entityid, String lastmodified) {
        this.id = id;
        this.title = title;
        this.imgpath = imgpath;
        this.categoryid = categoryid;
        this.entityid = entityid;
        this.lastmodified = lastmodified;
    }
}
