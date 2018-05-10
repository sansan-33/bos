package com.ana.dao;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository(value = "userDao")
public class UserDAO extends BaseDAO {

    private final Logger theLogger = LoggerFactory.getLogger(UserDAO.class);
	public Map<String, Object> getUserInfo(Map<String,String> user) throws SQLException{
		StringBuffer sql = new StringBuffer();
		String errorstatus = "";
		String socialtype = user.get("socialtype");
		
		if("update".equalsIgnoreCase(user.get("action"))){

			sql.append("update bos.user set  ");
			sql.append("namelocal='" + quote((String) user.get("namelocal")) + "',");
			sql.append("anonymous='" + quote((String) user.get("anonymous")) + "', ");
			sql.append("kidentityid='" + quote((String) user.get("entityid")) + "', ");
			sql.append("parententityid='" + quote((String) user.get("parententityid")) + "', ");
			sql.append("selfintro='" + quote((String) user.get("selfintro")) + "', ");
			sql.append("sex='" + quote((String) user.get("sex")) + "', ");
			sql.append("lookupdistrict1='" + quote((String) user.get("lookupdistrict1")) + "', ");
			sql.append("lookupdistrict2='" + quote((String) user.get("lookupdistrict2")) + "', ");
			sql.append("lookupdistrict3='" + quote((String) user.get("lookupdistrict3")) + "', ");
			
			if(user.get("password") != null && ((String) user.get("password")).trim().length() > 0 )
				sql.append("password='" + quote((String) user.get("password")) + "', ");
			sql.append("lastmodified=current_timestamp ");
			sql.append("where email='" + quote((String) user.get("email")) + "'");
			theLogger.debug("user update " + sql.toString());
			jdbcTemplate.update(sql.toString());
			
		}else if("new".equalsIgnoreCase(user.get("action"))){
			int iExisting = jdbcTemplate.queryForObject("select count(1) from bos.user where email='" + quote((String) user.get("email")) + "'", Integer.class);
			if(iExisting <1){
				sql.append("insert into bos.user(namelocal,namesocial,email" + (socialtype != null && socialtype.trim().length() > 0 ? "," + socialtype : "") + ",anonymous,password,kidentityid,parententityid,selfintro,sex,rank,lookupdistrict1,lookupdistrict2,lookupdistrict3,roleid,lastmodified,created,lastlogin,parentratingcount,logincount,casesharingcount,postcount ) values( ");
				sql.append("'" + quote((String) user.get("namelocal")) + "',");
				sql.append("'" + quote((String) user.get("namesocial")) + "',");
				sql.append("'" + quote((String) user.get("email")) + "',");
				if(socialtype != null && socialtype.trim().length() > 0 )
					sql.append("'" + quote((String) user.get("socialid")) + "',");
				sql.append("'" + quote((String) user.get("anonymous")) + "',");
				sql.append("'" + quote((String) user.get("password")) + "',");
				sql.append("'" + quote((String) user.get("entityid")) + "',");
				sql.append("'" + quote((String) user.get("parententityid")) + "',");
				sql.append("'" + quote((String) user.get("selfintro")) + "',");
				sql.append("'" + quote((String) user.get("sex")) + "',");
				sql.append("'bronzeicon.png',");
				sql.append("'" + quote((String) user.get("lookupdistrict1")) + "',");
				sql.append("'" + quote((String) user.get("lookupdistrict2")) + "',");
				sql.append("'" + quote((String) user.get("lookupdistrict3")) + "',");
				sql.append("" + user.get("roleid") + ",");
				sql.append("current_timestamp,");
				sql.append("current_timestamp,");
				sql.append("current_timestamp,0,0,0,0)");
				
				jdbcTemplate.update(sql.toString());
			}else{
				errorstatus = "Email address already in use. Please choose another one";
				user.put("email","Email address already in use");
			}
			
		}
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(errorstatus != null && errorstatus.trim().length() == 0 ){
			sql = new StringBuffer();
			if(socialtype != null && socialtype.trim().length() > 0  && ! "-1".equalsIgnoreCase(socialtype)){
				sql.append("update bos.user set lastlogin=current_timestamp," + socialtype + "='" + quote((String) user.get("socialid")) + "' ");
				sql.append("where email='" + quote((String) user.get("email")) + "'");
				jdbcTemplate.update(sql.toString());
			}else{
				sql.append("update bos.user set lastlogin=current_timestamp ");
				sql.append("where email='" + quote((String) user.get("email")) + "' ");
				jdbcTemplate.update(sql.toString());
			}
			sql = new StringBuffer();
			sql.append("select u.*, e.name as schoolname from user u left join entity e on (u.kidentityid=e.id) where u.email ='" + user.get("email") +  "' " +  (socialtype != null && socialtype.trim().length() > 0 ? "" : " and u.password='" + quote((String) user.get("password")) + "' ") );
			List<Map<String, Object>> resultList = jdbcTemplate.queryForList(sql.toString());
			
			if(!resultList.isEmpty()) {
				result = resultList.get(0);
			}else{
				theLogger.debug("Result list is empty");
				if(errorstatus.trim().length() > 0 ){
					result.put("errorstatus", errorstatus);
				}else{
					result.put("errorstatus", "The username or password you entered is incorrect.");			
				}
				theLogger.debug("Status " + result.get("errorstatus"));
			}
			theLogger.debug("Is tutor signup ? " + user.get("tutor"));
			if("y".equalsIgnoreCase(user.get("tutor"))){
				user.put("userid", result.get("id") + "");
				updateUserTutorCategory(user);
			}
			
			result.putAll(getUserTutorCategoryMap(result.get("id") + ""));
			theLogger.debug("getuserinfo user map   " + result);
		}else{
			result.put("errorstatus", errorstatus);
		}
		return result;
	}
	public List<Map<String, Object>> getUserList() throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select id, namesocial,email,password,roleid,namelocal, DATE_FORMAT(lastlogin,'%d %b %Y %H:%i' ) as lastlogin, DATE_FORMAT(created,'%d %b %Y %H:%i' ) as created from bos.user");
		sql.append(" order by bos.user.lastlogin desc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("Result size " + result.size());
		return result;
	}
	public List<Map<String, Object>> getParentRatingList(String userid) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select e.name,e.nameeng,e.parentscore,c.grade as yourscore, e.chscid, e.categoryid from bos.comment c, bos.user u, entity e ");
		sql.append(" where c.type='polling' and c.grade > 0 and c.userid=u.id and c.entityid=e.id and u.id=" + userid + " ");
		sql.append(" order by e.parentscore desc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("Result size " + result.size());
		return result;
	}
	
