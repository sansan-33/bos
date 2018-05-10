package com.ana.entity;

import java.util.concurrent.atomic.AtomicInteger;

public
class ObjectStat
{
    int objectid;
    String type;
    AtomicInteger hitcounter;

    public ObjectStat(int aObjectid, String aType, int aHitcounter){
        objectid = aObjectid;
        type = aType;
        hitcounter = new AtomicInteger(aHitcounter);
    }

    public
    int getObjectid()
    {
        return objectid;
    }

    public
    void setObjectid(int aObjectid)
    {
        objectid = aObjectid;
    }

    public
    String getType()
    {
        return type;
    }

    public
    void setType(String aType)
    {
        type = aType;
    }

    public
    AtomicInteger getHitcounter()
    {
        return hitcounter;
    }

    public
    void setHitcounter(AtomicInteger aHitcounter)
    {
        hitcounter = aHitcounter;
    }

    public  void updateHitCount(){
        hitcounter.incrementAndGet();
    }
}
