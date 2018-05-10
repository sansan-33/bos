package com.ana.entity.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by anthan on 17/12/2016.
 */
public class SchoolListJSON implements Serializable{

    private List<SchoolJSON> schools = new ArrayList<SchoolJSON>();
    public List<SchoolJSON> getSchools() {
        return schools;
    }
    public void setSchools(List<SchoolJSON> schools) {
        this.schools = schools;
    }
}
