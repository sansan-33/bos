package com.ana.dao;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository(value = "cmsDao")
public class CMSDAO extends BaseDAO {

    private final Logger theLogger = LoggerFactory.getLogger(CMSDAO.class);
	public List<Map<String, Object>> getCMSList(final HashMap<String,String> searchMap) throws SQLException{
		
		StringBuffer sql = new StringBuffer();
		sql.append("select  DATE_FORMAT(c.lastmodified,'%b %d %Y %h:%i %p') as shortdate,  c.*  ");
		sql.append("from cms c   " );
		sql.append("where 1=1  ");
		sql.append(searchMap.get("id") != null && ! "-1".equalsIgnoreCase(searchMap.get("id")) ? " and  c.id= " + searchMap.get("id") : " ");
		
		sql.append(" order by c.lastmodified desc ");
	
		theLogger.debug("getCMSList {}" , sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	


}
