package com.ana.entity.impl;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by anthan on 17/12/2016.
 */
@XmlRootElement(name="schools")
public class SchoolListVO implements Serializable{

    private List<SchoolVO> schools = new ArrayList<SchoolVO>();

    @XmlElement(name="school")
    public List<SchoolVO> getSchools() {
        return schools;
    }

    public void setSchools(List<SchoolVO> schools) {
        this.schools = schools;
    }
}
