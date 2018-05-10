package com.ana.dao;

import com.ana.entity.ObjectStat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Repository(value = "objectStatDao")
public
class ObjectStatDAO extends BaseDAO
{
    private final Logger theLogger = LoggerFactory.getLogger(ObjectStatDAO.class);
    private TransactionTemplate transactionTemplate;

    public
    TransactionTemplate getTransactionTemplate()
    {
        return transactionTemplate;
    }

    public
    void setTransactionTemplate(TransactionTemplate aTransactionTemplate)
    {
        transactionTemplate = aTransactionTemplate;
    }

    public
    ObjectStat getObjectStatByKey(final int entityid, final String type) throws SQLException {

        StringBuffer sql = new StringBuffer();
        sql.append("select hitcounter,id,objectid from objectstat where objectid=" + entityid + " and type='" + type + "' and status='active' order by hitcounter desc");
        theLogger.debug(sql.toString());
        int result =  0;
        int id=0;
        try{
            List<Map<String, Object>> resultList = jdbcTemplate.queryForList(sql.toString());
            result =  Integer.parseInt("" + resultList.get(0).get("hitcounter"));
            id = Integer.parseInt("" + resultList.get(0).get("objectid"));
            //objectstatid = "" + resultList.get(0).get("id");
            //if(resultList.size() > 1){
            //    jdbcTemplate.update("delete from objectstat where objectid=" + entityid + " and type='" + type + "' and status='active' and hitcounter !=" + result);
            //}
        }catch(Exception ex){
            //ex.printStackTrace();
            result = 0;
            //objectstatid="-1";
        }
        //updateEntityHitCount(entityid, type,result,ip, objectstatid);
        return result == 0 ? null : new ObjectStat(id,type,result);

    }
    public
    java.util.List getObjectStatByType(final String type) throws SQLException {

        StringBuffer sql = new StringBuffer();
        sql.append("select hitcounter,id,objectid from objectstat where type='" + type + "' and status='active' order by hitcounter desc");
        return  jdbcTemplate.queryForList(sql.toString());
    }
    public boolean isNewObjectStat(final int entityid, final String type){
        try{
            List<Map<String, Object>> resultList = jdbcTemplate.queryForList("select id from objectstat where objectid="
                + entityid
                + " and type='"
                + type
                + "' and status='active' ");
            if(resultList.size() > 0 ){
                return  false;
            }else{
                return true;
            }
        }catch(Exception ex){

            return true;
        }

    }

    public void saveTranObjectStat(final Map<String,ObjectStat> objectStatMap) throws Exception {

        transactionTemplate.execute(new TransactionCallbackWithoutResult() {
            @Override
            protected void doInTransactionWithoutResult(TransactionStatus status) {
                try{
                    saveObjectStat(objectStatMap);
                }catch (Exception ex){
                    theLogger.error("saveTranObjectStat exception {}" , ex);
                    status.setRollbackOnly();
                }
            }
        });
    }

    public void saveObjectStat(final Map<String,ObjectStat> objectStatMap) throws Exception {

        ArrayList<String> sqllist = new ArrayList<String>();
        String sql = "";
        //synchronized in application filter
        for (Map.Entry<String, ObjectStat> entry : objectStatMap.entrySet()) {
            if(entry.getValue().getHitcounter() != null && entry.getValue().getHitcounter().get() > 0){
                sql = "INSERT INTO objectstat (objectid,type,hitcounter,status,lastmodified,created) VALUES (" + entry.getValue().getObjectid() + ", '" + entry.getValue().getType() + "', " + entry.getValue().getHitcounter().get() + " ,'active',current_timestamp, current_timestamp) ON DUPLICATE KEY UPDATE hitcounter =" +  entry.getValue().getHitcounter().get();
                //jdbcTemplate.update(sql);
                //System.out.println("sql: " + sql);
                sqllist.add(sql);
            }
            if("eventCalendar".equalsIgnoreCase(entry.getValue().getType()))
                theLogger.info("updateEntityHitCount:" + "INSERT INTO objectstat (objectid,type,hitcounter,status,lastmodified,created) VALUES (" + entry.getValue().getObjectid() + ", '" + entry.getValue().getType() + "', " + entry.getValue().getHitcounter().get() + " ,'active',current_timestamp, current_timestamp) ON DUPLICATE KEY UPDATE hitcounter =" +  entry.getValue().getHitcounter().get());

        }
        if(!sqllist.isEmpty()){
            theLogger.debug("updateEntityHitCount:" + sqllist.toString());
            //System.out.println("updateEntityHitCount:" + sqllist.size());
            jdbcTemplate.batchUpdate( sqllist.toArray(new String[sqllist.size()])  );
        }

    }

}

