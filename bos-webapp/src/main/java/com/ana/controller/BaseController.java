package com.ana.controller;

import com.ana.dao.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

import static org.springframework.web.context.support.WebApplicationContextUtils.*;

@Controller(value="baseController")
public abstract class BaseController {

    private final Logger theLogger = LoggerFactory.getLogger(BaseController.class);
    final static String STATUSBOX = "statusbox";
	static List<Map<String, Object>> kindergartenSchoolList;
	static List<Map<String, Object>> primarySchoolList;
	static List<Map<String, Object>> secondarySchoolList;
    static List<Map<String, Object>> ibSchoolList;
	static HashSet<String> foulLanguageSet = new HashSet<String>();


	static List<Map<String, Object>> entityImagesAll ;
	static List<Map<String, Object>> financeTypePrimaryList;
	static List<Map<String, Object>> poaschoolnetList;
	static List<Map<String, Object>> financeTypeKindergartenList;
	static List<Map<String, Object>> financeTypeSecondaryList ;
	static List<Map<String, Object>> districtList;
	static Map<String, String> poaschoolnetshortMap;
	static Map<String, String> apiMap = new HashMap<String, String>();

	static String schoolText;
	//static List<Map<String, Object>> poaschoolnetonlyshortList;
	static final int maxchatsize=150;
    final static boolean blockattack = true;
    static int totalparentcount=0;
    static int totalusercount=0;
    static int totalhitcount=0;
    static int totaltutorcount=0;


	
    @Autowired
	protected EntityDAO entityDAO;
	
	@Autowired
	protected EventDAO eventDAO;
	
	@Autowired
	protected ServiceDAO serviceDAO;

	@Autowired
	protected UserDAO userDAO;
	
	@Autowired
	protected QuestionAnswerDAO questionAnswerDAO;
	
	@Autowired
	protected TutorDAO tutorDAO;
	
	@Autowired
	protected CaseDAO caseDAO;
	
	@Autowired
	protected CMSDAO cmsDAO;

	public void setEntityDAO(EntityDAO entityDAO) {
		this.entityDAO = entityDAO;
	}
	public void setEventDAO(EventDAO eventDAO) {
		this.eventDAO = eventDAO;
	}
	
	public void setServiceDAO(ServiceDAO serviceDAO) {
		this.serviceDAO = serviceDAO;
	}
	
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	public void setQuestionAnswerDAO(QuestionAnswerDAO questionAnswerDAO) {
		this.questionAnswerDAO = questionAnswerDAO;
	}
	public void setTutorDAO(TutorDAO tutorDAO) {
		this.tutorDAO = tutorDAO;
	}
	
	public void setCaseDAO(CaseDAO caseDAO) {
		this.caseDAO = caseDAO;
	}
	
	public void setCMSDAO(CMSDAO cmsDAO) {
		this.cmsDAO = cmsDAO;
	}
	
