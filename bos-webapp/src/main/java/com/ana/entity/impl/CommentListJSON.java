package com.ana.entity.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by anthan on 17/12/2016.
 */
public class CommentListJSON implements Serializable{

    private List<CommentJSON> comments = new ArrayList<CommentJSON>();
    public List<CommentJSON> getComments() {
        return comments;
    }
    public void setComments(List<CommentJSON> comments) {
        this.comments = comments;
    }
}
