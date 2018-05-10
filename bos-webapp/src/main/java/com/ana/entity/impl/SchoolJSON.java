package com.ana.entity.impl;

import java.io.Serializable;

public class SchoolJSON implements Serializable {


    private String id;
    private String name;
    private String nameeng;

    private String address;
    private String telephone;
    private String score;
    private String ranking;
    private String category;
    private String website;
    private String email;
    private String district;
    private String principal;
    private String funding_type;
    private String student_gender;
    private String religion;
    private String comments;
    private String parent_feedback;
    private String parent_feedback_count;
    private String overallmetric;
    private String lat;
    private String lon;
    private String imgpath;
    private String categoryid;
    private String sex;
    private String distance;
    private String viewcount;

    public SchoolJSON(){

    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getTelephone() {
        return telephone;
    }

    public String getScore() {
        return score;
    }

    public String getRanking() {
        return ranking;
    }

    public String getCategory() {
        return category;
    }

    public String getWebsite() {
        return website;
    }

    public String getEmail() {
        return email;
    }

    public String getDistrict() {
        return district;
    }

    public String getPrincipal() {
        return principal;
    }

    public String getFunding_type() {
        return funding_type;
    }

    public String getStudent_gender() {
        return student_gender;
    }

    public String getReligion() {
        return religion;
    }

    public String getComments() {
        return comments;
    }

    public String getParent_feedback() {
        return parent_feedback;
    }

    public String getParent_feedback_count() {
        return parent_feedback_count;
    }

    public String getLat() {
        return lat;
    }

    public String getLon() {
        return lon;
    }

    public String getImgpath() {
        return imgpath;
    }

    public String getNameeng() {
        return nameeng;
    }

    public String getOverallmetric() {
        return overallmetric;
    }

    public String getDistance() {
        return distance;
    }

    public String getCategoryid() {
        return categoryid;
    }

    public String getViewcount() {
        return viewcount;
    }

    public String getSex() {
        return sex;
    }



    public void build(String id, String name, String nameeng, String address, String telephone, String score, String ranking, String website, String email, String category, String district, String principal, String funding_type, String student_gender, String religion, String comments, String parent_feedback, String parent_feedback_count, String lat, String lon, String imgpath, String overallmetric, String categoryid, String sex, String distance, String viewcount)  {
        this.id=id;
        this.name = name;
        this.nameeng = nameeng;

        this.address = address ;
        this.telephone = telephone;
        this.score = score;
        this.ranking = ranking;
        this.category = category;
        this.website =  website ;
        this.email = (email != null && email.length() > 0) ? email : "";
        this.district = district;
        this.principal = principal;
        this.funding_type = funding_type;
        this.student_gender = student_gender;
        this.religion = religion;
        this.comments =  comments ;
        this.parent_feedback = parent_feedback;
        this.parent_feedback_count = parent_feedback_count;
        this.lat = lat;
        this.lon=lon;
        this.imgpath=imgpath;
        this.overallmetric = overallmetric;
        this.categoryid = categoryid;
        this.sex = sex;
        this.distance = distance;
        this.viewcount = viewcount;
    }
}
