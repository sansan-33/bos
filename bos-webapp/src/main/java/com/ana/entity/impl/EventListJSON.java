package com.ana.entity.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by anthan on 17/12/2016.
 */
public class EventListJSON implements Serializable{

    private List<EventJSON> events = new ArrayList<EventJSON>();
    public List<EventJSON> getEvents() {
        return events;
    }
    public void setEvents(List<EventJSON> events) {
        this.events = events;
    }
}
