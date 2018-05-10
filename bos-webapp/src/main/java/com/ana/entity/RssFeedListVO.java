package com.ana.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by anthan on 17/12/2016.
 */
public class RssFeedListVO implements Serializable{

    private List<RssFeedVO> feeds = new ArrayList<RssFeedVO>();

    public List<RssFeedVO> getFeeds() {
        return feeds;
    }

    public void setFeeds(List<RssFeedVO> feeds) {
        this.feeds = feeds;
    }

    @Override
    public String toString() {
        StringBuilder result = new StringBuilder();
        for(RssFeedVO feed : feeds){
            result.append(feed.toString()).append("\n\r");
        }
        return result.toString();
    }
}
