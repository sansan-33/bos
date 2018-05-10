package com.ana.dao;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository(value = "tutorDao")
public class TutorDAO extends BaseDAO {

    private final Logger theLogger = LoggerFactory.getLogger(TutorDAO.class);
	final static int timeleft = 720;
	
	public List<Map<String, Object>> getCourseList(final HashMap<String,String> searchMap) throws SQLException{
		
		StringBuffer sql = new StringBuffer();
		sql.append("select c.*, u.userprofile, u.namelocal, cs.description as courseclass, l.description as coursename, gs.description as gradestart, ge.description as gradeend, COALESCE(q.id,-1) as questionanswerid, u.sex as  sex, c.userid as tutoruserid,   ");
		sql.append("TIMESTAMPDIFF(MINUTE, now(), DATE_ADD(c.lastmodified,INTERVAL " + timeleft + " DAY) ) as timediffmin,");
		sql.append("TIMESTAMPDIFF(DAY, now(), DATE_ADD(c.lastmodified,INTERVAL " + timeleft + " DAY)) as timediffday,");
		sql.append("TIMESTAMPDIFF(HOUR, now(),  DATE_ADD(c.lastmodified,INTERVAL " + timeleft + " DAY) ) as timediffhour, ");
		sql.append("TIMESTAMPDIFF(SECOND,now(), DATE_ADD(c.lastmodified,INTERVAL " + timeleft + " DAY) ) as timediffsec ");
		sql.append("from course c LEFT JOIN (select * from bos.questionanswer where parentid=0 and type='c' and userid=" + searchMap.get("useridforapply") + ") q ON (c.id=q.entityid)  , user u, lookup l, lookup gs, lookup ge, lookup cs  " );
		sql.append("where c.tutorcategoryid=cs.value and cs.type='tutor.category' and  c.lookupclassid=l.value and c.userid=u.id and u.roleid=2   ");
		sql.append("and c.lookupclassrangestartid=gs.value and gs.type=c.lookupclassrangetype ");
		sql.append("and c.lookupclassrangeendid=ge.value and ge.type=c.lookupclassrangetype ");
		sql.append(searchMap.get("id") != null && ! "-1".equalsIgnoreCase(searchMap.get("id")) ? " and  c.id= " + searchMap.get("id") : " ");
		sql.append(searchMap.get("userid") != null && ! "-1".equalsIgnoreCase(searchMap.get("userid")) ? " and  c.userid= " + searchMap.get("userid") : " and  DATE_ADD(c.lastmodified,INTERVAL " + (timeleft) + " DAY) >= now() ");
		sql.append(searchMap.get("hourlyrate") != null && ! "-1".equalsIgnoreCase(searchMap.get("hourlyrate")) ? " and  c.hourlyrate >= " + searchMap.get("hourlyrate") : "");
		sql.append(searchMap.get("tutorcategoryid") != null && ! "-1".equalsIgnoreCase(searchMap.get("tutorcategoryid")) ? " and  c.tutorcategoryid ='" + searchMap.get("tutorcategoryid") + "' " : "");
		sql.append(searchMap.get("lookuptutorialclassid") != null && ! "-1".equalsIgnoreCase(searchMap.get("lookuptutorialclassid")) ? " and  c.lookupclassid ='" + searchMap.get("lookuptutorialclassid") + "' " : " ");
		sql.append(searchMap.get("lookupmusicclassid") != null && ! "-1".equalsIgnoreCase(searchMap.get("lookupmusicclassid")) ? " and  c.lookupclassid ='" + searchMap.get("lookupmusicclassid") + "' " : " ");
		sql.append(searchMap.get("lookuporalclassid") != null && ! "-1".equalsIgnoreCase(searchMap.get("lookuporalclassid")) ? " and  c.lookupclassid ='" + searchMap.get("lookuporalclassid") + "' " : " ");
		sql.append(searchMap.get("lookupextraclassid") != null && ! "-1".equalsIgnoreCase(searchMap.get("lookupextraclassid")) ? " and  c.lookupclassid ='" + searchMap.get("lookupextraclassid") + "' " : " ");
		sql.append(searchMap.get("lookupsportclassid") != null && ! "-1".equalsIgnoreCase(searchMap.get("lookupsportclassid")) ? " and  c.lookupclassid ='" + searchMap.get("lookupsportclassid") + "' " : " ");
		sql.append(searchMap.get("kidgradelookupid") != null && ! "-1".equalsIgnoreCase(searchMap.get("kidgradelookupid")) ? " and  c.lookupclassrangestartid <=" + searchMap.get("kidgradelookupid") + " and  c.lookupclassrangeendid >=" + searchMap.get("kidgradelookupid") + " " : " ");
		sql.append(searchMap.get("sex") != null && ! "-1".equalsIgnoreCase(searchMap.get("sex")) ? " and  u.sex ='" + searchMap.get("sex") + "' " : "");
		sql.append(searchMap.get("districtlookupid") != null && ! "-1".equalsIgnoreCase(searchMap.get("districtlookupid")) ? " and  ( u.lookupdistrict1 ='" + searchMap.get("districtlookupid") + "' or u.lookupdistrict2 ='" + searchMap.get("districtlookupid") + "' or u.lookupdistrict3 ='" + searchMap.get("districtlookupid") + "') " : "");
		sql.append(searchMap.get("applied") != null && "y".equalsIgnoreCase(searchMap.get("applied")) ? " and  q.id > 0 "  : "");
		
		sql.append(" order by c.lastmodified desc ");
		theLogger.debug("getCourseList:" + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	
	public void saveTutorCourse(Map<String,String> course) throws SQLException{
    	try {
			
    			StringBuffer sql = new StringBuffer();
				if(course.get("id") != null && ! "-1".equalsIgnoreCase((String) course.get("id"))){
					sql.append("update bos.course set " );
					sql.append(" remark=? " );
					sql.append(" ,coursedesc=? " );
					sql.append(" ,courseimg=? " );
					sql.append(" ,hourlyrate=? " );
					sql.append(" ,lookupclassid=? " );
					sql.append(" ,lookupclassrangestartid=? " );
					sql.append(" ,lookupclassrangeendid=? " );
					sql.append(" ,lookupclassrangetype=? " );
					sql.append(" ,notes=? " );
					sql.append(" ,lastmodified=current_timestamp " );
					sql.append("where id='" + course.get("id") + "'");
					jdbcTemplate.update(sql.toString(),course.get("remark"),course.get("coursedesc"),course.get("courseimg"),course.get("hourlyrate"),course.get("lookupclassid"),course.get("lookupclassrangestartid"),course.get("lookupclassrangeendid"),course.get("lookupclassrangetype"),course.get("notes"));
				}else{
					sql.append("insert into bos.course (remark,coursedesc,courseimg,userid,tutorcategoryid,hourlyrate,lookupclassid,lookupclassrangestartid,lookupclassrangeendid,lookupclassrangetype,notes,hitcounter,status,lastmodified,created) values( ");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("0,'a',current_timestamp,current_timestamp)");
					jdbcTemplate.update(sql.toString(),course.get("remark"),course.get("coursedesc"),course.get("courseimg"),course.get("userid"),course.get("tutorcategoryid"),course.get("hourlyrate"),course.get("lookupclassid"),course.get("lookupclassrangestartid"),course.get("lookupclassrangeendid"),course.get("lookupclassrangetype"),course.get("notes"));
				}
				theLogger.debug(sql.toString());
				theLogger.debug(course.toString() );
				
		} catch (Exception ex) {
			ex.printStackTrace();

		}
    }
	public void saveParentTutorSearch(Map<String,String> parent) throws SQLException{
    	try {
    		
    			        
    			StringBuffer sql = new StringBuffer();
				if(parent.get("id") != null && ! "-1".equalsIgnoreCase( ((String) parent.get("id")).trim() )){
					sql.append("update bos.parenttutorsearch  set " );
					sql.append(" userid=? " );
					sql.append(" ,kidgradelookupid=? " );
					sql.append(" ,lookupclassid=? " );
					sql.append(" ,districtlookupid=? " );
					sql.append(" ,tutorcategoryid=? " );
					sql.append(" ,hourlyrate=? " );
					sql.append(" ,sex=? " );
					sql.append(" ,specialrequest=? " );
					sql.append(" ,lastmodified=current_timestamp " );
					sql.append("where id='" + parent.get("id") + "'");
					jdbcTemplate.update(sql.toString(),parent.get("userid"),parent.get("kidgradelookupid"),parent.get("lookupclassid"),parent.get("districtlookupid"),parent.get("tutorcategoryid"),parent.get("hourlyrate"),parent.get("sex"),parent.get("specialrequest"));
					theLogger.debug("update parenttutorsearch  " + sql.toString());
				}else{
					sql.append("insert into bos.parenttutorsearch  (userid,kidgradelookupid,lookupclassid,districtlookupid,tutorcategoryid,hourlyrate,sex,specialrequest,lastmodified,created) values( ");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("?,");
					sql.append("current_timestamp,current_timestamp)");
					theLogger.debug("insert parenttutorsearch  " + sql.toString());
					jdbcTemplate.update(sql.toString(),parent.get("userid"),parent.get("kidgradelookupid"),parent.get("lookupclassid"),parent.get("districtlookupid"),parent.get("tutorcategoryid"),parent.get("hourlyrate"),parent.get("sex"),parent.get("specialrequest"));
				}
		} catch (Exception ex) {
			ex.printStackTrace();

		}
    }
	public List<Map<String, Object>> getParentTutorSearch(final HashMap<String,String> searchMap) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select p.*, u.namelocal, u.userprofile, d.description as district, g.description as grade, c.description as courseclass, t.description as coursetype, COALESCE(q.id,-1) as questionanswerid    ");
		sql.append("from parenttutorsearch p LEFT JOIN (select * from bos.questionanswer where type='c' and parentid=0 and userid=" + searchMap.get("useridtutor") + ") q ON (p.id=q.entityid) , user u, lookup d, lookup g , lookup c, lookup t  ");
		sql.append("where p.userid=u.id ");
		sql.append("and p.kidgradelookupid=g.value and g.type='kid.grade' ");
		sql.append("and p.districtlookupid=d.value and d.type='district.kindergarten' ");
		sql.append("and p.lookupclassid=c.value and c.type like '%.class'  ");
		sql.append("and p.tutorcategoryid=t.value and t.type='tutor.category' ");
		
		sql.append(searchMap.get("id") != null && ! "-1".equalsIgnoreCase(searchMap.get("id")) ? " and  p.id =" + searchMap.get("id") + " " : "");
		sql.append(searchMap.get("userid") != null && ! "-1".equalsIgnoreCase(searchMap.get("userid")) ? " and  p.userid =" + searchMap.get("userid") + " " : "");
		
		sql.append("order by p.lastmodified desc ");
		theLogger.debug("getParentTutorSearch  " + sql.toString());
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public List<Map<String, Object>> getMatchedCourseList(final HashMap<String,String> searchMap) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select e.*, u.namelocal, u.userprofile, d.description as district, g.description as grade, c.description as courseclass, t.description as coursetype, ut.sex as  sex,    ");
		sql.append("TIMESTAMPDIFF(MINUTE, now(), DATE_ADD(e.lastmodified,INTERVAL " + timeleft + " DAY) ) as timediffmin,");
		sql.append("TIMESTAMPDIFF(DAY, now(), DATE_ADD(e.lastmodified,INTERVAL " + timeleft + " DAY)) as timediffday,");
		sql.append("TIMESTAMPDIFF(HOUR, now(),  DATE_ADD(e.lastmodified,INTERVAL " + timeleft + " DAY) ) as timediffhour, ");
		sql.append("TIMESTAMPDIFF(SECOND,now(), DATE_ADD(e.lastmodified,INTERVAL " + timeleft + " DAY) ) as timediffsec ");
		sql.append("from parenttutorsearch p, user u, user ut, lookup d, lookup g , lookup c, lookup t , course e ");
		sql.append("where p.userid=u.id and e.userid=ut.id  ");
		sql.append("and e.lookupclassid=p.lookupclassid and p.hourlyrate <= e.hourlyrate and  ut.sex=p.sex  ");
		sql.append("and p.kidgradelookupid=g.value and g.type='kid.grade' ");
		sql.append("and p.districtlookupid=d.value and d.type='district.kindergarten' ");
		sql.append("and p.lookupclassid=c.value and c.type like '%.class'  ");
		sql.append("and p.tutorcategoryid=t.value and t.type='tutor.category' ");
		
		sql.append(searchMap.get("id") != null && ! "-1".equalsIgnoreCase(searchMap.get("id")) ? " and  p.id =" + searchMap.get("id") + " " : "");
		sql.append(searchMap.get("userid") != null && ! "-1".equalsIgnoreCase(searchMap.get("userid")) ? " and  p.userid =" + searchMap.get("userid") + " " : "");
		
		sql.append("order by p.lastmodified desc ");
		theLogger.debug("getParentTutorSearch  " + sql.toString());
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	
	
	public List<Map<String, Object>> getAppliedUserList(final HashMap<String,String> searchMap) throws SQLException{
		
		StringBuffer sql = new StringBuffer();
		sql.append("select q.id as questionanswerid, u.*  ");
		sql.append("from course c , questionanswer q , user u  " );
		sql.append("where  q.type='c' and q.entityid=c.id and q.userid=u.id and q.parentid=0  ");
		sql.append(searchMap.get("courseid") != null && ! "-1".equalsIgnoreCase(searchMap.get("courseid")) ? " and  c.id= " + searchMap.get("courseid") : " ");
		sql.append(searchMap.get("userid") != null && ! "-1".equalsIgnoreCase(searchMap.get("userid")) ? " and  c.userid= " + searchMap.get("userid") : " ");
		sql.append(" order by c.lastmodified desc ");

		theLogger.debug("getCourseList:" + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public Map<String, String> getAppliedUserCountList(final HashMap<String,String> searchMap) throws SQLException{
		
		StringBuffer sql = new StringBuffer();
		sql.append("select count(q.id) as noofuser, c.id as courseid   ");
		sql.append("from course c , questionanswer q , user u  " );
		sql.append("where  q.type='c' and q.entityid=c.id and q.userid=u.id and q.parentid=0  ");
		sql.append(searchMap.get("userid") != null && ! "-1".equalsIgnoreCase(searchMap.get("userid")) ? " and  c.userid=" + searchMap.get("userid") : " ");
		sql.append(" group by c.id ");

		theLogger.debug("getCourseList:" + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		HashMap<String,String> resultMap = new  HashMap<String,String>();
		for(int i=0; i<result.size(); i++ ){
			Map<String, Object> tmp = result.get(i);
			resultMap.put("" + tmp.get("courseid") , "" + tmp.get("noofuser"));
		}
		
		return resultMap;
	}
	public List<Map<String, Object>> getTutorRegisteredClass(final HashMap<String,String> searchMap) throws SQLException{
		String type = "tutor.category";
		
		StringBuffer sql = new StringBuffer();
		sql.append("select l.value,l.description,l.tooltips,u.id as registered from lookup l left join (select * from usertutorcategory where userid=" + searchMap.get("userid") + ") u on (l.value=u.tutorcategoryid) ");
		sql.append(" where l.type ='" + type + "' ");
		sql.append(" order by sortorder asc, description asc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	
}