	protected void initStaticData(HttpServletRequest request){
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		String userid = "-1";

		foulLanguageSet.add("撚");
		foulLanguageSet.add("仆");
		foulLanguageSet.add("閪");
		foulLanguageSet.add("黃狗耀");
		foulLanguageSet.add("script");
		foulLanguageSet.add("郭智峰");
		foulLanguageSet.add("屎");
		foulLanguageSet.add("屌");
		foulLanguageSet.add("老母");
		foulLanguageSet.add("臭");


		try{
			userid = user != null && user.get("ID") != null &&  (Integer) user.get("ID") > 0  ? ((Integer) user.get("ID")).toString()  : "-1";
		}catch (Exception ex){}
		ServletContext appContext = request.getServletContext();
		try{
			if(schoolText == null || kindergartenSchoolList == null || poaschoolnetshortMap == null ){
				System.out.println("LOAD BASE CONTROLLER AGAIN $#$%#$%#%#$%#$#$%#$%#$%# ================ \n");

				//entityImagesAll = entityDAO.getEntityImageList("-1","-1");
				//P
				//financeTypePrimaryList = entityDAO.getSearchField("financeType","1");
				//poaschoolnetList = entityDAO.getLookup("district.poaschoolnet");
				//K
				//financeTypeKindergartenList = entityDAO.getSearchField("financeType","0");
				//S
				//financeTypeSecondaryList=entityDAO.getSearchField("financeType","2");
				//districtList=entityDAO.getLookup("district.kindergarten");

				Map<String, String> districtMap = new HashMap<String, String>();
				Map<String, String> poaschoolnetschortMapLocal = new HashMap<String, String>();
				districtMap = (HashMap<String, String>) entityDAO.getLookupMap("district.kindergarten");
				poaschoolnetschortMapLocal  = (HashMap<String, String>) entityDAO.getLookupMap("district.poaschoolnetshort");
				apiMap = (HashMap<String, String>) entityDAO.getLookupMap("api.auth") ;
				//poaschoolnetonlyshortList =  entityDAO.getLookup("district.poaschoolnetshort");

				poaschoolnetschortMapLocal.putAll(districtMap);
				
				poaschoolnetshortMap= poaschoolnetschortMapLocal ;
				
				kindergartenSchoolList = entityDAO.getSchoolList("0");
				primarySchoolList = entityDAO.getSchoolList("1");
                secondarySchoolList = entityDAO.getSchoolList("2");
                ibSchoolList = entityDAO.getSchoolList("5");

				// used by school quick search in Service Controller
                schoolText = entityDAO.getSchoolListText();
                totalparentcount = serviceDAO.getTotalParentPollCount();
                totalusercount = serviceDAO.getTotalUserCount();
                totalhitcount = serviceDAO.getTotalSchoolHitCount();
                totaltutorcount =  serviceDAO.getTotalTutorCount();
			}
			appContext.setAttribute("poaschoolnetlist",entityDAO.getLookup("district.kindergarten"));

			appContext.setAttribute("kindergartenSchoolList",kindergartenSchoolList);
			appContext.setAttribute("primarySchoolList",primarySchoolList);
			appContext.setAttribute("secondarySchoolList",secondarySchoolList);
			//appContext.setAttribute("entityImagesAll",entityImagesAll );
			appContext.setAttribute("ibSchoolList",ibSchoolList);
			//appContext.setAttribute("financeTypePrimaryList", financeTypePrimaryList );
			//appContext.setAttribute("poaschoolnetList",  poaschoolnetList);
			//appContext.setAttribute("financeTypeKindergartenList",financeTypeKindergartenList  );
			//appContext.setAttribute("financeTypeSecondaryList", financeTypeSecondaryList );
			//appContext.setAttribute("districtList",  districtList);
			appContext.setAttribute("poaschoolnetshortMap",  poaschoolnetshortMap);
			appContext.setAttribute("apiMap",  apiMap);

			//request.setAttribute("poaschoolnetonlyshortList",  poaschoolnetonlyshortList);
			//request.setAttribute("schoolmasterlist",userDAO.getTopUserList(8));

			appContext.setAttribute("totalparentcount", totalparentcount );
			appContext.setAttribute("totalusercount", totalusercount );
			appContext.setAttribute("totalhitcount",   totalhitcount);
			appContext.setAttribute("totaltutorcount",   totaltutorcount);
			appContext.setAttribute("totaltutorcount",   totaltutorcount);

			if(user != null){
				request.setAttribute("unreadmessagecount",   questionAnswerDAO.getUnreadMessageCount(userid));
				request.setAttribute("friendscount",   questionAnswerDAO.getPrivateMessageUserList(userid).size());
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	protected String getIPaddress(HttpServletRequest request){
		String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }  
        return ip;
	}
	
	
	protected ArrayList<Map<String,String>> buildTopMenu(HttpServletRequest request){
		
		ApplicationContext applicationContext = getWebApplicationContext(request.getServletContext());
		boolean entityexist = false;
		boolean poaschoolnetexist = true;
		String URI = request.getRequestURI();
		Map<String,String> paramMap = new HashMap<String,String> ();
		
		String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");
		String financetype = request.getParameter("financetype") != null ? request.getParameter("financetype") : "-1";
		String nursery = request.getParameter("nursery") != null ? request.getParameter("nursery") : "-1";
		String poaschoolnets = request.getParameter("poaschoolnets") != null && request.getParameter("poaschoolnets").length() > 0  ? request.getParameter("poaschoolnets") : "-1";
		String poaschoolnet= ! "-1".equalsIgnoreCase(request.getParameter("poaschoolnet"))  && request.getParameter("poaschoolnet") != null && request.getParameter("poaschoolnet").length() > 0  ? request.getParameter("poaschoolnet") : poaschoolnets;
		String categoryid = request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "-1";
		String districtschoolbreadcrumb = request.getParameter("districtschoolbreadcrumb") != null ? request.getParameter("districtschoolbreadcrumb") : "-1";
		String schoolsystem = request.getParameter("schoolsystem") != null ? request.getParameter("schoolsystem") : "-1";
		String nominated = request.getParameter("nominated") != null ? request.getParameter("nominated") : "-1";
		String throughtrain = request.getParameter("throughtrain") != null ? request.getParameter("throughtrain") : "-1";
		String feeder = request.getParameter("feeder") != null ? request.getParameter("feeder") : "-1";
		
		
		paramMap.put("entityid", entityid);
		paramMap.put("categoryid", categoryid);
		paramMap.put("poaschoolnet", poaschoolnet);
		paramMap.put("financetype", financetype);
		paramMap.put("nursery", nursery);
		paramMap.put("schoolsystem", schoolsystem);
		
		paramMap.put("districtschoolbreadcrumb", districtschoolbreadcrumb);
		
		//theLogger.debug("buildTopMenu ............." );
		//theLogger.debug("categoryid" + paramMap.get("categoryid"));
		//theLogger.debug("poaschoolnet" +  paramMap.get("poaschoolnet"));
		//theLogger.debug("poaschoolnets" +  paramMap.get("poaschoolnets"));
		//theLogger.debug("districtschoolbreadcrumb " +  paramMap.get("districtschoolbreadcrumb"));
		//theLogger.debug("financetype " +  paramMap.get("financetype"));
		
		URI = URI.substring(URI.lastIndexOf("/"));
		HashMap<String,String> topmenutitle = new HashMap<String,String>();
		topmenutitle.put("/myFavoriteConsole","label.favorite");
		topmenutitle.put("/home","label.home");
		topmenutitle.put("/primarySchoolConsole","label.primary");
		topmenutitle.put("/secondarySchoolConsole","label.secondary");
		topmenutitle.put("/kindergartenConsole","label.kindergarten");
		topmenutitle.put("/intlSchoolConsole","label.ib");
		topmenutitle.put("/schoolSearch","label.search");
		
		
		try{
			HashMap<String, String> poaschoolnetschortMapLocal  = (HashMap<String, String>) entityDAO.getLookupMap("district.poaschoolnetshort");
			HashMap<String, String> poaschoolnetMap  = (HashMap<String, String >) entityDAO.getPOASchoolNet();
			HashMap<String, String> poaschoolnetKindergarten  = (HashMap<String, String>) entityDAO.getLookupMap("district.kindergarten");
			
			theLogger.debug("URI "  + URI);
			if(entityid.contains(","))
				entityid = entityid.substring(0,entityid.indexOf(","));
			
			HashMap<String,String> topmenu = new HashMap<String,String>();
			ArrayList<Map<String,String>> topMenu = new ArrayList<Map<String,String>>();
			String last="";
			categoryid =  "" + entityDAO.getCategoryEntity(entityid);
			Map<String, Object> entity = entityDAO.getEntityDetailsLimit(entityid,categoryid,"","single");
		
			if(entityid != null && entityid.trim().length() > 0 && entity != null && ((String) entity.get("name")).trim().length() > 0 ){
				entityexist = true;
				financetype=(String)entity.get("financetype");
				poaschoolnet=(String)entity.get("poaschoolnet");
				nursery= "yes".equalsIgnoreCase((String)entity.get("nursery")) ? applicationContext.getMessage("label.nursery", null, Locale.SIMPLIFIED_CHINESE) : "-1" ;
				schoolsystem=(String)entity.get("schoolsystem");
			
			}else{
				entityexist = false;
				categoryid =  paramMap.get("categoryid");
				financetype=paramMap.get("financetype");
				poaschoolnet=paramMap.get("poaschoolnet");
				nursery=paramMap.get("nursery");
				schoolsystem=paramMap.get("schoolsystem");
				
						
			}
			poaschoolnetexist = poaschoolnetKindergarten.containsKey(poaschoolnet) ? true : false;
			
			topmenu = new HashMap<String,String>(); 
			if(entityexist){
				topmenu.put("LAST", (String) entity.get("name"));
				topmenu.put("ENTITYEXIST", "true");
			}
			
			topmenu.put("URI","home");
			topmenu.put("NAME",applicationContext.getMessage("label.home", null, Locale.SIMPLIFIED_CHINESE)) ;
			topMenu.add(topmenu);
			
			topmenu = new HashMap<String,String>(); 
			theLogger.debug("buildTopMenu categoryid " + categoryid);
			
			if("0".equalsIgnoreCase(categoryid)){
				topmenu.put("URI","kindergartenConsole?categoryid=0");
				topmenu.put("NAME",applicationContext.getMessage("label.kindergarten", null, Locale.SIMPLIFIED_CHINESE)) ;
				topMenu.add(topmenu);
			}else if("1".equalsIgnoreCase(categoryid)){
				topmenu.put("URI","primarySchoolConsole?categoryid=1");
				topmenu.put("NAME",applicationContext.getMessage("label.primary", null, Locale.SIMPLIFIED_CHINESE)) ;
				topMenu.add(topmenu);
						
			}else if("2".equalsIgnoreCase(categoryid)){
				topmenu.put("URI","secondarySchoolConsole?categoryid=2");
				topmenu.put("NAME",applicationContext.getMessage("label.secondary", null, Locale.SIMPLIFIED_CHINESE)) ;
				topMenu.add(topmenu);
			}else if("5".equalsIgnoreCase(categoryid)){
				topmenu.put("URI","intlSchoolConsole?categoryid=5");
				topmenu.put("NAME",applicationContext.getMessage("label.ib", null, Locale.SIMPLIFIED_CHINESE)) ;
				topMenu.add(topmenu);
			}
			if(!"-1".equalsIgnoreCase(financetype) && !"5".equalsIgnoreCase(categoryid)){
				topmenu = new HashMap<String,String>(); 
				topmenu.put("URI","javascript:getSchoolListByFinanceTypeMenu('" + financetype +"','" + categoryid + "')");
				topmenu.put("NAME",financetype) ;
				topmenu.put("SCRIPT","true") ;
				topMenu.add(topmenu);
			}
			
			if("1".equalsIgnoreCase(feeder)){
				topmenu = new HashMap<String,String>();
				topmenu.put("URI","javascript:getSchoolListByMode('1')");
				topmenu.put("NAME",applicationContext.getMessage("label.feeder", null, Locale.SIMPLIFIED_CHINESE)) ;
				topmenu.put("SCRIPT","true") ;
				topMenu.add(topmenu);
				
			}else if("2".equalsIgnoreCase(nominated)){
				topmenu = new HashMap<String,String>();
				topmenu.put("URI","javascript:getSchoolListByMode('2')");
				topmenu.put("NAME",applicationContext.getMessage("label.nominated", null, Locale.SIMPLIFIED_CHINESE)) ;
				topmenu.put("SCRIPT","true") ;
				topMenu.add(topmenu);
						
			}else if("3".equalsIgnoreCase(throughtrain)){
				topmenu = new HashMap<String,String>();
				topmenu.put("URI","javascript:getSchoolListByMode('3')");
				topmenu.put("NAME",applicationContext.getMessage("label.throughtrain", null, Locale.SIMPLIFIED_CHINESE)) ;
				topmenu.put("SCRIPT","true") ;
				topMenu.add(topmenu);
			}
			
			if(!"-1".equalsIgnoreCase(nursery)){
				topmenu = new HashMap<String,String>(); 
				topmenu.put("URI","javascript:getSchoolListByNurseryMenu('" + nursery +"','" + categoryid + "')");
				topmenu.put("NAME",nursery) ;
				topmenu.put("SCRIPT","true") ;
				topMenu.add(topmenu);
			}

			if(poaschoolnetschortMapLocal != null && poaschoolnet != null && ! "-1".equalsIgnoreCase(poaschoolnet) && ! "/".equalsIgnoreCase(poaschoolnet) && !"5".equalsIgnoreCase(categoryid)){
				topmenu = new HashMap<String,String>(); 
				if(! "1".equalsIgnoreCase(categoryid) && poaschoolnetexist){
					topmenu.put("URI","javascript:getSchoolListMenu('" + poaschoolnet +"','" + categoryid + "')");
					topmenu.put("NAME",(String) poaschoolnetKindergarten.get(poaschoolnet)) ;
				}else{
					topmenu.put("URI","javascript:getSchoolListMenu('" + poaschoolnet +"','" + categoryid + "')");
					topmenu.put("NAME", (! "-1".equalsIgnoreCase(districtschoolbreadcrumb) ? districtschoolbreadcrumb :  poaschoolnetshortMap.get(poaschoolnet) )  ) ;
				}
				topmenu.put("SCRIPT","true") ;
				topMenu.add(topmenu);
			}
			if(!"-1".equalsIgnoreCase(schoolsystem) && schoolsystem != null && schoolsystem.trim().length() > 0){
				topmenu = new HashMap<String,String>(); 
				topmenu.put("URI","javascript:getSchoolListBySystem('" + schoolsystem  + "')");
				topmenu.put("NAME",schoolsystem) ;
				topmenu.put("SCRIPT","true") ;
				topMenu.add(topmenu);
			}
			
			if(!entityexist){
				topMenu.get(0).put("LAST", topMenu.get(topMenu.size()-1).get("NAME"));
				topMenu.remove(topMenu.size()-1);
				topmenu.put("ENTITYEXIST", "false");
			}
			
			
			return topMenu;
		}catch(Exception ex){
			return null;
		}
	}
	protected Map<String,String> extractCommentParam(HttpServletRequest request) {
		
		try{
			request.setCharacterEncoding("UTF-8");
			String ip = request.getHeader("X-Forwarded-For");  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("Proxy-Client-IP");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("WL-Proxy-Client-IP");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("HTTP_CLIENT_IP");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getRemoteAddr();  
	        }  
	        
			
			HttpSession session = request.getSession(true);
			Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");
			Map<String,String> paramMap = new HashMap<String,String> ();
			String action = request.getAttribute("action") != null ? (String)  request.getAttribute("action") :  (request.getParameter("action") != null ? request.getParameter("action") : "compare");
			String comment = request.getParameter("commenttext") != null ? request.getParameter("commenttext") : "-1";
			String subject = request.getParameter("commentsubject") != null ? request.getParameter("commentsubject") : "-1";
			String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");
			String categoryid = request.getAttribute("categoryid") != null ? (String)  request.getAttribute("categoryid") :  (request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "-1");
			String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;
			String roleid = request.getParameter("roleid") != null ? request.getParameter("roleid")  : (user != null && user.get("ROLEID") != null &&  (Integer) user.get("ROLEID") > 0  ? ((Integer) user.get("ROLEID")).toString()  : "-1" );
			
			
			String grade = request.getParameter("grade") != null ? request.getParameter("grade") : "-1";
			String metric1 = request.getParameter("metric1") != null ? request.getParameter("metric1") : "0";
			String metric2 = request.getParameter("metric2") != null ? request.getParameter("metric2") : "0";
			String metric3 = request.getParameter("metric3") != null ? request.getParameter("metric3") : "0";
			String metric4 = request.getParameter("metric4") != null ? request.getParameter("metric4") : "0";
			String metric5 = request.getParameter("metric5") != null ? request.getParameter("metric5") : "0";
			String type = request.getParameter("type") != null ? request.getParameter("type") : "-1";
            String formsubmitsource = request.getParameter("formsubmitsource") != null ? request.getParameter("formsubmitsource") : "-1";

            try{
				grade = "-1".equalsIgnoreCase(grade) ? "" + (Integer.parseInt(metric1)  + Integer.parseInt(metric2) + Integer.parseInt(metric3) + Integer.parseInt(metric4) + Integer.parseInt(metric5)) / 5 : grade;
			}catch(Exception ex){
				grade = "0";
			}
		
			
			paramMap.put("comment", comment);
			paramMap.put("subject", subject);
			paramMap.put("entityid", entityid);
			paramMap.put("categoryid", categoryid);
			paramMap.put("userid", userid);
			paramMap.put("roleid", roleid);
			
			paramMap.put("action", action);
			paramMap.put("metric1", metric1);
			paramMap.put("metric2", metric2);
			paramMap.put("metric3", metric3);
			paramMap.put("metric4", metric4);
			paramMap.put("metric5", metric5);
			paramMap.put("type", type);
            paramMap.put("formsubmitsource", formsubmitsource);
            paramMap.put("ip", ip );
			paramMap.put("grade", grade );
		
			
			return paramMap;
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}
	protected Map<String,String> extractParam(HttpServletRequest request) {
		
		try{
			request.setCharacterEncoding("UTF-8");
			String ip = request.getHeader("X-Forwarded-For");  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("Proxy-Client-IP");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("WL-Proxy-Client-IP");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("HTTP_CLIENT_IP");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getRemoteAddr();  
	        }  
	        
			
			HttpSession session = request.getSession(true);
			Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");
			Map<String,String> paramMap = new HashMap<String,String> ();
			String action = request.getAttribute("action") != null ? (String)  request.getAttribute("action") :  (request.getParameter("action") != null ? request.getParameter("action") : "compare");
			String currenturi = request.getParameter("currenturi") != null ? request.getParameter("currenturi") : "home";
			String comment = request.getParameter("commenttext") != null ? request.getParameter("commenttext") : "-1";
			String subject = request.getParameter("commentsubject") != null ? request.getParameter("commentsubject") : "-1";
		//	theLogger.debug("3");
			String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");
			String parententityid = request.getAttribute("parententityid") != null ? (String)  request.getAttribute("parententityid") :  (request.getParameter("parententityid") != null ? request.getParameter("parententityid") : "-1");
		//	theLogger.debug("4");
			String categoryid = request.getAttribute("categoryid") != null ? (String)  request.getAttribute("categoryid") :  (request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "-1");
		//	theLogger.debug("5");
			String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;
			String roleid = request.getParameter("roleid") != null ? request.getParameter("roleid")  : (user != null && user.get("ROLEID") != null &&  (Integer) user.get("ROLEID") > 0  ? ((Integer) user.get("ROLEID")).toString()  : "-1" );
			String sex = request.getParameter("sex") != null ? request.getParameter("sex")  : (user != null && user.get("sex") != null  ? "" + user.get("sex")  : "" );
			
			String lookupdistrict1 = request.getParameter("lookupdistrict1") != null ? request.getParameter("lookupdistrict1")  : (user != null && user.get("lookupdistrict1") != null  ? "" + user.get("lookupdistrict1")  : "" );
			String lookupdistrict2 = request.getParameter("lookupdistrict2") != null ? request.getParameter("lookupdistrict2")  : (user != null && user.get("lookupdistrict2") != null  ? "" + user.get("lookupdistrict2")  : "" );
			String lookupdistrict3 = request.getParameter("lookupdistrict3") != null ? request.getParameter("lookupdistrict3")  : (user != null && user.get("lookupdistrict3") != null  ? "" + user.get("lookupdistrict3")  : "" );
			theLogger.debug("lookupdistrict request :" + lookupdistrict1 + "," + lookupdistrict2 + "," + lookupdistrict3);
		
			
			//	theLogger.debug("6");
			String favoriteid = request.getParameter("favoriteid") != null ? request.getParameter("favoriteid") : "-1";
		//	theLogger.debug("7");
			String namelocal = request.getParameter("namelocal") != null ? request.getParameter("namelocal") : "-1";
			String namesocial = request.getParameter("namesocial") != null ? request.getParameter("namesocial") : "-1";
			String anonymous = request.getParameter("anonymous") != null ? request.getParameter("anonymous") : "-1";
			
			String email = request.getParameter("email") != null ? request.getParameter("email") : "-1";
			String password = request.getParameter("password") != null ? request.getParameter("password") : "-1";
			String grade = request.getParameter("grade") != null ? request.getParameter("grade") : "-1";
			String metric1 = request.getParameter("metric1") != null ? request.getParameter("metric1") : "0";
			String metric2 = request.getParameter("metric2") != null ? request.getParameter("metric2") : "0";
			String metric3 = request.getParameter("metric3") != null ? request.getParameter("metric3") : "0";
			String metric4 = request.getParameter("metric4") != null ? request.getParameter("metric4") : "0";
			String metric5 = request.getParameter("metric5") != null ? request.getParameter("metric5") : "0";
			String type = request.getParameter("type") != null ? request.getParameter("type") : "-1";
			
			String status = request.getParameter("status") != null ? request.getParameter("status") : "-1";
			String application = request.getParameter("application") != null ? request.getParameter("application") : "-1";
			String announcement = request.getParameter("announcement") != null ? request.getParameter("announcement") : "-1";
			String interview = request.getParameter("interview") != null ? request.getParameter("interview") : "-1";
			String id = request.getParameter("id") != null ? request.getParameter("id") : "-1";
			String phone = request.getParameter("phone") != null ? request.getParameter("phone") : "-1";
			String coursekeywords = request.getParameter("coursekeywords") != null ? request.getParameter("coursekeywords") : "-1";
			String coursedesc = request.getParameter("coursedesc") != null ? request.getParameter("coursedesc") : "-1";
			String address = request.getParameter("address") != null ? request.getParameter("address") : "-1";
			String url = request.getParameter("url") != null ? request.getParameter("url") : "-1";
			String year = request.getParameter("year") != null ? request.getParameter("year") : "-1";
			
		//	theLogger.debug("8");
			try{
				grade = "-1".equalsIgnoreCase(grade) ? "" + (Integer.parseInt(metric1)  + Integer.parseInt(metric2) + Integer.parseInt(metric3) + Integer.parseInt(metric4) + Integer.parseInt(metric5)) / 5 : grade;
			}catch(Exception ex){
				grade = "0";
			}
		//	theLogger.debug("9");
			
			
			String selfintro = request.getParameter("selfintro") != null ? request.getParameter("selfintro") : "nil";
			if(selfintro.length() > 499)
				selfintro = selfintro.substring(0,499);
			
			paramMap.put("selfintro", selfintro);
			
			int totalTutorCat = 5;
			try{
				totalTutorCat = Integer.parseInt( request.getParameter("tutorcategorycount") );
			}catch(Exception ex){
				
			}
			paramMap.put("tutorcategorycount","" + totalTutorCat);
			for( int i=1; i<=totalTutorCat; i++){
				if(request.getParameter("tutorcategoryid" + i) != null){
					paramMap.put("tutor","y");
					paramMap.put("tutorcategoryid" + i,    request.getParameter("tutorcategoryid" + i));
					paramMap.put("bestdesc" + i,  request.getParameter("bestdesc" + i));
					paramMap.put("tutorialexp" + i,  request.getParameter("tutorialexp" + i));
					
				}
			}
			
			paramMap.put("id", id);
			paramMap.put("namelocal", namelocal);
			paramMap.put("namesocial", namesocial);
			paramMap.put("anonymous", anonymous);
			paramMap.put("email", email);
			paramMap.put("currenturi", currenturi);
			paramMap.put("password", password);
			paramMap.put("comment", comment);
			paramMap.put("subject", subject);
		//	theLogger.debug("10");
			paramMap.put("entityid", entityid);
			paramMap.put("parententityid", parententityid);
			paramMap.put("categoryid", categoryid);
			paramMap.put("userid", userid);
			paramMap.put("roleid", roleid);
			paramMap.put("sex", sex);
			paramMap.put("lookupdistrict1", lookupdistrict1);
			paramMap.put("lookupdistrict2", lookupdistrict2);
			paramMap.put("lookupdistrict3", lookupdistrict3);
			
			theLogger.debug("lookupdistrict paramMap:" + paramMap.get("lookupdistrict1") + "," + paramMap.get("lookupdistrict2") + "," + paramMap.get("lookupdistrict3"));
			
			
			paramMap.put("favoriteid", favoriteid);
			paramMap.put("action", action);
			paramMap.put("metric1", metric1);
			paramMap.put("metric2", metric2);
			paramMap.put("metric3", metric3);
			paramMap.put("metric4", metric4);
			paramMap.put("metric5", metric5);
			paramMap.put("type", type);
			paramMap.put("ip", ip );
			
			
			paramMap.put("grade", grade );
			paramMap.put("status", status);
			paramMap.put("interview", interview);
			paramMap.put("application", application);
			paramMap.put("announcement", announcement);
			paramMap.put("address", address);
			paramMap.put("phone", phone);
			paramMap.put("coursekeywords",coursekeywords );
			paramMap.put("coursedesc", coursedesc);
			paramMap.put("url", url);
			paramMap.put("year", year);
			
			
	//		theLogger.debug("11");
			
			
			return paramMap;
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}
	public boolean isRobot (HttpServletRequest request){
		boolean isRobot = false;
		if(request != null && ! request.getHeader("user-agent").contains("facebook") && ! request.getHeader("user-agent").contains("spider")  && ! request.getHeader("user-agent").contains("bot") && ! request.getHeader("user-agent").contains("spider.html")  && ! request.getHeader("user-agent").contains("webspider") )  //Exclude all robot traffic 
			isRobot=false;
		else
			isRobot=true;
		
		return isRobot;
		
	}
	
	public String getChatMsg(List<Map<String, Object>> result, HttpServletRequest request, Date lastread){
		
		try{
		ApplicationContext applicationContext = getWebApplicationContext(request.getServletContext());
		String userscore = applicationContext.getMessage("label.userscore",new Object[] {},Locale.SIMPLIFIED_CHINESE);
		String parentrating = applicationContext.getMessage("label.parentrating",new Object[] {},Locale.SIMPLIFIED_CHINESE);
		String dayago = applicationContext.getMessage("label.dayago",new Object[] {},Locale.SIMPLIFIED_CHINESE);
		String hourago = applicationContext.getMessage("label.hourago",new Object[] {},Locale.SIMPLIFIED_CHINESE);
		String minago = applicationContext.getMessage("label.minago",new Object[] {},Locale.SIMPLIFIED_CHINESE);
		String secago = applicationContext.getMessage("label.secago",new Object[] {},Locale.SIMPLIFIED_CHINESE);
		String anonymous = applicationContext.getMessage("label.anonymous",new Object[] {},Locale.SIMPLIFIED_CHINESE);
		
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");

		
		StringBuffer html = new StringBuffer();
		String username="" ;
		try{
			username = "" + user.get("namelocal");
		}catch(Exception ex){
			username=anonymous;
		}
		String htmlalign="right";
		String myself="myself";
		String bubblesize="small";
		String text="";
		int chatsize = 0;
		String padding = "padding-left:15px;padding-right:15px";
		if("all".equalsIgnoreCase("" + request.getAttribute("chatlistsize")) )
			chatsize=result.size();
		else
			chatsize= (maxchatsize > result.size() ? result.size() : maxchatsize) ;
			
		for(int i=0; i< chatsize; i++ ){
			HashMap <String,Object> questionAnswer = (HashMap <String,Object>) result.get(i);
			if (username.equalsIgnoreCase("" + questionAnswer.get("username"))  ){
				htmlalign="right";
				myself=" you";
			}else{
				htmlalign="left";
				myself=" me";
			}	
			
			html.append("<div class=\"clearboth\" >"); //cannot remove this line, it is for clear formatting
			if( "facebook".equalsIgnoreCase("" + questionAnswer.get("style"))){    //facebookstyle
				html.append("<div class='msgbox fb'>");
			}else{
				html.append("<div class='msgbox'>");
			}
			html.append("<div style=\"float:" +  htmlalign +  ";text-align: center;\" class=\"font2\" >");
			html.append("<img style=\"padding:4px 3px;\" src=\"/school/userimages/" +  questionAnswer.get("userprofile") + "\"  onerror=\"UserImgError(this);\"  width=\"30px\" height=\"30px\"/><br>");
			html.append("<p class=\"font1\">");
			String name = questionAnswer.get("username") != null &&  ("" + questionAnswer.get("username")).trim().length() > 0  ? ""+ questionAnswer.get("username") : anonymous;
			name = name.length() > 5 ? name.substring(0,5) : name;
			html.append(name);
			html.append("</p>");
			html.append("</div>");
			text = "" + questionAnswer.get("questionanswer");
			text = "<br>" + text;
			if("facebook".equalsIgnoreCase("" + questionAnswer.get("style"))  ){  //facebookstyle
				bubblesize="bubblesizeL";
			}else{
				if(text.length() > 20){
					bubblesize="bubblesizeS";
				}else{
					bubblesize="bubblesizeS";
				}
			}
			//html.append("<p style=\"float:" + htmlalign +";\" class=\"bubble" + bubblesize + myself + " speech" +  bubblesize + myself +  "\" >");
            html.append("<p class=\"bubble " + myself +  " " +  bubblesize  + "\" >");
            if( "facebook".equalsIgnoreCase("" + questionAnswer.get("style")) ){  //facebookstyle
				html.append("<span class=\"font1b\" style=\"float:" + ("right".equalsIgnoreCase(htmlalign) ? "left" : "right")  + ";\">#" + (i + 1) + "</span>");
					
				if(lastread != null && questionAnswer.get("created") != null && user != null && user.get("id") != null && questionAnswer.get("userid") != null &&
						lastread.before((Date) questionAnswer.get("created")) && ! ("" + user.get("id")).equalsIgnoreCase("" + questionAnswer.get("userid") ) )
					html.append("<img src=\"/school/img/newtrip.png\" style=\"float:" + ("right".equalsIgnoreCase(htmlalign) ? "right" : "left")  + ";\" />");
				
				padding = "";
			}
			html.append("<span style=\"padding-" + htmlalign  + ":5px;\">" + text + "</span>");
		
			html.append("<br><font style=\"padding-top:5px;" + padding + ";float:" + ("right".equalsIgnoreCase(htmlalign) ? "left" : "right") +";\" class=\"font0b\">");
		    
			boolean notfound = true;
			try{
				
				if( Integer.parseInt("" + questionAnswer.get("timediffday")) > 0 && notfound ){
					html.append(questionAnswer.get("timediffday") + "  " + dayago);
					notfound = false;
				}
				if( Integer.parseInt("" + questionAnswer.get("timediffhour")) > 0 && notfound){
					html.append(questionAnswer.get("timediffhour") + "  " + hourago);
					notfound = false;
				}
				if( Integer.parseInt("" + questionAnswer.get("timediffmin")) > 0 && notfound){
					html.append(questionAnswer.get("timediffmin") + "  " + minago);
					notfound = false;
				}
				if( Integer.parseInt("" + questionAnswer.get("timediffsec")) > 0 && notfound){
					html.append(questionAnswer.get("timediffsec") + "  " + secago);
					notfound = false;
				}
			}catch(Exception ex){
				
			}
			if(questionAnswer.get("ipaddr") != null)
				html.append("<font style=\"padding-left:5px;\">by: " + questionAnswer.get("ipaddr") + "</font>");
			
			html.append("</font>");
			html.append("</span>");
			html.append("</p> <!--  bubble box -->");
			html.append("</div>");
			
			
		}
		
		html.append("<br class=\"clear\"><br class=\"clearboth\"> ");
			return html.toString();
		}catch(Exception ex){
			ex.printStackTrace();
			return ex.toString();
		}
	}
	public String getRankingYear(){
		return entityDAO.getRankingYear();
	}

	public boolean isFoulLanguage(String source){
		boolean isFoul = false;
		for(String s: foulLanguageSet){
			if(source.contains(s)){
				isFoul = true;
				break;
			}
		}
		return isFoul;
	}
	
}
