package com.ana.entity.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class SchoolDetailsJSON extends SchoolJSON implements Serializable {

    private List<ImageJSON> images = new ArrayList<ImageJSON>();
    public List<ImageJSON> getImages() {
        return images;
    }
    public void setImages(List<ImageJSON> images) {
        this.images = images;
    }

    private String banding;
    private String hkdsepassrate;
    private String chipassrate;
    private String engpassrate;
    private String urate;
    private String sixcoursesratio;

    private String athleticsposmale;
    private String athleticsdivmale;
    private String athleticsposfemale;
    private String athleticsdivfemale;
    private String footballpos;
    private String footballdiv;
    private String swimmingposmale;
    private String swimmingdivmale;
    private String swimmingposfemale;
    private String swimmingdivfemale;
    private String basketballposmale;
    private String basketballdivmale;
    private String basketballposfemale;
    private String basketballdivfemale;
    private String athleticsdivname;

    private String choirchinese;
    private String choirforeign;
    private String instrumentchinese;
    private String instrumentwestern;
    private String musicfirst;
    private String musicsecond;
    private String musicthird;
    private String speechfirst;
    private String speechsecond;
    private String speechthird;
    private String musicother;
    private String debatechi;

    private String area;
    private String noofspecialroom;
    private String teacherexperience;
    private String teachermaster;
    private String teacherbachelor;
    private String teacherforeign;
    private String schoolfee;
    private String tuitionfee;

    private String schoolallocationscore;
    private String qareport;
    private String voucher;
    private String schoolfeenursery;
    private String noofclassroom;
    private String indoorplayground;
    private String outdoorplayground;
    private String musicroom;
    private String noofotherroom;
    private String teacherpupilam;
    private String teacherpupilpm;


    private String overpercent;
    private String noofhall;
    private String noofplayground;
    private String nooflibraryroom;

    public String getBanding() {
        return (banding == null || "null".equals(banding) ? "" : banding);
    }

    public String getHkdsepassrate() {
        return hkdsepassrate == null || "null".equals(hkdsepassrate)? "" : hkdsepassrate;
    }

    public String getChipassrate() {
        return chipassrate == null || "null".equals(chipassrate)? "" : chipassrate;
    }

    public String getEngpassrate() {
        return engpassrate == null || "null".equals(engpassrate)? "" : engpassrate;
    }

    public String getUrate() {
        return urate == null || "null".equals(urate)  ? "" : urate;
    }

    public String getSixcoursesratio() {
        return sixcoursesratio == null || "null".equals(sixcoursesratio) ? "" : sixcoursesratio;
    }

    public String getAthleticsposmale() {
        return athleticsposmale == null || "null".equals(athleticsposmale) ? "" : athleticsposmale;
    }

    public String getAthleticsdivmale() {
        return athleticsdivmale == null || "null".equals(athleticsdivmale)  ? "" : athleticsdivmale;
    }

    public String getAthleticsposfemale() {
        return athleticsposfemale == null || "null".equals(athleticsposfemale)  ? "" : athleticsposfemale;
    }

    public String getAthleticsdivfemale() {
        return athleticsdivfemale == null || "null".equals(athleticsdivfemale)  ? "" : athleticsdivfemale;
    }

    public String getFootballpos() {
        return footballpos == null || "null".equals(footballpos)  ? "" : footballpos;
    }

    public String getFootballdiv() {
        return footballdiv == null || "null".equals(footballdiv)  ? "" : footballdiv;
    }

    public String getSwimmingposmale() {
        return swimmingposmale == null || "null".equals(swimmingposmale)  ? "" : swimmingposmale;
    }

    public String getSwimmingdivmale() {
        return swimmingdivmale == null || "null".equals(swimmingdivmale)  ? "" : swimmingdivmale;
    }

    public String getSwimmingposfemale() {
        return swimmingposfemale == null || "null".equals(swimmingposfemale)  ? "" : swimmingposfemale;
    }

    public String getSwimmingdivfemale() {
        return swimmingdivfemale == null || "null".equals(swimmingdivfemale)  ? "" : swimmingdivfemale;
    }

    public String getBasketballposmale() {
        return basketballposmale == null || "null".equals(basketballposmale)  ? "" : basketballposmale;
    }

    public String getBasketballdivmale() {
        return basketballdivmale == null || "null".equals(basketballdivmale)  ? "" : basketballdivmale;
    }

    public String getBasketballposfemale() {
        return basketballposfemale == null || "null".equals(basketballposfemale)  ? "" : basketballposfemale;
    }

    public String getBasketballdivfemale() {
        return basketballdivfemale == null || "null".equals(basketballdivfemale)  ? "" : basketballdivfemale;
    }

    public String getAthleticsdivname() {
        return athleticsdivname == null || "null".equals(athleticsdivname)  ? "" : athleticsdivname;
    }

    public String getChoirchinese() {
        return choirchinese == null || "null".equals(choirchinese)  ? "" : choirchinese;
    }

    public String getChoirforeign() {
        return choirforeign == null || "null".equals(choirforeign)  ? "" : choirforeign;
    }

    public String getInstrumentchinese() {
        return instrumentchinese == null || "null".equals(instrumentchinese)  ? "" : instrumentchinese;
    }

    public String getInstrumentwestern() {
        return instrumentwestern == null || "null".equals(instrumentwestern)  ? "" : instrumentwestern;
    }

    public String getMusicfirst() {
        return musicfirst == null || "null".equals(musicfirst)  ? "" : musicfirst;
    }

    public String getMusicsecond() {
        return musicsecond == null || "null".equals(musicsecond)   ? "" : musicsecond;
    }

    public String getMusicthird() {
        return musicthird == null || "null".equals(musicthird)  ? "" : musicthird;
    }

    public String getSpeechfirst() {
        return speechfirst == null || "null".equals(speechfirst)  ? "" : speechfirst;
    }

    public String getSpeechsecond() {
        return speechsecond == null || "null".equals(speechsecond)  ? "" : speechsecond;
    }

    public String getSpeechthird() {
        return speechthird == null || "null".equals(speechthird)  ? "" : speechthird;
    }

    public String getMusicother() {
        return musicother == null || "null".equals(musicother)  ? "" : musicother;
    }

    public String getDebatechi() {
        return debatechi == null || "null".equals(debatechi)  ? "" : debatechi;
    }

    public String getArea() {
        return area == null || "null".equals(area)  ? "" : area;
    }

    public String getNoofspecialroom() {
        return noofspecialroom == null || "null".equals(noofspecialroom)  ? "" : noofspecialroom;
    }

    public String getTeacherexperience() {
        return teacherexperience == null || "null".equals(teacherexperience)  ? "" : teacherexperience;
    }

    public String getTeachermaster() {
        return teachermaster == null || "null".equals(teachermaster)  ? "" : teachermaster;
    }

    public String getTeacherbachelor() {
        return teacherbachelor == null || "null".equals(teacherbachelor)  ? "" : teacherbachelor;
    }

    public String getTeacherforeign() {
        return teacherforeign == null || "null".equals(teacherforeign)  ? "" : teacherforeign;
    }

    public String getSchoolfee() {
        return schoolfee == null || "null".equals(schoolfee)  ? "" : schoolfee;
    }

    public String getTuitionfee() {
        return tuitionfee == null || "null".equals(tuitionfee)  ? "" : tuitionfee;
    }

    public String getSchoolallocationscore() {
        return schoolallocationscore;
    }

    public String getQareport() {
        return qareport;
    }

    public String getVoucher() {
        return voucher;
    }

    public String getSchoolfeenursery() {
        return schoolfeenursery;
    }

    public String getNoofclassroom() {
        return noofclassroom;
    }

    public String getIndoorplayground() {
        return indoorplayground;
    }

    public String getOutdoorplayground() {
        return outdoorplayground;
    }

    public String getMusicroom() {
        return musicroom;
    }

    public String getNoofotherroom() {
        return noofotherroom;
    }

    public String getTeacherpupilam() {
        return teacherpupilam;
    }

    public String getTeacherpupilpm() {
        return teacherpupilpm;
    }

    public String getOverpercent() {
        return overpercent;
    }

    public String getNoofhall() {
        return noofhall;
    }

    public String getNoofplayground() {
        return noofplayground;
    }

    public String getNooflibraryroom() {
        return nooflibraryroom;
    }

    public void buildMetric(String banding, String hkdsepassrate, String chipassrate, String engpassrate, String urate, String sixcoursesratio, String athleticsposmale, String athleticsdivmale, String athleticsposfemale, String athleticsdivfemale, String footballpos, String footballdiv, String swimmingposmale, String swimmingdivmale, String swimmingposfemale, String swimmingdivfemale, String basketballposmale, String basketballdivmale, String basketballposfemale, String basketballdivfemale, String athleticsdivname, String choirchinese, String choirforeign, String instrumentchinese, String instrumentwestern, String musicfirst, String musicsecond, String musicthird, String speechfirst, String speechsecond, String speechthird, String musicother, String debatechi, String area, String noofspecialroom, String teacherexperience, String teachermaster, String teacherbachelor, String teacherforeign, String schoolfee, String tuitionfee) {
        this.banding = banding;
        this.hkdsepassrate = hkdsepassrate;
        this.chipassrate = chipassrate;
        this.engpassrate = engpassrate;
        this.urate = urate;
        this.sixcoursesratio = sixcoursesratio;
        this.athleticsposmale = athleticsposmale;
        this.athleticsdivmale = athleticsdivmale;
        this.athleticsposfemale = athleticsposfemale;
        this.athleticsdivfemale = athleticsdivfemale;
        this.footballpos = footballpos;
        this.footballdiv = footballdiv;
        this.swimmingposmale = swimmingposmale;
        this.swimmingdivmale = swimmingdivmale;
        this.swimmingposfemale = swimmingposfemale;
        this.swimmingdivfemale = swimmingdivfemale;
        this.basketballposmale = basketballposmale;
        this.basketballdivmale = basketballdivmale;
        this.basketballposfemale = basketballposfemale;
        this.basketballdivfemale = basketballdivfemale;
        this.athleticsdivname = athleticsdivname;
        this.choirchinese = choirchinese;
        this.choirforeign = choirforeign;
        this.instrumentchinese = instrumentchinese;
        this.instrumentwestern = instrumentwestern;
        this.musicfirst = musicfirst;
        this.musicsecond = musicsecond;
        this.musicthird = musicthird;
        this.speechfirst = speechfirst;
        this.speechsecond = speechsecond;
        this.speechthird = speechthird;
        this.musicother = musicother;
        this.debatechi = debatechi;
        this.area = area;
        this.noofspecialroom = noofspecialroom;
        this.teacherexperience = teacherexperience;
        this.teachermaster = teachermaster;
        this.teacherbachelor = teacherbachelor;
        this.teacherforeign = teacherforeign;
        this.schoolfee = schoolfee;
        this.tuitionfee = tuitionfee;
    }

    public void buildMetricKidergarten(String schoolallocationscore, String qareport, String voucher, String schoolfeenursery, String noofclassroom, String indoorplayground, String outdoorplayground, String musicroom, String noofotherroom, String teacherpupilam, String teacherpupilpm) {
        this.schoolallocationscore = schoolallocationscore;
        this.qareport = qareport;
        this.voucher = voucher;
        this.schoolfeenursery = schoolfeenursery;
        this.noofclassroom = noofclassroom;
        this.indoorplayground = indoorplayground;
        this.outdoorplayground = outdoorplayground;
        this.musicroom = musicroom;
        this.noofotherroom = noofotherroom;
        this.teacherpupilam = teacherpupilam;
        this.teacherpupilpm = teacherpupilpm;
    }

    public void buildMetricPrimary(String overpercent, String noofhall, String noofplayground, String nooflibraryroom) {
        this.overpercent = overpercent;
        this.noofhall = noofhall;
        this.noofplayground = noofplayground;
        this.nooflibraryroom = nooflibraryroom;
    }
}