	public  List<Map<String, Object>> getParentKidListByEntity(final String entityid) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select u.* from user u where u.kidentityid=" + entityid);
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
	
		return result;
	}
	public Map<String, String> getParentPerGroup(final String entityids) throws SQLException {

		StringBuffer sql = new StringBuffer();
		
		sql.append("SELECT kidentityid as entityid, count(id) as counter from  ");
		sql.append("user where kidentityid in (" + (entityids != null && entityids.contains(",")  ? entityids : "0" ) + ") ");
		sql.append("GROUP BY kidentityid ");
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		HashMap<String, String> resultMap = new HashMap<String, String>();
		if(result.size() > 0){
			for(int i=0; i < result.size(); i++ ){
				HashMap map = (HashMap) result.get(i);
				resultMap.put("" +map.get("entityid"), "" +map.get("counter"));
			}
		}
		
	
		return resultMap;
	}
	public String resetPassword(String email) throws SQLException {
		String error="y";
		StringBuffer sql = new StringBuffer();
		sql.append("update bos.user set lastlogin=current_timestamp,password='123456' ");
		sql.append("where email='" + quote(email) + "'");
		int rowaffected = jdbcTemplate.update(sql.toString());
		if(rowaffected > 0 ){
			error="n";
		}else{
			error="y";		
		}
		return error;
	}
	public int getSchoolParentCount(String entityid) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select count(1) from user where kidentityid=" + entityid);
		return jdbcTemplate.queryForObject(sql.toString(), Integer.class);
		
	}
	public List<Map<String, Object>> getTopUserList(int limit) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select *, (select max(userscore) from user) as maxscore from bos.user");
		sql.append(" order by bos.user.userscore desc limit " + limit);
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getTopUserList " + sql.toString());
		return result;
	}
	
	
	public void updateUserTutorCategory(Map<String,String> user) throws SQLException{
	  
		HashMap<String, String> result = new HashMap<String, String>();	
		int categorycount = 0;
		categorycount = Integer.parseInt(user.get("tutorcategorycount"));
		jdbcTemplate.update("delete from usertutorcategory where userid=" + user.get("userid"));
		for(int i=1; i<=categorycount; i++ ){
			if(user.get("tutorcategoryid" + i) != null){
				StringBuffer sb = new StringBuffer();
				sb.append("insert into usertutorcategory (userid,tutorcategoryid,bestdesc,tutorialexp,lastmodified,created) values (?,?,?,?,current_timestamp,current_timestamp)");
				jdbcTemplate.update(sb.toString(), user.get("userid"),user.get("tutorcategoryid" + i),user.get("bestdesc" + i),user.get("tutorialexp" + i) );
				//result.put("tutorcategoryid" + i, user.get("tutorcategoryid" + i));
				//result.put("bestdesc" + i, user.get("bestdesc" + i));
			}
		}
//		return result;
	  
		
	}
	
	public Map<String, String> getUserTutorCategoryMap(final String userid) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select * from usertutorcategory where userid ='" + userid + "' order by tutorcategoryid  asc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		HashMap<String, String> resultMap = new HashMap<String, String>();
		if(result.size() > 0){
			for(int i=0; i < result.size(); i++ ){
				HashMap map = (HashMap) result.get(i);
				if(map.get("tutorcategoryid") != null ){
					resultMap.put("tutorcategoryid" +map.get("tutorcategoryid"), "" +map.get("tutorcategoryid"));
					resultMap.put("bestdesc" +map.get("tutorcategoryid"), "" +map.get("bestdesc"));
					resultMap.put("tutorialexp" +map.get("tutorcategoryid"), "" +map.get("tutorialexp"));
				}
			}
		}
		return resultMap;
	}
	public String updateUserProfile(String userprofile, String id) throws SQLException {
		String error="y";
		StringBuffer sql = new StringBuffer();
		sql.append("update bos.user set userprofile='" + userprofile + "'");
		sql.append("where id=" + id + " ");
		int rowaffected = jdbcTemplate.update(sql.toString());
		if(rowaffected < 0 ){
			error="n";
		}else{
			error="y";		
		}
		return error;
	}
	public void updateCounter(String fieldname, String id) throws SQLException {
		
		String sql = "update bos.user set " + fieldname + "=" + fieldname + "+1 where id=" + id;
		theLogger.debug("updateCounter "  + sql);
		jdbcTemplate.update(sql);
	}
    public void updateCounterByEmail(String fieldname, String email) throws SQLException {
		
		String sql = "update bos.user set " + fieldname + "=" + fieldname + "+1 where email='" + email + "'";
		theLogger.debug("updateCounterByEmail " + sql);
		jdbcTemplate.update(sql);
	}
	public String getUnreadMessageCount(String userid) throws SQLException {
		
		String sql = " select  count(1)  from questionanswer q join (select * from user where id=" +userid +  " ) u on ( entityid = kidentityid )  where  type='e' and q.lastmodified > u.lastread" ;
		//theLogger.debug("getUnreadMessageCount " + sql);
		return "" + jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public Map<String, Object> viewProfile(String id) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append(" select u.id, u.namesocial,u.email,u.password, u.roleid,u.namelocal,u.userprofile, userscore, casesharingcount, parentratingcount,logincount,rank,postcount,   ");
		sql.append(" DATE_FORMAT(u.lastlogin,'%d %b %Y %H:%i' ) as lastlogin, DATE_FORMAT(u.created,'%d %b %Y %H:%i' ) as created, ");
		sql.append(" e.name,e.nameeng , n.name as parententityname, n.nameeng as parententitynameeng ");
		sql.append(" from bos.user u left join entity e on (e.id=u.kidentityid) left join entity n on (n.id=u.parententityid) ");
		sql.append(" where  u.id=" + id);
		theLogger.debug("viewProfile "  + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		if(result.size() > 0 && result.get(0) != null)
			return result.get(0);
		else
			return new HashMap<String, Object>();
	}
	
}
