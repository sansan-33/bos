package com.ana.entity;

import java.io.Serializable;

public class RssFeedVO implements Serializable {

    private String title;

    private String content;

    private String cite;

    private String date;

    private String url;

    private String thumbnail;

    public RssFeedVO() {
    }

    public RssFeedVO(String title, String cite, String content, String date, String url, String thumbnail) {
        this.title = title;
        this.content = content;
        this.cite = cite;
        this.date = date;
        this.url = url;
        this.thumbnail = thumbnail;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getCite() {
        return cite;
    }

    public String getDate() {
        return date;
    }

    public String getUrl() {
        return url;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    @Override
    public String toString() {
        return "RssFeedVO{" +
                "title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", cite='" + cite + '\'' +
                ", date='" + date + '\'' +
                ", url='" + url + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                '}';
    }
}
