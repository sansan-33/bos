package com.ana.dao;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

@Repository(value = "serviceDao")
public class ServiceDAO extends BaseDAO {

    private final Logger theLogger = LoggerFactory.getLogger(ServiceDAO.class);
	public List<Map<String, Object>> getTileImage(int noofrecord) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select chscid, categoryid from entity e where categoryid =0 and score > 8.0 and chscid not in (879,880,881,882,883,884,1004,108,109,110,639) ");
		sql.append("union select chscid, categoryid from entity e where categoryid =1 and score > 6.6 ");
		sql.append("union select chscid , categoryid from entity e where categoryid = 2 and score > 6.6");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	} 
	public int getTotalParentPollCount() throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select count(1) from comment where type='polling' and grade > 0");
		return jdbcTemplate.queryForObject(sql.toString(),Integer.class);
	}
	public int getTotalSchoolHitCount() throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select sum(hitcounter) from objectstat where status='active'");
		sql.append(" and objectid > 0 " );
		
		return jdbcTemplate.queryForObject(sql.toString(),Integer.class);
	}
	public int getTotalUserCount() throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select count(1) from user where roleid < 2   ");
		
		return jdbcTemplate.queryForObject(sql.toString(),Integer.class);
	}
	public int getTotalTutorCount() throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select count(1) from user where roleid=2 ");

		return jdbcTemplate.queryForObject(sql.toString(),Integer.class);
	}
	public List<Map<String, Object>> searchSite(final HashMap<String,String> searchMap) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select * from ( ");
		//sql.append("(select e.id, 'school' as searchcat, name, nameeng, metric1,metric2,metric3,metric4,metric5, CONCAT(e.financetype, ' ', l.description, ' ' , e.sex,    ', \u5275\u6821\u5E74\u4EFD:' , e.yearofcommencement " +  ( searchMap.get("categoryid") != null && searchMap.get("categoryid").indexOf('0') != -1  ? "" :  ", ' \u5B78\u6821\u4F54\u5730\u9762\u7A4D:' , e.area")  + "  ) as desctext , score, '1' as userid, categoryid, chscid as imgid, e.lastmodified  from entity e, comment c, lookup l  where e.id=c.entityid and c.year="+ getRankingYear() + " and  l.type = 'entity.category.chi' and e.categoryid=l.value  ");
        sql.append(" select * from  ");
        sql.append("(select e.id, 'school' as searchcat, name, nameeng, e.poaschoolnet,e.address, ");
        /*sql.append("IF(avg(metric1) > 0 , round(avg(metric1),1) , '?')  as metric1, ");
        sql.append("IF(avg(metric2) > 0 , round(avg(metric2),1) , '?')  as metric2, ");
        sql.append("IF(avg(metric3) > 0 , round(avg(metric3),1) , '?')  as metric3, ");
        sql.append("IF(avg(metric4) > 0 , round(avg(metric4),1) , '?')  as metric4, ");
        sql.append("IF(avg(metric5) > 0 , round(avg(metric5),1) , '?')  as metric5, ");
*/
		sql.append("IF(avg(metricoverall1) > 0 , round(avg(metricoverall1),1) , '?')  as metric1, ");
		sql.append("IF(avg(metricoverall2) > 0 , round(avg(metricoverall2),1) , '?')  as metric2, ");
		sql.append("IF(avg(metricoverall3) > 0 , round(avg(metricoverall3),1) , '?')  as metric3, ");
		sql.append("IF(avg(metricoverall4) > 0 , round(avg(metricoverall4),1) , '?')  as metric4, ");
		sql.append("IF(avg(metricoverall5) > 0 , round(avg(metricoverall5),1) , '?')  as metric5, ");

		sql.append("CONCAT(e.financetype, ' ', l.description, ' ' , e.sex,    ', \u5275\u6821\u5E74\u4EFD:' , e.yearofcommencement " +  ( searchMap.get("categoryid") != null && searchMap.get("categoryid").indexOf('0') != -1  ? "" :  ", ' \u5B78\u6821\u4F54\u5730\u9762\u7A4D:' , e.area")  + "  ) as desctext , score, '1' as userid, categoryid, chscid as imgid, e.lastmodified ");
		//sql.append(" from entity e, comment c, lookup l, lookup lp  ");
		//sql.append(" where e.id=c.entityid  and c.type='system' and  l.type = 'entity.category.chi' and e.categoryid=l.value  ");
		sql.append(" from entity e, lookup l, lookup lp, entitybasic b  ");
		sql.append(" where e.id=b.entityid and b.isclosed='n' and l.type = 'entity.category.chi' and e.categoryid=l.value  ");
		sql.append(searchMap.get("yearofcommencement") != null && ! "-1".equalsIgnoreCase(searchMap.get("yearofcommencement")) ? " and  YEAR(CURDATE()) - CAST(`yearofcommencement` AS DECIMAL(10,2))  > "+ searchMap.get("yearofcommencement") + " ": "");

		// at least one exist
		if( (searchMap.get("nominated") != null && ! "-1".equalsIgnoreCase(searchMap.get("nominated"))) || (searchMap.get("throughtrain") != null && ! "-1".equalsIgnoreCase(searchMap.get("throughtrain")))  || (searchMap.get("feeder") != null && ! "-1".equalsIgnoreCase(searchMap.get("feeder"))) ){
		sql.append( "  and  ( 1 < 0 " ); // dummy criteria
		sql.append(searchMap.get("nominated") != null && ! "-1".equalsIgnoreCase(searchMap.get("nominated")) ? " or  length(nominated) > 0  ": "");
		sql.append(searchMap.get("throughtrain") != null && ! "-1".equalsIgnoreCase(searchMap.get("throughtrain")) ? " or  length(throughtrain) > 0 ": "");
		sql.append(searchMap.get("feeder") != null && ! "-1".equalsIgnoreCase(searchMap.get("feeder")) ? " or  length(feeder) > 0 ": "");
		sql.append("  ) ");
		}
		
		sql.append(searchMap.get("financetype") != null && ! "-1".equalsIgnoreCase(searchMap.get("financetype")) ? " and  financetype in ("+ searchMap.get("financetype") + ") ": "");
		sql.append(searchMap.get("nursery") != null && ! "-1".equalsIgnoreCase(searchMap.get("nursery")) ? " and  lower(nursery) ='yes'  and categoryid=0  " : "");
		
		// at least one exist
		if( (searchMap.get("boy") != null && ! "-1".equalsIgnoreCase(searchMap.get("boy"))) || (searchMap.get("girl") != null && ! "-1".equalsIgnoreCase(searchMap.get("girl")))  || (searchMap.get("boygirl") != null && ! "-1".equalsIgnoreCase(searchMap.get("boygirl"))) ){
		sql.append( "  and  ( 1 < 0 " ); // dummy criteria
		sql.append(searchMap.get("boy") != null && ! "-1".equalsIgnoreCase(searchMap.get("boy")) ? "  or e.sex = '" + searchMap.get("boy")   + "' " : "");
		sql.append(searchMap.get("girl") != null && ! "-1".equalsIgnoreCase(searchMap.get("girl")) ? " or e.sex = '" + searchMap.get("girl")   + "' " : "");
		sql.append(searchMap.get("boygirl") != null && ! "-1".equalsIgnoreCase(searchMap.get("boygirl")) ? " or e.sex = '" + searchMap.get("boygirl")   + "' " : "");
		sql.append("  ) ");
		}
		
		// at least one exist
		if( (searchMap.get("chinese") != null && ! "-1".equalsIgnoreCase(searchMap.get("chinese"))) 
				|| (searchMap.get("english") != null && ! "-1".equalsIgnoreCase(searchMap.get("english"))) 
				|| (searchMap.get("chineseenglish") != null && ! "-1".equalsIgnoreCase(searchMap.get("chineseenglish"))) 
				|| (searchMap.get("chineseputonghua") != null && ! "-1".equalsIgnoreCase(searchMap.get("chineseputonghua"))) 
				|| (searchMap.get("chineseputonghuaenglish") != null && ! "-1".equalsIgnoreCase(searchMap.get("chineseputonghuaenglish")))  ){
			sql.append( "  and  ( 1 < 0 " ); // dummy criteria
			sql.append(searchMap.get("chinese") != null && ! "-1".equalsIgnoreCase(searchMap.get("chinese")) ? "  or e.language = '" + searchMap.get("chinese")   + "' " : "");
			sql.append(searchMap.get("english") != null && ! "-1".equalsIgnoreCase(searchMap.get("english")) ? " or e.language = '" + searchMap.get("english")   + "' " : "");
			sql.append(searchMap.get("chineseenglish") != null && ! "-1".equalsIgnoreCase(searchMap.get("chineseenglish")) ? " or e.language = '" + searchMap.get("chineseenglish")   + "' " : "");
			sql.append(searchMap.get("chineseputonghua") != null && ! "-1".equalsIgnoreCase(searchMap.get("chineseputonghua")) ? " or e.language = '" + searchMap.get("chineseputonghua")   + "' " : "");
			sql.append(searchMap.get("chineseputonghuaenglish") != null && ! "-1".equalsIgnoreCase(searchMap.get("chineseputonghuaenglish")) ? " or e.language = '" + searchMap.get("chineseputonghuaenglish")   + "' " : "");
			
			sql.append("  ) ");
		}
		sql.append(searchMap.get("categoryid") != null ? " and  categoryid in("+ searchMap.get("categoryid") + ") ": "");
		sql.append(searchMap.get("session") != null && ! "-1".equalsIgnoreCase(searchMap.get("session")) ? " and  session in (" +  searchMap.get("session") + ") ": "");
		
		sql.append(searchMap.get("parentrating") != null && ! "-1".equalsIgnoreCase(searchMap.get("parentrating")) ? " and  parentscore >= ("+ searchMap.get("parentrating") + ") ": "");
		sql.append(searchMap.get("systemranking") != null && ! "-1".equalsIgnoreCase(searchMap.get("systemranking")) ? " and  ranking <= ("+ searchMap.get("systemranking") + ") ": "");
		sql.append(searchMap.get("score") != null && ! "-1".equalsIgnoreCase(searchMap.get("score")) ? " and  score >= ("+ searchMap.get("score") + ") ": "");
		
		
		sql.append(searchMap.get("schoolname") != null && ! "-1".equalsIgnoreCase(searchMap.get("schoolname")) ? " and ( name like '%"+ quote(searchMap.get("schoolname")) + "%' ": "");
		sql.append(searchMap.get("schoolname") != null && ! "-1".equalsIgnoreCase(searchMap.get("schoolname")) ? " or  lower(nameeng) like '%"+ quote(searchMap.get("schoolname").toLowerCase()) + "%' ) ": "");
		sql.append(searchMap.get("address") != null && ! "-1".equalsIgnoreCase(searchMap.get("address")) ? " and  address like '%"+ quote(searchMap.get("address")) + "%' ": "");
		sql.append(searchMap.get("poaschoolnet") != null && ! "-1".equalsIgnoreCase(searchMap.get("poaschoolnet")) ? " and (poaschoolnet='"+ searchMap.get("poaschoolnet") + "' or poaschoolnet in ( " + getPOASchoolNet(searchMap.get("poaschoolnet")) + ") )": "");

		//sql.append(" limit 500  ) union all ");
        sql.append(" group by id, name ,nameeng, score  ");
        sql.append(" limit 1200  ) as s where 1=1 " );
        sql.append(searchMap.get("metric1") != null && ! "-1".equalsIgnoreCase(searchMap.get("metric1")) ? " and  metric1 >= ("+ searchMap.get("metric1") + ") ": "");
        sql.append(searchMap.get("metric2") != null && ! "-1".equalsIgnoreCase(searchMap.get("metric2")) ? " and  metric2 >= ("+ searchMap.get("metric2") + ") ": "");
        sql.append(searchMap.get("metric3") != null && ! "-1".equalsIgnoreCase(searchMap.get("metric3")) ? " and  metric3 >= ("+ searchMap.get("metric3") + ") ": "");
        sql.append(searchMap.get("metric4") != null && ! "-1".equalsIgnoreCase(searchMap.get("metric4")) ? " and  metric4 >= ("+ searchMap.get("metric4") + ") ": "");
        sql.append(searchMap.get("metric5") != null && ! "-1".equalsIgnoreCase(searchMap.get("metric5")) ? " and  metric5 >= ("+ searchMap.get("metric5") + ") ": "");

        sql.append("  union all ");
        sql.append("(select id, 'reverse' as searchcat, SUBSTRING(subject,1,20) as name,'' as nameeng,'' as poaschoolnet, '' as address, '' as metric1,'' as metric2,'' as metric3,'' as metric4,'' as metric5,  SUBSTRING(questionanswer,1,30) as desctext, id as score, userid, '80' as categoryid, id as imgid, lastmodified  from questionanswer  ");
		sql.append(" where type='a' and tag1  like '%\u9006\u5411\u641C\u5C0B%' and (" + splitSearchKeywords("lower(subject)",searchMap.get("schoolname").toLowerCase())  + ") limit 50)");  //lower(subject) like '%" + quote()   +  "%' ) ");
		sql.append(" union all ");
		sql.append("(select id, 'compare' as searchcat, SUBSTRING(subject,1,20) as name ,'' as nameeng,'' as poaschoolnet, '' as address,  '' as metric1,'' as metric2,'' as metric3,'' as metric4,'' as metric5, SUBSTRING(questionanswer,1,30)  as desctext, id as score,userid, '90' as categoryid, id as imgid, lastmodified   from questionanswer  ");
		sql.append(" where type='a' and (tag2  like '%\u6BD4\u8F03%' or tag1  like '%VS%')  and (" + splitSearchKeywords("lower(subject)",searchMap.get("schoolname").toLowerCase())  + ")  limit 50 )");
		sql.append(") p order by p.categoryid asc, p.nameeng asc, p.lastmodified desc");
		theLogger.debug("searchSite " + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}

	private String getPOASchoolNet(String poaschoolnetprimary) {
		String poa="";
		String sql = "select value from lookup where type='district.poaschoolnet' and imgpath = (select imgpath from lookup where type='district.kindergarten' and value='" + poaschoolnetprimary +"')";
		theLogger.debug("getPOASchoolNet: " + sql);
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		for(Map<String, Object> net : result){
			poa += net.get("value") + ",";
		}
		if(poa.length() > 0)
			poa = poa.substring(0,poa.length()-1);
		return poa;
	}

	private String splitSearchKeywords(String field, String keywords){
		StringBuffer result =  new StringBuffer();
		result.append(field + " like '%" + quote(keywords) + "%' ");
		StringTokenizer st = new StringTokenizer(keywords," ");
		while (st.hasMoreTokens()) {
			result.append(" or " +  field + " like '%" + quote(st.nextToken()) + "%' ");
		}
		return result.toString();
	}
	public List<Map<String, Object>> getUserImageList(String refid) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select * from userimage where referenceid=" + refid + " order by sortorder asc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public void saveUserImage(Map<String,String> userimage) throws SQLException{
    	try {
    		StringBuffer sql = new StringBuffer();
    		
    		if("delete".equalsIgnoreCase(userimage.get("filename"))){
    			jdbcTemplate.update("delete from userimage where imagetype='" + userimage.get("imagetype") +"' and referenceid=" +  userimage.get("referenceid")  + " and sortorder=" +userimage.get("sortorder"));
    			
    		}else{
	    		int i = jdbcTemplate.queryForObject("select count(1) from bos.userimage where imagetype='" + userimage.get("imagetype") +"' and referenceid=" +  userimage.get("referenceid")  + " and sortorder=" +userimage.get("sortorder"),Integer.class );
	    		
	    		if(i>0){
	    			//For the case only description was changed
	    			if(!"-1".equalsIgnoreCase(userimage.get("filename")) && userimage.get("filename").trim().length() > 0 ){
	    				sql.append("update bos.userimage set filename=?,description=?,lastmodified=now() where imagetype=? and referenceid=? and sortorder=? ");
	    				jdbcTemplate.update(sql.toString(),userimage.get("filename"),userimage.get("description"),userimage.get("imagetype"),userimage.get("referenceid"),userimage.get("sortorder"));
	    			}else{
	    				sql.append("update bos.userimage set description=?,lastmodified=now() where imagetype=? and referenceid=? and sortorder=? ");
	    				jdbcTemplate.update(sql.toString(),userimage.get("description"),userimage.get("imagetype"),userimage.get("referenceid"),userimage.get("sortorder"));
	    				
	    			}
	    		}
	    		else{
		    		sql.append("insert into bos.userimage (referenceid,filename,imagetype,sortorder,description,lastmodified,created) values ( ");
		    		sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("now(),now())");
		    		
		    		jdbcTemplate.update(sql.toString(),userimage.get("referenceid"),userimage.get("filename"),userimage.get("imagetype"),userimage.get("sortorder"),userimage.get("description"));
		    		}
    		}
    	} catch (Exception ex) {
			ex.printStackTrace();

		}
    }
	public void hideComment (String commentid) throws SQLException{
    	try {
    		StringBuffer sql = new StringBuffer();
    		sql.append("update comment set userlike=-99 where id=" + commentid );
    		jdbcTemplate.update(sql.toString());
    		
    		
    		
    	}catch(Exception ex){
    		
    	}
	}
	public void hideQA (String qaid) throws SQLException{
    	try {
    		StringBuffer sql = new StringBuffer();
    		
    		sql.append("update questionanswer set userlike=-99 where id=" + qaid );
    		jdbcTemplate.update(sql.toString());

    		sql = new StringBuffer();
			sql.append("select id,entityid,ip from comment where comment = (select childanswer from questionanswer where id=" + qaid + ") order by id desc" );
			List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
			theLogger.info("hideQA: " + sql.toString() + "  / " + result.size() );
			if(result.size() > 0 ) {
				sql = new StringBuffer();
				sql.append(" update comment set userlike=-99 where id=(select id from comment where comment = (select childanswer from questionanswer ");
				sql.append(" where id=" + result.get(0).get("id")  + "))");
				sql.append(" entityid=" + result.get(0).get("entityid")  + "))");
				sql.append(" ip=" + result.get(0).get("ipaddr")  + "))");
				theLogger.info("hideQA: " + sql.toString() );
				jdbcTemplate.update(sql.toString());
			}
    	}catch(Exception ex){
    		
    	}
	}
	public void hideEvent (String eventid) throws SQLException{
    	try {
    		StringBuffer sql = new StringBuffer();
    		
    		sql.append("delete from event where id=" + eventid );
    		jdbcTemplate.update(sql.toString());
    		
    		
    	}catch(Exception ex){
    		
    	}
	}
}
