package com.ana.dao;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository(value = "eventDao")
public class EventDAO extends BaseDAO {

    private final Logger theLogger = LoggerFactory.getLogger(EventDAO.class);
	public List<Map<String, Object>> getEventList(int month, int year, boolean all, String type, String sortby ) throws SQLException {

        String groupdate = (sortby !=null && sortby.trim().length() == 0) ?  "e.startdate" : "e.enddate" ;
        theLogger.debug("sortby " + sortby);
        StringBuffer sql = new StringBuffer();
        StringBuffer sqldate = new StringBuffer();
        StringBuffer sqlorder = new StringBuffer();
        sql.append("select t.id as entityid,t.categoryid as categoryid, e.id,e.title,e.note,e.ipaddr,  MONTH(" + groupdate + ") as emonth, DAY(" + groupdate + ") as eday, DATE_FORMAT(e.startdate,'%d %b %Y' ) as startdate, DATE_FORMAT(e.enddate,'%d %b %Y' ) as enddate, e.url as url,  ");
		sql.append(" CONCAT(t.name, ' ', t.nameeng) as schoolname, t.name, t.nameeng, eventtype, t.chscid, t.categoryid, t.poaschoolnet, t.financetype, ");
        //sql.append(" IF( (  (enddate >= DATE_SUB(now(), INTERVAL 1 DAY) )  or  ( now() between startdate and enddate  )  ) , 'active', 'expiry') as status, ");
        sql.append(" IF( (  (enddate >= CURRENT_DATE() )  or  ( now() between startdate and enddate  )  ) , 'active', 'expiry') as status, ");
        sql.append(" TIMESTAMPDIFF(MINUTE, e.lastmodified, now()) as timediffmin,TIMESTAMPDIFF(DAY, e.lastmodified, now()) as timediffday,TIMESTAMPDIFF(HOUR, e.lastmodified, now()) as timediffhour, TIMESTAMPDIFF(SECOND, e.lastmodified, now()) as timediffsec, ABS(DATEDIFF(now(),e.enddate)) as remainday ");

        sql.append("from bos.event e left join bos.entity t on (e.entityid=t.id) ");
		sql.append(" where eventtype!='principalsay' " );

		if(!all){
			if(year > 2011){
                sqldate.append(" and active='y' and YEAR(startdate) = '" + year + "'" );
            }else {
                sqldate.append(" and active='y' and YEAR(startdate) >= '" + year + (month < 0 ? "' and (  (startdate between DATE_SUB(now(), INTERVAL 1 DAY) and DATE_ADD(now(), INTERVAL 31 DAY))  or  ( now() between startdate and DATE_ADD(enddate,INTERVAL 1 DAY)   )  ) " : "' and MONTH(startdate) = '" + month + "'") );
            }
            if(type.equalsIgnoreCase("privatedss")){
                sqldate.append(" and  t.categoryid=1 and t.financetype in ('\u76F4\u8CC7','\u79C1\u7ACB')  ");
            }
        }
        sqlorder.append(" order by " + ((sortby !=null && sortby.trim().length() == 0) ?  "e.startdate asc " : ("full".equalsIgnoreCase(sortby)) ? "e.enddate desc" : "e.enddate asc" ) );
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString() + sqldate.toString() + sqlorder.toString());
        //Home page show more event special case
        if(result.size() < 12  && month < 0 && ! type.equalsIgnoreCase("privatedss") && year <  2011){
            sqldate = new StringBuffer();
            sqldate.append(" and active='y' and YEAR(startdate) >= '" + year + (month < 0 ? "' and (  (startdate between DATE_SUB(now(), INTERVAL 1 DAY) and DATE_ADD(now(), INTERVAL 360 DAY))  or  ( CURRENT_DATE() between startdate and enddate   )  ) " : "' and MONTH(startdate) = '" + month + "'") );
            result = jdbcTemplate.queryForList(sql.toString() + sqldate.toString() + " order by e.enddate asc  limit 12 ");
            theLogger.debug("getEventList  " + sql.toString() + sqldate.toString() + " order by e.enddate asc  limit 12 ");
        }
		theLogger.debug("getEventList  " + sql + sqldate + sqlorder);
		return result;
	}


