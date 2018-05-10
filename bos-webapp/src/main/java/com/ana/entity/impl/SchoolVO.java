package com.ana.entity.impl;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

@XmlRootElement(name="school")
@XmlAccessorType(XmlAccessType.NONE)
public class SchoolVO  implements Serializable {


    @XmlElement
    private String id;

    @XmlElement
    private String name;

    @XmlElement
    private String address;

    @XmlElement
    private String telephone;

    @XmlElement
    private String score;

    @XmlElement
    private String ranking;

    @XmlElement
    private String category;

    @XmlElement
    private String website;

    @XmlElement
    private String email;

    @XmlElement
    private String district;

    @XmlElement
    private String principal;

    @XmlElement
    private String funding_type;

    @XmlElement
    private String student_gender;

    @XmlElement
    private String religion;

    @XmlElement
    private String comments;

    @XmlElement
    private String parent_feedback;

    @XmlElement
    private String parent_feedback_count;

    @XmlElement
    private String lat;

    @XmlElement
    private String lon;

    @XmlElement
    private String imgpath;

    public SchoolVO(){

    }

    public void build(String id, String name, String address, String telephone, String score, String ranking,  String website, String email, String category, String district, String principal, String funding_type, String student_gender, String religion, String comments, String parent_feedback, String parent_feedback_count, String lat, String lon, String imgpath) {
        this.id=id;
        this.name = "<![CDATA[" + name + "]]>";
        this.address = "<![CDATA[" + address + "]]>";
        this.telephone = telephone;
        this.score = score;
        this.ranking = ranking;
        this.category = category;
        this.website = "<![CDATA[" + website + "]]>";
        this.email = (email != null && email.length() > 0 && ! "null".equals(email)) ? email : "";
        this.district = district;
        this.principal = (principal != null && principal.length() > 0 && ! "null".equals(principal)) ? principal : "";;
        this.funding_type = funding_type;
        this.student_gender = student_gender;
        this.religion = religion;
        this.comments = "<![CDATA[" + comments + "]]>";
        this.parent_feedback = "<![CDATA[" + parent_feedback + "]]>";
        this.parent_feedback_count = parent_feedback_count;
        this.lat = lat;
        this.lon=lon;
        this.imgpath=imgpath;
    }
}
