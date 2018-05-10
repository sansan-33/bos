package com.ana.entity.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by anthan on 17/12/2016.
 */
public class SchoolDetailsListJSON implements Serializable{

    private List<SchoolDetailsJSON> schools = new ArrayList<SchoolDetailsJSON>();
    public List<SchoolDetailsJSON> getSchools() {
        return schools;
    }
    public void setSchools(List<SchoolDetailsJSON> schools) {
        this.schools = schools;
    }
}
