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
import java.util.*;

@Repository(value = "questionAnswerDao")
public class QuestionAnswerDAO extends BaseDAO {

    private final Logger theLogger = LoggerFactory.getLogger(QuestionAnswerDAO.class);
	final static String questionanswertype_case = "a";
	final static String questionanswertype_course = "c";
	final static String questionanswertype_questionanswer = "q";
	final static String questionanswertype_entity = "e";
	
	
	public List<Map<String, Object>> getQAListByTag(HashMap<String,String> searchParam) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select q.*,u.namelocal as username,u.anonymous,(select count(1) from questionanswer where parentid=q.id) as noofanswer, SUBSTRING_INDEX(q.questionanswer,' ',30) as questionanswer50 , ");
		sql.append("TIMESTAMPDIFF(MINUTE, q.lastmodified, now()) as timediffmin,TIMESTAMPDIFF(DAY, q.lastmodified, now()) as timediffday,TIMESTAMPDIFF(HOUR, q.lastmodified, now()) as timediffhour, TIMESTAMPDIFF(SECOND, q.lastmodified, now()) as timediffsec, ");
		sql.append(" CONCAT(t.name, ' ', t.nameeng) as schoolname "); 
		sql.append("from bos.questionanswer q left join bos.entity t on q.entityid = t.id ");
		sql.append(" left join bos.user u on q.userid = u.id ");
		sql.append(" where q.type='q' " );
		if(!"-1".equalsIgnoreCase(searchParam.get("tag"))){
			sql.append(" and ( ");
			sql.append(" q.tag1 = '" + quote(searchParam.get("tag")) + "' or " );
			sql.append(" q.tag2 = '" + quote(searchParam.get("tag")) + "' or " );
			sql.append(" q.tag3 = '" + quote(searchParam.get("tag")) + "' or " );
			sql.append(" q.tag4 = '" + quote(searchParam.get("tag")) + "' or " );
			sql.append(" q.tag5 = '" + quote(searchParam.get("tag")) + "'  " );
			sql.append(" ) ");
		}
		sql.append(" order by q.lastmodified desc limit 100 ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getQAList " + result.size());
		return result;
	}
	public List<Map<String, Object>> getPrivateMessageUserList(final String userid) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("select q.id, q.entityid, u1.id as userid1,  u1.namelocal as name1, u1.userprofile as userprofile1 , e1.name as kidschoolname1,  ");
		sql.append("  u2.id as userid2, u2.namelocal as name2, u2.userprofile as userprofile2 , e2.name as kidschoolname2,c.inbox   ");
		sql.append(" from questionanswer q , user u1 left join entity e1 on (u1.kidentityid=e1.id)  , user u2 left join entity e2 on (u2.kidentityid=e2.id) , ");
		sql.append(" ( select c.name,c.id,c.receivedby,c.createdby,cu.inbox from chatchannel c, chatchanneluser cu where c.id=cu.chatchannelid and cu.userid=" + userid + ")  c ");
		sql.append(" where q.entityid=c.id and u1.id=c.createdby and u2.id=c.receivedby and q.parentid=0 and q.type='private' " );
		theLogger.debug("getQAList " + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		return result;
	}
	public List<Map<String, Object>> getQAList(HashMap<String,String> searchParam) throws SQLException {

		theLogger.debug("getQAList categoryid: " + searchParam.get("categoryid"));
		StringBuffer sql = new StringBuffer();

		
		sql.append(" select q.*,u.namelocal as username,u.anonymous,u.roleid, SUBSTRING_INDEX(q.questionanswer,' ',30) as questionanswer50 , ");
		sql.append(" TIMESTAMPDIFF(MINUTE, q.lastmodified, now()) as timediffmin,TIMESTAMPDIFF(DAY, q.lastmodified, now()) as timediffday,TIMESTAMPDIFF(HOUR, q.lastmodified, now()) as timediffhour, TIMESTAMPDIFF(SECOND, q.lastmodified, now()) as timediffsec, ");
		sql.append(" CONCAT(t.name, ' ', t.nameeng) as schoolname, t.chscid, t.categoryid, l.description as schoolcategory   ");
		
		sql.append(" from bos.entity t, bos.lookup l , bos.questionanswer q  left join bos.user u on (q.userid = u.id)  ");
		
		sql.append(" where  q.entityid = t.id  and  l.type = 'entity.category.chi' and t.categoryid=l.value ");
		sql.append(" and  q.type='q' and q.parentid=0 and TIMESTAMPDIFF(DAY, q.lastmodified, now()) < 14   " );
		
		
		if("-1".equalsIgnoreCase(searchParam.get("categoryid")))
			sql.append(" and q.entityid is null " );
		else if("all".equalsIgnoreCase(searchParam.get("categoryid")))
			sql.append(" and t.categoryid in (0,1,2,3,4,5,6) " );
		else
			sql.append(" and t.categoryid=" + searchParam.get("categoryid") + "  " );
		
		if("y".equalsIgnoreCase(searchParam.get("userlike"))){
			sql.append(" and q.userlike > 1 ");
		}

		if("latest".equalsIgnoreCase(searchParam.get("latest"))){
			sql.append(" order by q.lastmodified desc, q.userlike desc limit 20 ");
		}
		if("hot".equalsIgnoreCase(searchParam.get("hot"))){
			sql.append(" order by q.lastmodified desc, q.userlike desc limit 100 ");
		}
		theLogger.debug("getQAList " + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		return result;
	}
	public List<Map<String, Object>> getForumContentList(HashMap<String,String> searchParam) throws SQLException {

		theLogger.debug("getQAList categoryid: " + searchParam.get("categoryid"));
		StringBuffer sql = new StringBuffer();

		sql.append("select q.id as id, q.subject ,  u.namelocal as username,u.anonymous,u.roleid,u.id as userid, n.hitcounter ,q.totalreply,q.tag2 as newspapername,q.created ,    ");
		sql.append("DATE_FORMAT(q.lastmodified, '%Y%m%d%H%i') as sortabledate, TIMESTAMPDIFF(MINUTE, q.lastmodified, now()) as timediffmin,TIMESTAMPDIFF(DAY, q.lastmodified, now()) as timediffday,TIMESTAMPDIFF(HOUR, q.lastmodified, now()) as timediffhour, TIMESTAMPDIFF(SECOND, q.lastmodified, now()) as timediffsec, ");
		
		if(searchParam.get("categoryid") != null && ! "-1".equalsIgnoreCase(searchParam.get("categoryid"))){
			sql.append(" CONCAT(t.name, ' ', t.nameeng) as schoolname, t.chscid, t.categoryid, l.description as schoolcategory   "); 
		}else{
			sql.append(" '' as schoolname, '', '', '' as schoolcategory   "); 
		}
		sql.append(" from  bos.questionanswer q  left join bos.user u on q.userid = u.id,  objectstat n ");
		
		
		if(searchParam.get("categoryid") != null && ! "-1".equalsIgnoreCase(searchParam.get("categoryid"))){
			sql.append(" , bos.entity t , bos.lookup l ");
			sql.append(" where  q.parentid=0 and q.entityid = t.id and l.type = 'entity.category.chi' and t.categoryid=l.value and q.userid != 1 and q.userlike > 0 ");
			
		}else{
			sql.append(" where  q.parentid=0   ");
				
		}
		sql.append("   and n.status='active' and n.type='forum' and q.id=n.objectid ");
		sql.append(searchParam.get("type") != null && ! "-1".equalsIgnoreCase(searchParam.get("type"))  && ! "hot".equalsIgnoreCase(searchParam.get("type")) ? " and  q.type='" + searchParam.get("type") + "' " : " and q.type='q' ");
		sql.append(searchParam.get("categoryid") != null && ! "-1".equalsIgnoreCase(searchParam.get("categoryid")) ? " and  t.categoryid=" + searchParam.get("categoryid")  : " ");
		sql.append(searchParam.get("userid") != null && ! "-1".equalsIgnoreCase(searchParam.get("userid")) ? " and  q.userid=" + searchParam.get("userid")  : " ");
		sql.append(searchParam.get("entityid") != null && ! "-1".equalsIgnoreCase(searchParam.get("entityid")) ? " and  q.entityid=" + searchParam.get("entityid")  : " ");
		sql.append(searchParam.get("tag") != null && ! "-1".equalsIgnoreCase(searchParam.get("tag")) ? " and  ( q.tag3='" + searchParam.get("tag") + "' or q.tag4='" + searchParam.get("tag") + "' or q.tag5='" + searchParam.get("tag") + "') " : " ");
		sql.append(searchParam.get("isnewspaper") != null && ! "-1".equalsIgnoreCase(searchParam.get("isnewspaper")) ? " and  tag1='newspaper' "  : " ");
		sql.append(searchParam.get("isparentrating") != null && ! "-1".equalsIgnoreCase(searchParam.get("isparentrating")) ? " and  tag1='" + searchParam.get("isparentrating") + "' "  : " ");

		sql.append(searchParam.get("type") != null && "hot".equalsIgnoreCase(searchParam.get("type")) ? " order by  n.hitcounter desc,sortabledate desc, q.userlike desc limit 200  "  : "Y".equalsIgnoreCase(searchParam.get("all")) ? " order by sortabledate desc, q.userlike desc " : " order by " + searchParam.get("colName") + " " + searchParam.get("dir") + " limit " + searchParam.get("start") + ", " + searchParam.get("amount"));

		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getForumContentList " + sql.toString());
		return result;
	}
	public Map<String, String> getQuestionAnswerLatestContent(final String qaids) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select parentid, questionanswer as content from questionanswer q ");
		if(qaids !=null && qaids.trim().length() > 0)
		sql.append("where parentid in (" + qaids + ") ");
		sql.append("group by id having max(id) ");
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		HashMap<String, String> resultMap = new HashMap<String, String>();
		if(result.size() > 0){
			for(int i=0; i < result.size(); i++ ){
				HashMap map = (HashMap) result.get(i);
				resultMap.put("" +map.get("parentid"), "" +map.get("content"));
			}
		}
	
		return resultMap;
	}
	public List<Map<String, Object>> getQAListByID(HashMap<String,String> searchParam) throws SQLException {

		StringBuffer sql = new StringBuffer();
		String order = "desc";
        order = searchParam.get("order") != null ?  searchParam.get("order") : order;
		sql.append("select * from ( ");
		sql.append("select q.*,q.id as qaid,  u.namelocal as username, u.userprofile,  u.anonymous,u.userscore,u.parentratingcount,  SUBSTRING_INDEX(q.questionanswer,' ',30) as questionanswer50 , CONCAT(t.name, ' ', t.nameeng) as schoolname,t.name, t.nameeng, " + ( searchParam.get("style") != null ? " '"+searchParam.get("style")+ "' as style, " : " " ) );
		sql.append(" TIMESTAMPDIFF(MINUTE, q.created, now()) as timediffmin,TIMESTAMPDIFF(DAY, q.created, now()) as timediffday,TIMESTAMPDIFF(HOUR, q.created, now()) as timediffhour, TIMESTAMPDIFF(SECOND, q.created, now()) as timediffsec ");
		sql.append(" from bos.questionanswer q left join bos.entity t on q.entityid = t.id left join bos.user u on q.userid = u.id  where q.id =" + (searchParam.get("id") != null && searchParam.get("id").trim().length() > 0 ? searchParam.get("id") : "-1") );
		sql.append(" union select q.*,q.id as qaid,u.namelocal as username,u.userprofile, u.anonymous,u.userscore,u.parentratingcount, SUBSTRING_INDEX(questionanswer,' ',30) as questionanswer50 , CONCAT(t.name, ' ', t.nameeng) as schoolname,t.name, t.nameeng, " + ( searchParam.get("style") != null ? " '"+searchParam.get("style")+ "' as style, " : " " ) );
		sql.append(" TIMESTAMPDIFF(MINUTE, q.created, now()) as timediffmin,TIMESTAMPDIFF(DAY, q.created, now()) as timediffday,TIMESTAMPDIFF(HOUR, q.created, now()) as timediffhour, TIMESTAMPDIFF(SECOND, q.created, now()) as timediffsec ");
		sql.append(" from bos.questionanswer q left join bos.entity t on q.entityid = t.id left join bos.user u on q.userid = u.id  where q.parentid =" + (searchParam.get("id") != null && searchParam.get("id").trim().length() > 0 ? searchParam.get("id") : "-1") );
		sql.append(" ) as a order by qaid " + order +  "  limit 50 ");
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getQAList " + sql.toString() );
		return result;
	}
	public List<Map<String, Object>> getQATag(HashMap<String,String> searchParam ) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("select count(tag1) as questioncount, tag1 as tag from questionanswer where type='q' and active='y' and LENGTH(tag1) > 0 group by tag1 ");
		sql.append("union select count(tag2) as questioncount, tag2 as tag from questionanswer where type='q' and active='y' and LENGTH(tag2) > 0 group by tag2 ");
		sql.append("union select count(tag3) as questioncount, tag3 as tag from questionanswer where type='q' and active='y' and LENGTH(tag3) > 0 group by tag3 ");
		sql.append("union select count(tag4) as questioncount, tag4 as tag from questionanswer where type='q' and active='y' and LENGTH(tag4) > 0 group by tag4 ");
		sql.append("union select count(tag5) as questioncount, tag5 as tag from questionanswer where type='q' and active='y' and LENGTH(tag5) > 0 group by tag5 ");
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public int getQAParentID(Map<String,String> questionanswer) throws SQLException{
		int maxid=0;
		try {
			//type c is course private msg, userid is the filter param
			//type e is entity chat room msg, don't count userid param
			//maxid =  jdbcTemplate.queryForInt("select id from bos.questionanswer where type='" + questionanswer.get("type") + "' and parentid=0 and entityid=" + questionanswer.get("entityid")  + " and userid=" + questionanswer.get("userid") + " " );
			maxid =  jdbcTemplate.queryForObject("select id from bos.questionanswer where type='" + questionanswer.get("type") + "' and parentid=0 and entityid=" + questionanswer.get("entityid")  + ("c".equalsIgnoreCase(questionanswer.get("type"))   ?  " and userid=" + questionanswer.get("userid") + " " : " ") , Integer.class);
			if(maxid < 1){
				maxid=-1;
			}
			return maxid;
		}catch(Exception ex){
			//ex.printStackTrace();
			maxid=-1;
			return maxid;
		}
	}
	public String saveQuestionAnswer(final Map<String,String> questionanswer) throws SQLException{
		try {
			if(questionanswer.get("ipaddr") != null){
    			final StringBuffer sql = new StringBuffer();
    			String key="";
				if(questionanswer.get("id") != null && ! "-1".equalsIgnoreCase((String) questionanswer.get("id"))){
					sql.append("update bos.questionanswer set subject=? " );
					sql.append(" ,active=? " );
					sql.append(" ,questionanswer=? " );
					sql.append(" ,parentid=? " );
					sql.append(" ,tag1=? " );
					sql.append(" ,tag2=? " );
					sql.append(" ,tag3=? " );
					sql.append(" ,tag4=? " );
					sql.append(" ,tag5=? " );
					sql.append(" ,type=? " );
					sql.append(" ,entityid=? " );
					sql.append(" ,categoryid=? " );
					
					sql.append(" ,userlike=? " );
					
					sql.append("where id='" + questionanswer.get("id") + "'");
					jdbcTemplate.update(sql.toString(),quote(questionanswer.get("subject")),questionanswer.get("active"),quote(questionanswer.get("questionanswer")),questionanswer.get("parentid")
							,quote(questionanswer.get("tag1")),quote(questionanswer.get("tag2")),quote(questionanswer.get("tag3")),quote(questionanswer.get("tag4")),quote(questionanswer.get("tag5"))
							,questionanswer.get("type"),questionanswer.get("entityid"),questionanswer.get("categoryid"),questionanswer.get("userlike"));
					
					key="" + questionanswer.get("id");
				}else{
					sql.append("insert into bos.questionanswer (subject,active,questionanswer,entityid,categoryid,ipaddr,tag1,tag2,tag3,tag4,tag5,userid,parentid,userlike,type,lastmodified,created) values( ");
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
				
					
					sql.append("current_timestamp,current_timestamp)");
					if(!"-1".equalsIgnoreCase(questionanswer.get("subject")) && !"-1".equalsIgnoreCase(questionanswer.get("questionanswer")) ){
					
						
						KeyHolder keyHolder = new GeneratedKeyHolder();
						jdbcTemplate.update(
						    new PreparedStatementCreator() {
						        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
						            PreparedStatement ps =
					                connection.prepareStatement(sql.toString(), new String[] {"id"});
						            ps.setString(1,questionanswer.get("subject"));
						            ps.setString(2,questionanswer.get("active"));
						            ps.setString(3,questionanswer.get("questionanswer"));
						            ps.setString(4,questionanswer.get("entityid"));
						            ps.setString(5,questionanswer.get("categoryid"));
						            ps.setString(6,questionanswer.get("ipaddr"));
							           
						            ps.setString(7,(String)quote(questionanswer.get("tag1")));
						            ps.setString(8,(String)quote(questionanswer.get("tag2")));
						            ps.setString(9,(String)quote(questionanswer.get("tag3")));
						            ps.setString(10,(String)quote(questionanswer.get("tag4")));
						            ps.setString(11,(String)quote(questionanswer.get("tag5")));
						            ps.setString(12,questionanswer.get("userid"));
						            ps.setString(13,(String)quote(questionanswer.get("parentid")));
						            ps.setString(14,questionanswer.get("userlike"));
						            ps.setString(15,(String)quote(questionanswer.get("type")));
						            
						            return ps;
						        }
						    },
						    keyHolder);
							key = keyHolder.getKey().toString(); //now contains the generated key
							
						}
				}
				theLogger.info(sql.toString());
				return key;
			}else{
				return "-1";
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			return "0";
		}
    }
	
	public void likeQuestionAnswer(final String id, String userid, String ipaddr) throws SQLException{
    	try {
    		if(!blockattack){
	    		StringBuffer sql = new StringBuffer();
	    		String userlike = "0";
	    		
	    		int iExisting = jdbcTemplate.queryForObject("select count(1) from bos.questionanswerlike where questionanswerid='" + id + "' and ipaddr='" + ipaddr + "' and userid='" + userid + "'", Integer.class );
				
	    		if(iExisting < 1){
	    			sql.append("update bos.questionanswer set userlike=userlike+1, ipaddr='" + ipaddr + "' where id='" + id + "'");
	    			jdbcTemplate.update(sql.toString());
	    			sql = new StringBuffer();
	    			sql.append("insert into bos.questionanswerlike (userid,questionanswerid,ipaddr,lastmodified,created) values('" + userid  + "','" + id + "','" + ipaddr +  "',current_timestamp,current_timestamp)");
	    			jdbcTemplate.update(sql.toString());
	    		}
    		}
    	} catch (Exception ex) {
			ex.printStackTrace();

		}
    }
	/*
	public void acceptAnswer(final String id, final String userid,final String parentid) throws SQLException{
    	try {
    		StringBuffer sql = new StringBuffer();
    		String userlike = "0";
    		
    		int iExisting = jdbcTemplate.queryForInt("select count(1) from bos.questionanswer where id=( select parentid from bos.questionanswer where id='" + id +  "') and userid='" + userid + "'" );
			
    		if(iExisting == 1){
    			sql.append("update bos.questionanswer set accept='y' where id='" + id + "'");
    			jdbcTemplate.update(sql.toString());
    			sql = new StringBuffer();
    			sql.append("update bos.questionanswer set accept='y' where id='" + parentid + "'");
    			jdbcTemplate.update(sql.toString());
    		}
    		iExisting = jdbcTemplate.("select count(1) from bos.user where id=(select userid from bos.questionanswer where id='" + id +  "') " );
    		if(iExisting == 1){
    			sql = new StringBuffer();
    			sql.append("update bos.user set userscore=userscore + 10,noofanswer=noofanswer+1 where id=(select userid from bos.questionanswer where id='" + id +  "') ");
    			jdbcTemplate.update(sql.toString());
    		}
    	
    	} catch (Exception ex) {
			ex.printStackTrace();

		}
    }
    */
	public List<Map<String, Object>> getUserQAScore() throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("select u.* from user u where u.userscore>0 order by userscore desc limit 100 ");
		
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public String saveQuestionWithAnswer(final Map<String,String> questionanswer) throws SQLException {
		List<Map<String, Object>> result;
		
		if(questionanswer.get("ipaddr") != null && questionanswer.get("ipaddr").trim().length() > 0 ) // Special Case for parent rating
			result  = jdbcTemplate.queryForList("select id from  bos.questionanswer where subject='" + (String) quote(questionanswer.get("subject")) + "' and type='q' " + " and userid='" + questionanswer.get("userid") + "' " + ("-1".equalsIgnoreCase(questionanswer.get("userid") )  ? " and ipaddr='" + quote(questionanswer.get("ipaddr")) + "' " : " "  ) );
		else
			result  = jdbcTemplate.queryForList("select id from  bos.questionanswer where subject='" + (String) quote(questionanswer.get("subject")) + "' and type='q' and userid='1' ");
			
		final StringBuffer sql = new StringBuffer();
		String parentkey="";
		if(result.size() > 0){
			parentkey = "" + result.get(0).get("id");
			StringBuffer sql2 = new StringBuffer();
			//This part update parentid=0
			if(questionanswer.get("ipaddr") != null && questionanswer.get("ipaddr").trim().length() > 0 )
				sql2.append(" update bos.questionanswer set lastmodified=now(),childanswer='" + quote(questionanswer.get("answer")) + "'  where id='" + parentkey +"' and userid='" + questionanswer.get("userid") + "'  "  + ("-1".equalsIgnoreCase(questionanswer.get("userid") )  ? " and ipaddr='" + quote(questionanswer.get("ipaddr")) + "' " : " "  ) );
			else
				sql2.append(" update bos.questionanswer set lastmodified=now(),childanswer='" + quote(questionanswer.get("answer")) + "',entityid=" + questionanswer.get("signleentityid") + ", categoryid=" + questionanswer.get("categoryid") + " where id='" + parentkey +"' and userid=1" );
				
			jdbcTemplate.update(sql2.toString());


			//This part update children -- parentid!=0
			sql2= new StringBuffer();
			sql2.append(" update bos.questionanswer ");
			sql2.append(" set questionanswer=? " );
			sql2.append(" , entityid=? " );
			sql2.append(" , categoryid=? " );
			sql2.append(" , lastmodified=now() " );
			
			if(questionanswer.get("ipaddr") != null && questionanswer.get("ipaddr").trim().length() > 0 ){ // Special Case for parent rating
				if(! "-1".equalsIgnoreCase(questionanswer.get("userid"))){
					sql2.append(" where userid=? and parentid=? ");
					jdbcTemplate.update(sql2.toString(),quote(questionanswer.get("answer")),questionanswer.get("signleentityid"),questionanswer.get("categoryid"),questionanswer.get("userid"),parentkey);
				}else{
					sql2.append(" where ipaddr=? and parentid=? and userid=? ");
					jdbcTemplate.update(sql2.toString(),quote(questionanswer.get("answer")),questionanswer.get("signleentityid"),questionanswer.get("categoryid"),questionanswer.get("ipaddr"),parentkey,questionanswer.get("userid"));
				}
			}else{
				sql2.append(" where userid=1 and parentid=? ");
				jdbcTemplate.update(sql2.toString(),quote(questionanswer.get("answer")),questionanswer.get("signleentityid"),questionanswer.get("categoryid"),parentkey);
			}	
			theLogger.debug("savequestionwithanswer:" + sql2);
			theLogger.debug("questionanswer:" + questionanswer);
			
		}else{
			sql.append("insert into bos.questionanswer (subject,active,questionanswer,entityid,categoryid,tag1,tag2,tag3,tag4,tag5,userid,parentid,userlike,type,ipaddr,childanswer,lastmodified,created) values( ");
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
			sql.append("current_timestamp,current_timestamp)");
			KeyHolder keyHolder = new GeneratedKeyHolder();
			jdbcTemplate.update(
			    new PreparedStatementCreator() {
			        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
			            PreparedStatement ps =
		                connection.prepareStatement(sql.toString(), new String[] {"id"});
			            ps.setString(1,questionanswer.get("subject"));
			            ps.setString(2,questionanswer.get("active"));
			            ps.setString(3,questionanswer.get("question"));
			            ps.setString(4,questionanswer.get("signleentityid"));
			            ps.setString(5,questionanswer.get("categoryid"));
			            
			            ps.setString(6,(String)quote(questionanswer.get("tag1")));
			            ps.setString(7,(String)quote(questionanswer.get("tag2")));
			            ps.setString(8,(String)quote(questionanswer.get("tag3")));
			            ps.setString(9,(String)quote(questionanswer.get("tag4")));
			            ps.setString(10,(String)quote(questionanswer.get("tag5")));
			            ps.setString(11,questionanswer.get("userid"));
			            ps.setString(12,"0");
			            ps.setString(13,questionanswer.get("userlike"));
			            ps.setString(14,"q");
			            ps.setString(15,questionanswer.get("ipaddr"));
						ps.setString(16,questionanswer.get("answer"));
						return ps;
			        }
			    },
			    keyHolder);
				parentkey = keyHolder.getKey().toString(); //now contains the generated key
				
				StringBuffer sql2 = new StringBuffer();
				sql2.append("insert into bos.questionanswer (subject,active,questionanswer,entityid,tag1,tag2,tag3,tag4,tag5,userid,parentid,userlike,type,ipaddr,lastmodified,created) values( ");
				sql2.append("?,");
				sql2.append("?,");
				sql2.append("?,");
				sql2.append("?,");
				sql2.append("?,");
				sql2.append("?,");
				sql2.append("?,");
				sql2.append("?,");
				sql2.append("?,");
				sql2.append("?,");
				sql2.append("?,");
				sql2.append("?,");
				sql2.append("?,");
				sql2.append("?,");
				sql2.append("current_timestamp,current_timestamp)");
				
				jdbcTemplate.update(sql2.toString(),questionanswer.get("subject"),questionanswer.get("active"),questionanswer.get("answer"),questionanswer.get("signleentityid"),
						quote(questionanswer.get("tag1")),quote(questionanswer.get("tag2")),quote(questionanswer.get("tag3")),quote(questionanswer.get("tag4")),quote(questionanswer.get("tag5"))
						,questionanswer.get("userid"),parentkey,questionanswer.get("userlike"),"a",questionanswer.get("ipaddr"));
				
		
		}
		theLogger.debug("saveQuestionWithAnswer parentkey" + parentkey);
		theLogger.debug("saveQuestionWithAnswer answer" + questionanswer.get("answer"));

		return parentkey;

	}
	public Map<String, String> getForumCount(final String timerange) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select categoryid , count(1) as noofquestion from questionanswer q " );
		sql.append(" where q.type='q' ");
		sql.append(" and DATE_SUB(now(),INTERVAL " + (timerange) + " DAY) <= q.lastmodified  ");
		sql.append(" and q.categoryid in (0,1,2,5) " );
		sql.append(" and q.userid != 1 and q.userlike > 0 ");
		sql.append(" group by categoryid ");
		theLogger.debug("getForumCount " + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		HashMap<String, String> resultMap = new HashMap<String, String>();
		if(result.size() > 0){
			for(int i=0; i < result.size(); i++ ){
				HashMap map = (HashMap) result.get(i);
				resultMap.put("" +map.get("categoryid"), "" +map.get("noofquestion"));
				theLogger.debug("" +map.get("categoryid") +  "" + ":" + map.get("noofquestion"));
			}
		}
		
		sql = new StringBuffer();
		sql.append(" select type , count(1) as noofquestion from questionanswer q " );
		sql.append(" where (q.type='hot' or q.type='tutor' or q.type='support') ");
		sql.append(" and DATE_SUB(now(),INTERVAL " + (timerange) + " DAY) <= q.lastmodified  ");
		sql.append(" group by type ");
		result = jdbcTemplate.queryForList(sql.toString());
		
		
		if(result.size() > 0){
			for(int i=0; i < result.size(); i++ ){
				HashMap map = (HashMap) result.get(i);
				resultMap.put("" +map.get("type"), "" +map.get("noofquestion"));
			}
		}
		
		
		return resultMap;
		
		
	}
	public void updateQuestionAnswerTotalReply(String parentid){
		//if(!blockattack){
			String sql = "";
			sql = "update questionanswer set totalreply=totalreply+1, lastmodified=now() where id=?";
			jdbcTemplate.update(sql,parentid); 
		//}
	}
	public Map<String, String> getLastMessagePerGroup(final String entityids,final String type) throws SQLException {

		StringBuffer sql = new StringBuffer();
		
		sql.append("SELECT concat( substring(questionanswer,1,30),'.... <br><font class=\"font0b d3-color-gray-2\">', lastmodified, '</font>' ) as questionanswer, entityid from questionanswer q1 ");
		sql.append("JOIN (SELECT  max(id) as id ");
		sql.append("FROM questionanswer  q2 where entityid in  ( " +  (entityids !=null && entityids.trim().length() > 0 ? entityids : "0" )  + " ) and type='" + type+ " '  ");
		sql.append("GROUP BY q2.entityid, q2.type ) x ON x.id = q1.id ");
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		HashMap<String, String> resultMap = new HashMap<String, String>();
		if(result.size() > 0){
			for(int i=0; i < result.size(); i++ ){
				HashMap map = (HashMap) result.get(i);
				resultMap.put("" +map.get("entityid"), "" +map.get("questionanswer"));
			}
		}
		
	
		return resultMap;
	}
	public String saveChatChannel(final Map<String,String> chatchannel) throws SQLException {
				
		final StringBuffer sql = new StringBuffer();
		String parentkey="";
		int exist=0;
		StringTokenizer st = new StringTokenizer(chatchannel.get("userids"), ",");
		
			
			exist = jdbcTemplate.queryForObject("select count(1) from chatchannel where (createdby =" + chatchannel.get("userid") + " and receivedby=" + chatchannel.get("receivedby") + ") or (receivedby =" + chatchannel.get("userid") + " and createdby=" + chatchannel.get("receivedby") +" ) ", Integer.class);
			
			if(exist != 1){
				sql.append("insert into bos.chatchannel (type,name,receivedby,createdby, lastmodified,created) values(?,?,?,?,current_timestamp,current_timestamp)");
				KeyHolder keyHolder = new GeneratedKeyHolder();
		
				jdbcTemplate.update(
				    new PreparedStatementCreator() {
				        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				            PreparedStatement ps =
			                connection.prepareStatement(sql.toString(), new String[] {"id"});
				            ps.setString(1,(String) quote("" + chatchannel.get("channeltype")));
				            ps.setString(2,(String) quote("" + chatchannel.get("channelname")));
				            ps.setString(3,(String) quote("" + chatchannel.get("receivedby")));
				            ps.setString(4,(String) quote("" + chatchannel.get("userid")));
				            
				            return ps;
				        }
				    },
				    keyHolder);
					parentkey = keyHolder.getKey().toString(); //now contains the generated key
					
					StringBuffer sql2 = new StringBuffer();
					sql2.append("insert into bos.chatchanneluser (chatchannelid,userid,inbox,lastread,lastmodified,created) values( ");
					sql2.append("?,");
					sql2.append("?,");
					sql2.append("0,current_timestamp,current_timestamp,current_timestamp)");
					 
					while (st.hasMoreElements()) {
					
						jdbcTemplate.update(sql2.toString(),parentkey,st.nextElement());
					}
			}
		
		
		return parentkey;
	}
	public void saveChatChannelUser(final ArrayList<Map<String,String>> chatchannellist) throws SQLException {
	
		StringBuffer sql2 = new StringBuffer();
		theLogger.debug("saveChatChannelUser " + chatchannellist.size());
		for (Iterator<Map<String, String>> i = chatchannellist.iterator(); i.hasNext(); ){
			Map<String, String> chatchannel =  (Map<String, String>) i.next();
			sql2 = new StringBuffer();
				
				sql2.append("delete from bos.chatchanneluser where chatchannelid=? and userid=?");
				jdbcTemplate.update(sql2.toString(),chatchannel.get("favoriteid"),chatchannel.get("userid"));
			
			if(! "dislike".equalsIgnoreCase(chatchannel.get("action"))){
				sql2 = new StringBuffer();
				sql2.append("insert into bos.chatchanneluser (chatchannelid,userid,inbox,lastread,lastmodified,created) values( ");
				sql2.append("?,");
				sql2.append("?,");
				sql2.append("0,current_timestamp,current_timestamp,current_timestamp)");
				jdbcTemplate.update(sql2.toString(),chatchannel.get("favoriteid"),chatchannel.get("userid"));
			}
			
		}
	}
	public List<Map<String,Object>>  getReceiveUserID(String entityid){
		 return jdbcTemplate.queryForList("select receivedby,createdby from chatchannel where id=" + entityid);
	}
   
    public void updateInbox( String chatchannelid, String userid, String type) throws SQLException {
    	
    	String sql ="";
    	
    	if("read".equalsIgnoreCase(type)){
			sql = "update bos.chatchanneluser set inbox=0 , lastread=now() where chatchannelid=" + chatchannelid + " and userid=" + userid;
			jdbcTemplate.update(sql);
    	}else{
			sql = "update bos.chatchanneluser set inbox=inbox+1 where chatchannelid=" + chatchannelid ;
			jdbcTemplate.update(sql);
			sql = "update bos.chatchanneluser set inbox=inbox-1 where chatchannelid=" + chatchannelid + " and userid=" + userid;
			jdbcTemplate.update(sql);
    		
    	}
	}
    public String getUnreadMessageCount(String userid) throws SQLException {
		
		String sql = " select sum(inbox) from chatchanneluser where userid=" + userid ;
		
		return "" + jdbcTemplate.queryForObject(sql, Integer.class);
	}
    public List<Map<String,Object>> getUnreadTimestamp(String userid,String chatchannelid) throws SQLException {
		
		String sql = " select * from chatchanneluser where userid=" + userid + " and chatchannelid=" + chatchannelid ;
		theLogger.debug("getUnreadTimestamp " + sql);
		return  jdbcTemplate.queryForList(sql);
	}

}
