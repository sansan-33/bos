package com.ana.dao;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository(value = "baseDao")
public abstract class BaseDAO {

	protected JdbcTemplate jdbcTemplate;
	private static String rankingYear="-1";
	protected final static boolean blockattack = true;
    private final Logger theLogger = LoggerFactory.getLogger(BaseDAO.class);
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public Object quote(Object s) {
		if (s == null) {
			return "";
		} else {
			if(s instanceof String)
			s = ((String) s).trim().replaceAll("'", "''"); // ISO/ANSI SQL quote
			return s;
		}
	}
	public void touchRecord(final String id,final String table) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("update " + table + "  set lastmodified=now() where id=" + id );
		jdbcTemplate.update(sql.toString());
	}
	public void setRankingYear() throws SQLException{
		
		if("-1".equalsIgnoreCase(rankingYear)){
			StringBuffer sql = new StringBuffer();
			sql.append("select value from lookup where type='system.param' and description='rankingyear'  ");
			List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
			//System.out.println(sql.toString());
			//System.out.println("result.isEmpty() "  + result.isEmpty());
			if(!result.isEmpty()){
				//System.out.println("setRankingYear done");
				rankingYear = "" + result.get(0).get("value");
			}
		}
	}
	public String getRankingYear(){
        //rankingYear="-1";
		//System.out.println("getRankingYear");
		if("-1".equalsIgnoreCase(rankingYear)){
			try{
                setRankingYear();
                theLogger.debug("get a new one from db" + rankingYear);
            }catch(Exception ex){}
		}else{
			//System.out.println("use existing value" + rankingYear);
		}
		return rankingYear;
	}
	
	public boolean authorized(String userid){
		
		boolean result = false;
		StringBuffer sql = new StringBuffer();
		sql.append("select id from user where roleid in (1,4,5) and id='" + userid + "'  ");
		List<Map<String, Object>> userlist = jdbcTemplate.queryForList(sql.toString());
		if(!userlist.isEmpty()){
			result = true;
		}
		return result;
	}
	public boolean isAdmin(String userid){
		
		boolean result = false;
        StringBuffer sql = new StringBuffer();
		sql.append("select roleid from user where roleid=1 and id='" + userid + "'  ");
		List<Map<String, Object>> userlist = jdbcTemplate.queryForList(sql.toString());
		try{
            if(userlist != null &&  !userlist.isEmpty() && userlist.size() > 0 && "1".equalsIgnoreCase("" + userlist.get(0).get("roleid")) ){
			    result = true;
		    }
        }
        catch (Exception ex){

        }
		return result;
	}
	
}
