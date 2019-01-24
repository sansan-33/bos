package com.ana.dao;

import com.ana.util.Spider;
import com.ana.util.SpiderKindergarten;
import com.ana.util.SpiderSecondary;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.*;

@Repository(value = "entityDao")
public class EntityDAO extends BaseDAO {

    private final Logger theLogger = LoggerFactory.getLogger(EntityDAO.class);
	final static String MINSCORE = "0";
	final static int GOODCOMMENTSCORE=6;
	final static int BESTCOMMENTSCORE=8;
    final static int COMPARECOMMENTOFFSET = 0;
    final static String SCHOOLALLOCATIONLIMIT = "10";
    final static String EXCEEDQUOTATEMP ="100";
	protected Spider spider;
	protected SpiderKindergarten spiderk;
	protected SpiderSecondary spiders;
	final static int RANKING_BETWEEN_MIN = 5;
	final static boolean IS_SCORING_ACAD=true;
	final static boolean IS_SCORING_METRIC=true;
	final static boolean IS_UPDATE_RANK=true;


	@Autowired
	public void setSpider(Spider spider) {
		this.spider = spider;
	}
	@Autowired
	public void setSpider(SpiderKindergarten spiderk) {
		this.spiderk = spiderk;
	}
	@Autowired
	public void setSpider(SpiderSecondary spiders) {
		this.spiders = spiders;
	}
	public Map<String, Object> getEntityDetailsLimit(final String entityid,final String categoryid,final String userid,final String action) throws SQLException {

		StringBuffer sql = new StringBuffer();
			sql.append("select a.financetype,a.poaschoolnet,a.nursery,a.name,a.chscid " );
			sql.append(",a.id as entityid, b.schoolsystem from bos.entity a, entitybasic b  ");
			sql.append(" where a.id=b.entityid  ");
			sql.append("single".equalsIgnoreCase(action) ? " and a.id='" + entityid + "' " : ""); //For User Id
		sql.append(!"-1".equalsIgnoreCase(categoryid) ? " and  a.categoryid ='"+ categoryid + "'": "");
		sql.append(" order by a.nameeng asc  limit 1");
		theLogger.debug("new getEntityDetailsLimit"  + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("result.szie :" + result.size());
		if(!result.isEmpty()) {
			theLogger.debug("result name :" + result.get(0).get("name"));
			return result.get(0);
		}else
			return null;
	}
	public Map<String, Object> getEntityDetails(final String entityid,final String categoryid,final String userid,final String action) throws SQLException {

		StringBuffer sql = new StringBuffer();
		if( userid!=null && userid.trim().length() > 0 && !"-1".equalsIgnoreCase(userid)){
			sql.append(" select a.*,a.id as entityid, cu.inbox, b.schoolsystem from bos.entity a, entitybasic b,  chatchanneluser cu   ");
			sql.append(" where 1=1 ");
			sql.append(" and a.id=b.entityid and a.id=cu.chatchannelid and cu.userid=" + userid );
			sql.append("single".equalsIgnoreCase(action) ? " and a.id='" + entityid + "' " : ""); //For User Id
		}else{
			sql.append("select a.*,a.id as entityid, '0' as inbox, b.schoolsystem from bos.entity a, entitybasic b  ");
			sql.append(" where 1=1 and a.id=b.entityid  ");
			sql.append("single".equalsIgnoreCase(action) ? " and a.id='" + entityid + "' " : ""); //For User Id
		}
		sql.append(!"-1".equalsIgnoreCase(categoryid) ? " and  a.categoryid ='"+ categoryid + "'": "");
		sql.append(" order by a.nameeng asc  limit 1");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getEntityDetails"  + sql.toString());
		if(!result.isEmpty())
			return result.get(0);
		else
			return null;
	}
	public List<Map<String, Object>> getEntityList(final String id,	final String categoryid,final String userid,final String action) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select CONCAT(a.name, '  ', a.nameeng) as fullname, round(a.parentscore,1) as parentscore, a.*, ");
		sql.append("IF(avg(metric1) > 0 , round(avg(metric1),1) , '?')  as metric1, ");
		sql.append("IF(avg(metric2) > 0 , round(avg(metric2),1) , '?')  as metric2, ");
		sql.append("IF(avg(metric3) > 0 , round(avg(metric3),1) , '?')  as metric3, ");
		sql.append("IF(avg(metric4) > 0 , round(avg(metric4),1) , '?')  as metric4, ");
		sql.append("IF(avg(metric5) > 0 , round(avg(metric5),1) , '?')  as metric5, ");
		sql.append("IF(avg(metric6) > 0 , round(avg(metric6),1) , '?')  as metric6 ");
		sql.append(" from bos.entity a, comment c  ");
		sql.append(" where a.id=c.entityid and c.userid=1 and c.type='system' "); // and c.year=" + getRankingYear());
		sql.append(action.contains("compare") ? " and  a.id in(" + id  + ")" : ""); //For Compare Console
		sql.append(!"-1".equalsIgnoreCase(categoryid) ? " and  a.categoryid ='"+ categoryid + "'": "");
		sql.append(" group by a.id, a.name ");
		sql.append(action.contains("compare") ? " order by a.ranking asc, a.nameeng asc  " : " order by c.metric1 desc,c.metric4 desc,c.metric3 desc,c.metric2 desc,c.metric5 desc, a.nameeng asc  ");
		theLogger.debug(sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getEntityList Result size " + result.size());
		return result;
	}
	public List<Map<String, Object>> getSingleEntityYearList(final String id,	final String categoryid,final String userid,final String action, String year) throws SQLException {
		String startyear = "2012";
		try {
			startyear = "" + (Integer.parseInt(getRankingYear()) - 6 );
		}catch (Exception ex){
			ex.printStackTrace();
		}

		StringBuffer sqlcommon = new StringBuffer();
		sqlcommon.append(" name,nameeng,address,telephone,url,language,nominated,throughtrain,feeder,yearofcommencement,schoolmotto,schoolmission,languagepolicy,financetype,a.poaschoolnet,nursery,session,principal,religion, ");
        sqlcommon.append(" a.categoryid,a.ranking,a.rankingfinancetype,a.rankingdistrict,a.score,a.exceedquota,a.enrolltotal,a.schoolallocationscore , ");
		sqlcommon.append(" a.banding,a.sixcoursesratio,a.chipassrate,a.engpassrate,a.urate,a.alpassrate,a.dp,a.igcse,a.hkdsepassrate,  ");
		sqlcommon.append(" a.athleticsdivmale,a.athleticsposmale,a.athleticsdivfemale,a.athleticsposfemale, a.athleticsdivmale as athleticsposmaledivision, a.athleticsdivfemale as athleticsposfemaledivision, a.athleticsdivname,a.sex,   ");     
		sqlcommon.append(" a.basketballdivmale,a.basketballposmale,a.basketballdivfemale,a.basketballposfemale,a.basketballdivmale as basketballposmaledivision,a.basketballdivfemale as basketballposfemaledivision,");     
		sqlcommon.append(" a.swimmingdivmale,a.swimmingposmale,a.swimmingdivfemale,a.swimmingposfemale, a.swimmingdivmale as swimmingposmaledivision,a.swimmingdivfemale as swimmingposfemaledivision,");     
		sqlcommon.append(" a.footballdiv,a.footballpos,");     
		sqlcommon.append(" a.musicfirst,a.musicsecond,a.musicthird,a.musicother,a.debatechi,a.speechfirst,a.speechsecond,a.speechthird,a.speechscore,a.schoolfee,a.tuitionfee,");
		sqlcommon.append(" a.schoolfeenursery,a.area,a.noofclassroom,a.noofhall,");
		sqlcommon.append(" a.noofplayground,a.nooflibraryroom,a.noofspecialroom,a.noofotherroom,a.outdoorplayground,a.indoorplayground,a.musicroom, ");
		sqlcommon.append(" a.teacherforeign,a.teacherexperience,a.teachermaster,a.teacherbachelor,a.teacherpupilam,a.teacherpupilpm,a.userid,a.created,a.lastmodified, ");
		sqlcommon.append(" a.voucher,a.qareport, ");
        sqlcommon.append(" TRUNCATE( (((a.vacancy - a.admitted)   / a.vacancy ) * 100), 2)  as overpercent, ");
        sqlcommon.append(" a.nooftest,a.noofexam,a.elite ");

        StringBuffer sql = new StringBuffer();
		if(!action.contains("edit")){
			sql.append("select * from ( ");
			sql.append(" select CONCAT(a.name, '  ', a.nameeng) as fullname, round(a.parentscore,1) as parentscore, '1' as year, a.id as id,  ");
			sql.append(sqlcommon.toString());
			sql.append(" from bos.entity a, comment c where a.id=c.entityid and c.userid=1 and c.type='system' and c.year=" + getRankingYear() );
			sql.append(action.contains("compare") ? " and  a.id in(" + id  + ")" : ""); //For Compare Console
			sql.append(!"-1".equalsIgnoreCase(categoryid) ? " and  a.categoryid ='"+ categoryid + "'": "");
			sql.append(" union ");
		}
		sql.append(" select CONCAT(e.name, '  ', e.nameeng) as fullname, round(e.parentscore,1) as parentscore, a.year, e.id as id, ");
		sql.append(sqlcommon.toString());
		sql.append(" from entityscore a , bos.entity e, comment c  ");
		sql.append(" where e.id=a.entityid and e.id=c.entityid and c.userid=1 and c.type='system' ");
		sql.append(action.contains("compare") ? " and  a.entityid in(" + id  + ")" : ""); //For Compare Console
		sql.append(action.contains("edit") && ! "-1".equalsIgnoreCase(year) ? " and c.year=" + year + " and  a.year='" + year +  "' and a.entityid=" + id + " " : ""); //For School Edit
		sql.append(!"-1".equalsIgnoreCase(categoryid) ? " and  e.categoryid ='"+ categoryid + "'": "");
		if(!action.contains("edit")){
			sql.append(" ) a where a.year > " + startyear + " order by a.year asc ");
		}
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getSingleEntityYearList " + sql.toString());
		return result;
	}
	public List<Map<String, Object>> getEntityListByMetric(final String metric,	final String categoryid,	final String metricExclude) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select * from bos.entityscore  ");
		sql.append("where categoryid ='"+ categoryid + "' and year=" + getRankingYear() + " ");
		if(metricExclude.startsWith("@") ){
			sql.append(" and  " + metricExclude.substring(1)  + " > " + MINSCORE + " ");
		}else if(! "-1".equalsIgnoreCase(metricExclude) )
			sql.append(" and CAST(`"+  metricExclude + "` AS DECIMAL(10,2)) > " + MINSCORE + " ");
		
		 sql.append(" order by " + metric + " ");
		 
		theLogger.debug("getEntityListByMetric:" + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public List<Map<String, Object>> getEntityListBySportMetric(final String metric,	final String categoryid,	final String metricExclude) throws SQLException {

        String NTSCHNETID = "62,64,65,66,70,71,72,73,74,80,81,83,84,88,89,91,95,96,97,98,99";
        String NTDIRECTPRIVATEID= "3576,3625,3639,3641,3646,3736,3737,3742,3812,3898,3910,3912";
        String male= "\u7537";
		String female= "\u5973";
		String malefemale= "\u7537\u5973";
		String NTDIVOFFSET = "20";
        String NTPRICELING = "800";

        StringBuffer sql = new StringBuffer();
		if("1".equalsIgnoreCase(categoryid) ){
			sql.append("select * from ( " );
			sql.append("( select entityid, IF(athleticsposmale > 0,athleticsposmale,1) as pos from entityscore where categoryid=" + categoryid + " and year=" + getRankingYear() + " and athleticsposmale > 0  and athleticsposfemale = 0 and poaschoolnet not in ( " + NTSCHNETID + " ) and entityid not in (" + NTDIRECTPRIVATEID +") ) ");
			sql.append("union all (select entityid,  IF(athleticsposfemale > 0,athleticsposfemale,1) as pos  from entityscore where categoryid=" + categoryid + " and year=" + getRankingYear() + " and athleticsposfemale > 0  and athleticsposmale = 0 and poaschoolnet not in ( " + NTSCHNETID + " ) and entityid not in (" + NTDIRECTPRIVATEID +") ) ");
			sql.append("union all (select entityid,  IF((athleticsposmale + athleticsposfemale) > 0, (athleticsposmale + athleticsposfemale),2) / 2 as pos from entityscore ");
			sql.append("where categoryid=" + categoryid + " and year=" + getRankingYear() + " and athleticsposmale > 0  and athleticsposfemale > 0  and poaschoolnet not in ( " + NTSCHNETID + " ) and entityid not in (" + NTDIRECTPRIVATEID +") )  ");

            sql.append("union all (select entityid, IF( (athleticsposmale * athleticsposmale / 10) > "+ NTPRICELING +", "+ NTPRICELING +", (athleticsposmale * athleticsposmale / 10) ) as pos from entityscore where categoryid=" + categoryid + " and year=" + getRankingYear() + " and athleticsposmale > 0  and athleticsposfemale = 0 and (poaschoolnet in ( " + NTSCHNETID + " ) or entityid  in (" + NTDIRECTPRIVATEID +"))  ) ");
            sql.append("union all (select entityid,  IF((athleticsposfemale * athleticsposfemale / 10) > "+ NTPRICELING +", "+ NTPRICELING + ", (athleticsposfemale * athleticsposfemale / 10) ) as pos  from entityscore where categoryid=" + categoryid + " and year=" + getRankingYear() + " and athleticsposfemale > 0  and athleticsposmale = 0 and (poaschoolnet in ( " + NTSCHNETID + " ) or entityid  in (" + NTDIRECTPRIVATEID +")) ) ");
            sql.append("union all (select entityid,  IF( ((athleticsposmale * athleticsposmale / 10) + (athleticsposfemale * athleticsposfemale / 10)) / 2 > "+ NTPRICELING + ", "+ NTPRICELING +" , ((athleticsposmale * athleticsposmale / 10) + (athleticsposfemale * athleticsposfemale / 10)) / 2 )  as pos from entityscore ");
            sql.append("where categoryid=" + categoryid + " and year=" + getRankingYear() + " and athleticsposmale > 0  and athleticsposfemale > 0  and (poaschoolnet in ( " + NTSCHNETID + " ) or entityid  in (" + NTDIRECTPRIVATEID +")) )  ");

            sql.append("union all (select entityid,  0 as pos from entityscore ");
			sql.append("where categoryid=" + categoryid + " and year=" + getRankingYear() + " and athleticsposmale = 0  and athleticsposfemale = 0   )) f ");
			
			sql.append("order by f.pos desc ");
		}else{
			sql.append("select * from ( " );
			sql.append("( select entityid, (CASE athleticsposmale WHEN '0' THEN 999 ELSE (IF(athleticsdivname is not null , athleticsposmale + " + NTDIVOFFSET + "  , athleticsposmale)) END) as pos, (CASE athleticsdivmale WHEN '0' THEN 999 ELSE athleticsdivmale END)  as sportdiv, (CASE footballpos WHEN '0' THEN 999 ELSE footballpos END) as footballpos, (CASE footballdiv WHEN '0' THEN 999 ELSE footballdiv END)  as footballdiv, (CASE swimmingposmale WHEN '0' THEN 999 ELSE swimmingposmale END) as swimmingpos, (CASE swimmingdivmale WHEN '0' THEN 999 ELSE swimmingdivmale END)  as swimmingdiv, (CASE basketballposmale WHEN '0' THEN 999 ELSE basketballposmale END) as basketballpos, (CASE basketballdivmale WHEN '0' THEN 999 ELSE basketballdivmale END)  as basketballdiv from entityscore where categoryid=" + categoryid + " and year=" + getRankingYear() + "  and sex='" + male + "')  ");
			sql.append("union all (select entityid,  (CASE athleticsposfemale WHEN '0' THEN 999 ELSE (IF(athleticsdivname is not null , athleticsposfemale + " + NTDIVOFFSET + " , athleticsposfemale)) END) as pos, (CASE athleticsdivfemale WHEN '0' THEN 999 ELSE athleticsdivfemale END)  as sportdiv, 999 as footballpos, 999  as footballdiv, (CASE swimmingposfemale WHEN '0' THEN 999 ELSE swimmingposfemale END) as swimmingpos, (CASE swimmingdivfemale WHEN '0' THEN 999 ELSE swimmingdivfemale END)  as swimmingdiv, (CASE basketballposfemale WHEN '0' THEN 999 ELSE basketballposfemale END) as basketballpos, (CASE basketballdivfemale WHEN '0' THEN 999 ELSE basketballdivfemale END)  as basketballdiv  from entityscore where categoryid=" + categoryid + " and year=" + getRankingYear() + " and sex='" + female + "')  ");
			sql.append("union all (select entityid,  (CASE athleticsposmale + athleticsposfemale WHEN '0' THEN 9000  ELSE (IF(athleticsdivname is not null , athleticsposmale + " + NTDIVOFFSET + " , athleticsposmale) + IF(athleticsdivname is not null , athleticsposfemale + " + NTDIVOFFSET + " , athleticsposfemale))  END) / 2 as pos, (CASE athleticsdivmale + athleticsdivfemale WHEN '0' THEN 9000  ELSE (IF(athleticsdivmale > 0 , athleticsdivmale , '3')  + IF(athleticsdivfemale > 0 , athleticsdivfemale , '3'))  END) / 2 as sportdiv, ");
			sql.append("  (CASE footballpos WHEN '0' THEN 999 ELSE footballpos END) as footballpos, (CASE footballdiv WHEN '0' THEN 999 ELSE footballdiv END)  as footballdiv, ");
			sql.append("  (CASE swimmingposmale + swimmingposfemale WHEN '0' THEN 9000  ELSE (swimmingposmale + swimmingposfemale)  END) / 2 as swimmingpos, (CASE swimmingdivmale + swimmingdivfemale WHEN '0' THEN 9000  ELSE (swimmingdivmale + swimmingdivfemale)  END) / 2 as swimmingdiv, ");
			sql.append("  (CASE basketballposmale + basketballposfemale WHEN '0' THEN 9000  ELSE (basketballposmale + basketballposfemale)  END) / 2 as basketballpos, (CASE basketballdivmale + basketballdivfemale WHEN '0' THEN 9000  ELSE (basketballdivmale + basketballdivfemale)  END) / 2 as basketballdiv ");
			sql.append(" from entityscore ");
			sql.append(" where categoryid=" + categoryid + " and year=" + getRankingYear() + " and sex='" + malefemale + "')  ");
			sql.append(" union all (select entityid,  9999 as pos, 9999 as sportdiv,  9999 as footballpos, 9999 as footballdiv,  9999 as swimmingpos, 9999 as swimmingdiv,  9999 as basketballpos, 9999 as basketballdiv  from entityscore ");
			sql.append(" where categoryid=" + categoryid + " and year=" + getRankingYear() + " and athleticsposmale = 0  and athleticsposfemale = 0  and  footballpos = 0  and basketballposmale = 0 and basketballposfemale = 0  and swimmingposmale = 0  and swimmingposfemale = 0  )) f ");
			
			sql.append(" order by f.sportdiv asc, f.pos asc,  f.swimmingdiv asc, f.swimmingpos asc, f.basketballdiv asc, f.basketballpos asc,f.footballdiv asc, f.footballpos asc ");
		}
		
		theLogger.debug("getEntityListBySportMetric ");
		theLogger.debug("SQL {}" , sql.toString());

		List<Map<String, Object>> result = this.jdbcTemplate.queryForList(
				sql.toString()
		       );
		
		return result;
	}
	
	
	
	public List<Map<String, Object>> getKindergartenList(final String id,final String categoryid,final String userid,final String action) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select CONCAT(a.name, ' ', a.nameeng) as fullname, ");
		sql.append("a.id,a.noofclassroom,a.financetype,a.sex,a.outdoorplayground,a.schoolfee,a.url,a.poaschoolnet, ");
		sql.append("a.tuitionfee,a.nursery,a.noofplayground,a.religion,a.principal ");
		sql.append("from bos.entity a where a.categoryid=0 ");
		sql.append(" order by a.nameeng asc  ");
		theLogger.debug(sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getKindergartenList Result size " + result.size());
		return result;
	}
	public List<Map<String, Object>> getPrimarySchoolList(final String id,final String categoryid,final String userid,final String action) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select CONCAT(a.name, ' ', a.nameeng) as fullname, ");
		sql.append("a.id,a.language,a.financetype,a.sex,a.session,a.schoolfee,a.url,a.throughtrain,a.feeder,a.nominated,a.poaschoolnet, ");
		sql.append("a.tuitionfee,a.area,a.religion, ");
        sql.append("a.name,a.nameeng,a.vacancy, a.admitted  ");
        sql.append("from bos.entity a where a.categoryid=1 ");
		sql.append(" order by a.nameeng asc  ");
		theLogger.debug(sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getPrimarySchoolList Result size " + result.size());
		return result;
	}
	public List<Map<String, Object>> getSecondarySchoolList(final String id,final String categoryid,final String roleid,final String action) throws SQLException {

		String tablealias_entity="a";
		String tablealias_entity_dba="d";

		if("5".equals(roleid)) {
			tablealias_entity = "d";
			tablealias_entity_dba = "a";
		}

		StringBuffer sql = new StringBuffer();
		sql.append(" select CONCAT(a.name, ' ', a.nameeng) as fullname, a.*, COALESCE(DATE_FORMAT(a.lastmodified,'%d %b %Y' )  ,'N/A') as lastupdated, ");
		sql.append(" d.banding as banding_dba,d.teacherforeign as teacherforeign_dba,d.hkdsepassrate as hkdsepassrate_dba,");
		sql.append(" d.chipassrate as chipassrate_dba,d.engpassrate as engpassrate_dba,d.urate as urate_dba,d.alpassrate as alpassrate_dba, ");
		sql.append(" d.musicfirst as musicfirst_dba,d.musicsecond as musicsecond_dba,d.musicthird as musicthird_dba,d.musicother as musicother_dba, ");
		sql.append(" d.speechfirst as speechfirst_dba,d.speechsecond as speechsecond_dba,d.speechthird as speechthird_dba ");

		sql.append(" from bos.entity " +  tablealias_entity + ", bos.entity_dba " + tablealias_entity_dba);
		sql.append(" where a.id=d.id and a.categoryid=2 ");
		sql.append(" order by a.nameeng asc  ");
		theLogger.debug(sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getEntityList Result size " + result.size());
		return result;
	}
	public List<Map<String, Object>> getExtraList(final String id,final String categoryid,final String userid,final String action) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select CONCAT(a.name, ' ', a.nameeng) as fullname,");
		sql.append("a.id, a.coursekeywords,a.url,a.phone,a.address,a.email   ");
		sql.append(" from bos.entity a where a.categoryid=4 ");
		sql.append(" order by a.nameeng asc  ");
		theLogger.debug(sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getExtraList Result size " + result.size());
		return result;
	}
	public  List<Map<String, Object>> getFavoriteUserListByEntity(final String entityid) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select u.*, f.lastmodified as schooljoindate from favorite f, user u where f.userid=u.id and f.entityid=" + entityid);
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
				
	
		return result;
	}
	public Map<String, String> getUserFavoriteCount(final String entityids) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select entityid, count(1) as favoritecount from favorite f ");
		if(entityids !=null && entityids.trim().length() > 0)
		sql.append("where entityid in (" + entityids + ") ");
		sql.append("group by entityid ");
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		HashMap<String, String> resultMap = new HashMap<String, String>();
		if(result.size() > 0){
			for(int i=0; i < result.size(); i++ ){
				HashMap map = (HashMap) result.get(i);
				resultMap.put("" +map.get("entityid"), "" +map.get("favoritecount"));
			}
		}
		
	
		return resultMap;
	}
	public Map<String, String> getParentCommentCount(final String entityids) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select entityid, count(1) as noofcomment from comment c, entity e " );
		sql.append("where e.id = c.entityid  and type='polling' and userlike > 1 and grade > 0 ");
		if(entityids !=null && entityids.trim().length() > 0)
			sql.append(" and c.entityid in (" + entityids + ") ");
		sql.append("group by entityid ");
		Map temp = new HashMap();
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		HashMap<String, String> resultMap = new HashMap<String, String>();
		if(result.size() > 0){
			for(int i=0; i < result.size(); i++ ){
				HashMap map = (HashMap) result.get(i);
				resultMap.put("" +map.get("entityid"), "" +map.get("noofcomment"));
			}
		}
		
		return resultMap;
		
		
	}
	public int getInUserFavoriteList(final String entityid,final String userid) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select count(1) from favorite f ");
		sql.append("where entityid in (" + entityid + ") and userid=" + userid);
		
	
		return jdbcTemplate.queryForObject(sql.toString(), Integer.class);
	}
	public List<Map<String, Object>> getUserEntityList(final String id,final String categoryid,final String userid,final String action,final String roleid ) throws SQLException {

		StringBuffer sql = new StringBuffer();
		
		sql.append("select CONCAT(a.name, ' ', a.nameeng) as fullname, cu.inbox, a.enrolltotal,a.categoryid,a.chscid,a.name,a.nameeng,a.ranking,a.rankingfinancetype,a.rankingdistrict,a.id as entityid,a.score,a.financetype,a.poaschoolnet, l.description as categorydesc,a.url,b.userid, u.namelocal , b.grade,b.status,");
		sql.append("COALESCE(DATE_FORMAT(b.application,'%d %b %Y' )  ,'N/A') as application, COALESCE(DATE_FORMAT(b.interview,'%d %b %Y' )  ,'N/A') as interview ,");
		sql.append("COALESCE(DATE_FORMAT(b.announcement,'%d %b %Y' ) ,'N/A') as announcement, ");
		sql.append(" v.title, v.note, date_format(v.startdate,'%b') as shortmonth,date_format(v.startdate,'%a') as shortweekday,date_format(v.startdate,'%e') as shortday, ");
		sql.append(" n .hitcounter as viewedschool  ");
		sql.append("from bos.entity a left join (select * from event where  YEAR(startdate)=YEAR(CURDATE()) and active='y' and eventtype='application' ) v on (a.id=v.entityid) , bos.favorite b , bos.lookup l, user u, objectstat n, chatchanneluser cu  ");
		sql.append(" where a.id=b.entityid and a.categoryid=l.value and b.userid = u.id  ");
		sql.append(" and cu.chatchannelid=b.entityid and cu.userid=b.userid ");
		sql.append(" and l.type='entity.category.chi' ");
		sql.append(" and n.status='active' and n.type='entity' and n.objectid > 0 and  n.objectid = a.id  ");
		sql.append(!"-1".equalsIgnoreCase(categoryid) ? " and  a.categoryid ='"+ categoryid + "'": "");
		sql.append("favorite".equalsIgnoreCase(action) ? " and  b.userid ='"+ userid + "' ": "");
		sql.append(" order by b.userid, b.grade asc, a.nameeng asc  ");
		theLogger.debug(sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getUserEntityList Result size " + result.size());
		return result;
	}
	public List<Map<String, Object>> getNewsList(final String id, final String userid) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select a.*,b.* from bos.news a , bos.newscontent b where a.id = b.newsid ");
		//sql.append(!"-1".equalsIgnoreCase(userid) ? "and a.entityid in (select entityid from favorite where userid ='"+ userid + "') " : " " );
		//sql.append(!"-1".equalsIgnoreCase(id) ? " and  a.id =" + id : "");
		//sql.append(!"-1".equalsIgnoreCase(userid) ? " and  b.userid ='"+ userid + "' ": "");
		sql.append(" order by a.lastmodified asc, a.subject asc, b.seq asc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("Result size " + result.size());
		return result;
	}
	public List<Map<String, Object>> getTopEntity(final String categoryid) throws SQLException {
		
		return getTopEntity(categoryid,"10","30");
				
	}
	public List<Map<String, Object>> getTopEntity(final String categoryid,String period) throws SQLException {
		
		return getTopEntity(categoryid,"10",period);
				
	}
	public List<Map<String, Object>> getTopEntity(final String categoryid,String limit, String period) throws SQLException {

		StringBuffer sql = new StringBuffer();
		
		sql.append("select n.objectid as entityid, e.nameeng as nameeng, e.name as name, e.score as score, format(e.parentscore,1) as parentscore , e.financetype, n.hitcounter as viewedschool, n.hitcounter as schoolallocation, ");
		sql.append(" v.title, v.note, date_format(v.startdate,'%b') as shortmonth,date_format(v.startdate,'%a') as shortweekday,date_format(v.startdate,'%e') as shortday, e.chscid, e.categoryid   ");
		sql.append(" from objectstat n  , entity e left join (select * from event where YEAR(startdate)=YEAR(CURDATE()) and active='y' and eventtype='application' ) v on (e.id=v.entityid) ");
		sql.append("where n.status='active' and n.type='entity'  ");
		sql.append(" and n.objectid > 0 and  n.objectid = e.id and e.categoryid =" + categoryid + " " );
		if(!"0".equalsIgnoreCase(period))
			sql.append(" and n.lastmodified BETWEEN SYSDATE() - INTERVAL " +  period + " DAY AND SYSDATE()");
		sql.append(" order by n.hitcounter desc, e.score desc, e.name asc limit " + limit);
		
		theLogger.debug("Top SQL " + sql.toString());
		
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		theLogger.debug("Result size " + result.size());
		return result;
	}
	public int getEntityHitCount(final String entityid, final String type) throws SQLException {
		return 0;
        //return getEntityHitCount(entityid,type, "-1");
	}
	public int getEntityHitCount(final String entityid, final String type, String ip) throws SQLException {

        return 0;
        /*
		StringBuffer sql = new StringBuffer();
		String objectstatid="-1";
		sql.append("select hitcounter,id from objectstat where objectid=" + entityid + " and type='" + type + "' and status='active' order by hitcounter desc");
		theLogger.debug(sql.toString());
		
		int result =  0;
		try{
			List<Map<String, Object>> resultList = jdbcTemplate.queryForList(sql.toString());
			result =  Integer.parseInt("" + resultList.get(0).get("hitcounter"));
			objectstatid = "" + resultList.get(0).get("id");
			if(resultList.size() > 1){
				jdbcTemplate.update("delete from objectstat where objectid=" + entityid + " and type='" + type + "' and status='active' and hitcounter !=" + result);
			}
		}catch(Exception ex){
			//ex.printStackTrace();
			result = 0;
			objectstatid="-1";
		}
		
		
		
		updateEntityHitCount(entityid, type,result,ip, objectstatid);
		
		return result;
		*/
		
	}
	public int ipAudit(final String objectstatid, final String ip) throws SQLException {
		theLogger.debug("ipAudit " + objectstatid);
    	if( "-1".equalsIgnoreCase(objectstatid) ){
    		return 1;
    	}else{
			StringBuffer sql = new StringBuffer();
			
			sql.append("select id from ipaudit where objectstatid=" + objectstatid + " and ip='" + ip + "'  ");
			int ipauditid =  0;
			try{
				ipauditid = jdbcTemplate.queryForObject(sql.toString(), Integer.class);
			}catch(Exception ex){
				//ex.printStackTrace();
				ipauditid = 0;
			}
			//Is it viewed at least once before ?
			sql = new StringBuffer();
			if(ipauditid > 0){
				sql.append("select id from ipaudit where objectstatid=" + objectstatid + " and ip='" + ip + "' and lastmodified <= DATE_SUB(curdate(), INTERVAL 1 DAY) ");
				theLogger.debug("vote today ? " +  sql.toString());
				try{
					ipauditid = jdbcTemplate.queryForObject(sql.toString(), Integer.class);
				}catch(Exception ex){
					//ex.printStackTrace();
					ipauditid = 0;
				}
				theLogger.debug("vote today result ? " +  ipauditid );
				if(ipauditid > 0){
					sql = new StringBuffer();
					sql.append("update ipaudit set lastmodified=now() where id=" + ipauditid + " ");
					jdbcTemplate.update(sql.toString());
				}
			}else{
				sql = new StringBuffer();
				sql.append("insert into bos.ipaudit (objectstatid,ip,lastmodified,created) values(" + objectstatid + ", '" + ip + "', now(), now()) ");
				jdbcTemplate.update(sql.toString());
				ipauditid = 1;
			}
			
	
			return ipauditid;
    	}
	}
	
    public List<Map<String, Object>> getEntity(final HashMap<String,String> searchMap) throws SQLException {
    	return getEntity(searchMap, "n");
    }
    public List<Map<String, Object>> getEntity(final HashMap<String,String> searchMap, String allfields) throws SQLException {

		theLogger.debug("getEntity searchMap: " + searchMap);
		
		StringBuffer sql = new StringBuffer();
		sql.append("select a.id as id, a.id as entityid,a.score as entityscore, CONCAT(a.name, '  ', a.nameeng) as fullname ,l.description as categoryname,a.lastmodified as lastmodified, a.categoryid, a.name,a.nameeng,a.chscid,a.schoolfee,a.ranking,  ");
		if("y".equalsIgnoreCase(allfields)){
			sql.append(" a.*, eb.schoolsystem ,eb.feature,eb.iskindergarten,eb.isprimary,eb.issecondary,eb.primaryprogramme,eb.middleprogramme ,eb.diplomaprogramme ,eb.govbody,eb.schoolsystemdesc, ");
		}
		sql.append("(select count(1)  from user u where u.kidentityid=a.id) as noofparentregistered ,  ");
		//sql.append("metric1 as rating1, metric2 as rating2, metric3 as rating3, metric4 as rating4, metric5 as rating5, metric6 as rating6, ");
		
		sql.append("IF(avg(metric1) > 0 , round(avg(metric1),1) , '?')  as metric1, ");
		sql.append("IF(avg(metric2) > 0 , round(avg(metric2),1) , '?')  as metric2, ");
		sql.append("IF(avg(metric3) > 0 , round(avg(metric3),1) , '?')  as metric3, ");
		sql.append("IF(avg(metric4) > 0 , round(avg(metric4),1) , '?')  as metric4, ");
		sql.append("IF(avg(metric5) > 0 , round(avg(metric5),1) , '?')  as metric5, ");
		sql.append("IF(avg(metric6) > 0 , round(avg(metric6),1) , '?')  as metric6, ");

        sql.append("avg(metric1) as avgm1,avg(metric2) as avgm2,avg(metric3) as avgm3,avg(metric4) as avgm4,avg(metric5) as avgm5,avg(metric6) as avgm6, ");
		sql.append(" CAST((avg(b.metric1 * 3) + avg(b.metric2) + avg(b.metric3) + avg(b.metric4) + avg(b.metric5))/7 AS DECIMAL(10,2)) as score, ");
		sql.append(" CAST((avg(b.metric1 * 3) + avg(b.metric2) + avg(b.metric3) + avg(b.metric4) + avg(b.metric5))/7 AS DECIMAL(10,2)) as score2, ");
		sql.append(" CAST((avg(b.metric1 * 3) + avg(b.metric4) + avg(b.metric5))/5 AS DECIMAL(10,2)) as score3 ");
		sql.append("from entity a, entitybasic eb,  comment b, lookup l where a.id = b.entityid and a.id=eb.entityid and eb.isclosed='n' and a.categoryid=l.value and l.type='entity.category' and b.userid=1 and b.type='system' " );
		sql.append(searchMap.get("idnotin") != null ? " and  a.id not in("+ searchMap.get("idnotin") + ") " : "");
		sql.append(searchMap.get("sexopposite") != null ? " and  a.sex <> '" + searchMap.get("sexopposite")   + "' " : "");
		sql.append(searchMap.get("categoryid") != null ? " and  a.categoryid in("+ searchMap.get("categoryid") + ") ": "");
		sql.append(searchMap.get("schoolname") != null && ! "-1".equalsIgnoreCase(searchMap.get("schoolname")) ? " and ( name like '%"+ quote(searchMap.get("schoolname")) + "%' ": "");
		sql.append(searchMap.get("schoolname") != null && ! "-1".equalsIgnoreCase(searchMap.get("schoolname")) ? " or  lower(nameeng) like '%"+ quote(searchMap.get("schoolname").toLowerCase()) + "%' ) ": "");
		sql.append(searchMap.get("yearofcommencement") != null && ! "-1".equalsIgnoreCase(searchMap.get("yearofcommencement")) ? " and  YEAR(CURDATE()) - CAST(`yearofcommencement` AS DECIMAL(10,2))  > "+ searchMap.get("yearofcommencement") + " ": "");
		sql.append(searchMap.get("nominated") != null && ! "-1".equalsIgnoreCase(searchMap.get("nominated")) ? " and  length(nominated) > 0  ": "");
		sql.append(searchMap.get("throughtrain") != null && ! "-1".equalsIgnoreCase(searchMap.get("throughtrain")) ? " and  length(throughtrain) > 0 ": "");
		sql.append(searchMap.get("feeder") != null && ! "-1".equalsIgnoreCase(searchMap.get("feeder")) ? " and  length(feeder) > 0 ": "");
		sql.append(searchMap.get("district") != null && ! "-1".equalsIgnoreCase(searchMap.get("district")) ? " and  poaschoolnet = '"+ quote(searchMap.get("district")) + "' ": "");
		sql.append(searchMap.get("poaschoolnet") != null && ! "-1".equalsIgnoreCase(searchMap.get("poaschoolnet")) ? " and  poaschoolnet ='"+ quote(searchMap.get("poaschoolnet")) + "' ": "");
		sql.append(searchMap.get("poaschoolnets") != null && ! "-1".equalsIgnoreCase(searchMap.get("poaschoolnets")) ? " and  poaschoolnet in ("+ quote(searchMap.get("poaschoolnets")) + ") ": ""); // For primary school mutiliple poaschoolnet
		sql.append(searchMap.get("financetype") != null && ! "-1".equalsIgnoreCase(searchMap.get("financetype")) ? " and  financetype = '"+ quote(searchMap.get("financetype")) + "' ": "");
        sql.append(searchMap.get("financetypeGroup") != null && ! "-1".equalsIgnoreCase(searchMap.get("financetypeGroup")) ? " and  financetype  "+ searchMap.get("financetypeGroup") + "  ": "");


        sql.append(searchMap.get("nursery") != null && ! "-1".equalsIgnoreCase(searchMap.get("nursery")) ? " and  lower(nursery) ='yes'  and categoryid=0  " : "");
		sql.append(searchMap.get("schoolsystem") != null && ! "-1".equalsIgnoreCase(searchMap.get("schoolsystem")) ? " and  eb.schoolsystem='" +  searchMap.get("schoolsystem") + "'   " : "");
        sql.append(searchMap.get("rankingyear") != null ? " and  b.year<=" + searchMap.get("rankingyear") + " " : "");
        sql.append(searchMap.get("metric1") != null ? " and  metric1  >= " + searchMap.get("metric1") + "  " : "");
        sql.append(searchMap.get("ranking") != null && ! "-1".equalsIgnoreCase(searchMap.get("ranking")) ? " and  ranking  between " + (Integer.parseInt(searchMap.get("ranking")) - RANKING_BETWEEN_MIN) + " and  " + searchMap.get("ranking") : "");
        sql.append(searchMap.get("rankingdistrict") != null && ! "-1".equalsIgnoreCase(searchMap.get("rankingdistrict")) ? " and  rankingdistrict  between " + (Integer.parseInt(searchMap.get("rankingdistrict")) - RANKING_BETWEEN_MIN) +  " and  " + searchMap.get("rankingdistrict") : "");
        sql.append(searchMap.get("rankingfinancetype") != null && ! "-1".equalsIgnoreCase(searchMap.get("rankingfinancetype")) ? " and  rankingfinancetype  between " + (Integer.parseInt(searchMap.get("rankingfinancetype")) - RANKING_BETWEEN_MIN) + " and " + searchMap.get("rankingfinancetype")  : "");

        sql.append(searchMap.get("staticcompareid") != null && ! "-1".equalsIgnoreCase(searchMap.get("staticcompareid")) ? " and  a.id in (  " +  searchMap.get("staticcompareid") + " ) " : " ");




		sql.append(" group by a.id, a.name ,a.score,a.ranking  ");
		if(searchMap.get("sortby") != null){  // update ranking ... 
			sql.append(" order by " + searchMap.get("sortby") + " "  + searchMap.get("sortorder"));
		}
		else if(searchMap.get("reporttype") != null){ // for top100 kindergarten, primary school and secondary school
			if(searchMap.get("categoryid") != null && "0".equalsIgnoreCase(searchMap.get("categoryid")) ){  
				sql.append(" order by  ranking asc ");
			}else{
				sql.append(" order by ranking asc ");
			}
		}else{
			if(searchMap.get("categoryid") != null && "0".equalsIgnoreCase(searchMap.get("categoryid")) ){  
				sql.append(" order by " + ("y".equalsIgnoreCase(searchMap.get("searchmodeactive")) ? "poaschoolnet asc, " : "" ) + " score3 desc ");
			}else if(searchMap.get("categoryid") != null && "5".equalsIgnoreCase(searchMap.get("categoryid")) ){  
				sql.append(" order by nameeng asc ");
			}else{
				sql.append(" order by " + ("y".equalsIgnoreCase(searchMap.get("searchmodeactive")) ? "poaschoolnet asc, " : "" ) + " score desc ");
			}
		}
		sql.append(searchMap.get("limit") != null ? " limit "+ searchMap.get("limit") + " " : "");
		theLogger.debug("generate comment get entity : " + sql.toString());

		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());

		return result;
	}
	public List<Map<String, Object>> getEntityLastYear(final HashMap<String,String> searchMap) throws SQLException {
		String lastyear="";
		boolean showlastyear = false;
		
		String rankingyear = getRankingYear();
		try{
			lastyear = "" + (Integer.parseInt(rankingyear) -1);
		}catch(Exception ex){
			lastyear="2012";
		}
		theLogger.debug("getEntityLastYear searchMap: " + searchMap);
		if(searchMap.get("lastyearrecord") != null && "y".equalsIgnoreCase(searchMap.get("lastyearrecord")) ){
			showlastyear=true;
		}
		StringBuffer sql = new StringBuffer();
		sql.append("select a.id as id, a.id as entityid,a.score as entityscore, a.poaschoolnet ,l.description as categoryname,a.lastmodified as lastmodified, a.categoryid, a.name,a.nameeng,a.chscid,a.schoolfee,a.ranking,lastyearranking as lastyearranking2,a.session,a.rankingdistrict, lastyearrankingdistrict,  ");
		
		if(showlastyear){
			sql.append(" lastyearscore,lastyearscore2,lastyearscore3,lastyearranking, ");
			sql.append("IF(lastyearmetric1 > 0 , round(lastyearmetric1,1) , '?')  as lastyearmetric1, ");
			sql.append("IF(lastyearmetric2 > 0 , round(lastyearmetric2,1) , '?')  as lastyearmetric2, ");
			sql.append("IF(lastyearmetric3 > 0 , round(lastyearmetric3,1) , '?')  as lastyearmetric3, ");
			sql.append("IF(lastyearmetric4 > 0 , round(lastyearmetric4,1) , '?')  as lastyearmetric4, ");
			sql.append("IF(lastyearmetric5 > 0 , round(lastyearmetric5,1) , '?')  as lastyearmetric5, ");
		}
        sql.append(" currentyearscore,currentyearscore2,currentyearscore3,currentyearranking, ");
        sql.append("IF(currentyearmetric1 > 0 , round(currentyearmetric1,1) , '?')  as currentyearmetric1, ");
        sql.append("IF(currentyearmetric2 > 0 , round(currentyearmetric2,1) , '?')  as currentyearmetric2, ");
        sql.append("IF(currentyearmetric3 > 0 , round(currentyearmetric3,1) , '?')  as currentyearmetric3, ");
        sql.append("IF(currentyearmetric4 > 0 , round(currentyearmetric4,1) , '?')  as currentyearmetric4, ");
        sql.append("IF(currentyearmetric5 > 0 , round(currentyearmetric5,1) , '?')  as currentyearmetric5, ");

        sql.append("IF(avg(metric1) > 0 , round(avg(metric1),1) , '?')  as metric1, ");
		sql.append("IF(avg(metric2) > 0 , round(avg(metric2),1) , '?')  as metric2, ");
		sql.append("IF(avg(metric3) > 0 , round(avg(metric3),1) , '?')  as metric3, ");
		sql.append("IF(avg(metric4) > 0 , round(avg(metric4),1) , '?')  as metric4, ");
		sql.append("IF(avg(metric5) > 0 , round(avg(metric5),1) , '?')  as metric5, ");
		sql.append("IF(avg(metric6) > 0 , round(avg(metric6),1) , '?')  as metric6, ");
		sql.append(" CAST((avg(b.metric1 * 3) + avg(b.metric2) + avg(b.metric3) + avg(b.metric4) + avg(b.metric5))/7 AS DECIMAL(10,1)) as score, ");
		sql.append(" CAST((avg(b.metric1 * 3) + avg(b.metric2) + avg(b.metric3) + avg(b.metric4) + avg(b.metric5))/7 AS DECIMAL(10,2)) as score2, ");
		sql.append(" CAST((avg(b.metric1 * 3) + avg(b.metric4) + avg(b.metric5))/5 AS DECIMAL(10,2)) as score3 ");
		sql.append("from entity a, entitybasic eb,  comment b, lookup l ");
		
		//if(showlastyear){
			sql.append(", (select a.entityid, metric1 as lastyearmetric1,metric2 as lastyearmetric2,metric3 as lastyearmetric3,metric4 as lastyearmetric4,metric5 as lastyearmetric5, ranking as lastyearranking, score as lastyearscore, rankingdistrict as lastyearrankingdistrict, ");
            sql.append(" CAST((metric1 * 3 + metric2 + metric3 + metric4 + metric5)/7 AS DECIMAL(10,2)) as lastyearscore2, ");
            sql.append(" CAST((metric1 * 3 + metric4 + metric5)/5 AS DECIMAL(10,2)) as lastyearscore3  ");
            sql.append(" from entityscore a, comment b where a.entityid=b.entityid and b.userid=1 and b.type='system' and a.year=" + lastyear + " and b.year=" + lastyear + (searchMap.get("categoryid") != null ? " and  a.categoryid in("+ searchMap.get("categoryid") + ") ": "") + "  ) es ");
            sql.append(", (select a.entityid, metric1 as currentyearmetric1,metric2 as currentyearmetric2,metric3 as currentyearmetric3,metric4 as currentyearmetric4,metric5 as currentyearmetric5, ranking as currentyearranking, score as currentyearscore, ");
            sql.append(" CAST((metric1 * 3 + metric2 + metric3 + metric4 + metric5)/7 AS DECIMAL(10,2)) as currentyearscore2, ");
            sql.append(" CAST((metric1 * 3 + metric4 + metric5)/5 AS DECIMAL(10,2)) as currentyearscore3  ");
            sql.append(" from entityscore a, comment b where a.entityid=b.entityid and b.userid=1 and b.type='system' and a.year=" + rankingyear + " and b.year=" + rankingyear + (searchMap.get("categoryid") != null ? " and  a.categoryid in("+ searchMap.get("categoryid") + ") ": "") + "  ) escurrent ");
        //}
		//}
		sql.append(" where a.id = b.entityid and eb.isclosed='n' and a.id=eb.entityid and  a.categoryid=l.value and l.type='entity.category' and b.userid=1 and b.type='system' " );
		//if(showlastyear){
			sql.append(" and a.id=es.entityid and a.id=escurrent.entityid ");
		//}
		
		sql.append(searchMap.get("idnotin") != null ? " and  a.id not in("+ searchMap.get("idnotin") + ") " : "");
		sql.append(searchMap.get("sexopposite") != null ? " and  a.sex <> '" + searchMap.get("sexopposite")   + "' " : "");
		sql.append(searchMap.get("categoryid") != null ? " and  a.categoryid in("+ searchMap.get("categoryid") + ") ": "");
		sql.append(searchMap.get("schoolname") != null && ! "-1".equalsIgnoreCase(searchMap.get("schoolname")) ? " and ( name like '%"+ quote(searchMap.get("schoolname")) + "%' ": "");
		sql.append(searchMap.get("schoolname") != null && ! "-1".equalsIgnoreCase(searchMap.get("schoolname")) ? " or  lower(nameeng) like '%"+ quote(searchMap.get("schoolname").toLowerCase()) + "%' ) ": "");
		sql.append(searchMap.get("yearofcommencement") != null && ! "-1".equalsIgnoreCase(searchMap.get("yearofcommencement")) ? " and  YEAR(CURDATE()) - CAST(`yearofcommencement` AS DECIMAL(10,2))  > "+ searchMap.get("yearofcommencement") + " ": "");
		sql.append(searchMap.get("nominated") != null && ! "-1".equalsIgnoreCase(searchMap.get("nominated")) ? " and  length(nominated) > 3  ": "");
		sql.append(searchMap.get("throughtrain") != null && ! "-1".equalsIgnoreCase(searchMap.get("throughtrain")) ? " and  length(throughtrain) > 3 ": "");
		sql.append(searchMap.get("feeder") != null && ! "-1".equalsIgnoreCase(searchMap.get("feeder")) ? " and  length(feeder) > 3 ": "");
		sql.append(searchMap.get("district") != null && ! "-1".equalsIgnoreCase(searchMap.get("district")) ? " and  poaschoolnet = '"+ quote(searchMap.get("district")) + "' ": "");
		sql.append(searchMap.get("poaschoolnet") != null && ! "-1".equalsIgnoreCase(searchMap.get("poaschoolnet")) ? " and  poaschoolnet ='"+ quote(searchMap.get("poaschoolnet")) + "' ": "");
		sql.append(searchMap.get("poaschoolnets") != null && ! "-1".equalsIgnoreCase(searchMap.get("poaschoolnets")) ? " and  poaschoolnet in ("+ quote(searchMap.get("poaschoolnets")) + ") ": ""); // For primary school mutiliple poaschoolnet
		sql.append(searchMap.get("financetype") != null && ! "-1".equalsIgnoreCase(searchMap.get("financetype")) ? " and  financetype = '"+ quote(searchMap.get("financetype")) + "' ": "");
		sql.append(searchMap.get("nursery") != null && ! "-1".equalsIgnoreCase(searchMap.get("nursery")) ? " and  lower(nursery) ='yes'  and categoryid=0  " : "");
		sql.append(searchMap.get("schoolsystem") != null && ! "-1".equalsIgnoreCase(searchMap.get("schoolsystem")) ? " and  eb.schoolsystem='" +  searchMap.get("schoolsystem") + "'   " : "");
		sql.append(searchMap.get("entityid") != null && ! "-1".equalsIgnoreCase(searchMap.get("entityid")) ? " and  a.id='" +  searchMap.get("entityid") + "'   " : "");
		
		sql.append(" group by a.id, a.name ");
		if(searchMap.get("sortby") != null){  // update ranking ... 
			sql.append(" order by " + searchMap.get("sortby") + " "  + searchMap.get("sortorder"));
		}
		else if(searchMap.get("reporttype") != null){ // for top100 kindergarten, primary school and secondary school
			if(searchMap.get("categoryid") != null && "0".equalsIgnoreCase(searchMap.get("categoryid")) ){  
				sql.append(" order by  ranking asc ");
			}else{
				sql.append(" order by ranking asc ");
			}
		}else{
			if(searchMap.get("categoryid") != null && "0".equalsIgnoreCase(searchMap.get("categoryid")) ){  
				sql.append(" order by " + ("y".equalsIgnoreCase(searchMap.get("searchmodeactive")) ? "poaschoolnet asc, " : "" ) + " score3 desc ");
			}else if(searchMap.get("categoryid") != null && "5".equalsIgnoreCase(searchMap.get("categoryid")) ){  
				sql.append(" order by nameeng asc ");
			}else{
				sql.append(" order by " + ("y".equalsIgnoreCase(searchMap.get("searchmodeactive")) ? "poaschoolnet asc, " : "" ) + " score desc ");
			}
		}
		sql.append(searchMap.get("limit") != null ? " limit "+ searchMap.get("limit") + " " : "");
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getEntityLastYear" + sql.toString());
		return result;
	}
	public List<Map<String, Object>> getReverseEntityList(final HashMap<String,String> searchMap) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select categoryid, name from entity where id =" + searchMap.get("entityid")  );
		Map tmp = jdbcTemplate.queryForMap(sql.toString());
		
		sql = new StringBuffer();
		
		sql.append("(select a.id as entityid, CONCAT(a.name, ' ', a.nameeng) as fullname , a.name,a.nameeng, a.score,a.chscid,a.categoryid,'-1' as allocationyear ,  ");
		sql.append("'Y' as throughtrain, ");
		sql.append("'N' as nominated, ");
		sql.append("'N' as feeder, ");
		sql.append("'999' as schoolallocation ");
		sql.append("from entity a where throughtrain like '%" + tmp.get("name") + "%'  ) ");
		sql.append(" union all ");
		sql.append("(select a.id as entityid, CONCAT(a.name, ' ', a.nameeng) as fullname , a.name,a.nameeng, a.score,a.chscid,a.categoryid,'-1' as allocationyear , ");
		sql.append("'N' as throughtrain, ");
		sql.append("'Y' as nominated, ");
		sql.append("'N' as feeder, ");
		sql.append("'999' as schoolallocation ");
		sql.append("from entity a where  nominated  like '%" + tmp.get("name") + "%'  ) ");
		sql.append(" union all ");
		sql.append("(select a.id as entityid, CONCAT(a.name, ' ', a.nameeng) as fullname , a.name,a.nameeng, a.score,a.chscid,a.categoryid,'-1' as allocationyear , ");
		sql.append("'N' as throughtrain, ");
		sql.append("'N' as nominated, ");
		sql.append("'Y' as feeder, ");
		sql.append("'999' as schoolallocation ");
		sql.append("from entity a where  feeder  like '%" + tmp.get("name") + "%'  ) ");
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());

		theLogger.debug("Through train size " + result.size());
		
		sql = new StringBuffer();
		sql.append("select a.id as entityid, CONCAT(a.name, ' ', a.nameeng) as fullname , a.name,a.nameeng, a.score,a.chscid,a.categoryid,s.allocationyear,  ");
		sql.append("'N' as throughtrain, ");
		sql.append("'N' as nominated, ");
		sql.append("'N' as feeder, ");
		sql.append(" noofstudent as schoolallocation ");
		sql.append("from entity a , schoolallocation s where  a.categoryid=" + (Integer.parseInt((String) tmp.get("categoryid"))  - 1)  + " and a.id=s.entityidfrom ");
		sql.append(searchMap.get("entityid") != null ? " and  s.entityidto ="+ searchMap.get("entityid") + " ": "");
        sql.append(searchMap.get("allocationyear") != null && ! "-1".equalsIgnoreCase(searchMap.get("allocationyear"))  ? " and  s.allocationyear ="+ searchMap.get("allocationyear") + " ": "");
        sql.append("  order by allocationyear desc, cast(noofstudent AS DECIMAL(10,2)) desc  ");

        theLogger.debug("getReverseEntityList: {} " , sql.toString());


        result.addAll(jdbcTemplate.queryForList(sql.toString()));
		
		return result;
	}
	public Map<String, Object> getCommentCount() throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select c.entityid as entityid, count(c.entityid) as noofcomment from comment c, entity e " );
		sql.append("where e.id = c.entityid  ");
		sql.append(" group by entityid " );
		HashMap resultMap = new HashMap();
		Map temp = new HashMap();
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		
		for (int i=0; i<result.size(); i++ ){
			temp = result.get(i);
			//theLogger.debug("" + (Integer) temp.get("entityid")   +" , " +  (Long) temp.get("noofcomment"));
			resultMap.put( "" + (Integer) temp.get("entityid")    , "" + (Long) temp.get("noofcomment") );  
		}
		return resultMap;
		
		
	}
	public Map<String, Object> getFavoriteCount() throws SQLException {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Map temp = new HashMap();
		List<Map<String, Object>> tmp = getTopEntity("0");
		tmp.addAll( getTopEntity("1"));
		tmp.addAll( getTopEntity("2"));
		tmp.addAll( getTopEntity("4"));
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<tmp.size(); i++){
			resultMap.put( "" + tmp.get(i).get("entityid")    , "0" );  
			sb.append(tmp.get(i).get("entityid") + ",");
		}
		sb.append("-1");
		
		StringBuffer sql = new StringBuffer();
		sql.append("select c.entityid as entityid, count(c.entityid) as nooffavorite from favorite c, entity e " );
		sql.append("where e.id = c.entityid  ");
		sql.append("and e.id in (" + sb.toString() + ")  ");
		sql.append(" group by entityid " );
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		
		for (int i=0; i<result.size(); i++ ){
			temp = result.get(i);
			theLogger.debug(temp.get("entityid")   +" , " +  (Long) temp.get("nooffavorite"));
			resultMap.put( (String) temp.get("entityid")    , "" + (Long) temp.get("nooffavorite") );  
		}
		return resultMap;
		
		
	}
	public int getFavoriteCount(String userid) throws SQLException{
    			
			return	jdbcTemplate.queryForObject("select count(1) from bos.favorite where userid='" + userid + "'", Integer.class);
					
	}
    public int getPrevNextEntity(String type, String entityid, String navtype) throws SQLException{
		// navtype = ranking / rankingfinancetype / rankingpoaschoolnet

        String SQL = "";
		SQL = "select id from bos.entity where " + navtype + "=(select " + navtype + " " + ("prev".equalsIgnoreCase(type) ? "-1" : "+1"  ) + " from bos.entity where id=" + entityid + ") and categoryid=(select categoryid from bos.entity where id=" + entityid + " )";
        if("rankingfinancetype".equalsIgnoreCase(navtype) ){
			SQL += "and financetype=(select financetype from bos.entity where id=" + entityid + " ) ";
		}
		if("rankingdistrict".equalsIgnoreCase(navtype)){
			SQL += "and poaschoolnet=(select poaschoolnet from bos.entity where id=" + entityid + " ) ";
		}

        return	jdbcTemplate.queryForObject(SQL, Integer.class);
		
	}
	
	
    public void saveFavorite(ArrayList<Map<String, String>> favorite) throws SQLException{
    	try {
			
			for (Iterator<Map<String, String>> i = favorite.iterator(); i.hasNext(); ){
				Map<String, String> entity = (Map<String, String>) i.next();

				if("dislike".equalsIgnoreCase((String) entity.get("action"))){
		    		jdbcTemplate.update("delete from bos.favorite where userid='" + quote(favorite.get(0).get("userid")) + "' and entityid='"+quote((String) entity.get("favoriteid")) +"'" );
				}else{
				
					int iExisting = jdbcTemplate.queryForObject("select count(1) from bos.favorite where entityid='" + quote((String) entity.get("favoriteid")) + "' and userid='" + entity.get("userid") + "'", Integer.class);
					
					if(iExisting < 1){
						StringBuffer sql = new StringBuffer();
						sql.append("insert into bos.favorite(userid,categoryid,entityid) values( ");
						sql.append("'" + quote((String) entity.get("userid")) + "',");
						sql.append("'" + quote((String) entity.get("categoryid")) + "',");
						sql.append("'" + quote((String) entity.get("favoriteid")) + "')");
						jdbcTemplate.update(sql.toString());
					}
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
    }
	public void synchronize(String action,String userid) throws SQLException {
		if(isAdmin(userid)){
		try {
			boolean FIELD_UPDATED = false;

			//Fields for entityscore only, not entity
            HashMap<String,String> fields = new  HashMap <String,String>();
            fields.put("area", "y");
            fields.put("schoolfee", "y");
            fields.put("schoolfeenursery", "y");
            fields.put("tuitionfee", "y");
            fields.put("noofclassroom", "y");
            fields.put("noofhall", "y");
            fields.put("noofplayground", "y");
            fields.put("nooflibraryroom", "y");
            fields.put("teacherexperience", "y");
            fields.put("teachermaster", "y");
            fields.put("teacherbachelor", "y");
            fields.put("musicroom", "y");
            fields.put("outdoorplayground", "y");
            fields.put("indoorplayground", "y");
            fields.put("teacherpupilam", "y");
            fields.put("teacherpupilpm", "y");
            fields.put("qareport", "y");
            fields.put("qareporturl", "y");
            fields.put("voucher", "y");
            fields.put("nooftest", "y");
            fields.put("noofexam", "y");
            fields.put("elite", "y");
            fields.put("noofotherroom", "y");



			String categoryid = "0";
            String year="" + getRankingYear();
			theLogger.info("synchronize start 01-Jun: {} -- {} ",action, year);

            int maxRecordKindergaretn=2000;
			//int maxRecordKindergaretn=1;
			int maxRecordPrimary=600;
			int maxRecordSecondary=510;
			int currentRecord=1;
			int nextRecord=100;
			
			int maxRecord=0;
			if("primary".equalsIgnoreCase(action)){
				maxRecord=maxRecordPrimary;
				categoryid = "1";
			}else if("secondary".equalsIgnoreCase(action)){
				maxRecord=maxRecordSecondary;
				categoryid = "2";
			}else{
                currentRecord=5600;
                maxRecord=currentRecord + maxRecordKindergaretn;
				categoryid = "0";
				//theLogger.info("action {} currentrecord {} , nextrecord {} categoryid{}" ,action,  currentRecord, nextRecord, categoryid);

			}
			
			while(currentRecord < maxRecord){
				ArrayList<Map<String, Object>> entityList;
				
					if("primary".equalsIgnoreCase(action)){
						entityList = (ArrayList<Map<String, Object>>) spider.onWeb(currentRecord,currentRecord + nextRecord);
					}else if("secondary".equalsIgnoreCase(action)){
						entityList = (ArrayList<Map<String, Object>>) spiders.onWeb(currentRecord,currentRecord + nextRecord);
					}else{
						theLogger.debug("spider kindergarten currentrecord {} , nextrecord {}" , currentRecord, currentRecord + nextRecord);
						entityList = (ArrayList<Map<String, Object>>) spiderk.onWeb(currentRecord,currentRecord +nextRecord);
					}
					theLogger.debug("synchronize {} - size {} ", action , entityList.size());
					for(Map<String,Object> entitymap : entityList){
						StringBuffer entitydesc = new StringBuffer();
						for (String key : entitymap.keySet()) {
							entitydesc.append("DAO " + key + ":" +  entitymap.get(key)).append("\n");
						}
						if("541".equalsIgnoreCase( (String) entitymap.get("chscid")))
							theLogger.info(entitydesc.toString());
					}


					for (Iterator <Map<String, Object>> i = entityList.iterator(); i.hasNext(); ){

						Map<String, Object> entity = (Map<String, Object>) i.next();
						//Check for empty entity
                        if(entity.containsKey("name")){
                            int iExistingEntity = jdbcTemplate.queryForObject("select count(1) from bos.entity where chscid='" + quote((String) entity.get("chscid")) + "' and categoryid='" + categoryid + "'" , Integer.class );
							//theLogger.info("new entity{},  chscid:{} " , entity.get("name"),  entity.get("chscid"));
                            StringBuffer sqlName = new StringBuffer();
                            StringBuffer sqlValue = new StringBuffer();

                            if(iExistingEntity < 1){
                                sqlName.append("insert into bos.entity(ranking, ");
                                sqlValue.append(" values(999, ");
                                for (String key : entity.keySet()) {
                                    sqlName.append(key + ",");
                                    sqlValue.append("'" + quote(entity.get(key)) + "',");
                                }
                                sqlName.deleteCharAt(sqlName.length() - 1).append(")");
                                sqlValue.deleteCharAt(sqlValue.length() - 1).append(")");
                            }else{
                                sqlName.append("update bos.entity set ");
                                for (String key : entity.keySet()) {
                                    if(!key.equalsIgnoreCase("name"))
										sqlName.append(key + "='").append(quote(entity.get(key)) + "',");
                                }
                                sqlName.deleteCharAt(sqlName.length() - 1).append(" where chscid='" + quote((String) entity.get("chscid")) + "' and categoryid='" + categoryid + "'");
                            }
                            if("541".equalsIgnoreCase( (String) entity.get("chscid")))
                                theLogger.info(sqlName.toString() + sqlValue.toString());
                            try{
                                if(iExistingEntity  > 0)
                            		jdbcTemplate.update(sqlName.toString() + sqlValue.toString());
                                else
									jdbcTemplate.update(sqlName.toString() + sqlValue.toString());
							//	System.out.println(sqlName.toString() + sqlValue.toString());

							}catch(Exception ex){
                                ex.printStackTrace();
                                theLogger.debug("synchronize exception:" + entity.get("chscid"));
                            }

                            // Todo need to insert basicentity , entityscore all years and comment all years
                            sqlName = new StringBuffer();
                            sqlValue = new StringBuffer();

                            int entityid=0;
                            try{
                                entityid = jdbcTemplate.queryForObject("select id from bos.entity where chscid='" + quote((String) entity.get("chscid")) + "' and categoryid='" + categoryid + "'" , Integer.class );
                            }catch(Exception ex){

                            }
                            if(entityid > 0){

                            	theLogger.debug("processing entityid: {}" , entityid);

                                if(iExistingEntity < 1){
                                    jdbcTemplate.update("insert into entitybasic (entityid,lastmodified,isclosed) values(" + entityid +",now(),'n')");
                                    for(int j = 2011; j<= Integer.parseInt(year); j++){
                                        jdbcTemplate.update("insert into comment (entityid,metric1,metric2,metric3,metric4,metric5,year,comment,type,userid,lastmodified,created) values(" + entityid +",0,0,0,0,0," + j + ",'N/A','system',1,now(),now())");
                                    	theLogger.info("insert into comment (entityid,metric1,metric2,metric3,metric4,metric5,year,comment,type,userid,lastmodified,created) values(" + entityid +",0,0,0,0,0," + j + ",'N/A','system',1,now(),now())");
                                    }
                                }

                                int iExistingEntityScore = jdbcTemplate.queryForObject("select count(1) from bos.entityscore where entityid=" + entityid + " and year=" + year, Integer.class  );


                                if(iExistingEntityScore < 1){
									int commentcount = (iExistingEntity < 1 ? 2011 : Integer.parseInt(year));
                                    for( int j = commentcount ; j<= Integer.parseInt(year); j++){
                                        sqlName.append("insert into bos.entityscore(entityid,year,lastmodified,categoryid,ranking,");
                                        sqlValue.append(" values(" + entityid + "," + j + ",now()," + categoryid + ",999,"  );
                                        for (String key : entity.keySet()) {
                                            if(fields.containsKey(key)){
                                                sqlName.append(key + ",");
                                                sqlValue.append("'" + quote(entity.get(key)) + "',");
                                            }
                                        }
                                        sqlName.deleteCharAt(sqlName.length() - 1).append(")");
                                        sqlValue.deleteCharAt(sqlValue.length() - 1).append(")");
                                        theLogger.info(sqlName.toString() + sqlValue.toString());
                                        jdbcTemplate.update(sqlName.toString() + sqlValue.toString());
                                        sqlName = new StringBuffer();
                                        sqlValue = new StringBuffer();

                                    }
                                }else{
                                    FIELD_UPDATED = false;
                                    sqlName.append("update bos.entityscore set ");
                                    for (String key : entity.keySet()) {
                                        if(fields.containsKey(key)){
                                            sqlName.append(key + "='").append(quote(entity.get(key)) + "',");
                                            FIELD_UPDATED = true;
                                        }
                                    }
                                    sqlName.deleteCharAt(sqlName.length() - 1).append(" where entityid=" + entityid + " and year=" + year  );
                                    if(FIELD_UPDATED){
                                        jdbcTemplate.update(sqlName.toString() + sqlValue.toString());
                                        if("3932".equalsIgnoreCase("" + entityid))
                                            theLogger.info(sqlName.toString() + sqlValue.toString());
                                    }
                                }


                            }
                        }//Check for empty entity
                    }//End of for loop
					currentRecord += nextRecord;
				theLogger.debug("currentRecord: {} " , currentRecord);

			} // end of while loop
			theLogger.info("last record ");

			jdbcTemplate.update("update bos.entity set lastmodified=current_timestamp where categoryid='" + categoryid + "'");
			jdbcTemplate.update("update entity set session='\u5168\u65E5' where session='\u5168\uFFFD'");
			jdbcTemplate.update("update entity set session='\u5168\u65E5' where session='\u5168\uFFFD\uFFFD'");
			jdbcTemplate.update("update entity set session='\u5168\u65E5' where session='\uFFFD\u65E5'");
			jdbcTemplate.update("update entity set session='\u5168\u65E5' where session='\uFFFD\uFFFD\u65E5'");
			jdbcTemplate.update("update entity set session='\u4E0A\u5348+\u4E0B\u5348' where session='\uFFFD\uFFFD\u5348+\u4E0B\u5348'");
			//Exception
			jdbcTemplate.update("update bos.entity set poaschoolnet='Yau Tsim Mong' where id='5890'");  //Diocesan Girls' School
			jdbcTemplate.update("update bos.entity set financetype='\u975E\u725F\u5229' where id=5429");  //PEGASUS SAU WAH CHRISTIAN KINDERGARTEN FINANCE TYPE
			if("0".equalsIgnoreCase(categoryid)){
				jdbcTemplate.update("update entity set qareport='' where qareport is null and categoryid=0");  //update qareport null to empty for scoring purpose.
				jdbcTemplate.update("update entity set poaschoolnet='Central & Western' where categoryid=0 and poaschoolnet like '%Central%'");
				jdbcTemplate.update("update entity set poaschoolnet='Kowloon City' where id=6008"); // update Bishop Hall Jubilee School poaschool net

			}
			if("2".equalsIgnoreCase(categoryid)){ //Patch Uau Tsim Mong POA school net data issue.
				jdbcTemplate.update("update entity set poaschoolnet='Yau Tsim Mong' where poaschoolnet='Yau Tsim  Mong'");
				jdbcTemplate.update("update entity set area=18697 where id=6098");  //Maryknoll Convent School (Secondary Section)
				jdbcTemplate.update("update entityscore set area=18697 where entityid=6098 and year=" + year);
			}
			if("1".equalsIgnoreCase(categoryid)){
				jdbcTemplate.update("update entity set area=6000 where id=3518"); //patch Holy Family Canossian School (Kowloon Tong)
				jdbcTemplate.update("update entityscore set area=6000 where entityid=3518 and year=" + year);
			}


			theLogger.info("synchronize finished ");
		} catch (Exception ex) {
			ex.printStackTrace();

		}
		}
	}
	public void synchronizeScore(String action,String userid) throws SQLException {
		if(isAdmin(userid)){
		try {
			
			HashMap<String,String> fields = new  HashMap <String,String>();
			fields.put("area", "y");
			fields.put("schoolfee", "y");
			fields.put("schoolfeenursery", "y");
			fields.put("tuitionfee", "y");
			fields.put("noofclassroom", "y");
			fields.put("noofhall", "y");
			fields.put("noofplayground", "y");
			fields.put("nooflibraryroom", "y");
			fields.put("teacherexperience", "y");
			fields.put("teachermaster", "y");
			fields.put("teacherbachelor", "y");
			fields.put("musicroom", "y");
			fields.put("outdoorplayground", "y");
			fields.put("indoorplayground", "y");
			fields.put("teacherpupilam", "y");
			fields.put("teacherpupilpm", "y");
			fields.put("qareport", "y");
            fields.put("qareporturl", "y");
            fields.put("voucher", "y");
            fields.put("noofotherroom", "y");

			
			
			//jdbcTemplate.update("delete from bos.entity;");
			String categoryid = "0";
			
			int maxRecordKindergaretn=1200;
			int maxRecordPrimary=610;
			int maxRecordSecondary=510;
			int currentRecord=1;
			int nextRecord=100;
			String year="2012";
			year = "" + getRankingYear();
			int maxRecord=0;
			if("primary".equalsIgnoreCase(action)){
				maxRecord=maxRecordPrimary;
				categoryid = "1";
			}else if("secondary".equalsIgnoreCase(action)){
				maxRecord=maxRecordSecondary;
				categoryid = "2";
			}else{
				maxRecord=maxRecordKindergaretn;
				categoryid = "0";
			}
			jdbcTemplate.update("delete from bos.entityscore where year='" + year + "' and categoryid=" + categoryid);
			
			theLogger.info("synchronizeScore start" );
			
			while(nextRecord < maxRecord){
				theLogger.debug("nextRecord " +nextRecord);
				ArrayList<Map<String, Object>> entityList;
				
					if("primary".equalsIgnoreCase(action)){
						entityList = (ArrayList<Map<String, Object>>) spider.onWeb(currentRecord,nextRecord);
					}else if("secondary".equalsIgnoreCase(action)){
						entityList = (ArrayList<Map<String, Object>>) spiders.onWeb(currentRecord,nextRecord);
					}else{
						entityList = (ArrayList<Map<String, Object>>) spiderk.onWeb(currentRecord,nextRecord);
					}
					
					for (Iterator<Map<String, Object>> i = entityList.iterator(); i.hasNext(); ){
		
						Map<String, Object> entity = (Map<String, Object>) i.next();
						int entityid=0;
						try{
							entityid = jdbcTemplate.queryForObject("select id from bos.entity where chscid='" + quote((String) entity.get("chscid")) + "' and categoryid='" + categoryid + "'" , Integer.class );
						}catch(Exception ex){
							
						}
						if(entityid > 0){
							StringBuffer sqlName = new StringBuffer();
							StringBuffer sqlValue = new StringBuffer();
							
							sqlName.append("insert into bos.entityscore(entityid,year,lastmodified,categoryid, ");
							sqlValue.append(" values(" + entityid + "," + year + ",now()," + categoryid + "," );
							for (String key : entity.keySet()) {
								if(fields.containsKey(key)){
								sqlName.append(key + ",");
								sqlValue.append("'" + quote(entity.get(key)) + "',");
								}
							}
							sqlName.deleteCharAt(sqlName.length() - 1).append(")");
							sqlValue.deleteCharAt(sqlValue.length() - 1).append(")");
							
							theLogger.debug(sqlName.toString() + sqlValue.toString());
							try{
								jdbcTemplate.update(sqlName.toString() + sqlValue.toString());
								jdbcTemplate.update("update entity set email='" + entity.get("email") + "', schoolfee=" + entity.get("schoolfee") + ", tuitionfee=" + entity.get("tuitionfee") + " where id=" + entityid);
								
							}catch(Exception ex){
								ex.printStackTrace();
								theLogger.info("synchronize exception: chscid:{}" , entity.get("chscid"));
							}
						}
					}
					currentRecord = nextRecord;
					nextRecord += 100;
			}

        //Patch the score
        jdbcTemplate.update("update bos.entityscore set area=5000  where entityid=6035 and year=" + year); // Pui Tak Canossian College
		jdbcTemplate.update("update bos.entityscore set teacherforeign=2  where entityid=6104 and year=" + year); // Munsang College foreign teacher


        } catch (Exception ex) {
			ex.printStackTrace();
            theLogger.info("synchronize exception: {}", ex );

		}
		}
	}
	public void saveEntity( Map<String, String> entity) throws SQLException {
		
		if(authorized(entity.get("userid"))){
			String tablename= "5".equals(entity.get("roleid")) ? "bos.entity_dba" : "bos.entity";
			String tablenamescore= "5".equals(entity.get("roleid")) ? "bos.entityscore_dba" : "bos.entityscore";

			String sqlEnttiyScore = "update " + tablenamescore + " set ";
			String sqlEnttiy = "update " + tablename + " set ";
			String sqlEnttiyScoreWhere = " where entityid='" + entity.get("id") + "' and year=" + entity.get("year");
			String sqlEnttiyWhere = " where id='" + entity.get("id") + "'" ;

			StringBuffer sqlName1 = new StringBuffer();
			StringBuffer sqlName2 = new StringBuffer();
			theLogger.debug("saveEntityScore now ");
			for (String key : entity.keySet()) {
				if(!"id".equalsIgnoreCase(key) && !"-1".equalsIgnoreCase(entity.get(key)) && entity.get(key).trim().length() > 0 && !"roleid".equals(key) ){
					sqlName1.append(key + "='").append(quote(entity.get(key)) + "',");
					if(!"year".equalsIgnoreCase(key)){
						sqlName2.append(key + "='").append(quote(entity.get(key)) + "',");
					}
				}
			}
			sqlName1.deleteCharAt(sqlName1.length() - 1);
			sqlName2.deleteCharAt(sqlName2.length() - 1);


			try{
				theLogger.debug("saveEntity sql 1: " + sqlEnttiyScore + sqlName1.toString() +sqlEnttiyScoreWhere + "\n");
				theLogger.debug("saveEntity sql 2: " + sqlEnttiy + sqlName2.toString() +sqlEnttiyWhere + "\n");
				jdbcTemplate.update(sqlEnttiyScore + sqlName1.toString() +sqlEnttiyScoreWhere);
				jdbcTemplate.update(sqlEnttiy + sqlName2.toString() +sqlEnttiyWhere);
			}catch(Exception ex){
				ex.printStackTrace();
				theLogger.debug("synchronize exception:" + entity.get("id"));
			}
		}
		
	}
	
	public List<Map<String, Object>> getSearchField(final String type, final String categoryid) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select distinct " + type + " as " + type.toUpperCase() + " from entity ");
		sql.append("where categoryid = " + categoryid + " order by " + type + " asc");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public List<Map<String, Object>> getLookup(final String type) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select distinct value,description,tooltips from lookup where type ='" + type + "' order by sortorder asc, description asc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public Map<String, String> getLookupMap(final String type) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select distinct value,description from lookup where type ='" + type + "' order by sortorder asc,  description asc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		HashMap<String, String> resultMap = new HashMap<String, String>();
		if(result.size() > 0){
			for(int i=0; i < result.size(); i++ ){
				HashMap map = (HashMap) result.get(i);
				resultMap.put("" +map.get("value"), "" +map.get("description"));
			}
		}
		return resultMap;
	}
	
	public List<Map<String, Object>> getCommentVS(final String entityid, final String userid) throws SQLException{
		StringBuffer sql = new StringBuffer();
		
		sql.append("(select a.*, '\u5B78\u6821\u5927\u5168' as NAMEENG, concat(e.name, ' ' ,e.nameeng) as ENTITYNAME from bos.entity e , bos.comment a  ");
		sql.append(" LEFT JOIN bos.user b ON (a.userid=b.id)  where a.type='system' and a.userid=1 and e.id=a.entityid and  e.id ='" + entityid  + "' order by a.grade desc limit 1 ) ");
		sql.append(" union all ");
		sql.append("(select a.*, COALESCE(b.namelocal,'Anonymous') as NAMEENG, concat(e.name, ' ' ,e.nameeng) as ENTITYNAME from bos.entity e , bos.comment a  ");
		sql.append(" LEFT JOIN bos.user b ON (a.userid=b.id)  where a.type='polling' and a.grade > 0 and e.id=a.entityid and  e.id ='" + entityid  + "' order by a.lastmodified desc limit 1 ) ");
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		List<Map<String, Object>> commentVS = new ArrayList<Map<String, Object>>();
		for (Iterator i = result.iterator(); i.hasNext(); ){
			Map<String, Object> comment = (Map<String, Object>) i.next();
			String commentID = "" + (Integer) comment.get("id");
			int like = getLikeCount( commentID,true,userid);
			int dislike = getLikeCount(commentID,false,userid);
			
			comment.put("like", like );
			comment.put("dislike", dislike);
			comment.put("total", like + dislike);
			commentVS.add(comment);
		}
		return commentVS;
	}
	public List<Map<String, Object>> getEntityMetaData(final String categoryid) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select * from entitymetadata  ");
		sql.append(" where active='y' and entitycategory ='" + categoryid + "' ");
		sql.append(" order by categoryorder asc, fieldorder asc");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public List<Map<String, Object>> getComment(final String entityid, final String userid, final String action) throws SQLException{
		StringBuffer sql = new StringBuffer();
		if("ALL".equalsIgnoreCase(action)){
			sql.append("select a.*,COALESCE(a.grade,'0') as rating, b.namelocal as username,b.anonymous,b.userscore,b.parentratingcount, b.userprofile, COALESCE(b.namelocal,'Anonymous') as NAMEENG, concat(e.name, ' ' ,e.nameeng) as ENTITYNAME, e.categoryid,e.chscid, ");
			sql.append(" TIMESTAMPDIFF(MINUTE, a.lastmodified, now()) as timediffmin,TIMESTAMPDIFF(DAY, a.lastmodified, now()) as timediffday,TIMESTAMPDIFF(HOUR, a.lastmodified, now()) as timediffhour, TIMESTAMPDIFF(SECOND, a.lastmodified, now()) as timediffsec ");
			sql.append(" from bos.entity e LEFT JOIN bos.comment a ON (e.id=a.entityid) LEFT JOIN bos.user b ON (a.userid=b.id)  where a.type <> 'system' and a.grade > 0 and a.userlike > 1 and  e.id ='" + entityid  + "' order by a.lastmodified desc,a.userlike desc, a.userdislike asc ");
		}else if ("SYSTEM".equalsIgnoreCase(action)){
			sql.append("select a.*,COALESCE(a.grade,'0') as rating, COALESCE(b.namelocal,'Anonymous') as NAMEENG,b.anonymous,b.userscore,b.parentratingcount, b.userprofile, concat(e.name, ' ' ,e.nameeng) as ENTITYNAME, e.categoryid,e.chscid, ");
			sql.append(" TIMESTAMPDIFF(MINUTE, a.lastmodified, now()) as timediffmin,TIMESTAMPDIFF(DAY, a.lastmodified, now()) as timediffday,TIMESTAMPDIFF(HOUR, a.lastmodified, now()) as timediffhour, TIMESTAMPDIFF(SECOND, a.lastmodified, now()) as timediffsec ");
			sql.append(" from bos.entity e LEFT JOIN bos.comment a ON (e.id=a.entityid  ");
			sql.append(") LEFT JOIN bos.user b ON (a.userid=b.id)  where a.userid =1 and a.type='system' and e.id ='" + entityid  + "' order by a.lastmodified desc, a.userlike desc, a.userdislike asc ");
		}else{
			sql.append("select a.*,COALESCE(a.grade,'0') as rating, COALESCE(b.namelocal,'Anonymous') as NAMEENG,b.anonymous,b.userscore,b.parentratingcount, b.userprofile, concat(e.name, ' ' ,e.nameeng) as ENTITYNAME, e.categoryid,e.chscid,  ");
			sql.append(" TIMESTAMPDIFF(MINUTE, a.lastmodified, now()) as timediffmin,TIMESTAMPDIFF(DAY, a.lastmodified, now()) as timediffday,TIMESTAMPDIFF(HOUR, a.lastmodified, now()) as timediffhour, TIMESTAMPDIFF(SECOND, a.lastmodified, now()) as timediffsec ");
			sql.append(" from bos.entity e LEFT JOIN bos.comment a ON (e.id=a.entityid  and a.userid='" + userid + "' )   LEFT JOIN bos.user b ON (a.userid=b.id) ");
			sql.append(" where e.id ='" + entityid + "' order by a.userlike desc, a.lastmodified desc,  a.userdislike asc ");
		}
		theLogger.debug("getComment " + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public List<Map<String, Object>> getCommentList() throws SQLException {

		StringBuffer sql = new StringBuffer();

		sql.append(" select a.*,COALESCE(a.grade,'0') as rating, b.namelocal as username,b.anonymous,b.userscore,b.parentratingcount, b.userprofile, COALESCE(b.namelocal,'Anonymous') as NAMEENG, concat(e.name, ' ' ,e.nameeng) as ENTITYNAME, e.categoryid,e.chscid, ");
		sql.append(" TIMESTAMPDIFF(MINUTE, a.lastmodified, now()) as timediffmin,TIMESTAMPDIFF(DAY, a.lastmodified, now()) as timediffday,TIMESTAMPDIFF(HOUR, a.lastmodified, now()) as timediffhour, TIMESTAMPDIFF(SECOND, a.lastmodified, now()) as timediffsec ");
		sql.append(" from bos.entity e LEFT JOIN bos.comment a ON (e.id=a.entityid) LEFT JOIN bos.user b ON (a.userid=b.id)   ");

		sql.append(" where  a.entityid = e.id  and a.type='polling' ");
		sql.append(" and TIMESTAMPDIFF(DAY, a.lastmodified, now()) < 14 and userlike > 1  and grade > 0 " );
		sql.append(" and e.categoryid in (0,1,2,3,4,5,6) " );

		sql.append(" order by a.lastmodified desc  limit 20 ");
		//theLogger.info("getCommentList " + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());

		return result;
	}
	public List<Map<String, Object>> getCommentSpider(final String entityid, final String userid, final String categoryid, final String action) throws SQLException{
		String lastyear="";
		String rankingyear = getRankingYear();
		try{
			lastyear = "" + (Integer.parseInt(rankingyear) -1);
		}catch(Exception ex){
			lastyear="2012";
		}
		StringBuffer sql = new StringBuffer();
		sql.append("select a.entityid as entityid, b.name as name, b.chscid as chscid , b.ranking,b.score,   ");
		sql.append("round(avg(metric1),1) as metric1, ");
		sql.append("round(avg(metric2),1) as metric2, ");
		sql.append("round(avg(metric3),1) as metric3, ");
		sql.append("round(avg(metric4),1) as metric4, ");
		sql.append("round(avg(metric5),1) as metric5, ");
        sql.append("currentyearranking,currentyearscore,currentyearrankingfinancetype,currentyearrankingdistrict,");
        sql.append("round(currentyearmetric1,1) as currentyearmetric1, ");
        sql.append("round(currentyearmetric2,1) as currentyearmetric2, ");
        sql.append("round(currentyearmetric3,1) as currentyearmetric3, ");
        sql.append("round(currentyearmetric4,1) as currentyearmetric4, ");
        sql.append("round(currentyearmetric5,1) as currentyearmetric5, ");
        sql.append("lastyearranking,lastyearscore,lastyearrankingfinancetype,lastyearrankingdistrict,");
		sql.append("round(lastyearmetric1,1) as lastyearmetric1, ");
		sql.append("round(lastyearmetric2,1) as lastyearmetric2, ");
		sql.append("round(lastyearmetric3,1) as lastyearmetric3, ");
		sql.append("round(lastyearmetric4,1) as lastyearmetric4, ");
		sql.append("round(lastyearmetric5,1) as lastyearmetric5 ");
		
		// can remove userid = 1 later when more and more user comment come ....
		sql.append(" from comment a, entity b ");
		sql.append(", (select a.entityid, metric1 as lastyearmetric1,metric2 as lastyearmetric2,metric3 as lastyearmetric3,metric4 as lastyearmetric4,metric5 as lastyearmetric5, ranking as lastyearranking, rankingfinancetype as lastyearrankingfinancetype, rankingdistrict as lastyearrankingdistrict, score as lastyearscore from entityscore a, comment b ");
		sql.append(" where a.entityid=b.entityid and b.userid=1 and b.type='system' and a.year=" + lastyear + " and b.year=" + lastyear + " and  a.categoryid in ("+ categoryid + ")  ) es ");

        sql.append(", (select a.entityid, metric1 as currentyearmetric1,metric2 as currentyearmetric2,metric3 as currentyearmetric3,metric4 as currentyearmetric4,metric5 as currentyearmetric5, ranking as currentyearranking, rankingfinancetype as currentyearrankingfinancetype, rankingdistrict as currentyearrankingdistrict, score as currentyearscore from entityscore a, comment b ");
        sql.append(" where a.entityid=b.entityid and b.userid=1 and b.type='system' and a.year=" + rankingyear + " and b.year=" + rankingyear + " and  a.categoryid in ("+ categoryid + ")  ) escurrent ");

        sql.append(" where a.entityid=b.id and a.entityid=es.entityid and a.entityid=escurrent.entityid and a.userid='1' and type='system' and b.categoryid=" + categoryid + " and a.entityid in (" + entityid + ")  ");
		sql.append(" group by a.entityid, b.name, b.chscid   ");
		sql.append("compare".equalsIgnoreCase(action) ? " order by b.ranking asc " :  " order by a.metric1 desc,a.metric4 desc,a.metric3 desc,a.metric2 desc,a.metric5 desc, b.nameeng asc  ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		theLogger.debug("getCommentSpider "   + sql.toString());
		
		return result;
	}
	public Map<String, Object> getParentScore(String entityid) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("select  e.name,  CAST((avg(b.metric1) + avg(b.metric2) + avg(b.metric3) + avg(b.metric4) )/4 AS DECIMAL(10,1)) as parentscore, " +
				"(select count(1) from comment where type='polling' and grade > 0 and entityid=" + entityid + ") as noofparent," +
				" TIMESTAMPDIFF(MINUTE, max(b.lastmodified), now()) as timediffmin,TIMESTAMPDIFF(DAY, max(b.lastmodified), now()) as timediffday,TIMESTAMPDIFF(HOUR, max(b.lastmodified), now()) as timediffhour, TIMESTAMPDIFF(SECOND, max(b.lastmodified), now()) as timediffsec, " + 
				"round(IFNULL(avg(b.metric1),0),1) as metric1 ,round(IFNULL(avg(b.metric2),0),1) as metric2 ,round(IFNULL(avg(b.metric3),0),1) as metric3, round(IFNULL(avg(b.metric4),0),1) as metric4 from comment b, entity e  ");
		sql.append("where b.type='polling' and grade > 0 and b.entityid=e.id and entityid=" + entityid );

		theLogger.debug("getParentScore : " + sql.toString());
		List<Map<String, Object>> result =  jdbcTemplate.queryForList(sql.toString());
			
		if(result.isEmpty())
			return null;
		else
			return (Map<String, Object>) result.get(0);
				
	}
	public Map<String, Object> getYourScore(String entityid,String userid,String ip) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("select b.id as commentid, round(metric1/2) as metric1 ,  round(metric2/2) as metric2 ,  round(metric3/2) as metric3,  round(metric4/2) as metric4 ,  round(metric5/2) as metric5, comment  from comment b  ");
		sql.append("where b.type='polling' and entityid=" + entityid );
		sql.append(" and b.userid=" + userid );
		if("-1".equalsIgnoreCase(userid))
			sql.append(" and b.ip='" + ip +  "'" );
			
		List<Map<String, Object>> result =  jdbcTemplate.queryForList(sql.toString());
			
		if(result.isEmpty())
			return null;
		else
			return (Map<String, Object>) result.get(0);
				
	}
	
	public Map<String, String> getAverageScore() throws SQLException{
		
		Map<String,String> resultMap = new HashMap<String,String>();
		List<Map<String, Object>> tmp = getTopEntity("0");
		tmp.addAll( getTopEntity("1"));
		tmp.addAll( getTopEntity("2"));
		tmp.addAll( getTopEntity("4"));
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<tmp.size(); i++){
			sb.append(tmp.get(i).get("entityid") + ",");
		}
		sb.append("-1");
		
		StringBuffer sql = new StringBuffer();
		sql.append("select a.entityid as entityid, b.name as name, ");
		sql.append("avg(metric1) as metric1, ");
		sql.append("avg(metric2) as metric2, ");
		sql.append("avg(metric3) as metric3, ");
		sql.append("avg(metric4) as metric4, ");
		sql.append("avg(metric5) as metric5 ");
		sql.append(" from comment a, entity b where a.userid=1 and a.entityid=b.id and a.entityid in(" + sb.toString() + ") group by b.name, a.entityid  ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		for(int i=0; i<result.size(); i++){
			BigDecimal average = new BigDecimal(0);
			average = ((BigDecimal) result.get(i).get("metric1"))
					.add((BigDecimal) result.get(i).get("metric2"))
					//.add((BigDecimal) result.get(i).get("metric3"))
					.add((BigDecimal) result.get(i).get("metric4"))
					.add((BigDecimal) result.get(i).get("metric5")).divide(new BigDecimal(4),2, BigDecimal.ROUND_HALF_UP);
			resultMap.put( "" + (Integer) result.get(i).get("entityid"),    "" + average.setScale(1, RoundingMode.HALF_EVEN) );
		}
		return resultMap;
	}
	public boolean isPolled(Map<String,String> polling){
		boolean rated = false;
		
		int i = jdbcTemplate.queryForObject("select count(1) from bos.comment where type='" + polling.get("type") +"' and entityid='" +  polling.get("entityid")  + "' " + ( ! "-1".equalsIgnoreCase(polling.get("userid")) ? " and userid='" + polling.get("userid") + "' "  :  " and ip='" + polling.get("ip") + "' " ), Integer.class );
		if(i > 0){
			rated = true;
		}else{
			// asked today ?
			i = jdbcTemplate.queryForObject("select count(1) from bos.comment where lastmodified >= DATE_SUB(curdate(), INTERVAL 1 DAY) and grade='-1' and type='" + polling.get("type") +"' and entityid='" +  polling.get("entityid") + "' "  + ( ! "-1".equalsIgnoreCase(polling.get("userid")) ? " and userid='" + polling.get("userid") + "' "  :  " and ip='" + polling.get("ip") + "' " ), Integer.class );
			if(i > 0)
				rated=true;
			else
				rated=false;
		}
		return rated;
	}
	public void refusePolling(Map<String,String> polling){
		try{
			polling.put("grade","-1");
			polling.put("type",polling.get("type"));
			saveComment(polling);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
	}
	public void saveComment(Map<String,String> comment) throws SQLException{

        if(! "bos".equalsIgnoreCase(comment.get("formsubmitsource")) ){
            return;
        }
    	try {
			int userlike=0;
			// default set user input commment with +20 userlike
			try{
				userlike = Integer.parseInt(comment.get("userlike"));
			}catch(Exception ex){			}
 
			int iExisting = jdbcTemplate.queryForObject("select count(1) from bos.comment where entityid=" + quote(comment.get("entityid")) +
    					( "polling".equalsIgnoreCase(comment.get("type")) && "-1".equalsIgnoreCase(comment.get("userid"))  ?  " and ip='" +  comment.get("ip") + "' " : " " ) +  
    					( " and userid='" + comment.get("userid") + "' "  )  + " and type='"  + comment.get("type") + "' " , Integer.class );
			StringBuffer sql = new StringBuffer();
			if("polling".equalsIgnoreCase(comment.get("type"))){
				try{ 
				Map<String, Object> pscore = getParentScore(comment.get("entityid"));
				 if(pscore != null && pscore.get("parentscore") != null)
					 jdbcTemplate.update("update entity set parentscore=" + pscore.get("parentscore") + " where id=" + comment.get("entityid") );
				}catch(Exception ex){
					theLogger.debug("Fail to update parent score for entityid" +comment.get("entityid") );
				}
			}
			if(comment.get("ip") != null){
		    	
				if(iExisting < 1){
					sql.append("insert into bos.comment(grade,metric1,metric2,metric3,metric4,metric5,type,ip,subject,comment,entityid,userid,created,userlike,userdislike) ");
					sql.append(" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");
					jdbcTemplate.update(sql.toString(),
					 quote(comment.get("grade")),
					quote(comment.get("metric1")),
					quote(comment.get("metric2")),
					quote(comment.get("metric3")),
					quote(comment.get("metric4")),
					quote(comment.get("metric5")),
					quote(comment.get("type")),
					quote(comment.get("ip")),
					comment.get("subject"),
					comment.get("comment"),
					quote(comment.get("entityid")),
					quote(comment.get("userid")),
					new java.sql.Timestamp(System.currentTimeMillis()),
					userlike,
					0);
					if("polling".equalsIgnoreCase(comment.get("type")) && ! "-1".equalsIgnoreCase(comment.get("userid"))  && ! "-1".equalsIgnoreCase(comment.get("grade")) && comment.get("comment") != null && comment.get("comment").trim().length() > 5  ){
						sql = new StringBuffer();
						sql.append("update bos.user set userscore=userscore + 1,parentratingcount=parentratingcount+1 where id=" + comment.get("userid"));
						jdbcTemplate.update(sql.toString());
					}
					theLogger.debug("sql save comment " + comment.get("type") + " " + sql);
				}else{
					
					sql.append("update bos.comment set comment= ?,");
					sql.append("subject = ?, ");
					sql.append("grade = ?, ");
					sql.append("metric1 = ?, ");
					sql.append("metric2 = ?, ");
					sql.append("metric3 = ?, ");
					sql.append("metric4 = ?, ");
					sql.append("metric5 = ?, ");
					sql.append("userlike = ?, ");
					sql.append("type = ?, ");
					sql.append("ip = ? ");
					sql.append("where userid=? and entityid=? and type=? " + ("polling".equalsIgnoreCase(comment.get("type")) && "-1".equalsIgnoreCase(comment.get("userid"))   ? " and ip='" + comment.get("ip") + "' ": "") );
				
					jdbcTemplate.update(sql.toString(),
							quote(comment.get("comment")),
							quote(comment.get("subject")),
							quote(comment.get("grade")),
							quote(comment.get("metric1")),
							quote(comment.get("metric2")),
							quote(comment.get("metric3")),
							quote(comment.get("metric4")),
							quote(comment.get("metric5")),
							userlike,
							quote(comment.get("type")),
							quote(comment.get("ip")),
							quote(comment.get("userid")),
							quote(comment.get("entityid")),
							quote(comment.get("type"))
							);
				}
			}
		} catch (Exception ex) {
			theLogger.debug("alert save comment exception !!!");
			ex.printStackTrace();

		}
    }
	public int getCategoryEntity(final String id) throws SQLException{
    	try {
    		StringBuffer sql = new StringBuffer();
    		//theLogger.debug("getCategoryEntity select categoryid from bos.entity where id='" + id + "'");
    		return jdbcTemplate.queryForObject("select categoryid from bos.entity where id='" + id + "'", Integer.class);
		
    	} catch (Exception ex) {
			//ex.printStackTrace();
			return 0;
		}
    }
	public int getLikeCount(final String id, boolean like, String userid) throws SQLException{
    	try {
    		StringBuffer sql = new StringBuffer();
    		String userlike = "0";
    		
    		if(like){
    			userlike = "1";
    		}else{
    			userlike = "0";
    		}
    		return jdbcTemplate.queryForObject("select count(userlike) from bos.usercommentlike where commentid='" + id + "'" + (like ? " and userlike=1 "  : " and userlike=0 group by userlike ") , Integer.class );
		
    	} catch (Exception ex) {
			//ex.printStackTrace();
			return 0;
		}
    }
	public void likeComment(final String id, boolean like, String userid) throws SQLException{
    	try {
    		StringBuffer sql = new StringBuffer();
    		String userlike = "0";
    		
    		if(like){
    			userlike = "1";
    		}else{
    			userlike = "0";
    		}
    		int iExisting = jdbcTemplate.queryForObject("select count(1) from bos.usercommentlike where commentid='" + id + "' and userid='" + userid + "'" + (like ? " and userlike=1 "  : " and userlike=0 "),Integer.class  );
			
    		if(iExisting < 1){
    			sql.append("update bos.comment set " + (like ? "userlike=userlike+1" : "userdislike=userdislike+1" ) + " where id='" + id + "'");
    			jdbcTemplate.update(sql.toString());
    			sql = new StringBuffer();
    			sql.append("insert into bos.usercommentlike (userid,commentid,userlike,lastmodified,created) values('" + userid  + "','" + id + "','" + userlike +  "',current_timestamp,current_timestamp)");
    			jdbcTemplate.update(sql.toString());
    		}
    	} catch (Exception ex) {
			ex.printStackTrace();

		}
    }
	public void saveReminder(Map<String,String> reminder) throws SQLException{
    	try {
			
    			StringBuffer sql = new StringBuffer();
				sql.append("update bos.favorite set grade='" + quote(reminder.get("grade")) + "' " );
				sql.append(" ,status='" + quote(reminder.get("status")) + "' " );
				if(reminder.get("interview").trim().length() > 0 )
					sql.append(" ,interview='" + quote(reminder.get("interview")) + "' " );
				if(reminder.get("application").trim().length() > 0 )
					sql.append(" ,application='" + quote(reminder.get("application")) + "' " );
				if(reminder.get("announcement").trim().length() > 0 )
					sql.append(" ,announcement='" + quote(reminder.get("announcement")) + "' " );
				
				sql.append("where userid='" + reminder.get("userid") + "' and entityid='" + reminder.get("entityid") + "'");
				jdbcTemplate.update(sql.toString());
		} catch (Exception ex) {
			ex.printStackTrace();

		}
    }
	public Map<String, Object> getReminder(Map<String,String> reminder) throws SQLException{
		Map<String, Object> emptyMap = new HashMap<String, Object>();
		try {
			
    		emptyMap.put("grade", 0);
			emptyMap.put("interview","");
			emptyMap.put("announcement", "");
			emptyMap.put("application", "");
			emptyMap.put("status", "");
			
    			StringBuffer sql = new StringBuffer();
				sql.append("select e.name, entityid, COALESCE(grade,0) as grade , f.status,COALESCE(DATE_FORMAT(application,'%Y-%m-%d'),'') as application,COALESCE(DATE_FORMAT(interview,'%Y-%m-%d'),'') as interview, COALESCE(DATE_FORMAT(announcement,'%Y-%m-%d'),'') as announcement  from bos.favorite f, entity e ");
				
				sql.append("where f.entityid=e.id and f.userid='" + reminder.get("userid") + "' and f.entityid='" + reminder.get("entityid") + "'");
				List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
				if(result.size() > 0 ){
					emptyMap = result.get(0);
					if("0000-00-00".equalsIgnoreCase( (String) emptyMap.get("interview"))){
						emptyMap.put("interview","");
					}
					if("0000-00-00".equalsIgnoreCase( (String) emptyMap.get("announcement"))){
						emptyMap.put("announcement","");
					}
					if("0000-00-00".equalsIgnoreCase( (String) emptyMap.get("application"))){
						emptyMap.put("application","");
					}
					
					return emptyMap;
				}else {
					theLogger.debug("Empty Reminder " + emptyMap.get("grade"));
					return emptyMap;
				}
		} catch (Exception ex) {
			ex.printStackTrace();
			theLogger.debug("Exception Reminder " + emptyMap.get("grade"));
			return emptyMap;

		}
    }
	
	public void scoring(String categoryid, ApplicationContext applicationContext,String userid){

		if(isAdmin(userid)){
        theLogger.info("start scoring for category {} , year {}", categoryid, getRankingYear());
		// Update the school allocation score by inherit parent.
		if(IS_SCORING_ACAD) {
			scoringAcademic(categoryid);
		}
		
		String systemuserid = "1";
		String metricvalue = "0";
		int recordCounter = 1;
		int totalRecord = 0;
		int totalMetric = 0;
		boolean winner = false;
		try {
			ArrayList<Map<String, Object>> entityList;
			
			HashMap<String,String> metric = new HashMap<String,String>();
			metric.put("metric5", "0".equalsIgnoreCase(categoryid) ? "teacherbachelor desc, cast(substring(teacherpupilam,5) AS DECIMAL(10,2))  asc ,  cast(substring(teacherpupilpm,5) AS DECIMAL(10,2))  asc,  teacherexperience desc " : "teachermaster desc, teacherbachelor desc, teacherexperience desc" );
			metric.put("metric3", "(musicfirst + speechfirst) desc , debatechi asc, (musicsecond + speechsecond) desc,  (musicthird + speechthird + musicother) desc ");
			metric.put("metric4", "0".equalsIgnoreCase(categoryid) ? "noofclassroom desc, outdoorplayground asc, indoorplayground asc, musicroom asc" : "area desc");
			metric.put("metric1", "2".equalsIgnoreCase(categoryid) ?  "banding asc,alpassrate desc,sixcoursesratio desc, engpassrate desc, chipassrate desc, urate desc" : "1".equalsIgnoreCase(categoryid) ? "schoolallocationscore desc, exceedquota desc " : "5".equalsIgnoreCase(categoryid) ? "dp desc, igcse desc " : "schoolallocationscore desc, qareport desc " );
			metric.put("metric2", "-1");
			metric.put("metric6", "schoolfee desc, tuitionfee desc");
			
			
			HashMap<String,String> metricZeroValExclude = new HashMap<String,String>();
			metricZeroValExclude.put("metric5", "0".equalsIgnoreCase(categoryid) ? "@(cast(substring(teacherpupilam,5) AS DECIMAL(10,2)) + cast(substring(teacherpupilpm,5) AS DECIMAL(10,2)))"  : "-1" );
			metricZeroValExclude.put("metric3", "@(musicfirst + musicsecond + musicthird + speechfirst + speechsecond + speechthird + musicother)");
			metricZeroValExclude.put("metric4", "0".equalsIgnoreCase(categoryid) ? "@noofclassroom" : "@area");
			metricZeroValExclude.put("metric1", "2".equalsIgnoreCase(categoryid) ?  "banding" : "1".equalsIgnoreCase(categoryid) ? "schoolallocationscore" : "5".equalsIgnoreCase(categoryid) ? "@(dp + igcse)" : "-1" );
			metricZeroValExclude.put("metric2", "-1");
			metricZeroValExclude.put("metric6", "@(schoolfee + tuitionfee)");
			//reset all the metric value for a category
			jdbcTemplate.update("update bos.comment set comment='', metric1=" + MINSCORE + ",metric2=" + MINSCORE + ",metric3=" + MINSCORE + ",metric4=" + MINSCORE + ",metric5=" + MINSCORE  + ",metric6=" + MINSCORE + "," +
					"lastmodified=current_timestamp,created=current_timestamp " +
					"where year=" + getRankingYear() + " and type='system' and userid='" + systemuserid + "' and entityid in (select id from entity where categoryid='" + categoryid + "' ) ");
			if(IS_SCORING_METRIC) {


				for (String metrickey : metric.keySet()) {
					if ("metric3".equalsIgnoreCase(metrickey))
						winner = true;
					else if ("5".equalsIgnoreCase(categoryid) && "metric1".equalsIgnoreCase(metrickey))
						winner = true;
					else
						winner = false;

					totalMetric++;
					entityList = new ArrayList<Map<String, Object>>();
					if ("metric2".equalsIgnoreCase(metrickey)) {
						if (!"0".equalsIgnoreCase(categoryid)) {
							entityList = (ArrayList<Map<String, Object>>) getEntityListBySportMetric(metric.get(metrickey), categoryid, metricZeroValExclude.get(metrickey));
						}
					} else {
						if ("metric1".equalsIgnoreCase(metrickey) && "1".equalsIgnoreCase(categoryid)) {
							patchExceedQuotaData(categoryid, "");
						}
						entityList = (ArrayList<Map<String, Object>>) getEntityListByMetric(metric.get(metrickey), categoryid, metricZeroValExclude.get(metrickey));
						if ("metric1".equalsIgnoreCase(metrickey) && "1".equalsIgnoreCase(categoryid)) {
							patchExceedQuotaData(categoryid, "y");
						}
					}
					totalRecord = entityList.size();
					recordCounter = 1;
					for (Iterator i = entityList.iterator(); i.hasNext(); ) {
						if ("5".equalsIgnoreCase(categoryid)) {
							theLogger.debug("is winner ? " + winner);
							if (recordCounter <= totalRecord * 1 / 10) {                                                                            //(10%)
								metricvalue = winner ? "10" : "10";
								theLogger.debug("cat-5 10 point");
							} else if (recordCounter > totalRecord * 1 / 10 && recordCounter <= totalRecord * 2 / 10) {                            //(20%)
								metricvalue = winner ? "9.8" : "9";
							} else if (recordCounter > totalRecord * 2 / 10 && recordCounter <= totalRecord * 3 / 10) {                            //(30%)
								metricvalue = winner ? "9.5" : "8";
							} else if (recordCounter > totalRecord * 3 / 10 && recordCounter <= totalRecord * 4 / 10) {                            //(40%)
								metricvalue = winner ? "9" : "7";
							} else if (recordCounter > totalRecord * 4 / 10 && recordCounter <= totalRecord * 5 / 10) {                            //(50%)
								metricvalue = winner ? "8.8" : "6";
							} else if (recordCounter > totalRecord * 5 / 10 && recordCounter <= totalRecord * 6 / 10) {                            //(60%)
								metricvalue = winner ? "8.5" : "5";
							} else if (recordCounter > totalRecord * 6 / 10 && recordCounter <= totalRecord * 7 / 10) {                            //(70%)
								metricvalue = winner ? "8" : "4";
							} else if (recordCounter > totalRecord * 7 / 10 && recordCounter <= totalRecord * 8 / 10) {                            //(80%)
								metricvalue = winner ? "7.8" : "3";
							} else if (recordCounter > totalRecord * 8 / 10 && recordCounter <= totalRecord * 9 / 10) {                            //(90%)
								metricvalue = winner ? "7.5" : "2";
							} else {
								metricvalue = winner ? "7" : "1";
							}
						} else {
							if (recordCounter <= totalRecord * 1.5 / 100) {                                                                            //1.5 (10)
								metricvalue = winner ? "10" : "10";
							} else if (recordCounter > totalRecord * 1.5 / 100 && recordCounter <= totalRecord * 5 / 100) {                            //3.5 (9)
								metricvalue = winner ? "9.5" : "9";
							} else if (recordCounter > totalRecord * 5 / 100 && recordCounter <= totalRecord * 16 / 100) {                            //10.8 (8)
								metricvalue = winner ? "9" : "8";
							} else if (recordCounter > totalRecord * 16 / 100 && recordCounter <= totalRecord * 28.8 / 100) {                        //12.8 (7)
								metricvalue = winner ? "8.5" : "7";
							} else if (recordCounter > totalRecord * 28.8 / 100 && recordCounter <= totalRecord * 38.9 / 100) {                        //10.1 (6.5)
								metricvalue = winner ? "8.3" : "6.5";
							} else if (recordCounter > totalRecord * 38.9 / 100 && recordCounter <= totalRecord * 49.9 / 100) {                        //10 (6)
								metricvalue = winner ? "8" : "6";
							} else if (recordCounter > totalRecord * 49.9 / 100 && recordCounter <= totalRecord * 84.1 / 100) {                        //35 (5)
								metricvalue = winner ? "7.8" : "5";
							} else if (recordCounter > totalRecord * 84.1 / 100 && recordCounter <= totalRecord * 97.7 / 100) {                        //13 (4)
								metricvalue = winner ? "7.5" : "4";
							} else if (recordCounter > totalRecord * 97.7 / 100 && recordCounter <= totalRecord * 98.8 / 100) {                        //1.1 (3)
								metricvalue = winner ? "7" : "3";
							} else if (recordCounter > totalRecord * 98.8 / 100 && recordCounter <= totalRecord * 100 / 100) {                        //1.2 (2)
								metricvalue = winner ? "6.5" : "2";
							} else {
								metricvalue = winner ? "6" : "1";
							}
						}
						Map<String, Object> entity = (Map<String, Object>) i.next();
						int iExisting = jdbcTemplate.queryForObject("select count(1) from bos.comment where year=" + getRankingYear() + " and type='system' and entityid='" + quote("" + entity.get("entityid")) + "' and userid='" + systemuserid + "'", Integer.class);

						StringBuffer sqlName = new StringBuffer();
						StringBuffer sqlValue = new StringBuffer();
						StringBuffer sqlEntity = new StringBuffer();

						HashMap<String, String> systemComment = new HashMap<String, String>();
						Double imetricvalue = 0.0;
						try {
							imetricvalue = Double.parseDouble(metricvalue);
						} catch (Exception ex) {
							imetricvalue = 0.0;
						}
						if ("6143".equalsIgnoreCase("" + entity.get("entityid")) && "metric2".equalsIgnoreCase(metrickey)) {
							theLogger.debug("Jockey Club Ti-I College " + imetricvalue);
							imetricvalue = imetricvalue <= 7 ? imetricvalue + 2 : imetricvalue;
							metricvalue = "" + imetricvalue;
						}
						if ("6160".equalsIgnoreCase("" + entity.get("entityid")) && "metric2".equalsIgnoreCase(metrickey)) {
							theLogger.debug("St. Paul's Co-Educational College " + imetricvalue);
							imetricvalue = imetricvalue <= 8.0 ? 8.0 : imetricvalue;
							metricvalue = "" + imetricvalue;
						}
						systemComment.put("comment", "n/a");
						systemComment.put("subject", "\u4E3B\u7DE8\u8A55\u8AD6");
						systemComment.put("entityid", "" + entity.get("entityid"));
						systemComment.put("userid", systemuserid);
						//systemComment.put("type", "system");

						systemComment.put(metrickey, metricvalue);

						if (iExisting < 1) {
							sqlName.append("insert into bos.comment(lastmodified,created,type,year,  ");
							sqlValue.append(" values(current_timestamp,current_timestamp,'system', " + getRankingYear() + " ,  ");
							for (String key : systemComment.keySet()) {
								sqlName.append(key + ",");
								sqlValue.append("'" + quote(systemComment.get(key)) + "',");
							}
							sqlName.deleteCharAt(sqlName.length() - 1).append(")");
							sqlValue.deleteCharAt(sqlValue.length() - 1).append(")");
						} else {
							sqlName.append("update bos.comment set lastmodified=current_timestamp,created=current_timestamp, ");
							for (String key : systemComment.keySet()) {
								sqlName.append(key + "='").append(quote(systemComment.get(key)) + "',");
							}

							// TODO remove ib school year 2011 metric update next year ...
							sqlName.deleteCharAt(sqlName.length() - 1).append(" where  type='system' and entityid='" + quote("" + entity.get("entityid")) + "' and userid='" + systemuserid + "' " + (!"5".equalsIgnoreCase(categoryid) ? " and year=" + getRankingYear() + " " : ""));
						}

						//if("3751".equalsIgnoreCase("" + entity.get("entityid")) || "3767".equalsIgnoreCase("" + entity.get("entityid")) || "3749".equalsIgnoreCase("" + entity.get("entityid")) )
						//theLogger.info(sqlName.toString() + sqlValue.toString());

						jdbcTemplate.update(sqlName.toString() + sqlValue.toString());

						sqlEntity = new StringBuffer();
						sqlEntity.append("update entity e,");
						sqlEntity.append("		(select ");
						sqlEntity.append("entityid,");
						sqlEntity.append("IF(avg(metric1) > 0 , round(avg(metric1),1) , '0')  as metric1,");
						sqlEntity.append("IF(avg(metric2) > 0 , round(avg(metric2),1) , '0')  as metric2,");
						sqlEntity.append("IF(avg(metric3) > 0 , round(avg(metric3),1) , '0')  as metric3,");
						sqlEntity.append("IF(avg(metric4) > 0 , round(avg(metric4),1) , '0')  as metric4,");
						sqlEntity.append("IF(avg(metric5) > 0 , round(avg(metric5),1) , '0')  as metric5 ");
						sqlEntity.append("from comment where type='system' and entityid=" + entity.get("entityid") + " group by entityid ) c set ");
						sqlEntity.append("e.metricoverall1=c.metric1,");
						sqlEntity.append("		e.metricoverall2=c.metric2,");
						sqlEntity.append("		e.metricoverall3=c.metric3,");
						sqlEntity.append("		e.metricoverall4=c.metric4,");
						sqlEntity.append("		e.metricoverall5=c.metric5 ");
						sqlEntity.append("where e.id=c.entityid ");
						sqlEntity.append(" and e.id=" + entity.get("entityid"));
						jdbcTemplate.update(sqlEntity.toString());
						recordCounter++;
					}

					//if("2".equalsIgnoreCase(categoryid) && "metric4".equalsIgnoreCase(metrickey)){
					//	jdbcTemplate.update("update entity set area=4800 where id = 6056;"); //Ho Fung College (Sponsored by Sik Sik Yuen)
					//	jdbcTemplate.update("update entity set area=6000 where id = 5900;"); //Po Leung Kuk Lee Shing Pik College
					//}

				}

				if ("2".equalsIgnoreCase(categoryid)) {

					jdbcTemplate.update("update comment set metric1=IF(metric1 < 8.8 ,8.8, metric1) where type='system' and  entityid=6303 and year=" + getRankingYear());  //Ying Wa
					jdbcTemplate.update("update comment set metric1=IF(metric1 < 8.7 ,8.7, metric1) where type='system' and  entityid=6096 and year=" + getRankingYear());  //Marymount
					jdbcTemplate.update("update comment set metric1=IF(metric1 < 8.7 ,8.7, metric1) where type='system' and  entityid=6194 and year=" + getRankingYear()); //St. Joseph
					jdbcTemplate.update("update comment set metric1=IF(metric1 < 8.9 ,8.9, metric1) where type='system' and  entityid=6098 and year=" + getRankingYear()); //Maryknoll Convent School (Secondary Section)
					jdbcTemplate.update("update comment set metric1=IF(metric1 < 8.7 ,8.7, metric1) where type='system' and  entityid=6304 and year=" + getRankingYear()); //King's
					jdbcTemplate.update("update comment set metric1=IF(metric1 < 8.7 ,8.7, metric1) where type='system' and  entityid=6039 and year=" + getRankingYear()); //Sacred Heart Canossian
					jdbcTemplate.update("update comment set metric1=IF(metric1 < 8.7 ,8.7, metric1) where type='system' and  entityid=6196 and year=" + getRankingYear()); //St. Stephen Girl

					jdbcTemplate.update("update comment set metric1=10, metric5=9 where  type='system' and entityid = 5890 and year=" + getRankingYear()); //Diocesan Girl School

					jdbcTemplate.update("update comment set metric1=9, metric5=8,metric4=10 where type='system' and  entityid = 6062 and year=" + getRankingYear()); //La Salle College
					jdbcTemplate.update("update comment set metric1=9, metric5=8, metric4=10 where type='system' and entityid = 5888 and year=" + getRankingYear()); //Diocesan Boy school
					jdbcTemplate.update("update comment set metric5=8,metric4=10 where type='system' and entityid = 5937 and year=" + getRankingYear()); //Good Hope
					jdbcTemplate.update("update comment set metric5=8,metric4=9 where type='system' and entityid = 6284 and year=" + getRankingYear()); //Heep Yunn
					jdbcTemplate.update("update comment set metric5=8 where type='system' and entityid = 6013 and year=" + getRankingYear()); //Quuen's College
					jdbcTemplate.update("update comment set metric5=7.5 where type='system' and entityid = 6011 and year=" + getRankingYear()); //Wah Ying College
					jdbcTemplate.update("update comment set metric5=7.5 where type='system' and entityid = 6194 and year=" + getRankingYear()); //St Joseph's college
					jdbcTemplate.update("update comment set metric5=7 where type='system' and  entityid = 6104 and year=" + getRankingYear()); //Munsang college
					jdbcTemplate.update("update comment set metric5=7 where type='system' and entityid = 6298 and year=" + getRankingYear()); //Queen Elizabeth School
					jdbcTemplate.update("update comment set metric5=7 where type='system' and entityid = 6304 and year=" + getRankingYear()); //King's College
					jdbcTemplate.update("update comment set metric3=IF(metric3 <  8.6 , 8.6, metric3 ), metric4=IF(metric4 <  8.5 , 8.5, metric4 ), metric5=8.5  where type='system' and entityid = 6160 and year=" + getRankingYear()); //St. Paul's Co-Educational College
					jdbcTemplate.update("update comment set metric2=IF(metric2 <  6.5 , 6.5, metric2 ) where type='system' and entityid = 6035 and year=" + getRankingYear()); //Pui Tak Canossian College

					//Fix the zero music score for current year but not for past year
					jdbcTemplate.update("update comment c1,(select IF(max(metric2)-3 > 0 , max(metric2)-3,1 ) as metric2, c.entityid, e.athleticsposmale, e.athleticsposfemale from comment c, entityscore e where type='system' and c.entityid=e.entityid and e.categoryid=2 and e.year=" + getRankingYear() + " group by c.entityid) c2  set c1.metric2=c2.metric2 where c1.entityid=c2.entityid and c2.athleticsposmale=0 and c2.athleticsposfemale=0 and c1.type='system' and c1.year=" + getRankingYear());
					jdbcTemplate.update("update comment c1,(select IF(max(metric3)-3 > 0 , max(metric3)-3,1 ) as metric3, c.entityid from comment c, entityscore e where type='system' and c.entityid=e.entityid and e.categoryid=2 and e.year=" + getRankingYear() + " group by c.entityid) c2  set c1.metric3=c2.metric3 where c1.entityid=c2.entityid and c1.metric3=0 and c1.type='system' and c1.year=" + getRankingYear());

				}
				if ("1".equalsIgnoreCase(categoryid)) { // teacher

					jdbcTemplate.update("update comment set metric5=8 where  type='system' and entityid = 3850 and year=" + getRankingYear()); //Good Hope Primary School
					jdbcTemplate.update("update comment set metric4=6.5 where  type='system' and entityid = 3590 and year=" + getRankingYear()); //PLK Castar Primary School
					jdbcTemplate.update("update comment set metric4=7.5 where  type='system' and entityid = 3509 and year=" + getRankingYear()); //Diocesan Preparatory Schoo
					jdbcTemplate.update("update comment set metric4=IF(metric4 <  6 , 6, metric4 ) where type='system' and entityid = 3420 and year=" + getRankingYear()); // St. Paul's College Primary School
					jdbcTemplate.update("update comment set metric4=IF(metric4 <  9 , 9, metric4 ) where  type='system' and entityid = 3656 and year=" + getRankingYear()); //St. Paul's Co-educational College Primary School
					jdbcTemplate.update("update comment set metric4=IF(metric4 <  7.5 , 7.5, metric4 ) where  type='system' and entityid = 3933 and year=" + getRankingYear()); //P.L.K. Camoes Tan Siu Lin Primary School
					jdbcTemplate.update("update comment set metric4=IF(metric4 <  10 , 10, metric4 ) where  type='system' and entityid = 3494 and year=" + getRankingYear()); //Diocesan Boys' School Primary Division
					jdbcTemplate.update("update comment set metric5=IF(metric5 <  8 , 8, metric5 )  where  type='system' and entityid = 3504 and year=" + getRankingYear()); //Maryknoll Convent School (Primary Section)
					jdbcTemplate.update("update comment set metric5=IF(metric4 <  6.5 , 6.5, metric4 )  where  type='system' and entityid = 3505 and year=" + getRankingYear()); //Alliance Primary School, Kowloon Tong


					//Fix the zero music, sport score for current year but not for past year
					jdbcTemplate.update("update comment c1,(select IF(max(metric2)-3 > 0 , max(metric2)-3, 1 ) as metric2, c.entityid, e.athleticsposmale, e.athleticsposfemale from comment c, entityscore e where type='system' and c.entityid=e.entityid and e.categoryid=1 and e.year=" + getRankingYear() + " group by c.entityid) c2  set c1.metric2 = c2.metric2 where c1.entityid=c2.entityid and c2.athleticsposmale=0 and c2.athleticsposfemale=0 and c1.type='system' and c1.year=" + getRankingYear());
					jdbcTemplate.update("update comment c1,(select IF(max(metric3)-3 > 0 , max(metric3)-3, 1 ) as metric3, c.entityid from comment c, entityscore e where type='system' and c.entityid=e.entityid and e.categoryid=1 and e.year=" + getRankingYear() + " group by c.entityid) c2  set c1.metric3 = c2.metric3 where c1.entityid=c2.entityid and c1.metric3=0 and c1.type='system' and c1.year=" + getRankingYear());

					jdbcTemplate.update("update comment set metric1=IF(metric1 <  7.5 , 7.5, metric1 )  where  type='system' and entityid = 3742 and year=" + getRankingYear()); //Po Leung Kuk Hong Kong Taoist Association Yuen Yuen Pri. Sch.

				}
				if ("0".equalsIgnoreCase(categoryid)) { // Area
					jdbcTemplate.update("update comment set metric4=8.5 where type='system' and entityid = 5186 and year=" + getRankingYear()); //Heep Yunn Kindergarten
					jdbcTemplate.update("update comment set metric4=8.5 where type='system' and entityid = 5864 and year=" + getRankingYear()); //Good Hope Kindergarten
					jdbcTemplate.update("update comment set metric4=6.5 where type='system' and entityid = 5337 and year=" + getRankingYear()); //Learning Habitat Tsing yi
					jdbcTemplate.update("update comment set metric4=8.0 where type='system' and entityid = 5134 and year=" + getRankingYear()); //ELCHK SHATIN LUTHERAN KINDERGARTEN sport stadium, bbq area, fish pool
					jdbcTemplate.update("update comment set metric4=10 where type='system' and entityid = 5705 and year=" + getRankingYear()); //True Light Middle School of Hong Kong (Kindergarten Section)

				}

				theLogger.info(" All metric calculation completed , waiting for update entity ranking and generate comment for category {} ", categoryid);
			}
			if(IS_UPDATE_RANK) {
				updateEntityRanking(categoryid);
			}
			generateComment(categoryid,applicationContext);
				
		} catch (Exception ex) {
			ex.printStackTrace();

		}
            theLogger.info("Scoring completed for category {}, year {} ", categoryid, getRankingYear());
		}
	}
	public void scoringAcademic(String categoryid){


        try {
            String TESTID = "3619";

            ArrayList<Map<String, Object>> entityList;
			ArrayList<String> schoolnamelist;
			entityList = (ArrayList<Map<String, Object>>) getEntityList("",categoryid, "","" );

            //patch through train problem for good hope primary
            jdbcTemplate.update("update bos.entity set throughtrain='德望學校'  where id=3850");

            for (Iterator i = entityList.iterator(); i.hasNext(); ){
				StringBuffer sql = new StringBuffer();
				String schoolname = "";
				StringTokenizer st;
				List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
				List<Map<String, Object>> result2 = new ArrayList<Map<String, Object>>();;

				BigDecimal score= new BigDecimal(0);
                BigDecimal student= new BigDecimal(0);
                BigDecimal scoreDragon= new BigDecimal(0);
                BigDecimal studentDragon= new BigDecimal(0);
                BigDecimal avg= new BigDecimal(0);
                BigDecimal avgDragon= new BigDecimal(0);

				Map<String, Object> entity = (Map<String, Object>) i.next();
                if(TESTID.equalsIgnoreCase(""  + entity.get("id"))){
                    theLogger.info("scoringAcademic  " + entity.get("nameeng") + "\n");
                }
				String schoolallocationscore="";
				if( entity.get("feeder") != null && ((String) entity.get("feeder")).trim().length() > 0 && ! "-".equalsIgnoreCase(((String) entity.get("feeder")).trim())   || (entity.get("throughtrain") != null && ((String) entity.get("throughtrain")).trim().length() > 0 && !"-".equalsIgnoreCase(((String) entity.get("throughtrain")).trim())) ){
					
					schoolname = entity.get("feeder") != null && ! "-".equalsIgnoreCase(((String) entity.get("feeder")).trim())   ? ((String) entity.get("feeder")).replaceAll("\u3001",",") : "";
					schoolname += entity.get("throughtrain") != null && ! "-".equalsIgnoreCase(((String) entity.get("throughtrain")).trim())   ? ((String) entity.get("throughtrain")).replaceAll("\u3001",",")  : "";
					if(TESTID.equalsIgnoreCase( ""+ entity.get("id")) ){
						theLogger.info("Feeder / throughtrain    " + entity.get("feeder") + "/" + entity.get("throughtrain"));
						theLogger.info("schoolname " + schoolname);
					
					}
					st = new StringTokenizer(schoolname,",");
					while (st.hasMoreTokens()) {
						sql.append("'" +   quote(st.nextToken().trim()) + "',");
					}
					result = this.jdbcTemplate.queryForList("select metric1,score from comment c, entity e where c.entityid=e.id and c.type='system' and c.userid=1 and c.year=" +  getRankingYear() + " and c.entityid in (select id from entity where categoryid=2 and name in (" + sql.toString() + "'@'))" );
                    if(TESTID.equalsIgnoreCase(""  + entity.get("id"))  ){
                        theLogger.info("select metric1,score from comment c, entity e where c.entityid=e.id and c.type='system' and c.userid=1 and c.year=" +  getRankingYear() + " and c.entityid in (select id from entity where name in (" + sql.toString() + "'@'))" );
                    }

					result2 = this.jdbcTemplate.queryForList("select c.metric1,s.noofstudent  from comment c, schoolallocation s where c.type='system' and c.userid=1 and c.year=" +  getRankingYear() + " and s.noofstudent > 0 and s.allocationyear=" +  getRankingYear() + " and c.entityid = s.entityidto and s.entityidfrom=" + entity.get("id") + " order by c.metric1 desc limit " + SCHOOLALLOCATIONLIMIT ); // select top 8 from the school allocation list
					for (Iterator j = result2.iterator(); j.hasNext(); ){
						Map<String, Object> allocation = (Map<String, Object>) j.next();
                            BigDecimal allStudent = new BigDecimal((Integer) allocation.get("noofstudent"));
							score = ((BigDecimal) allocation.get("metric1")).multiply( allStudent ).add(score) ;
							student = allStudent.add(student);
					}
					
					if(score.intValue() > 0 && student.intValue() > 0){

                        avg = score.divide(student,2, BigDecimal.ROUND_HALF_UP);

					}
					if(TESTID.equalsIgnoreCase(""  + entity.get("id"))  ){
						theLogger.info("scoringAcademic " + entity.get("name")  );
						theLogger.info("score " + score);
						theLogger.info("student " + student);
						theLogger.info("avg " + avg);
						
					}
					if(result.size() > 0){
                        schoolallocationscore =  "" + result.get(0).get("metric1");
                    }
                    try{
							//schoolallocationscore = Double.parseDouble("" + result.get(0).get("metric1")) > Double.parseDouble("" + result.get(0).get("score")) ? "" + result.get(0).get("metric1") : "" + result.get(0).get("score");

                        if(TESTID.equalsIgnoreCase(""  + entity.get("id"))  ){
                            theLogger.info("through train : schoolallocationscore " + schoolallocationscore);
                        }
                        //if(avg > 0){
    						schoolallocationscore =  Double.parseDouble(schoolallocationscore) > avg.doubleValue() ? schoolallocationscore : "" + avg;
	    					if(TESTID.equalsIgnoreCase(""  + entity.get("id"))  ){
								theLogger.info("schoolallocationscore " + schoolallocationscore);
							}
						//}
                    }catch(Exception ex){
                        schoolallocationscore="1";
                        //ex.printStackTrace();
                    }

					jdbcTemplate.update("update bos.entity set schoolallocationscore=" + schoolallocationscore + "  where id=" + entity.get("id") +  " ");
					jdbcTemplate.update("update bos.entityscore set schoolallocationscore=" + schoolallocationscore + "  where entityid=" + entity.get("id") +  " and year=" + getRankingYear());
						

				}else{
					theLogger.debug("nominated ");
					schoolname = (entity.get("nominated") != null && ((String) entity.get("nominated")).trim().length() > 0 && ! "-".equalsIgnoreCase(((String) entity.get("nominated")).trim() ) ) ? ((String) entity.get("nominated")).replaceAll("\u3001",",") + "," : "";
					st = new StringTokenizer(schoolname,",");
					while (st.hasMoreTokens()) {
						sql.append("'" +  quote(st.nextToken().trim()) + "',");
					}
					result = this.jdbcTemplate.queryForList("select metric1 from comment where type='system' and userid=1 and year=" +  getRankingYear() + " and entityid in (select id from entity where categoryid=2 and name in (" + sql.toString() + "'@'))" );
					for (Iterator j = result.iterator(); j.hasNext(); ){
						Map<String, Object> nominated = (Map<String, Object>) j.next();
                        scoreDragon = ((BigDecimal) nominated.get("metric1")).add(scoreDragon) ;
                        studentDragon = studentDragon.add(new BigDecimal(1));
                  	}
					theLogger.debug("school allocation ");
					result = this.jdbcTemplate.queryForList("select c.metric1,s.noofstudent  from comment c, schoolallocation s where c.type='system' and c.userid=1 and c.year=" +  getRankingYear() + " and s.noofstudent > 0 and s.allocationyear=" +  getRankingYear() + " and c.entityid = s.entityidto and s.entityidfrom=" + entity.get("id") + " order by c.metric1 desc limit " + SCHOOLALLOCATIONLIMIT ); // select top 8 from the school allocation list
					if(TESTID.equalsIgnoreCase(""  + entity.get("id"))  ) {
						theLogger.info("select c.metric1,s.noofstudent  from comment c, schoolallocation s where c.type='system' and c.userid=1 and c.year=" + getRankingYear() + " and s.noofstudent > 0 and s.allocationyear=" + getRankingYear() + " and c.entityid = s.entityidto and s.entityidfrom=" + entity.get("id") + " order by c.metric1 desc limit " + SCHOOLALLOCATIONLIMIT); // select top 8 from the school allocation list
					}
					for (Iterator j = result.iterator(); j.hasNext(); ){
						Map<String, Object> allocation = (Map<String, Object>) j.next();
                        BigDecimal allStudent = new BigDecimal((Integer) allocation.get("noofstudent"));
                        if(TESTID.equalsIgnoreCase(""  + entity.get("id"))  ){
                            theLogger.info("score " + score);
                            theLogger.info("student " + student);
                        }
                        score = ((BigDecimal) allocation.get("metric1")).multiply( allStudent ).add(score) ;
                        student = allStudent.add(student);

					}
					if(TESTID.equalsIgnoreCase(""  + entity.get("id"))  ) {
						theLogger.info("school allocation " +  entity.get("nameeng") + "\n");
						theLogger.info("score "  + score );
						theLogger.info("student "  + student );
						theLogger.info("scoreDragon "  + scoreDragon );


					}
						if( (score.intValue() > 0 && student.intValue() > 0) || scoreDragon.intValue() > 0){

                        try{
                            avg = score.divide(student,2, BigDecimal.ROUND_HALF_UP);
                        }catch(Exception ex){
                            avg = new BigDecimal(0);
                        }

                        try{
                            avgDragon = scoreDragon.divide(studentDragon,2, BigDecimal.ROUND_HALF_UP);
                        }catch(Exception ex){
                            avgDragon = new BigDecimal(0);
                        }

                        if(avgDragon.intValue() > 0){
                            if(avg.intValue() > 0)
                                avg = avgDragon.multiply(new BigDecimal(0.25)).add(avg.multiply(new BigDecimal(0.75)));
                            else
                                avg = avgDragon;
                        }

                        if(TESTID.equalsIgnoreCase(""  + entity.get("id"))  ){
                            theLogger.info("scoreDragon "  + scoreDragon );
                            theLogger.info("score " + score);
                            theLogger.info("student " + student);
                            theLogger.info("avg " + avg);

                        }

                        jdbcTemplate.update("update bos.entity set schoolallocationscore="  + avg + "  where id=" + entity.get("id") +  " ");
						jdbcTemplate.update("update bos.entityscore set schoolallocationscore="  + avg + "  where entityid=" + entity.get("id") +  " and year=" + getRankingYear() );

					}else{
						jdbcTemplate.update("update bos.entity set schoolallocationscore=" + MINSCORE + "  where id=" + entity.get("id") +  " ");
						jdbcTemplate.update("update bos.entityscore set schoolallocationscore="  + MINSCORE + "  where entityid=" + entity.get("id") +  " and year=" + getRankingYear() );
						
					}

				}
				
			}
			//Patch the score
			DecimalFormat df1 = new DecimalFormat(".#");

			jdbcTemplate.update("update bos.entity set schoolallocationscore=" + (7 + df1.format(new Random().nextDouble()))  + "  where id in(5739,5740,5738,6557)"); //TUTOR TIME
            jdbcTemplate.update("update bos.entity set schoolallocationscore=" + (8 + df1.format(new Random().nextDouble()))  + " where id in(5839,5840,5841,5857,5857)"); //York Kindergarten
			jdbcTemplate.update("update bos.entity set schoolallocationscore=" + (8 + df1.format(new Random().nextDouble()))  + "  where id in(5584,5583,5876)"); //st. catherines
			//jdbcTemplate.update("update bos.entity set schoolallocationscore=8.5  where id=3850 "); //Good Hope Primary School
            jdbcTemplate.update("update bos.entity set schoolallocationscore=IF(schoolallocationscore >=8,schoolallocationscore," + (7 + df1.format(new Random().nextDouble()))  + ")  where id=3913 "); // Methodist School
            jdbcTemplate.update("update bos.entity set schoolallocationscore=" + (9 + df1.format(new Random().nextDouble()))  + "  where id=5864 "); //Good Hope Kindergarten
			jdbcTemplate.update("update bos.entity set schoolallocationscore=" + (8 + df1.format(new Random().nextDouble()))  + "  where id=3509 "); //Diocesan Preparatory School
			jdbcTemplate.update("update bos.entity set schoolallocationscore=" + (7 + df1.format(new Random().nextDouble()))  + "  where id=5301 "); //KENTVILLE
            jdbcTemplate.update("update bos.entity set schoolallocationscore=(select metric1 from comment where year=" + getRankingYear()+" and entityid=6260 )  where id=3736 "); //HKBUAS Wong Kam Fai Secondary and Primary School
            jdbcTemplate.update("update entity set schoolallocationscore =(select metric1 from comment where year=" + getRankingYear()+ " and entityid=6194 ) where id=3831"); //St. Joseph's Primary School -- through train secondary school name problem
			jdbcTemplate.update("update bos.entity set schoolallocationscore=" + (9 + df1.format(new Random().nextDouble()))  + "  where id=3494 "); //Diocesan Boys' School Primary Division
			jdbcTemplate.update("update bos.entity set schoolallocationscore=" + (9 + df1.format(new Random().nextDouble()))  + "  where id=3503 "); //la salle


            jdbcTemplate.update("update bos.entityscore set schoolallocationscore=(select schoolallocationscore from entity where id=5739)  where entityid in(5839,5840,5841,5857,5857)"); //York Kindergarten
			jdbcTemplate.update("update bos.entityscore set schoolallocationscore=(select schoolallocationscore from entity where id=5584)  where entityid in(5584,5583,5876)"); //st. catherines
			//jdbcTemplate.update("update bos.entityscore set schoolallocationscore=8.5  where entityid=3850 "); //Good Hope Primary School
            jdbcTemplate.update("update bos.entityscore set schoolallocationscore=(select schoolallocationscore from entity where id=3913) where entityid=3913 "); // Methodist School
            jdbcTemplate.update("update bos.entityscore set schoolallocationscore=(select schoolallocationscore from entity where id=5864)  where entityid=5864 "); //Good Hope Kindergarten
			jdbcTemplate.update("update bos.entityscore set schoolallocationscore=(select schoolallocationscore from entity where id=3509)  where entityid=3509 "); //Diocesan Preparatory School
			jdbcTemplate.update("update bos.entityscore set schoolallocationscore=(select schoolallocationscore from entity where id=5301)  where entityid=5301 "); //KENTVILLE
            jdbcTemplate.update("update entityscore set schoolallocationscore =(select schoolallocationscore from entity where id=3831) where entityid=3831"); //St. Joseph's Primary School -- through train secondary school name problem
            jdbcTemplate.update("update entityscore set schoolallocationscore =(select schoolallocationscore from entity where id=3736) where entityid=3736"); //HKBUAS Wong Kam Fai Secondary and Primary School
			jdbcTemplate.update("update entityscore set schoolallocationscore =(select schoolallocationscore from entity where id=3494) where entityid=3494"); //Diocesan Boys' School Primary Division
			jdbcTemplate.update("update entityscore set schoolallocationscore =(select schoolallocationscore from entity where id=3503) where entityid=3503"); //la salle

			//fix schoolallocationscore if no data for current year but not in pervious year
            if("0".equalsIgnoreCase(categoryid) || "1".equalsIgnoreCase(categoryid)){
                //jdbcTemplate.update("update entityscore es1,entityscore es2  set es1.schoolallocationscore = es2.schoolallocationscore where es1.year=" + getRankingYear() + " and es2.year=" + ( Integer.parseInt(getRankingYear()) -1) + " and es1.entityid=es2.entityid and es1.schoolallocationscore=0 and es2.schoolallocationscore > 0");
                jdbcTemplate.update("update entityscore es1,(select IF(max(schoolallocationscore)-2 > 0,max(schoolallocationscore)-2, 1)  as schoolallocationscore, entityid from entityscore where categoryid=" + categoryid + " group by entityid) es2  set es1.schoolallocationscore = es2.schoolallocationscore where es1.year=" + getRankingYear() + " and es1.entityid=es2.entityid and es1.schoolallocationscore=0 and es1.categoryid=" + categoryid + " " );
            }
		} catch (Exception ex) {
			ex.printStackTrace();

		}
		
	}
	public void updateEntityRanking(String categoryid){
		try{
			theLogger.info("updateEntityRanking ");
            final String TESTID ="5583";
            final String TESTID2 ="5777";

            String year = getRankingYear();
			HashMap<String,String> tmp = new HashMap<String,String>();
			Map<String, Object> entity = new HashMap<String,Object>();
			tmp.put("categoryid", categoryid);
			tmp.put("schoolname", "-1");
			tmp.put("yearofcommencement",  "-1");
			tmp.put("nominated",  "-1");
			tmp.put("throughtrain",  "-1");
			tmp.put("feeder",  "-1");
			tmp.put("sortby",  "0".equalsIgnoreCase(categoryid) ? "score3 desc, avgm1 desc, avgm5 desc, avgm4 desc" : "score2 desc, avgm1 desc, avgm3 desc, avgm2 desc, avgm5 desc, avgm4 desc");
			tmp.put("sortorder",  " ");
			tmp.put("rankingyear",year);
            //tmp.put("updaterankingshowsql","y");
			
			List<Map<String, Object>> entityRankingList = getEntity(tmp);
			for (int i=0; i<entityRankingList.size(); i++ ){
				entity = entityRankingList.get(i);
	    		//theLogger.debug("updateEntityRanking " + (i+1) + "," + entity.get("score2")+ "," +entity.get("entityid"));
                //if(TESTID.equalsIgnoreCase("" + entity.get("entityid")) || TESTID2.equalsIgnoreCase("" + entity.get("entityid")) ){
                if(i<2){
                theLogger.info("updateEntityRanking raw:{}" , entity );
                theLogger.info("updateEntityRanking id:{}-score2:{}-score3:{}-metric1:{}" , entity.get("entityid"),entity.get("score2"),entity.get("score3"),entity.get("avgm1"),entity.get("metric1")  );
                theLogger.info("update bos.entity set lastmodified=now(), ranking=" + (i+1) + ", score=" +entity.get("score3")+ " where id="  + entity.get("entityid"));
                theLogger.info("update bos.entityscore set lastmodified=now(), ranking=" + (i+1)+ ", score=" +entity.get("score3")+ " where entityid="  + entity.get("entityid") + " and year="+ year);
                }
                jdbcTemplate.update("update bos.entity set lastmodified=now(), ranking=?, score=? where id=?",(i+1), "0".equalsIgnoreCase(categoryid) ? entity.get("score3") : entity.get("score2") ,entity.get("entityid"));
                jdbcTemplate.update("update bos.entityscore set lastmodified=now(), ranking=?, score=? where entityid=? and year=?",(i+1), "0".equalsIgnoreCase(categoryid) ? entity.get("score3") : entity.get("score2") ,entity.get("entityid"), year);
            }

            tmp.put("updaterankingshowsql","n");
			List<Map<String, Object>> districtList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> fianceTypeList = new ArrayList<Map<String, Object>>();
			fianceTypeList = getSearchField("financeType",categoryid);
			districtList = "1".equalsIgnoreCase(categoryid) ?  getLookup("district.poaschoolnet") : getLookup("district.kindergarten");
			
			for (int j=0; j<districtList.size(); j++ ){
				tmp.put("financetype", "-1");
				tmp.put("poaschoolnet", ""  +districtList.get(j).get("value"));
				entityRankingList = getEntity(tmp);
				
				for (int i=0; i<entityRankingList.size(); i++ ){
					entity = entityRankingList.get(i);
					jdbcTemplate.update("update bos.entity set rankingdistrict=? where id=?",(i+1) ,entity.get("entityid"));
                    jdbcTemplate.update("update bos.entityscore set rankingdistrict=? where entityid=? and year=?",(i+1) ,entity.get("entityid"),year);
                }
			}
			
			for (int j=0; j<fianceTypeList.size(); j++ ){
				tmp.put("financetype", ""  +fianceTypeList.get(j).get("FINANCETYPE"));
				tmp.put("poaschoolnet", "-1");
				theLogger.debug("financetype " + fianceTypeList.get(j).get("value"));
				entityRankingList = getEntity(tmp);
				for (int i=0; i<entityRankingList.size(); i++ ){
					entity = entityRankingList.get(i);
					jdbcTemplate.update("update bos.entity set rankingfinancetype=? where id=?",(i+1) ,entity.get("entityid"));
                    jdbcTemplate.update("update bos.entityscore set rankingfinancetype=? where entityid=? and year=?" ,(i+1) ,entity.get("entityid"),year);

                }
			}
			//P
			//getSearchField("financeType","1");
			//getLookup("district.poaschoolnet");
			//K
			//getSearchField("financeType","0");
			//getLookup("district.kindergarten");
			//S
			//getSearchField("financeType","2");
			//getLookup("district.kindergarten");
			
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	public String saveSchoolAllocation(Map<String,String> allocation) throws SQLException{
    	
		if(authorized(allocation.get("userid"))){
		 try {
			
    		jdbcTemplate.update("delete from bos.schoolallocation where entityidfrom=" + quote(allocation.get("entityidfrom")) + " and allocationyear=" + allocation.get("allocationyear") + " " );
			String entityidto = allocation.get("entityidto") != null ? allocation.get("entityidto") : "";
			theLogger.debug("saveSchoolAllocation entityidto " + entityidto);
			int counter = 0;
			String schoolname = "";
			String student = "";
			String schoolnamestduent = "";
			StringBuffer sql = new StringBuffer();
			StringBuffer result = new StringBuffer();
    		
			StringTokenizer st = new StringTokenizer(entityidto,",");
			if("y".equalsIgnoreCase(allocation.get("nodata"))){
				sql = new StringBuffer();
				sql.append("insert into bos.schoolallocation(entityidfrom,entityidto,reference,allocationyear,created) ");
				sql.append(" values(?,?,?,?,?) ");
				jdbcTemplate.update(sql.toString(),allocation.get("entityidfrom").trim(),-1,"N/A",quote(allocation.get("allocationyear")),new java.sql.Timestamp(System.currentTimeMillis()));
			}else{
				while (st.hasMoreTokens()) {
					sql = new StringBuffer();
					schoolnamestduent = st.nextToken().trim();
					if(schoolnamestduent.contains("-")){
						schoolname = schoolnamestduent.substring(0, schoolnamestduent.indexOf("-"));
						student = schoolnamestduent.substring(schoolnamestduent.indexOf("-")+1);
					}else{
						schoolname = schoolnamestduent;
						student = "1";
					}
					int entityid = 0;
					if("y".equalsIgnoreCase(allocation.get("schoolupdate"))){
						try{entityid = Integer.parseInt(schoolname);}catch(Exception ex){}
					}
					else{
						List<Map <String,Object>> entityList = jdbcTemplate.queryForList("select id from bos.entity where categoryid=" + allocation.get("sacategoryid") + " and (name like '%" + quote(schoolname) + "%' or nameeng like '%" + quote(schoolname) + "%') " );
						entityid = entityList.size() > 0 ? ((Integer) (entityList.get(0).get("id"))).intValue()  : 0;
					}
					int inoofstudent = 1;
					try{
						inoofstudent = Integer.parseInt(student);
					}catch(Exception ex){
						inoofstudent = 1;
					}
					theLogger.debug("insert into bos.schoolallocation " + allocation.get("entityidfrom").trim() + "," + entityid + "," + inoofstudent + "," + allocation.get("reference") + "," + allocation.get("allocationyear"));
					if(entityid > 0){
						sql.append("insert into bos.schoolallocation(entityidfrom,entityidto,noofstudent,reference,allocationyear,created) ");
						sql.append(" values(?,?,?,?,?,?) ");
						jdbcTemplate.update(sql.toString(),
		 			    allocation.get("entityidfrom").trim(),
		 			    entityid,
		 			    inoofstudent,
		 			    quote(allocation.get("reference")),
		 			    quote(allocation.get("allocationyear")),
						new java.sql.Timestamp(System.currentTimeMillis())
						);
					}else{
						result.append(schoolname + "-" + inoofstudent + ",");
					}
					counter++;
				}
			}
			return result.toString();
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return ex.toString();
		}
		}else{
			return "";
		}
    }
	public Map<String, Object> getSchoolAllocationReference(final String entityid) throws SQLException{
		
		try{
		String sql="select reference from schoolallocation where entityidfrom=" + entityid + " and length(reference) > 5 order by allocationyear desc";
		theLogger.debug("getSchoolAllocationReference " + sql);
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql);
		if(result.size() > 0)
			return result.get(0);
		else
			return null;
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}
	public List<Map<String, Object>> getSchoolAllocation(final String entityid,final String allocationyear) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select s.*, a.name as schoolname,a.nameeng as schoolnameeng, e.name,e.nameeng, e.chscid, e.score from entity a, schoolallocation s LEFT JOIN entity e ON (s.entityidto = e.id) ");
		sql.append(" where entityidfrom ='" + entityid + "' and a.id=s.entityidfrom ");
		if("5".equalsIgnoreCase(allocationyear))
			sql.append(" and allocationyear>'" + (Integer.parseInt(getRankingYear()) - 5) + "' ");
		else if(!"-1".equalsIgnoreCase(allocationyear))
			sql.append(" and allocationyear='" + allocationyear + "' ");

		sql.append(" order by s.allocationyear desc, e.score desc, e.nameeng asc ");
		theLogger.debug("getSchoolAllocation "  + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public Map<String, String> getSchoolAllocationMap(final String entityid,final String allocationyear) throws SQLException{
		HashMap <String, String> resultMap = new HashMap<String, String>();
		List<Map<String, Object>> result = getSchoolAllocation(entityid,allocationyear);
		for(int i=0; i<result.size(); i++ ){
			resultMap.put("" + result.get(i).get("entityidto"), "" + result.get(i).get("noofstudent"));
		}
		return resultMap;
	}
    public String getSchoolAllocationReference(final String entityid,final String allocationyear) throws SQLException{
        List<Map<String, Object>> result = getSchoolAllocation(entityid,allocationyear);
        return result.isEmpty() ? "" : (String) result.get(0).get("reference");

    }
	public List<Map<String, Object>> getSchoolAllocationReport(String sortby, String sortorder, String categoryid, String schoolplacementyear) throws SQLException{
		StringBuffer sql = new StringBuffer();
        String rankingYear = getRankingYear();
        String metric1sql = "";
        String yearsql = "";
        if( jdbcTemplate.queryForObject("select count(1) from comment where userid=1 and type='system' and year=" + schoolplacementyear, Integer.class) > 0  ){
            metric1sql = "c.metric1";
            yearsql = schoolplacementyear;
        }
        else{
            metric1sql = "'?' as metric1";
            yearsql = rankingYear;
        }
        sql.append(" select e.id as entityid , concat(name,' ',nameeng) as fullname, e.name, e.nameeng ,allocationyear,count(1) as noofschool, " + metric1sql + " , s.lastmodified from schoolallocation s, entity e , ");
        sql.append(" (select metric1,entityid from comment a,entity b where a.userid=1 and type='system' and a.entityid=b.id and a.year=" + yearsql + " and b.categoryid=" + categoryid + ") c ");
        sql.append(" where  e.id=c.entityid and e.id=s.entityidfrom and e.categoryid=" + categoryid );
		if( ! "-1".equalsIgnoreCase(schoolplacementyear ))
			sql.append(" and allocationyear=" + schoolplacementyear);
		else
			sql.append(" and allocationyear=" + rankingYear);
			
		sql.append(" group by entityidfrom,allocationyear having count(1) > 1  order by " + sortby + " " + sortorder);
		theLogger.debug("getSchoolAllocationReport " + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
    public List<Map<String, Object>> getPoaSchoolNet(String categoryid) throws SQLException{
        StringBuffer sql = new StringBuffer();
        sql.append(" select distinct e.poaschoolnet from  entity e  ");
        sql.append(" where  e.categoryid=" + categoryid );
        sql.append(" and e.poaschoolnet REGEXP '^-?[0-9]+$'");
        sql.append(" order by e.poaschoolnet asc");

        theLogger.debug("getPoaSchoolNet " + sql.toString());
        List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
        return result;

    }
    public List<Map<String, Object>> getHitSchoolReport(String sortby, String sortorder, String schoolyear, String categoryid, String poaschoolnet) throws SQLException{
        StringBuffer sql = new StringBuffer();
        sql.append(" select e.id as entityid , concat(name,' ',nameeng) as fullname, e.name, e.nameeng, s.lastmodified, s.admitted, s.vacancy, e.poaschoolnet, ceil(s.vacancy / 2) as selfvacancy, ceil(s.vacancy / 30) as schoolrepeat,   ");
        sql.append(" (s.vacancy - s.admitted) as selfadmitted, ");
        sql.append(" ceil(s.vacancy / 30) as repeatstudent, ");
        sql.append(" ((s.vacancy - s.admitted)   / s.vacancy ) * 100 as overpercent, ");
		sql.append(" e.categoryid,e.chscid ");
		sql.append(" from entityscore s, entity e  ");
        sql.append(" where  e.id=s.entityid and e.categoryid=" + categoryid );
        sql.append(" and year=" + schoolyear);
        sql.append(" and e.poaschoolnet REGEXP '^-?[0-9]+$'");
        if(!"-1".equalsIgnoreCase(poaschoolnet)){
            sql.append(" and e.poaschoolnet='" + poaschoolnet + "' " );
        }
        sql.append(" order by " + sortby + " " + sortorder);

        theLogger.debug("getHitSchoolReport " + sql.toString());
        List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
        return result;
    }
	public List<Map<String, Object>> getPrivateDssReport() throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append(" select e.id as entityid , concat(name,' ',nameeng) as fullname , e.name, e.nameeng,  c.metric1, e.ranking , v.startdate as applicationdate, v.note as applicationdetails, e.schoolfee from  entity e left join event v on (e.id=v.entityid and v.active='y') ,comment c  where e.id=c.entityid and c.userid=1 and c.year=" + getRankingYear() +" and e.categoryid=1 and financetype in ('\u76F4\u8CC7','\u79C1\u7ACB')  and v.startdate  + INTERVAL 1 YEAR > CURDATE() order by nameeng asc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public int getSchoolAllocationCount(String categoryid, String schoolplacementyear) throws SQLException{
		StringBuffer sql = new StringBuffer();
		//sql.append("  select count(1) from entity where categoryid=" + categoryid + " and id in (select entityidfrom  from schoolallocation group by entityidfrom having count(1) > 1) ");
		sql.append(" select count(1) from (select  entityidfrom   from schoolallocation c, entity e  where e.id=c.entityidfrom and categoryid=" + categoryid + " and allocationyear=" + schoolplacementyear  + "   group by entityidfrom having count(1) > 1) a ");
		theLogger.debug("getSchoolAllocationCount " + sql.toString());
		return jdbcTemplate.queryForObject(sql.toString(), Integer.class);
	}
	
	public List<Map<String, Object>> getEntityImageList(final String categoryid, final String entityid) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select CONCAT(a.name, '  ', a.nameeng) as fullname, a.name, a.nameeng, a.id, e.imagepath, e.external, e.lastmodified, e.id as entityimageid from bos.entity a, bos.entityimage e   ");
		sql.append(" where e.entityid=a.id and e.status='y' ");
		sql.append(!"-1".equalsIgnoreCase(categoryid) ? " and  a.categoryid ='"+ categoryid + "'": "");
		sql.append(!"-1".equalsIgnoreCase(entityid) ? " and  a.id ='"+ entityid + "'": "");
		sql.append(" order by e.created desc limit 10  ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getEntityImageList : " + sql.toString());
		return result;
	}
	
	public List<Map<String, Object>> getSchoolList(final String type) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select distinct id as value, CONCAT(nameeng, ' | ', name) as description from entity where categoryid ='" + type + "' order by nameeng asc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public String getSchoolListText() throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select distinct e.id as entityid, e.nameeng,  e.name, chscid, e.categoryid, l.description as categoryname  from entity e, lookup l where  e.categoryid=l.value and l.type='entity.category' order by e.categoryid asc, nameeng asc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		StringBuffer sb = new StringBuffer();
		for(int i=0; i < result.size(); i++ ){
			HashMap map = (HashMap) result.get(i);
			sb.append("id=" +map.get("entityid") +  ",nameeng=" +map.get("nameeng") + ",name=" +map.get("name") + ",chscid=" +map.get("chscid") + ",categoryname=" +map.get("categoryname") + ",categoryid=" +map.get("categoryid") + System.getProperty("line.separator") );
		}
		return sb.toString();
	}
	public  List<Map<String, Object>>  getSchoolFullList(HashMap<String,String> searchMap ) throws SQLException{
		StringBuffer sql = new StringBuffer();
		sql.append("select distinct e.id as entityid, e.nameeng,  e.name, chscid, e.categoryid, l.description as categoryname  from entity e, lookup l where  e.categoryid=l.value and l.type='entity.category.chi' ");
		sql.append(searchMap.get("schoolname") != null && ! "-1".equalsIgnoreCase(searchMap.get("schoolname")) ? " and ( name like '%"+ quote(searchMap.get("schoolname")) + "%' ": "");
		sql.append(searchMap.get("schoolname") != null && ! "-1".equalsIgnoreCase(searchMap.get("schoolname")) ? " or  lower(nameeng) like '%"+ quote(searchMap.get("schoolname").toLowerCase()) + "%' ) ": "");
		
		sql.append("order by e.categoryid asc, nameeng asc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		return result;
	}
	private void generateComment(String categoryid, ApplicationContext applicationContext){
		String comment="";
		String type="";
		StringBuffer sbType =new StringBuffer();
		String secondary="";
		String start="";
		String academic="";
		String sport="";
		String music="";
		String teacher="";
		String campus="";
		String schoolfee="";
		String schoolallocation ="";
		String language="";
		String ranking ="";
		String rankingdistrict="";
		String rankingfinancetype="";
		String schoolcompare ="";
		String schoolcomparelist = "";
		String schoolcompareidlist ="";
		String schoolcomparemeta="";
		String syscomment="";
		String metadesc="";
		String keywords="";
		String qualityreview="";
		
		int avgArea=0;
		int avgSchoolFee=0;
		int metric1=0;
		int metric2=0;
		int metric3=0;
		int metric4=0;
		int metric5=0;
		int metric6=0;
		int history=0;
		HashMap<String, String> tmp = new HashMap<String, String>();
		
		Map<String, String> districtMap = new HashMap<String, String>();
		Map<String, String> poaschoolnetschortMap = new HashMap<String, String>();
		try{
			districtMap = (HashMap<String, String>) getLookupMap("district.kindergarten");
			poaschoolnetschortMap  = (HashMap<String, String>) getLookupMap("district.poaschoolnetshort");
			poaschoolnetschortMap.putAll(districtMap);
			avgArea = jdbcTemplate.queryForObject("select avg(area) from entity where categoryid=" +categoryid, Integer.class );
			avgSchoolFee = jdbcTemplate.queryForObject("select avg(schoolfee) from entity where schoolfee > 0 and categoryid=" +categoryid , Integer.class);
			
		}catch(Exception ex){
			ex.printStackTrace();
			
		}
		Map<String, Object> entity = new HashMap();
		tmp.put("categoryid", categoryid);
		tmp.put("schoolname", "-1");
		tmp.put("yearofcommencement",  "-1");
		tmp.put("nominated",  "-1");
		tmp.put("throughtrain",  "-1");
		tmp.put("feeder",  "-1");
		tmp.put("sortby",  "score2");
		tmp.put("sortorder",  "desc");
		
		Map<String, Object> entityCompare = new HashMap();
		
		try{
			String schooltype= applicationContext.getMessage("label." + getLookupMap("entity.category").get(categoryid),new Object[] {},Locale.SIMPLIFIED_CHINESE);
			theLogger.info("Generate Commnet entity list 18-Jan-19 ");
			List<Map<String, Object>> entityRankingList = getEntity(tmp,"y");
			for (int i=0; i<entityRankingList.size(); i++ ){

				comment="";
				syscomment="";
				metadesc="";
				keywords="";
				type="";
				secondary="";
				start="";
				academic="";
				sport="";
				music="";
				teacher="";
				campus="";
				schoolfee="";
				schoolallocation ="";
				language="";
				ranking ="";
				rankingdistrict="";
				rankingfinancetype="";
				schoolcompare ="";
				schoolcomparemeta="";
				schoolcomparelist = "";
				schoolcompareidlist ="";
				qualityreview="";
				sbType =new StringBuffer();

				entity = entityRankingList.get(i);
				theLogger.debug("Generate comment: " + entity.get("nameeng") + " /id: " + entity.get("id") + " /entityid: " + entity.get("entityid"));

				if("5".equalsIgnoreCase(categoryid)){

					try {
						history = Integer.parseInt(((String) entity.get("yearofcommencement")).trim());
					} catch (Exception ex) {

					}
					if(entity.get("govbody") != null && entity.get("govbody").toString().length() > 0 ){
						type  = applicationContext.getMessage( "comment.internationalschool_govbody" + (history > 0 ? "_history" : "" ), new Object[]{entity.get("govbody")}, Locale.SIMPLIFIED_CHINESE);
					}
					if("y".equals(entity.get("iskindergarten")) )
						sbType.append(  applicationContext.getMessage("label.kindergarten", new Object[]{}, Locale.SIMPLIFIED_CHINESE) );
					if("y".equals(entity.get("isprimary")))
						sbType.append( ( sbType.length() > 0 ?  "," : "" ) +  applicationContext.getMessage("label.primary", new Object[]{}, Locale.SIMPLIFIED_CHINESE) );
					if("y".equals(entity.get("issecondary")))
						sbType.append( ( sbType.length() > 0 ?  "," : "" ) +  applicationContext.getMessage("label.secondary", new Object[]{}, Locale.SIMPLIFIED_CHINESE) );

					if(entity.get("schoolfee") != null && (Integer) entity.get("schoolfee") > 0) {
						schoolfee = applicationContext.getMessage("comment.schoolfee", new Object[]{entity.get("schoolfee"), avgSchoolFee}, Locale.SIMPLIFIED_CHINESE) + "\u3002";
					}

					comment = applicationContext.getMessage("comment.internationalschool", new Object[]{entity.get("schoolsystem"),sbType.toString(),entity.get("feature")}, Locale.SIMPLIFIED_CHINESE);
					comment = type + schoolfee + comment;
					comment = comment.replaceAll("\uff0c\uff0c", "\uff0c");
					comment = comment.replaceAll("\u3002\uff0c", "\u3002");
					comment = comment.replaceAll("\u3002\u3002", "\u3002");

					syscomment = comment;
					metadesc = type +  comment;
					keywords = metadesc.replaceAll("\u3001", ",").replaceAll("\u3002", ",").replaceAll("\uFF0C", ",");

					jdbcTemplate.update("update bos.comment set comment=?,metadesc=?,keywords=?,type='system' where type='system' and userid=1 and entityid=?", syscomment, metadesc, keywords, entity.get("entityid"));

				}else {


					//Year/Name/Language/Feeder-ThroughTrain-nomiated/SecondarySchoolname/SchoolFee
					if (entity.get("throughtrain") != null && ((String) entity.get("throughtrain")).trim().length() > 2) {
						type = applicationContext.getMessage("label.throughtrain", new Object[]{}, Locale.SIMPLIFIED_CHINESE);
						secondary = (String) entity.get("throughtrain");
					} else if (entity.get("feeder") != null && ((String) entity.get("feeder")).trim().length() > 2) {
						type = applicationContext.getMessage("label.feeder", new Object[]{}, Locale.SIMPLIFIED_CHINESE);
						secondary = (String) entity.get("feeder");
					} else if (entity.get("nominated") != null && ((String) entity.get("nominated")).trim().length() > 2) {
						type = applicationContext.getMessage("label.nominated", new Object[]{}, Locale.SIMPLIFIED_CHINESE);
						secondary = (String) entity.get("nominated");
					} else {
						type = "nil";
					}

					if ("nil".equalsIgnoreCase(type)) {
						List schallocation = getSchoolAllocation(((Integer) entity.get("entityid")).toString(), getRankingYear());
						int schallocationsize = schallocation != null && schallocation.size() > 5 ? 5 : schallocation.size();
						for (int j = 0; j < schallocationsize; j++) {
							Map sch = (Map) schallocation.get(j);
							if (sch.get("name") != null)
								secondary += sch.get("name") + (j == 4 ? "" : "\u3001");
						}
					}

					if (secondary != null && secondary.trim().length() > 0) {
						//theLogger.debug("Why secondary null ? " + secondary);
						if ("nil".equalsIgnoreCase(type))
							schoolallocation = applicationContext.getMessage("comment.schoolallocationnotype", new Object[]{secondary}, Locale.SIMPLIFIED_CHINESE);
						else
							schoolallocation = applicationContext.getMessage("comment.schoolallocation", new Object[]{type, secondary}, Locale.SIMPLIFIED_CHINESE);
					} else {
						//theLogger.debug("Secondary Details " + schallocation.size() + " / " + secondary);
						schoolallocation = "";
					}
					HashMap<String, String> tmpCompare = getCompareMap(entity);

					List<Map<String, Object>> entityCompareList = getEntity(tmpCompare);

					//select same finance type only , not concern the location
					if (entityCompareList.isEmpty()) {
						//tmpCompare.put("ranking", "" + (((Integer) entity.get("ranking")).intValue() + 30) );
						tmpCompare.put("poaschoolnet", "-1");
						if (("6010".equalsIgnoreCase("" + entity.get("entityid")) || "5888".equalsIgnoreCase("" + entity.get("entityid")))) {  // update ranking ...

							//theLogger.info(" (Integer.parseInt((Integer) entity.get(ranking)) -2) > 0  ? {}" +  ((((Integer) entity.get("ranking")).intValue() -2) > 0)  );
							//theLogger.info(" (Integer.parseInt((Integer) entity.get(ranking)) ) ==  ? {}" +  entity.get("ranking")   );
						}
						//tmpCompare.put("limit", "5 offset " +   (  (Integer.parseInt((String) entity.get("ranking")) -5) > 0 ?  (Integer.parseInt((String) entity.get("ranking")) -5) : 0 )  );
						//tmpCompare.put("limit", "5 offset " +   (   (((Integer) entity.get("ranking")).intValue() - 2) > 0 ?  (((Integer) entity.get("ranking")).intValue() -2) : 0 )  );
						tmpCompare.put("limit", "5 offset 0");
						try {
							tmpCompare.put("metric1", "" + (Double.parseDouble((String) entity.get("metric1")) - 2.5 > 0 ? Double.parseDouble((String) entity.get("metric1")) - 2.5 : 2));
						} catch (Exception ex) {
							tmpCompare.put("metric1", "5");
						}
						entityCompareList = getEntity(tmpCompare);
					}
					//not concern finance type and location
					if (entityCompareList.isEmpty()) {
						tmpCompare.put("ranking", "" + (((Integer) entity.get("ranking")).intValue() + 5));
						tmpCompare.put("poaschoolnet", "-1");
						tmpCompare.put("financetypeGroup", "-1");
						tmpCompare.put("rankingfinancetype", "-1");
						tmpCompare.put("rankingdistrict", "-1");

						if (("6062".equalsIgnoreCase("" + entity.get("entityid")) || "5888".equalsIgnoreCase("" + entity.get("entityid")))) {  // update ranking ...
							//theLogger.info(" (Integer.parseInt((Integer) entity.get(ranking)) -5) > 0  ? {}" +  ((((Integer) entity.get("ranking")).intValue() -5) > 0)  );
							//theLogger.info(" (Integer.parseInt((Integer) entity.get(ranking)) ) ==  ? {}" +  entity.get("ranking")   );
						}
						//tmpCompare.put("limit", "5 offset " +   (   (((Integer) entity.get("ranking")).intValue() - 2) > 0 ?  (((Integer) entity.get("ranking")).intValue() -2) : 0 )  );
						tmpCompare.put("limit", "5 offset 0");

						try {
							tmpCompare.put("metric1", "" + (Double.parseDouble((String) entity.get("metric1")) - 2 > 0 ? Double.parseDouble((String) entity.get("metric1")) - 2 : 2));
						} catch (Exception ex) {
							tmpCompare.put("metric1", "5");
						}
						entityCompareList = getEntity(tmpCompare);
					}


					int maxEntityCompare = entityCompareList.size() > 3 ? 3 : entityCompareList.size();
					schoolcompareidlist = entity.get("id") + ",";
					for (int j = 0; j < maxEntityCompare; j++) {
						entityCompare = entityCompareList.get(j);
						schoolcomparelist += entityCompare.get("name") + (j == 2 ? "" : "\uFF0C");
						schoolcompareidlist += entityCompare.get("id") + ",";
						//theLogger.debug("compare id " + entityCompare.get("id"));
					}
					if (schoolcomparelist.endsWith("\uFF0C")) {
						schoolcomparelist = schoolcomparelist.substring(0, schoolcomparelist.lastIndexOf("\uFF0C"));
					}
					if (schoolcomparelist.trim().length() > 0) {
						schoolcompare = applicationContext.getMessage("comment.schoolcompare", new Object[]{schoolcompareidlist, schoolcomparelist}, Locale.SIMPLIFIED_CHINESE);
						schoolcomparemeta = applicationContext.getMessage("comment.schoolcomparemeta", new Object[]{schoolcomparelist}, Locale.SIMPLIFIED_CHINESE);
					}
					//theLogger.debug("schoolcompare: " + schoolcompare);
					comment = "-1";
					start = "-1";
					metric1 = 0;
					metric2 = 0;
					metric3 = 0;
					metric4 = 0;
					metric5 = 0;
					metric6 = 0;
					history = 0;

					try {
						metric1 = ((BigDecimal) entity.get("avgm1")).intValue();
						metric2 = ((BigDecimal) entity.get("avgm2")).intValue();
						metric3 = ((BigDecimal) entity.get("avgm3")).intValue();
						metric4 = ((BigDecimal) entity.get("avgm4")).intValue();
						metric5 = ((BigDecimal) entity.get("avgm5")).intValue();
						metric6 = ((BigDecimal) entity.get("avgm6")).intValue();
					} catch (Exception ex) {
						theLogger.debug("Rating conversation exception  " + ex.toString());
					}
					try {
						history = Integer.parseInt(((String) entity.get("yearofcommencement")).trim());
					} catch (Exception ex) {

					}
				/* 1-academic/2-sport/3-music */
					if (metric1 >= BESTCOMMENTSCORE && metric2 >= BESTCOMMENTSCORE && metric3 >= BESTCOMMENTSCORE) {
						if ("2".equalsIgnoreCase(categoryid))
							comment = applicationContext.getMessage("comment.allbestsecondary", new Object[]{entity.get("yearofcommencement"), entity.get("name"), entity.get("language"), (Integer) entity.get("schoolfee") > 0 ? entity.get("schoolfee") : "\u5168\u514D", avgSchoolFee}, Locale.SIMPLIFIED_CHINESE);
						else if ("1".equalsIgnoreCase(categoryid))
							comment = applicationContext.getMessage("comment.allbestprimary", new Object[]{entity.get("yearofcommencement"), entity.get("name"), entity.get("language"), (Integer) entity.get("schoolfee") > 0 ? entity.get("schoolfee") : "\u5168\u514D", avgSchoolFee}, Locale.SIMPLIFIED_CHINESE);
						else if ("0".equalsIgnoreCase(categoryid)) {
							if ((Integer) entity.get("schoolfee") > 0) {
								comment = applicationContext.getMessage("comment.allbestkindergarten", new Object[]{entity.get("yearofcommencement"), entity.get("name"), entity.get("schoolfee"), avgSchoolFee}, Locale.SIMPLIFIED_CHINESE);
							} else {
								comment = applicationContext.getMessage("comment.allbestzeroschoolfeekindergarten", new Object[]{entity.get("yearofcommencement"), entity.get("name"), entity.get("financetype"), entity.get("financetype"), entity.get("voucher"), avgSchoolFee}, Locale.SIMPLIFIED_CHINESE);
							}
						}
						comment += schoolallocation;
						theLogger.debug("Generate comment All best: " + comment);
					} else if (metric6 > BESTCOMMENTSCORE) {
						start = applicationContext.getMessage("comment.campusstart", new Object[]{entity.get("name")}, Locale.SIMPLIFIED_CHINESE);
					} else if (history > 0 && 2012 - history > 50) {
						start = applicationContext.getMessage("comment.historystart", new Object[]{"" + (2012 - history), "5".equalsIgnoreCase("" + entity.get("categoryid")) ? entity.get("schoolsystem") : entity.get("financetype"), schooltype}, Locale.SIMPLIFIED_CHINESE);
					}


					if ("-1".equalsIgnoreCase(start))
						start = applicationContext.getMessage("comment.start", new Object[]{entity.get("yearofcommencement"), entity.get("name")}, Locale.SIMPLIFIED_CHINESE);

					if (metric1 > GOODCOMMENTSCORE) {
						academic = applicationContext.getMessage("2".equalsIgnoreCase(categoryid) ? "comment.academichkceegood" : "comment.academicgood", new Object[]{}, Locale.SIMPLIFIED_CHINESE) + "\uFF0C";
					}
					if (metric2 > GOODCOMMENTSCORE) {
						sport = applicationContext.getMessage("comment.academicsport", new Object[]{}, Locale.SIMPLIFIED_CHINESE) + "\uFF0C";
					}
					if (metric3 > GOODCOMMENTSCORE) {
						music = !"0".equalsIgnoreCase(categoryid) ? applicationContext.getMessage("comment.music", new Object[]{}, Locale.SIMPLIFIED_CHINESE) + "\uFF0C" : "";
					}
					//metric4
					campus = !"0".equalsIgnoreCase(categoryid) ? applicationContext.getMessage("comment.campus", new Object[]{entity.get("area"), avgArea}, Locale.SIMPLIFIED_CHINESE) + "\uFF0C" : "";

					if (metric6 > BESTCOMMENTSCORE) {
						schoolfee = applicationContext.getMessage("comment.schoolfeebest", new Object[]{entity.get("schoolfee"), schooltype}, Locale.SIMPLIFIED_CHINESE);
					} else if ((Integer) entity.get("schoolfee") > 0) {
						schoolfee = applicationContext.getMessage("comment.schoolfee", new Object[]{entity.get("schoolfee"), avgSchoolFee}, Locale.SIMPLIFIED_CHINESE);
					} else {
						if ("0".equalsIgnoreCase(categoryid)) {
							schoolfee = applicationContext.getMessage("comment.schoolfeezerokinder", new Object[]{entity.get("financetype"), entity.get("voucher")}, Locale.SIMPLIFIED_CHINESE);
						} else {
							schoolfee = applicationContext.getMessage("comment.schoolfeezero", new Object[]{entity.get("financetype")}, Locale.SIMPLIFIED_CHINESE);
						}
					}
					if (metric5 > GOODCOMMENTSCORE) {
						teacher = applicationContext.getMessage("comment.teacher", new Object[]{}, Locale.SIMPLIFIED_CHINESE) + "\uFF0C";
					}

					if (!"0".equalsIgnoreCase(categoryid)) {
						language = applicationContext.getMessage("comment.language", new Object[]{entity.get("language")}, Locale.SIMPLIFIED_CHINESE);
					} else {
						// Do nothing to prevent copyright issue and dead link problem
						if ((entity.get("qareport") != null && ((String) entity.get("qareport")).trim().length() > 3)) {
							qualityreview = applicationContext.getMessage("comment.qualityreview", new Object[]{entity.get("qareport"), entity.get("qareporturl")}, Locale.SIMPLIFIED_CHINESE); // Kindergarten have Quality Review
						} else {
							String teacherpupilam = (entity.get("teacherpupilam") != null && ((String) entity.get("teacherpupilam")).length() > 0) ? (String) entity.get("teacherpupilam") : "";
							teacherpupilam = teacherpupilam.indexOf(":") > 0 ? teacherpupilam.substring(teacherpupilam.indexOf(":") + 1).trim() : teacherpupilam;
							if("\u6c92\u6709\u8cc7\u6599".equals(teacherpupilam))
								qualityreview = applicationContext.getMessage("comment.classroomonly", new Object[]{entity.get("noofclassroom")}, Locale.SIMPLIFIED_CHINESE); // classroom only no teacherpupilam
							else
								qualityreview = applicationContext.getMessage("comment.classroom", new Object[]{entity.get("noofclassroom"), teacherpupilam}, Locale.SIMPLIFIED_CHINESE); // classroom and teacherpupilam

						}
						//theLogger.debug("qareporturl " + entity.get("qareporturl"));
					}

					if ("-1".equalsIgnoreCase(comment))
						comment = start + ("0".equalsIgnoreCase(categoryid) ? "" : language) + academic + sport + music + campus + teacher + (!"2".equalsIgnoreCase(categoryid) ? schoolallocation + "\uFF0C" : "") + schoolfee + (qualityreview != null && qualityreview.trim().length() > 0 ? "\u3002" + qualityreview : "") + "\u3002";

					comment = comment.replaceAll("\uff0c\uff0c", "\uff0c");
					comment = comment.replaceAll("\u3002\uff0c", "\u3002");
					comment = comment.replaceAll("\u3002\u3002", "\u3002");


					ranking = applicationContext.getMessage("comment.ranking", new Object[]{entity.get("ranking")}, Locale.SIMPLIFIED_CHINESE);
					if (entity.get("rankingdistrict") != null && ((Integer) entity.get("rankingdistrict")) > 0 && poaschoolnetschortMap.get(entity.get("poaschoolnet")) != null) {
						rankingdistrict = applicationContext.getMessage("comment.rankingdistrict", new Object[]{poaschoolnetschortMap.get(entity.get("poaschoolnet")), entity.get("rankingdistrict")}, Locale.SIMPLIFIED_CHINESE);
						ranking += "\uFF0C" + rankingdistrict;
					}
					if (entity.get("rankingfinancetype") != null && ((Integer) entity.get("rankingfinancetype")) > 0) {
						rankingfinancetype = applicationContext.getMessage("comment.rankingfinancetype", new Object[]{entity.get("financetype"), entity.get("rankingfinancetype")}, Locale.SIMPLIFIED_CHINESE);
						ranking += "\uFF0C" + rankingfinancetype;
					}


					syscomment = comment + ranking + "\u3002" + schoolcompare + "\u3002";
					metadesc = comment + ranking + "\u3002" + schoolcomparemeta + "\u3002";
					keywords = metadesc.replaceAll("\u3001", ",").replaceAll("\u3002", ",").replaceAll("\uFF0C", ",");


					//unique comment override
					if (((String) entity.get("nameeng")).toLowerCase().contains("habitat") && "0".equalsIgnoreCase(categoryid)) {
						syscomment = applicationContext.getMessage("comment.kindergarten.unique.learninghabitat", new Object[]{secondary, ranking, entity.get("schoolfee"), entity.get("teacherpupilam"), entity.get("noofotherroom")}, Locale.SIMPLIFIED_CHINESE) + "\u3002" + schoolcompare + "\u3002";
					}
					if (((String) entity.get("nameeng")).toLowerCase().contains("victoria") && "0".equalsIgnoreCase(categoryid))
						syscomment = applicationContext.getMessage("comment.kindergarten.unique.victoria", new Object[]{secondary, ranking, entity.get("schoolfee"), entity.get("teacherpupilam"), entity.get("noofotherroom")}, Locale.SIMPLIFIED_CHINESE) + "\u3002" + schoolcompare + "\u3002";
					if (((String) entity.get("nameeng")).toLowerCase().contains("ming wai") && "0".equalsIgnoreCase(categoryid))
						syscomment = applicationContext.getMessage("comment.kindergarten.unique.mingwai", new Object[]{secondary, ranking, entity.get("schoolfee"), entity.get("teacherpupilam"), entity.get("noofotherroom")}, Locale.SIMPLIFIED_CHINESE) + "\u3002" + schoolcompare + "\u3002";
					if (((String) entity.get("nameeng")).toLowerCase().contains("york") && "0".equalsIgnoreCase(categoryid))
						syscomment = applicationContext.getMessage("comment.kindergarten.unique.york", new Object[]{ranking, entity.get("schoolfee")}, Locale.SIMPLIFIED_CHINESE) + "\u3002" + schoolcompare + "\u3002";
					if (((String) entity.get("nameeng")).toLowerCase().contains("catherine") && "0".equalsIgnoreCase(categoryid))
						syscomment = applicationContext.getMessage("comment.kindergarten.unique.stcatherines", new Object[]{ranking, entity.get("schoolfee")}, Locale.SIMPLIFIED_CHINESE) + "\u3002" + schoolcompare + "\u3002";

					if("13126".equals(entity.get("entityid")) || "13127".equals(entity.get("entityid")))
						theLogger.info("Generate comment: " + comment);

					jdbcTemplate.update("update bos.comment set comment=?,metadesc=?,keywords=?,type='system' where type='system' and userid=1 and entityid=?", syscomment, metadesc, keywords, entity.get("entityid"));
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	public List<Map<String, Object>> getSchoolListByDistrict(final String categoryid) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select l.description as district, l.imgpath as imgpath, count(e.id) as noofschool, e.poaschoolnet, l.tooltips  from entity e, lookup l ");
		sql.append("where e.poaschoolnet=l.value and e.categoryid='" + categoryid + "' ");
		if("1".equalsIgnoreCase(categoryid))
			sql.append(" and l.type='district.poaschoolnetshort2' ");
		else
			sql.append(" and l.type='district.kindergarten' ");
			
		sql.append("group by l.description, l.imgpath order by l.sortorder ");
		theLogger.debug("getSchoolListByDistrict:  " + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public List<Map<String, Object>> getSchoolListByIBSystem() throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select schoolsystem, schoolsystemdesc, count(e.id) as noofschool  from entity e , entitybasic eb   ");
		sql.append("where  e.id=eb.entityid and e.categoryid=5 ");
			
		sql.append("group by schoolsystem, schoolsystemdesc order by schoolsystem desc ");
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public  List<Map<String, Object>> getTopNPerDistrict(final String categoryid, final String topN) throws SQLException {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select name, score, ranking,  poaschoolnet, id, district   ");
		sql.append("from (select e1.id,e1.ranking, e1.poaschoolnet,e1.name, e1.score,l.description as district from entity e1, lookup l where e1.poaschoolnet=l.value and " + ("1".equalsIgnoreCase(categoryid) ? " l.type='district.poaschoolnetshort2' " : " l.type='district.kindergarten' " ) + " and e1.categoryid=" + categoryid + "  ) t1 ");
		sql.append("where " + topN + "  > (select count(*) from (select e1.id,e1.ranking, e1.poaschoolnet from entity e1 where e1.categoryid=" + categoryid + " ) t2 ");
		sql.append("where t1.poaschoolnet = t2.poaschoolnet and t1.ranking > t2.ranking) ");
		sql.append("group by poaschoolnet, id order by poaschoolnet, ranking asc ");
		theLogger.debug("getTopNPerDistrict "  + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public List<Map<String, Object>> getSchoolListByFinanceType(final String categoryid) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append("select financetype,count(id) as noofschool from entity e ");
		sql.append("where e.financetype is not null and e.categoryid='" + categoryid + "' ");
		sql.append("group by financetype order by financetype ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getSchoolListByFinanceType sql " +  sql.toString());
		theLogger.debug("getSchoolListByFinanceType size " +  result.size());
		return result;
	}
	public List<Map<String, Object>> getSchoolListByMode(final String categoryid) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append(" (select 'feeder' as mode,count(id) as noofschool from entity e ");
		sql.append("where e.categoryid='" + categoryid + "' and length(feeder) > 3 ) "); // length(feeder) > 3 means exclude '-' value
		sql.append("union all  ");
		sql.append(" (select 'nominated' as mode,count(id) as noofschool from entity e ");
		sql.append("where e.categoryid='" + categoryid + "' and length(nominated) > 3 ) ");
		sql.append("union all  ");
		sql.append(" (select 'throughtrain' as mode,count(id) as noofschool from entity e ");
		sql.append("where e.categoryid='" + categoryid + "' and length(throughtrain) > 3 ) ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public HashMap<String, String> getCompareMap(final Map<String, Object> entity){


        String DIRECT_PRIVATE = "'\u76F4\u8CC7','\u79C1\u7ACB'";
		HashMap<String, String> tmpCompare = new HashMap<String, String>();
		String ranktype = "";

        if("3503".equalsIgnoreCase("" + entity.get("id"))){ //la salle primary school
            tmpCompare.put("staticcompareid","3863,3509");
            return tmpCompare;
        }
        if("6062".equalsIgnoreCase("" + entity.get("id"))){ //la salle secondary school
            tmpCompare.put("staticcompareid","5888,6264,6104");
            return tmpCompare;
        }
        if("5888".equalsIgnoreCase("" + entity.get("id"))){ // Diocesan Boys school
            tmpCompare.put("staticcompareid","6062,6303,6160");
            return tmpCompare;
        }


		tmpCompare.put("categoryid", "" +  entity.get("categoryid"));
		tmpCompare.put("schoolname", "-1");
		tmpCompare.put("yearofcommencement",  "-1");
		tmpCompare.put("nominated",  "-1");
		tmpCompare.put("throughtrain",  "-1");
		tmpCompare.put("feeder",  "-1");
		tmpCompare.put("sortby",  "score2");
		tmpCompare.put("sortorder",  "desc");
        if("\u76F4\u8CC7".equalsIgnoreCase((String) entity.get("financetype")) ||  "\u79C1\u7ACB".equalsIgnoreCase((String) entity.get("financetype"))){
            tmpCompare.put("financetypeGroup", " in (" + DIRECT_PRIVATE + " ) ");
        }else{
            tmpCompare.put("financetypeGroup", "not in (" + DIRECT_PRIVATE + " ) "  );
        }
        //tmpCompare.put("metric1", "?".equalsIgnoreCase( (String) entity.get("metric1")) ? "6.5" : (String) entity.get("metric1") );
        try{
            tmpCompare.put("metric1",  "?".equalsIgnoreCase( (String) entity.get("metric1")) ? "6.5" : ("" + ( Double.parseDouble((String) entity.get("metric1")) - 1.5 > 0 ?  Double.parseDouble((String) entity.get("metric1")) - 1.5 : 4 )  ));
        }catch(Exception ex){
            tmpCompare.put("metric1","6.5");
        }

        // if ranking is top 10, choose other school with 10 ranking lower than it, otherwise choose 5 ranking lower than it
        //tmpCompare.put("ranking",  ""  + ( ((Integer) entity.get("ranking")).intValue()  < 30 ?  (((Integer) entity.get("ranking")).intValue() + 10 ) : (((Integer) entity.get("ranking")).intValue() + 15 )  ));
        tmpCompare.put("entityid", "" +  entity.get("entityid"));
        tmpCompare.put("comparemapshowsql", "y");


        // Direct Subsidy Scheme or Private
		if("\u76F4\u8CC7".equalsIgnoreCase((String) entity.get("financetype")) ||  "\u79C1\u7ACB".equalsIgnoreCase((String) entity.get("financetype")) || "5".equalsIgnoreCase("" +  entity.get("categoryid")) ){
			tmpCompare.put("poaschoolnet", "-1" );
			ranktype= "rankingfinancetype";
		}else{
			tmpCompare.put("poaschoolnet", (String)  entity.get("poaschoolnet") );
			ranktype= "rankingdistrict";
		}
		if("\u7537".equalsIgnoreCase((String) entity.get("sex"))) // male
			tmpCompare.put("sexopposite", "\u5973" ); // not in female
		else if("\u5973".equalsIgnoreCase((String) entity.get("sex"))) // female
			tmpCompare.put("sexopposite", "\u7537"  ); //not in male

		if(ranktype == null || ranktype.trim().length() == 0 || entity.get(ranktype) == null){
			theLogger.info("entityid " + entity.get("id"));
			theLogger.info("ranktype " + ranktype);
			theLogger.info("rank " + entity.get(ranktype));
		}
		tmpCompare.put(ranktype, "" + (((Integer)  entity.get(ranktype)).intValue() + 4)  );
        int limitstart=0;
		try{
			limitstart =  ((Integer)  entity.get(ranktype)).intValue()-COMPARECOMMENTOFFSET   > 0 ? ((Integer)  entity.get(ranktype)).intValue() : COMPARECOMMENTOFFSET;
            //limitstart =  ((Integer)  entity.get("ranking")).intValue()-COMPARECOMMENTOFFSET   > 0 ? ((Integer)  entity.get("ranking")).intValue() : COMPARECOMMENTOFFSET;
        }catch(Exception ex){
			//ex.printStackTrace();
			limitstart=COMPARECOMMENTOFFSET;

		}
		theLogger.debug("entityid " + entity.get("id"));
		theLogger.debug("ranktype " + ranktype);
		theLogger.debug("rank " + entity.get(ranktype));
		theLogger.debug("limitstart " + limitstart);

		tmpCompare.put("idnotin", ((Integer) entity.get("id")).toString() );
		//tmpCompare.put("limit", "5 offset " +   (limitstart - COMPARECOMMENTOFFSET)  );
        tmpCompare.put("limit", "5 offset 0 "  );

        return tmpCompare;
	}
	public HashMap<String, String > getPOASchoolNet() throws SQLException {

		List<Map<String, Object>> result = getLookup("district.poaschoolnetshort2");
		HashMap<String, String> resultMap = new HashMap<String, String>();
		String prevdesc = "-1";
		StringBuffer schoolnet = new StringBuffer();
		if(result.size() > 0){
			for(int i=0; i < result.size(); i++ ){
				HashMap map = (HashMap) result.get(i);
				if(i > 0 && ! prevdesc.equalsIgnoreCase("" + map.get("description"))){
					resultMap.put(prevdesc, schoolnet.toString().substring(0, schoolnet.toString().length() - 3 ) );
					//theLogger.debug("getPOASchoolNet: " + prevdesc + "," +  schoolnet.toString().substring(0, schoolnet.toString().length() - 3 ));
					schoolnet = new StringBuffer();
				}
				schoolnet.append("" + map.get("value") + " / ");
				prevdesc = "" + map.get("description");
			}
			resultMap.put(prevdesc, schoolnet.toString().substring(0, schoolnet.toString().length() - 3 ) );
		}
		return resultMap;
		
	}
	public List<Map<String, Object>> getSchoolCompareAnalyticsList(final String entityids) throws SQLException {
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select e.name,e.categoryid,e.sex,e.noofotherroom,e.noofspecialroom,e.area,e.language,e.financetype,e.feeder,e.nominated,e.throughtrain,e.teacherpupilam" +
				" ,e.id,format(e.schoolfee,0) as fschoolfee,  c.metric1, c.metric2, c.metric3, c.metric4, c.metric5, c.metric6 ");
		sql.append(" from entity e, comment c, entityscore es   ");
        //sql.append(" where e.id=c.entityid and c.userid=1 and c.type='system' and c.year=" + getRankingYear() +  " and e.id in(" + entityids + ") order by c.metric1 desc,c.metric4 desc,c.metric3 desc,c.metric2 desc,c.metric5 desc, e.nameeng asc ");
        sql.append(" where e.id=c.entityid and e.id=es.entityid and c.userid=1 and c.type='system' and c.year=" + getRankingYear() + " and es.year=" + getRankingYear() +  " and e.id in(" + entityids + ") order by e.ranking asc, e.nameeng asc ");
		theLogger.debug("getSchoolCompareAnalyticsList " + sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public List<Map<String, Object>> getSchoolSessionList() throws SQLException {
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select distinct session as session from entity where length(session) > 0 and session is not null group by session order by session asc ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		return result;
	}
	public List<Map<String, Object>> getTopParentEntityList(int limit) throws SQLException {

		StringBuffer sql = new StringBuffer();
		sql.append(" select  e.id as entityid, name as namelocal,  CAST((avg(b.metric1) + avg(b.metric2) + avg(b.metric3) + avg(b.metric4) )/4 AS DECIMAL(10,1)) as userscore, '10' as maxscore, b.lastmodified as lastmodified ");
		sql.append(" from comment b, entity e ");
		sql.append(" where b.type='polling' and grade > 0 and b.entityid=e.id " );
		sql.append(" group by e.id order by userscore  desc limit " + limit);
		
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		
		return result;
	}
	public void patchExceedQuotaData(String categoryid, String isReset){

        jdbcTemplate.update("update entityscore es, entity e set es.exceedquota=" + ("y".equalsIgnoreCase(isReset) ? "0" :  EXCEEDQUOTATEMP) + " where e.id=es.entityid and ( (e.financetypeeng = 'direct') or (e.financetypeeng = 'private')  ) and es.year=" + getRankingYear() + " and e.categoryid=" + categoryid + " and es.categoryid=" + categoryid + " and  (es.exceedquota=" + ("y".equalsIgnoreCase(isReset) ?   EXCEEDQUOTATEMP : "0 or es.exceedquota is null " ) + " ) "  );

    }

	public List<Map<String,Object>> getAllSchools() {

/*		StringBuffer sql = new StringBuffer();
		sql.append("select a.id as pk, round(a.parentscore,1) as parentscore, a.*, ");
		sql.append("IF(avg(metric1) > 0 , round(avg(metric1),1) , '0')  as metric1, ");
		sql.append("IF(avg(metric2) > 0 , round(avg(metric2),1) , '0')  as metric2, ");
		sql.append("IF(avg(metric3) > 0 , round(avg(metric3),1) , '0')  as metric3, ");
		sql.append("IF(avg(metric4) > 0 , round(avg(metric4),1) , '0')  as metric4, ");
		sql.append( "count(c.entityid) as parentcommentcount," );
		sql.append(" (select max(comment) from comment s, lookup l where entityid=a.id and s.type='system' and userid=1 and year=l.value and l.type='system.param') as systemcomment ");
		sql.append(" from bos.entity a, comment c  ");
		sql.append(" where a.categoryid in (0,1,2,4) and a.id=c.entityid and c.type='polling' "); // c.year=" + getRankingYear());
		sql.append(" group by a.id, a.name ");
		sql.append(" order by a.categoryid asc, a.nameeng asc, a.ranking asc  ");
		theLogger.info(sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.info("getEntityList Result size " + result.size());
		return result;*/

		StringBuffer sql = new StringBuffer();
		sql.append(" select a.id as pk, ");
		sql.append(" IF(b.nameyahoo is null , a.name , b.nameyahoo)  as name, " );
		sql.append(" a.address, a.telephone, a.score, a.email,a.ranking, a.url, a.categoryid,  ");
		sql.append(" a.principal, a.financetype, a.sex, a.religion, a.poaschoolnet,  ");
		sql.append(" IF(a.metricparent1 > 0 , round(a.metricparent1,1) , '0')  as metricparent1, ");
		sql.append(" IF(a.metricparent2 > 0 , round(a.metricparent2,1) , '0')  as metricparent2, ");
		sql.append(" IF(a.metricparent3 > 0 , round(a.metricparent3,1) , '0')  as metricparent3, ");
		sql.append(" IF(a.metricparent4 > 0 , round(a.metricparent4,1) , '0')  as metricparent4, ");
		sql.append(" a.parentcommentcount, o.hitcounter as viewcount, ");
		sql.append(" c.comment as systemcomment, b.lat, b.lng, ");
		sql.append(" concat('http://www.bookofschool.com/school/staticimage/CAT', categoryid, '/logo_' , chscid , '.jpg') as  imgpath ");
		//sql.append(" a.nameyahoo ");
		sql.append(" from bos.entity a, comment c, entitybasic b, objectstat o   ");
		sql.append(" where a.categoryid in (0,1,2,5) and a.id=c.entityid and a.id=b.entityid ");
		sql.append(" and o.type = 'entity' and o.objectid=c.entityid ");
		sql.append(" and c.type='system' and c.userid=1 and c.year=" + getRankingYear());
		sql.append(" and b.isclosed = 'n' and b.notshowyahoo ='n' ");
		sql.append(" order by a.categoryid asc, a.nameeng asc, a.ranking asc  ");
		theLogger.debug(sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getEntityList Result size " + result.size());
		return result;

	}
	//SHARE WITH IPHONE AND YAHOO API
	public List<Map<String,Object>> getSchools(HashMap<String, String> params) {

		StringBuffer sql = new StringBuffer();
		sql.append(" select a.id as pk, ");
		sql.append(" IF(b.nameyahoo is null , a.name , b.nameyahoo)  as name, a.nameeng, " );
		sql.append(" a.address, a.telephone, a.score, a.email,a.ranking, a.url, a.categoryid,sex,  ");
		sql.append(" a.principal, a.financetype, a.sex, a.religion, a.poaschoolnet,  ");
		sql.append(" IF(a.metricparent1 > 0 , round(a.metricparent1,1) , '0')  as metricparent1, ");
		sql.append(" IF(a.metricparent2 > 0 , round(a.metricparent2,1) , '0')  as metricparent2, ");
		sql.append(" IF(a.metricparent3 > 0 , round(a.metricparent3,1) , '0')  as metricparent3, ");
		sql.append(" IF(a.metricparent4 > 0 , round(a.metricparent4,1) , '0')  as metricparent4, ");
		sql.append(" IF(a.metricoverall1 > 0 , round(a.metricoverall1,1) , '0')  as metricoverall1, ");
		sql.append(" IF(a.metricoverall2 > 0 , round(a.metricoverall2,1) , '0')  as metricoverall2, ");
		sql.append(" IF(a.metricoverall3 > 0 , round(a.metricoverall3,1) , '0')  as metricoverall3, ");
		sql.append(" IF(a.metricoverall4 > 0 , round(a.metricoverall4,1) , '0')  as metricoverall4, ");
		sql.append(" IF(a.metricoverall5 > 0 , round(a.metricoverall5,1) , '0')  as metricoverall5, ");
		if(params.containsKey("lat") && params.containsKey("lon")) {
			sql.append("round( ( 6371 * acos( cos( radians(" + params.get("lat") + ") ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(" + params.get("lon") + ") ) + sin( radians(" +  params.get("lat") + ") ) * sin( radians( lat ) ) ) ), 1)  AS distance, ");
		}
		if(params.containsKey("metric")){
			sql.append("banding,hkdsepassrate,chipassrate,engpassrate,urate,sixcoursesratio,");
			sql.append("athleticsposmale,athleticsdivmale,athleticsposfemale,athleticsdivfemale,footballpos,footballdiv,swimmingposmale,swimmingdivmale,swimmingposfemale,swimmingdivfemale,basketballposmale,basketballdivmale,basketballposfemale,basketballdivfemale,athleticsdivname ,");
			sql.append("choirchinese,choirforeign,instrumentchinese,instrumentwestern,musicfirst,musicsecond,musicthird,speechfirst,speechsecond,speechthird,musicother,debatechi,");
			sql.append("area,noofspecialroom,teacherexperience,teachermaster,teacherbachelor,teacherforeign,schoolfee,tuitionfee,");
			sql.append("schoolallocationscore,qareport,voucher,schoolfeenursery,noofclassroom,indoorplayground,outdoorplayground,musicroom,noofotherroom,teacherpupilam,teacherpupilpm,");
			sql.append("exceedquota,noofhall,noofplayground,nooflibraryroom,");
		}
		sql.append(" a.parentcommentcount, o.hitcounter as viewcount, ");
		sql.append(" c.comment as systemcomment, b.lat, b.lng, ");
		sql.append(" concat('https://www.bookofschool.com/school/staticimage/CAT', categoryid, '/logo_' , chscid , '.jpg') as  imgpath ");
		//sql.append(" a.nameyahoo ");
		sql.append(" from bos.entity a, comment c, entitybasic b, objectstat o  ");
		sql.append(" where a.id=c.entityid and a.id=b.entityid ");
		sql.append(" and o.type = 'entity' and o.objectid=c.entityid ");

		sql.append(params.containsKey("system")  ? " and  b.schoolsystem='" +  params.get("system") + "'   " : "");

		if(params.containsKey("categoryid"))
			sql.append("and a.categoryid=" + params.get("categoryid") + " ");
		else
			sql.append("and a.categoryid in (0,1,2,5) ");

		if(params.containsKey("entityid"))
			sql.append("and a.id=" + params.get("entityid") + " ");

		if(params.containsKey("name")) {
			String name = params.get("name");
			name = name.replaceAll("'","''");
			sql.append("and (a.name like '%" + name + "%' or a.nameeng like '%" + name + "%') ");
		}
		if(params.containsKey("district"))
			sql.append("and a.poaschoolnet in('" + params.get("district") + "') ");

		sql.append(" and c.type='system' and c.userid=1 and c.year=" + getRankingYear());
		//sql.append(" and b.isclosed = 'n' and b.notshowyahoo ='n' ");
		sql.append(" and b.isclosed = 'n'  ");



		if(params.containsKey("lat") && params.containsKey("lon")) {
			sql.append("HAVING distance < 1 ORDER BY distance LIMIT 0 , 20");
		}else {

			if (params.containsKey("ranking"))
				sql.append(" order by a.categoryid asc, a.ranking asc limit 100  ");
			else
				sql.append(" order by a.categoryid asc, a.ranking asc, a.nameeng asc  ");

			if (params.containsKey("name")){
				sql.append(" limit 50");
			}
		}


//		select a.id as pk,  IF(b.nameyahoo is null , a.name , b.nameyahoo)  as name, a.nameeng,  a.address, a.telephone, a.score, a.email,a.ranking, a.url, a.categoryid,sex,   a.principal, a.financetype, a.sex, a.religion, a.poaschoolnet,   IF(a.metricparent1 > 0 , round(a.metricparent1,1) , '0')  as metricparent1,  IF(a.metricparent2 > 0 , round(a.metricparent2,1) , '0')  as metricparent2,  IF(a.metricparent3 > 0 , round(a.metricparent3,1) , '0')  as metricparent3,  IF(a.metricparent4 > 0 , round(a.metricparent4,1) , '0')  as metricparent4,  IF(a.metricoverall1 > 0 , round(a.metricoverall1,1) , '0')  as metricoverall1,  IF(a.metricoverall2 > 0 , round(a.metricoverall2,1) , '0')  as metricoverall2,  IF(a.metricoverall3 > 0 , round(a.metricoverall3,1) , '0')  as metricoverall3,  IF(a.metricoverall4 > 0 , round(a.metricoverall4,1) , '0')  as metricoverall4,  IF(a.metricoverall5 > 0 , round(a.metricoverall5,1) , '0')  as metricoverall5,
//		( 6371 * acos( cos( radians(22.323582) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(114.17422) ) + sin( radians(22.323582) ) * sin( radians( lat ) ) ) ) AS distance,
//		a.parentcommentcount,  c.comment as systemcomment, b.lat, b.lng,  concat('https://www.bookofschool.com/school/staticimage/CAT', categoryid, '/logo_' , chscid , '.jpg') as  imgpath  from bos.entity a, comment c, entitybasic b   where a.id=c.entityid and a.id=b.entityid and a.categoryid in (0,1,2,5)  and c.type='system' and c.userid=1 and c.year=2016 and b.isclosed = 'n' and b.notshowyahoo ='n'
//		HAVING distance < 1 ORDER BY distance LIMIT 0 , 20;

		theLogger.debug(sql.toString());
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql.toString());
		theLogger.debug("getEntityList Result size " + result.size());
		return result;

	}
	public void updateEntityParentMetric(String id, String m1, String m2, String m3, String m4,String parentcommentcount){
		StringBuffer sql = new StringBuffer();
		sql.append("update entity set metricparent1='" + m1 + "', metricparent2='" + m2 + "', metricparent3='" + m3 + "', metricparent4='" + m4 + "', parentcommentcount='" + parentcommentcount + "' where id=" + id);
		theLogger.debug("updateEntityParentMetric " + sql.toString());
		jdbcTemplate.update(sql.toString());
	}
	public void updateEntityImage(String id, String filename, String status){
		StringBuffer sql = new StringBuffer();
		sql.append("insert into bos.entityimage (entityid,imagepath,created,status) values (" +id+",'" + filename + "',NOW() + INTERVAL 13 DAY, '" + status + "')");
		theLogger.info("updateEntityImage " + sql.toString());
		jdbcTemplate.update(sql.toString());
	}
	public void deleteEntityImage(String id, String filename){
		StringBuffer sql = new StringBuffer();
		sql.append("delete from bos.entityimage where entityid=" + id + " and imagepath='" + filename + "'");
		//sql.append("update bos.entityimage set status='n' where entityid=" + id + " and imagepath='" + filename + "'");
		theLogger.info("delete  deleteEntityImage:  " + sql.toString());
		jdbcTemplate.update(sql.toString());
	}

}

