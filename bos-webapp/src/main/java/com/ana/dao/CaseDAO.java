package com.ana.dao;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

@Repository(value = "caseDao")
public class CaseDAO extends BaseDAO {
	
	final static int timeleft = 3650;
    private final Logger theLogger = LoggerFactory.getLogger(CaseDAO.class);

	public List<Map<String, Object>> getCaseSharingList(final HashMap<String,String> searchMap) throws SQLException{
		
		StringBuffer sql = new StringBuffer();
		sql.append("select c.id as caseid, c.sex as casesex, u.filename, n.hitcounter ,  c.*, te.name as targetentity, te.nameeng  as targetentityeng, l.description as targetschoolcategory, u.*,  ");
		sql.append("ce.name as currententity, ce.nameeng  as currententityeng, fe.name as finalentity, fe.nameeng  as finalentityeng, ");
		sql.append("(select count(1) from casesharingentity where casesharingid=c.id and offer='y') as appliedentityoffercount , ");
		sql.append("(select count(1) from casesharingentity where casesharingid=c.id and offer='n') as appliedentitycount , ");
		sql.append("TIMESTAMPDIFF(MINUTE, c.lastmodified, now()) as timediffmin,TIMESTAMPDIFF(DAY, c.lastmodified, now()) as timediffday,TIMESTAMPDIFF(HOUR, c.lastmodified, now()) as timediffhour, TIMESTAMPDIFF(SECOND, c.lastmodified, now()) as timediffsec ");
		sql.append("from casesharing c left join (select * from objectstat where status='active' and type='case') n on (c.id=n.objectid) , entity te, lookup l, user u, entity ce, entity fe,    " );
		sql.append(" (select referenceid,filename from userimage where imagetype='casesharing' group by referenceid having max(id)) u ");
		sql.append("where c.targetentityid=te.id and DATE_ADD(c.lastmodified,INTERVAL " + (timeleft) + " DAY) >= now()  ");
		sql.append(" and  c.userid = u.id  and c.currententityid=ce.id and c.finalentityid=fe.id    ");
		sql.append(" and  l.type = 'entity.category.chi' and te.categoryid=l.value ");
		sql.append(" and  c.id=u.referenceid ");
		
		sql.append(searchMap.get("id") != null && ! "-1".equalsIgnoreCase(searchMap.get("id")) ? " and  c.id= " + searchMap.get("id") : " ");
		if("viewprofile".equalsIgnoreCase(searchMap.get("view")))
			sql.append(searchMap.get("userid") != null && ! "-1".equalsIgnoreCase(searchMap.get("userid")) ? " and  c.userid= " + searchMap.get("userid") : " ");
		else
			sql.append(searchMap.get("userid") != null && ! "-1".equalsIgnoreCase(searchMap.get("userid")) && !"1".equalsIgnoreCase(searchMap.get("userid")) ? " and  c.userid= " + searchMap.get("userid") : " ");
				
		sql.append(searchMap.get("approved") != null && ! "-1".equalsIgnoreCase(searchMap.get("approved")) ? " and  c.approved in (" + searchMap.get("approved") + ") " : "  ");
		if("mostviewed".equalsIgnoreCase(searchMap.get("view")))
			sql.append(" order by n.hitcounter desc ");
		else if("mosthelpful".equalsIgnoreCase(searchMap.get("view")))
			sql.append(" order by helpful desc ");
		else
			sql.append(" order by c.lastmodified desc ");

        sql.append(searchMap.get("limit") != null ? " limit " + searchMap.get("limit") : " ");

        theLogger.debug("getCaseSharingList:" + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	
public List<Map<String, Object>> getCaseSharingEntityList(final HashMap<String,String> searchMap) throws SQLException{
		try{
		theLogger.debug("DAO getCaseSharingEntityList!!!!");
		StringBuffer sql = new StringBuffer();
		sql.append("select c.id as caseid, c.*, ae.name as appliedentity, ae.nameeng  as appliedentityeng, l.description as schoolcategory, financetype ");
		sql.append("from casesharingentity c, entity ae, lookup l  " );
		sql.append("where c.entityid=ae.id   ");
		sql.append(" and  l.type = 'entity.category.chi' and ae.categoryid=l.value ");
		sql.append(searchMap.get("id") != null && ! "-1".equalsIgnoreCase(searchMap.get("id")) ? " and  c.casesharingid= " + searchMap.get("id") : " ");
		
		sql.append(" order by c.lastmodified desc ");
		theLogger.debug("getCaseSharingEntityList:" + sql.toString());
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		theLogger.debug("result size: " + result.size());
		return result;
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
		
	}
	
	public String saveCase(final Map<String,String> caseSharing) throws SQLException{
    	try {
				String id = "";
    			KeyHolder keyHolder = new GeneratedKeyHolder();
    			StringBuffer sql = new StringBuffer();
				if(caseSharing.get("id") != null && ! "-1".equalsIgnoreCase((String) caseSharing.get("id"))){
					id = caseSharing.get("id");
					sql.append("update bos.casesharing set " );
					sql.append(" userid=? " );
					sql.append(" ,title=? " );
					sql.append(" ,applicationyear=? " );
					sql.append(" ,monthofbirth=? " );
					sql.append(" ,characterkid=? " );
					sql.append(" ,bigsmallkid=? " );
					sql.append(" ,currententityid=? " );
					sql.append(" ,finalentityid=? " );
					sql.append(" ,age=? " );
					sql.append(" ,sex=? " );
					sql.append(" ,content=? " );
					sql.append(" ,analysis=? " );
					sql.append(" ,targetentityid=? " );
					sql.append(" ,applicationresult=? " );
					sql.append(" ,publish=? " );
					sql.append(" ,payeename=? " );
					sql.append(" ,approved=? " );
					sql.append(" ,lastmodified=now() " );
					sql.append("where id='" + caseSharing.get("id") + "'");
					jdbcTemplate.update(sql.toString(),caseSharing.get("userid"),caseSharing.get("title"),caseSharing.get("applicationyear"),caseSharing.get("monthofbirth"),caseSharing.get("characterkid"),caseSharing.get("bigsmallkid"),caseSharing.get("currententityid"),caseSharing.get("finalentityid"),
							caseSharing.get("age"),caseSharing.get("sex"),caseSharing.get("content"),caseSharing.get("analysis"),caseSharing.get("targetentityid"),caseSharing.get("applicationresult"),caseSharing.get("publish"),caseSharing.get("payeename"),caseSharing.get("approved"));
					jdbcTemplate.update("delete from bos.casesharingentity where casesharingid='" + caseSharing.get("id") + "'");

				}else{
					theLogger.debug("caseSharing Map:" + caseSharing);
					jdbcTemplate.update(
						    new PreparedStatementCreator() {
						        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
						        	StringBuffer sql = new StringBuffer();
						        	sql.append("insert into bos.casesharing (userid,title,applicationyear,monthofbirth,characterkid,bigsmallkid,currententityid,finalentityid,age,sex,content,analysis,targetentityid,applicationresult,publish,payeename,approved,type,lastmodified,created ) values( ");
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
									sql.append("?,");
									sql.append("?,");
									sql.append("?,");
									sql.append("?,");
									sql.append("?,");
									sql.append("?,");
									sql.append("?,");
									sql.append("now(),now())");

						        	PreparedStatement ps =
						                connection.prepareStatement(sql.toString(), new String[] {"id"});
						            ps.setString(1, caseSharing.get("userid"));
						            ps.setString(2, caseSharing.get("title"));
						            ps.setString(3, caseSharing.get("applicationyear"));
						            ps.setString(4, caseSharing.get("monthofbirth"));
						            ps.setString(5, caseSharing.get("characterkid"));
						            ps.setString(6, caseSharing.get("bigsmallkid"));
						            ps.setString(7, caseSharing.get("currententityid"));
						            ps.setString(8, caseSharing.get("finalentityid"));
						            ps.setString(9, caseSharing.get("age"));
						            ps.setString(10, caseSharing.get("sex"));
						            ps.setString(11, caseSharing.get("content"));
						            ps.setString(12, caseSharing.get("analysis"));
						            ps.setString(13, caseSharing.get("targetentityid"));
						            ps.setString(14, caseSharing.get("applicationresult"));
						            ps.setString(15, caseSharing.get("publish"));
						            ps.setString(16, caseSharing.get("payeename"));
						            ps.setString(17, caseSharing.get("approved"));
									ps.setString(18, caseSharing.get("type"));
									return ps;
						        }
						    },
						    keyHolder);
					
					// keyHolder.getKey() now contains the generated key
					id = "" + keyHolder.getKey() ;
				}
					
				String[] applied = {"appliedschooloffer","appliedschool"};
				String entityid="";
				for(int i=0; i< applied.length; i++){
					String str = caseSharing.get(applied[i]);
					StringTokenizer st = new StringTokenizer(str, ",");
					Map<String,String> caseEntityMap;
					while (st.hasMoreElements()) {
						entityid = "" + st.nextElement();
						caseEntityMap = new HashMap<String,String>();
						caseEntityMap.put("casesharingid",  id);
						caseEntityMap.put("entityid", entityid);
						caseEntityMap.put("offer", (i ==0 ? "y" : "n") );
						if(entityid != null && entityid.trim().length() > 0)
							saveCaseEntity(caseEntityMap);
					}
				}
				theLogger.debug(sql.toString());
				return id;
		} catch (Exception ex) {
			ex.printStackTrace();
			return "-1";

		}
    }
	public void saveCaseEntity(Map<String,String> caseSharingEntity) throws SQLException{
    	try {
    		StringBuffer sql = new StringBuffer();
    		sql.append("insert into bos.casesharingentity (casesharingid,entityid,offer,lastmodified,created ) values ( ");
    		sql.append("?,");
			sql.append("?,");
			sql.append("?,");
			sql.append("now(),now())");
    		
    		jdbcTemplate.update(sql.toString(),caseSharingEntity.get("casesharingid"),caseSharingEntity.get("entityid"),caseSharingEntity.get("offer"));
    	} catch (Exception ex) {
			ex.printStackTrace();

		}
    }
	public void approveCase(Map<String,String> caseSharingEntity) throws SQLException{
    	try {
    		
    		// y=approved, a=approving, w=waitinglist, r=rejected
    		StringBuffer sql = new StringBuffer();
    		sql.append("update bos.casesharing set approved='" + caseSharingEntity.get("approved") + "' where id=" + caseSharingEntity.get("id") );
    		theLogger.debug(sql.toString());
    		jdbcTemplate.update(sql.toString());
    	} catch (Exception ex) {
			ex.printStackTrace();

		}
    }
	public void publishCase(Map<String,String> caseSharingEntity) throws SQLException{
    	try {
    		
    		// y=yes, n=no, w=waitinglist, r=rejected
    		StringBuffer sql = new StringBuffer();
    		sql.append("update bos.casesharing set publish='" + caseSharingEntity.get("publish") + "' where id=" + caseSharingEntity.get("id") );
    		jdbcTemplate.update(sql.toString());
    	} catch (Exception ex) {
			ex.printStackTrace();

		}
    }
	public int  voteHelpfulCase(String id) throws SQLException{
    	try {
    		
    		// y=yes, n=no, w=waitinglist, r=rejected
    		StringBuffer sql = new StringBuffer();
    		sql.append("update bos.casesharing set helpful=helpful+1 where id=" + id );
    		jdbcTemplate.update(sql.toString());
    		theLogger.debug("voteHelpfulCase: " + sql.toString());
    		return jdbcTemplate.queryForObject("select helpful from casesharing where id=" + id, Integer.class);
    	} catch (Exception ex) {
    		
			ex.printStackTrace();
			return 0;

		}
    }
	public List<Map<String, Object>> getTopCaseSharingList(int limit) throws SQLException {
		return  getTopCaseSharingList(limit,"MONTH(CURDATE())");
	}
	public List<Map<String, Object>> getTopCaseSharingList(int limit,String month) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append(" select  c.id as entityid, CONCAT(substring(TRIM(c.title),1,10) , '...  (', TRIM(u.namelocal),')' )  as namelocal,  n.hitcounter as userscore,  (select max(hitcounter) from objectstat where status='active' and type='case')  as maxscore, c.lastmodified as lastmodified, ");
		sql.append(" CONCAT(@rownum:=@rownum+1,' - ', substring(TRIM(c.title),1,10) , '...  (', TRIM(u.namelocal),')' )  as title,  n.hitcounter as startdate, 'y' as casesharing ");
		//sql.append(" select  c.id as entityid, CONCAT(substring(TRIM(c.title),1,10) , '...  ')  as namelocal,  n.hitcounter as userscore,  (select max(hitcounter) from objectstat where status='active' and type='case')  as maxscore, c.lastmodified as lastmodified ");
		sql.append(" from casesharing c,  objectstat n, user u , (SELECT @rownum:=0) r  ");
		sql.append(" where  c.id=n.objectid and c.userid=u.id and  n.status='active' and (n.type='case' or n.type='blog') and approved='y' " );
		sql.append( " and MONTH(c.created) =" + month);
		sql.append(" order by n.hitcounter desc limit " + limit);
		theLogger.debug("getTopCaseSharingList : " + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		return result;
	}
	public List<Map<String, Object>> getRelatedCaseSharingList(String entityid) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select * from (");
		sql.append("select analysis, title,c.id as id, u.namelocal as username, c.created from casesharing c, user u where c.userid=u.id and c.currententityid=" + entityid + " ");
		sql.append("union select analysis,title,c.id as id, u.namelocal as username, c.created from casesharing c, user u where c.userid=u.id and c.targetentityid=" + entityid + " ");
		sql.append("union select analysis,title,c.id as id, u.namelocal as username, c.created from casesharing c, user u where c.userid=u.id and c.finalentityid=" + entityid + " ");
		sql.append("union select analysis,title,c.id as id, u.namelocal as username, c.created from casesharing c, user u, casesharingentity e where c.id=e.casesharingid and c.userid=u.id and  e.entityid=" + entityid + " ");
		
		
		sql.append(") a order by created desc ");
		
		theLogger.debug("getTopCaseSharingList : " + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		return result;
	}
}