//	select t.id as entityid,t.categoryid as categoryid, e.id,e.title,e.note,e.ipaddr,  MONTH(e.enddate) as emonth, DAY(e.enddate) as eday, DATE_FORMAT(e.startdate,'%d %b %Y' ) as startdate, DATE_FORMAT(e.enddate,'%d %b %Y' ) as enddate, e.url as url,   CONCAT(t.name, ' ', t.nameeng) as schoolname, t.name, t.nameeng, eventtype, t.chscid, t.categoryid, t.poaschoolnet, t.financetype,  IF( (  (enddate >= CURRENT_DATE() )  or  ( now() between startdate and enddate  )  ) , 'active', 'expiry') as status,  TIMESTAMPDIFF(MINUTE, e.lastmodified, now()) as timediffmin,TIMESTAMPDIFF(DAY, e.lastmodified, now()) as timediffday,TIMESTAMPDIFF(HOUR, e.lastmodified, now()) as timediffhour, TIMESTAMPDIFF(SECOND, e.lastmodified, now()) as timediffsec, DATEDIFF(now(),e.enddate) as remainday from bos.event e left join bos.entity t on (e.entityid=t.id)  where eventtype!='principalsay'  and active='y' and YEAR(startdate) >= '0' and (  (startdate between DATE_SUB(now(), INTERVAL 1 DAY) and DATE_ADD(now(), INTERVAL 360 DAY))  or  ( CURRENT_DATE() between startdate and enddate   )  )  order by e.enddate asc

	public Map<String, Object> getEvent(String id) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("select v.id,v.title,v.note,v.ipaddr, v.active,v.created, COALESCE(DATE_FORMAT(v.startdate,'%d %b %Y'),'now') as startdate,COALESCE(DATE_FORMAT(v.enddate,'%d %b %Y'),'now') as enddate, v.entityid, e.name, e.chscid , e.categoryid, e.nameeng, e.schoolfee,e.address,e.url,e.telephone, e.financetype  from bos.event v, bos.entity e ");
		sql.append(" where v.entityid=e.id and v.id = '" + id + "'");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getEvent " + sql.toString());
		if(result.size() > 0){
			return result.get(0);
		}else{
			HashMap<String,Object> emptyMap = new HashMap<String,Object>();
			emptyMap.put("id", "-1");
			emptyMap.put("title","");
			emptyMap.put("active", "y");
			emptyMap.put("startdate", "now");
			return emptyMap;
		}
	}
	public List<Map<String, Object>> getEventBySchool(String id) throws SQLException {
		if(id != null && id.trim().length() > 0){
			StringBuffer sql = new StringBuffer();
			
			Map<String, Object> entity = jdbcTemplate.queryForMap("select categoryid,financetype from entity where id=" + id);
			
			if("\u5B98\u7ACB".equalsIgnoreCase((String) entity.get("financetype")) || "\u8CC7\u52A9".equalsIgnoreCase((String) entity.get("financetype")) ||  "\u6309\u4F4D\u6D25\u8CBC".equalsIgnoreCase((String) entity.get("financetype"))  ){
				sql.append("select * from (");
				sql.append("(select id,title,note,active,startdate,  date_format(startdate,'%b') as shortmonth,date_format(startdate,'%a') as shortweekday,date_format(startdate,'%e') as shortday, date_format(startdate,'%Y') as fouryear, entityid from bos.event");
				sql.append(" where  entityid = '10000" + entity.get("categoryid") + "' order by startdate desc ");
				sql.append(") union  (select id,title,note,active,startdate,  date_format(startdate,'%b') as shortmonth,date_format(startdate,'%a') as shortweekday,date_format(startdate,'%e') as shortday, date_format(startdate,'%Y') as fouryear, entityid from bos.event");
				sql.append(" where active='y' and entityid = '" + id + "' order by startdate desc ");
				sql.append(") ) f order by startdate desc");
						
			}else{
			sql.append("select id,title,note,active,  date_format(startdate,'%b') as shortmonth,date_format(startdate,'%a') as shortweekday,date_format(startdate,'%e') as shortday, date_format(startdate,'%Y') as fouryear, entityid from bos.event");
			sql.append(" where active='y' and entityid = '" + id + "' order by startdate desc ");
			}
			
			theLogger.debug("getEventBySchool " + sql.toString());
			List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
			theLogger.debug("Result size " + result.size());
			return result;
		}else{
			return new ArrayList<Map<String, Object>>();
		}
	}
	public Map<String, Object> getEventByEntity(String id, String type) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("select id,title,note,active, eventtype, entityid,ipaddr,  " );
		sql.append("COALESCE(DATE_FORMAT(startdate,'%Y-%m-%d'),'now') as startdate, ");
		sql.append("COALESCE(DATE_FORMAT(enddate,'%Y-%m-%d'),'now') as enddate ");
		sql.append(" from bos.event");
		sql.append(" where eventtype='" + type + "' and entityid = '" + id + "' order by startdate desc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		theLogger.debug("getEventByEntity " + sql.toString());
		if(result.size() > 0){
			return result.get(0);
		}else{
			return new HashMap<String, Object>();
		}
	}
	public Map<String, Object> getEventByID(String id) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("select id,title,note,active, eventtype, entityid,ipaddr, " );
		sql.append("COALESCE(DATE_FORMAT(startdate,'%Y-%m-%d'),'now') as startdate, ");
		sql.append("COALESCE(DATE_FORMAT(enddate,'%Y-%m-%d'),'now') as enddate ");
		sql.append(" from bos.event");
		sql.append(" where id = '" + id + "' order by startdate desc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		theLogger.debug("getEventByID " + sql.toString());
		theLogger.debug("getEventByID size" + result.size() );
		theLogger.debug("result" + result );
		if(result.size() > 0){
			return result.get(0);
		}else{
			return new HashMap<String, Object>();
		}
	}
	public void saveEvent(Map<String,String> event) throws SQLException{
    	try {
			
    			StringBuffer sql = new StringBuffer();
				if(event.get("id") != null && ! "-1".equalsIgnoreCase((String) event.get("id"))){
					sql.append("update bos.event set title=? " );
					sql.append(" ,active='" + quote(event.get("active")) + "' " );
					sql.append(" ,note=? " );
					sql.append(" ,eventtype=? " );
					sql.append(" ,ipaddr=? " );
					sql.append(" ,userid=? " );
					
					if(event.get("startdate").trim().length() > 0 )
						sql.append(" ,startdate='" + quote(event.get("startdate")) + "' " );
					if(event.get("enddate").trim().length() > 0 )
						sql.append(" ,enddate='" + quote(event.get("enddate")) + "' " );
					
					sql.append("where id='" + event.get("id") + "'");
				}else{
					sql.append("insert into bos.event (title,note,eventtype,ipaddr,userid,entityid,active,startdate,enddate,lastmodified,created) values( ");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("'" + quote(event.get("entityid")) + "',");
					sql.append("'" + quote(event.get("active")) + "',");
					if(event.get("startdate").trim().length() > 0)
						sql.append("'" + quote(event.get("startdate")) + "',");
					if(event.get("startdate").trim().length() > 0)
						sql.append("'" + quote(event.get("enddate")) + "',");
					
					sql.append("current_timestamp,current_timestamp)");
				}
				theLogger.debug("saveEvent " + sql.toString());
				jdbcTemplate.update(sql.toString(),event.get("title"),event.get("note"),event.get("eventtype"),event.get("ipaddr"),event.get("userid"));
		} catch (Exception ex) {
			ex.printStackTrace();

		}
    }
	public List<Map<String, Object>> getEventListByUser(String userid, String entityids, String categoryid) throws SQLException {
		try{
			StringBuffer sql = new StringBuffer();
			sql.append("(select interview as ordertime,DATE_FORMAT(interview,'%d%b%y') as eventdate, 'interview' as title,  e.name from favorite f, entity e where f.entityid=e.id and f.userid=" + userid + " and EXTRACT(YEAR FROM interview) >= EXTRACT(YEAR FROM current_timestamp) - 1 ) ");
			sql.append("union all ");
			sql.append("(select application as ordertime,DATE_FORMAT(application,'%d%b%y') as eventdate, 'application' as title,  e.name from favorite f, entity e where f.entityid=e.id and f.userid=" + userid + " and EXTRACT(YEAR FROM application) >= EXTRACT(YEAR FROM current_timestamp) - 1 ) ");
			sql.append("union all ");
			sql.append("(select announcement as ordertime,DATE_FORMAT(announcement,'%d%b%y') as eventdate, 'result' as title,  e.name from favorite f, entity e where f.entityid=e.id and f.userid=" + userid + " and EXTRACT(YEAR FROM announcement) >= EXTRACT(YEAR FROM current_timestamp) - 1 ) ");
			sql.append("union all ");
			sql.append("(select startdate as ordertime,DATE_FORMAT(startdate,'%d%b%y') as eventdate, title ,  t.name from favorite f, event e, entity t where e.active='y' and f.entityid=t.id and e.entityid =t.id and e.entityid in (" +  entityids + ")  and f.userid=" + userid + " and EXTRACT(YEAR FROM startdate) >= EXTRACT(YEAR FROM current_timestamp) - 1 ) ");
			sql.append("union all ");
			sql.append("(select startdate as ordertime,DATE_FORMAT(startdate,'%d%b%y') as eventdate, title, '' as name from event where entityid in (" +  ( "1".equalsIgnoreCase(categoryid ) ? "100001" : "100002"  ) + ") and EXTRACT(YEAR FROM startdate) >= EXTRACT(YEAR FROM current_timestamp) - 1 ) ");
			sql.append("union all ");
			sql.append("(select current_timestamp as ordertime,DATE_FORMAT(current_timestamp,'%d%b%y') as eventdate, 'today' as title, '' as name from favorite limit 1) ");
			sql.append(" order by ordertime asc");
			List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
			theLogger.debug("Result size " + result.size());
			return result;
		}catch(Exception ex){
			return new ArrayList<Map<String, Object>> ();
		}
	}
}
