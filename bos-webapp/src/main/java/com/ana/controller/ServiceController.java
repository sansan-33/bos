package com.ana.controller;

import com.ana.util.FileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller(value="serviceController")
public class ServiceController extends BaseController {

    private final Logger theLogger = LoggerFactory.getLogger(ServiceController.class);
    protected FileUtil fileUtil;
	
	@Autowired
	public void setFileUtil(FileUtil fileUtil) {
		this.fileUtil = fileUtil;
	}

    @Autowired
    protected EventController eventController;
	@RequestMapping("/tileImage")
	protected ModelAndView getTileImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView model = new ModelAndView("common/tileImage");	
		
		model.addObject("entityImages",serviceDAO.getTileImage(30) );
		
		return model;
	}
	@RequestMapping("/adminConsole")
	protected ModelAndView getAdminConsole(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		initStaticData(request);
		ModelAndView model = new ModelAndView("adminConsole");	

		Calendar calendar = Calendar.getInstance();

		model.addObject("userList",userDAO.getUserList() );
		model.addObject("topmenu",buildTopMenu(request));

		
		return model;
	}
	@RequestMapping("/synchronize")
	protected ModelAndView saveEntity(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		; 					if("1".equalsIgnoreCase(userid)){
			initStaticData(request);
			String action = request.getParameter("action") != null ? request.getParameter("action") : "-1";
            entityDAO.synchronize(action, userid);
            //entityDAO.synchronizeScore(action,userid);
		}
		return getAdminConsole(request,response);
	}
	@RequestMapping("/scoring")
	protected ModelAndView scoring(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		; 					if("1".equalsIgnoreCase(userid)){
			initStaticData(request);
			String categoryid = request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "-1";
			ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
			entityDAO.scoring(categoryid,applicationContext,userid);
		}
		return getAdminConsole(request,response);
	}
	
	@RequestMapping("/schoolQuickSearchCache/{schoolname}")
	protected @ResponseBody String schoolQuickSearchCache(@PathVariable String schoolname, HttpServletRequest request) throws Exception {
		
		
		StringBuffer result = new StringBuffer();
		HashMap<String,String> searchKeyMap = new HashMap<String,String>();
		searchKeyMap.put("1", "id=(.*),nameeng=(.*),name=(" + schoolname + "),chscid=(.*),categoryname=(.*),categoryid=(.*)");
		searchKeyMap.put("2", "id=(.*),nameeng=(" + schoolname + "),name=(.*),chscid=(.*),categoryname=(.*),categoryid=(.*)");
		
		
		for (String key : searchKeyMap.keySet()) {
		
		Pattern p = Pattern.compile(searchKeyMap.get(key));
		
		theLogger.debug("Quick Search " + searchKeyMap.get(key));
		
	    Matcher matcher = p.matcher(schoolText);
	    boolean matchFound = matcher.find();
	    String prevCategoryname ="-1";
		result.append("<p id=\"searchresults\">");
	    while(matchFound) {
	    	theLogger.debug("Found " + matcher.group(2));
	    	theLogger.debug("Found " + matcher.group(3));
			
			if(! prevCategoryname.equalsIgnoreCase((String) matcher.group(5))){
			result.append("<span class=\"category\">" + matcher.group(1) + "</span>");
			}
			result.append("<a href=\"/school/controller/entityDetails?entityid=" +matcher.group(1) + "&action=compare\">");
			result.append("<img src=\"/school/staticimage/CAT" + matcher.group(6) + "/logo_" + matcher.group(4) + ".jpg\" alt=\"No Image\" width=\"20px\" height=\"20px\"/>");
			result.append("<span class=\"searchheading\">" + matcher.group(2) + "</span>");
			result.append("     <span>" + matcher.group(3) + "</span>");
			result.append("  </a>");
		     
			prevCategoryname = (String) matcher.group(5);
		}
		}

		 result.append("</p>");

		return result.toString();
		
		
	}
	@RequestMapping("/schoolQuickSearch/{schoolname}")
	protected ResponseEntity<String>  schoolQuickSearch(@PathVariable String schoolname, HttpServletRequest request) throws Exception {
		
		StringBuffer result= new StringBuffer();
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		ModelAndView model = new ModelAndView("searchConsole");	
		HashMap<String,String> searchParam = new HashMap<String,String>();
		theLogger.debug("schoolname" + request.getParameter("schoolname"));
		searchParam.put("schoolname",schoolname);
		
		ArrayList<Map<String,Object>> resultList = (ArrayList<Map<String, Object>>) entityDAO.getSchoolFullList(searchParam);
		String prevCategoryname ="-1";
		result.append("<p id=\"searchresults\">");
		for(int i=0; i<resultList.size(); i++ ){
			HashMap<String,Object> school = (HashMap<String, Object>) resultList.get(i);
			if(! prevCategoryname.equalsIgnoreCase((String) school.get("categoryname"))){
			result.append("<span class=\"category\">" + school.get("categoryname") + "</span>");
			}
			result.append("<a href=\"/school/controller/entityDetails?entityid=" +school.get("entityid") + "&action=compare\">");
			//result.append("<img src=\"/school/staticimage/CAT" + school.get("categoryid") + "/logo_" + school.get("chscid") + ".jpg\" alt=\"No Image\" width=\"20px\" height=\"20px\"/>");
			result.append("<span class=\"searchheading\">" + school.get("nameeng") + "</span>");
			result.append("     <span>" + school.get("name") + "</span>");
			result.append("  </a>");
		     
			prevCategoryname = (String) school.get("categoryname");
		}
		 
		//result.append("<span class=\"seperator\">");
		//result.append(" <a href=\"http://www.bookofschool.com/school/sitemap.html\">Nothing interesting here? Try the sitemap.</a>");
		//result.append("</span>");
		result.append("</p>");

		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");

	    return new ResponseEntity<String>(result.toString(), responseHeaders, HttpStatus.CREATED);

		
		
	}
	@RequestMapping("/schoolSearch")
	protected ModelAndView getSchoolSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String reporttype = request.getParameter("reporttype") != null ? request.getParameter("reporttype") : "-1";
		String lastyearrecord = request.getParameter("lastyearrecord") != null && request.getParameter("lastyearrecord").length() > 0  ? request.getParameter("lastyearrecord") : "-1";
		
		if("secondaryranking".equalsIgnoreCase(reporttype) ){
			ModelAndView model = new ModelAndView("entity/schoolSearchSecondary");
			model.addObject("lastyearrecord",lastyearrecord);
			return model;
			
		}else if("primaryranking".equalsIgnoreCase(reporttype) ){
			ModelAndView model = new ModelAndView("entity/schoolSearchPrimary");
			model.addObject("lastyearrecord",lastyearrecord);
			return model;
			
		} else{
			initStaticData(request);
			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession(true);
			ModelAndView model = new ModelAndView("searchConsole");	
			model.addObject("mode" ,"search" );
			HashMap<String,String> searchParam = new HashMap<String,String>();
			

			String poaschoolnet = request.getParameter("poaschoolnet") != null && request.getParameter("poaschoolnet").length() > 0  ? request.getParameter("poaschoolnet") : "-1";
			String poaschoolnets = request.getParameter("poaschoolnets") != null && request.getParameter("poaschoolnets").length() > 0  ? request.getParameter("poaschoolnets") : "-1";
			if(poaschoolnets.contains("/"))
				poaschoolnets = poaschoolnets.replaceAll("/", ",");
			String district = request.getParameter("district") != null && request.getParameter("district").length() > 0 ? request.getParameter("district") : "-1";
            String districtschoolbreadcrumb = request.getParameter("districtschoolbreadcrumb") != null && request.getParameter("districtschoolbreadcrumb").length() > 0 ? request.getParameter("districtschoolbreadcrumb") : "-1";


			String categoryId[] = request.getParameterValues("schoolcategory") != null ? request.getParameterValues("schoolcategory") : null;
			String initial = request.getParameter("initial") != null ? request.getParameter("initial") : "-1";
			String schoolname = request.getParameter("schoolname") != null ? request.getParameter("schoolname") : request.getParameter("inputString") != null ? request.getParameter("inputString") : "-1";
			String yearofcommencement = request.getParameter("yearofcommencement") != null ? request.getParameter("yearofcommencement") : "-1";
			
			String nominated = request.getParameter("nominated") != null ? request.getParameter("nominated") : "-1";
			String throughtrain = request.getParameter("throughtrain") != null ? request.getParameter("throughtrain") : "-1";
			String feeder = request.getParameter("feeder") != null ? request.getParameter("feeder") : "-1";
			String financetype = request.getParameter("financetype") != null ? request.getParameter("financetype") : "-1";
			String nursery = request.getParameter("nursery") != null ? request.getParameter("nursery") : "-1";
			
			
			String categoryIdText = "";
			if(categoryId != null){
				for (int i = 0; i < categoryId.length; i++) {
					categoryIdText += categoryId[i] + ",";
				}
			}
			if(categoryIdText.contains(","))
				categoryIdText = categoryIdText.substring(0, categoryIdText.lastIndexOf(","));
		
			if(categoryIdText != null && categoryIdText.trim().length() > 0){
				searchParam.put("categoryid", categoryIdText);
			}else{
				searchParam.put("categoryid", "0");
			}
			searchParam.put("schoolname",schoolname.trim());
			searchParam.put("yearofcommencement",yearofcommencement);
			searchParam.put("nominated",nominated);
			searchParam.put("throughtrain",throughtrain);
			searchParam.put("feeder",feeder);
			searchParam.put("poaschoolnet",poaschoolnet);
			searchParam.put("poaschoolnets",poaschoolnets);
			searchParam.put("district",district);
			searchParam.put("financetype",financetype);
			searchParam.put("searchmodeactive","y");
			searchParam.put("reporttype",reporttype);
			searchParam.put("nursery",nursery);
			searchParam.put("lastyearrecord", lastyearrecord);
			
			String sacategoryid = searchParam.get("categoryid");
			try{
				sacategoryid = (Integer.parseInt(sacategoryid) + 1 ) + "";
			}catch(Exception ex){
				sacategoryid="1";
			}
			
			if("-1".equalsIgnoreCase(schoolname) && "-1".equalsIgnoreCase(financetype) )
				searchParam.put("limit","100");
			
			
			
			
			model.addObject("schoolList","-1".equalsIgnoreCase(initial) ?  entityDAO.getEntityLastYear(searchParam) :new ArrayList<Map<String, Object>>() );
			//model.addObject("schoollistlastyear",entityDAO.getEntityLastYear(searchParam));
			
			if(! "kindergartenranking".equalsIgnoreCase(reporttype) && ! "primaryranking".equalsIgnoreCase(reporttype) && ! "secondaryranking".equalsIgnoreCase(reporttype) ){
				model.addObject("topmenu",buildTopMenu(request));
			}
			model.addObject("category",entityDAO.getLookupMap("entity.category").get(searchParam.get("categoryid")) );
			model.addObject("poaschoolnetdesc",entityDAO.getLookupMap("1".equalsIgnoreCase(searchParam.get("categoryid")) ? "district.poaschoolnet" : "district.kindergarten").get(searchParam.get("poaschoolnet")) );
            model.addObject("poaschoolnet",searchParam.get("poaschoolnet") );

            model.addObject("district",districtschoolbreadcrumb );
            model.addObject("categoryid",searchParam.get("categoryid") );
			
			model.addObject("searchmodeactive","y");
			model.addObject("reporttype",reporttype);
			model.addObject("sacategoryid",sacategoryid);
			model.addObject("lastyearrecord",lastyearrecord);
            model.addObject("rankingyear", getRankingYear());
            session.setAttribute("searchCriteria",searchParam);

			
			return model;
		}
	}
	@RequestMapping("/siteSearch")
	protected ModelAndView getSiteSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		String kindergarten=applicationContext.getMessage("label.kindergarten", new Object[] { }, Locale.SIMPLIFIED_CHINESE);  
		String primary=applicationContext.getMessage("label.primary", new Object[] { }, Locale.SIMPLIFIED_CHINESE);  
		String secondary=applicationContext.getMessage("label.secondary", new Object[] { }, Locale.SIMPLIFIED_CHINESE);
        String ib=applicationContext.getMessage("label.ib", new Object[] { }, Locale.SIMPLIFIED_CHINESE);


        String metric1Label=applicationContext.getMessage("label.academic", new Object[] { }, Locale.SIMPLIFIED_CHINESE);
		String metric2Label=applicationContext.getMessage("label.sport", new Object[] { }, Locale.SIMPLIFIED_CHINESE);  
		String metric3Label=applicationContext.getMessage("label.music", new Object[] { }, Locale.SIMPLIFIED_CHINESE);  
		String metric4Label=applicationContext.getMessage("label.campus", new Object[] { }, Locale.SIMPLIFIED_CHINESE);  
		String metric5Label=applicationContext.getMessage("label.teacher", new Object[] { }, Locale.SIMPLIFIED_CHINESE);  
		String rankingLabel=applicationContext.getMessage("label.ranking", new Object[] { }, Locale.SIMPLIFIED_CHINESE);  
		String parentratingLabel=applicationContext.getMessage("label.parentrating", new Object[] { }, Locale.SIMPLIFIED_CHINESE);  
		String systemrankingLabel=applicationContext.getMessage("label.schoolrating", new Object[] { }, Locale.SIMPLIFIED_CHINESE);  

		initStaticData(request);
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		ModelAndView model = new ModelAndView("siteSearchConsole");	
		model.addObject("mode" ,"search" );
		HashMap<String,String> searchParam = new HashMap<String,String>();
		theLogger.debug("schoolname" + request.getParameter("schoolname"));
		
		String schoolname = request.getParameter("schoolname") != null ? request.getParameter("schoolname") : request.getParameter("inputString") != null ?  request.getParameter("inputString") : "-1";
		if(request.getParameter("inputString") == null || request.getParameter("inputString").trim().endsWith("..."))
			schoolname = "-1";
		String address = request.getParameter("address") != null  && request.getParameter("address").trim().length() > 0 ? request.getParameter("address")  : "-1";
		String poaschoolnet = request.getParameter("poaschoolnet") != null  && request.getParameter("poaschoolnet").trim().length() > 0 ? request.getParameter("poaschoolnet")  : "-1";
		String yearofcommencement = request.getParameter("yearofcommencement") != null && request.getParameter("yearofcommencement").trim().length() > 0 ? request.getParameter("yearofcommencement") : "-1";
		String boy = request.getParameter("boy") != null && request.getParameter("boy").trim().length() > 0 ? request.getParameter("boy") : "-1";
		String girl = request.getParameter("girl") != null && request.getParameter("girl").trim().length() > 0 ? request.getParameter("girl") : "-1";
		String boygirl = request.getParameter("boygirl") != null && request.getParameter("boygirl").trim().length() > 0 ? request.getParameter("boygirl") : "-1";
		String chinese = request.getParameter("chinese") != null && request.getParameter("chinese").trim().length() > 0 ? request.getParameter("chinese") : "-1";
		String english = request.getParameter("english") != null && request.getParameter("english").trim().length() > 0 ? request.getParameter("english") : "-1";
		String chineseenglish = request.getParameter("chineseenglish") != null && request.getParameter("chineseenglish").trim().length() > 0 ? request.getParameter("chineseenglish") : "-1";
		String chineseputonghua = request.getParameter("chineseputonghua") != null && request.getParameter("chineseputonghua").trim().length() > 0 ? request.getParameter("chineseputonghua") : "-1";
		String chineseputonghuaenglish = request.getParameter("chineseputonghuaenglish") != null && request.getParameter("chineseputonghuaenglish").trim().length() > 0 ? request.getParameter("chineseputonghuaenglish") : "-1";
		
		String nominated = request.getParameter("nominated") != null && request.getParameter("nominated").trim().length() > 0 ? request.getParameter("nominated") : "-1";
		String throughtrain = request.getParameter("throughtrain") != null && request.getParameter("throughtrain").trim().length() > 0 ? request.getParameter("throughtrain") : "-1";
		String feeder = request.getParameter("feeder") != null && request.getParameter("feeder").trim().length() > 0 ? request.getParameter("feeder") : "-1";
		String nursery = request.getParameter("nursery") != null && request.getParameter("nursery").trim().length() > 0 ? request.getParameter("nursery") : "-1";
		String[] financetype = request.getParameterValues("financetype") != null ? request.getParameterValues("financetype") : null;
		String[] schSession = request.getParameterValues("session") != null ? request.getParameterValues("session") : null;
		
		String metric1 = request.getParameter("metric1") != null && request.getParameter("metric1").trim().length() > 0 ? request.getParameter("metric1") : "-1";
		String metric2 = request.getParameter("metric2") != null && request.getParameter("metric2").trim().length() > 0 ? request.getParameter("metric2") : "-1";
		String metric3 = request.getParameter("metric3") != null && request.getParameter("metric3").trim().length() > 0 ? request.getParameter("metric3") : "-1";
		String metric4 = request.getParameter("metric4") != null && request.getParameter("metric4").trim().length() > 0 ? request.getParameter("metric4") : "-1";
		String metric5 = request.getParameter("metric5") != null && request.getParameter("metric5").trim().length() > 0 ? request.getParameter("metric5") : "-1";
		String parentrating = request.getParameter("parentrating") != null && request.getParameter("parentrating").trim().length() > 0 ? request.getParameter("parentrating") : "-1";
		String systemranking = request.getParameter("systemranking") != null && request.getParameter("systemranking").trim().length() > 0 ? request.getParameter("systemranking") : "-1";
		String score = request.getParameter("score") != null && request.getParameter("score").trim().length() > 0 ? request.getParameter("score") : "-1";
		
		
		String financetypeText = "";
		if(financetype != null){
			for (int i = 0; i < financetype.length; i++) {
				if(financetype[i] != null && financetype[i].trim().length() > 0 )
				financetypeText += "'" + financetype[i] + "',";
			}
		}
		if(financetypeText.contains(","))
			financetypeText = financetypeText.substring(0, financetypeText.lastIndexOf(","));
	
		if(financetypeText != null && financetypeText.trim().length() > 0){
			searchParam.put("financetype", financetypeText);
		}else{
			searchParam.put("financetype", "-1");
		}
		
		String schSessionText = "";
		if(schSession != null){
			for (int i = 0; i < schSession.length; i++) {
				if(schSession[i] != null && schSession[i].trim().length() > 0 )
					schSessionText += "'" + schSession[i] + "',";
			}
		}
		if(schSessionText.contains(","))
			schSessionText = schSessionText.substring(0, schSessionText.lastIndexOf(","));
	
		if(schSessionText != null && schSessionText.trim().length() > 0){
			searchParam.put("session", schSessionText);
		}else{
			searchParam.put("session", "-1");
		}
	
		
		String categoryId[] = request.getParameterValues("schoolcategory") != null && request.getParameter("schoolcategory").trim().length() > 0 ? request.getParameterValues("schoolcategory") : null;
		String categoryIdText = "";
		if(categoryId != null){
			for (int i = 0; i < categoryId.length; i++) {
				categoryIdText += categoryId[i] + ",";
			}
		}
		if(categoryIdText.contains(","))
			categoryIdText = categoryIdText.substring(0, categoryIdText.lastIndexOf(","));
	
		if(categoryIdText != null && categoryIdText.trim().length() > 0){
			searchParam.put("categoryid", categoryIdText);
		}else{
			searchParam.put("categoryid", "0,1,2,3,4,5");
		}
		
		
		searchParam.put("schcat0",request.getParameter("schcat0"));
		searchParam.put("schcat1",request.getParameter("schcat1"));
		searchParam.put("schcat2",request.getParameter("schcat2"));
        searchParam.put("schcat5",request.getParameter("schcat5"));

        searchParam.put("schoolname",schoolname.trim());
		searchParam.put("address",address.trim());
		searchParam.put("poaschoolnet",poaschoolnet.trim());

		searchParam.put("yearofcommencement",yearofcommencement.trim());
		searchParam.put("boy",boy.trim());
		searchParam.put("girl",girl.trim());
		searchParam.put("boygirl",boygirl.trim());
		searchParam.put("chinese",chinese.trim());
		searchParam.put("english",english.trim());
		searchParam.put("chineseenglish",chineseenglish.trim());
		searchParam.put("chineseputonghua",chineseputonghua.trim());
		searchParam.put("chineseputonghuaenglish",chineseputonghuaenglish.trim());
		
		searchParam.put("nominated",nominated.trim());
		searchParam.put("throughtrain",throughtrain.trim());
		searchParam.put("feeder",feeder.trim());
		searchParam.put("nursery",nursery.trim());
		searchParam.put("metric1",metric1.trim());
		searchParam.put("metric2",metric2.trim());
		searchParam.put("metric3",metric3.trim());
		searchParam.put("metric4",metric4.trim());
		searchParam.put("metric5",metric5.trim());
		searchParam.put("parentrating",parentrating.trim());
		searchParam.put("systemranking",systemranking.trim());
		searchParam.put("score",score.trim());
		
		
		StringBuffer searchkeywords = new StringBuffer();
		
		Iterator iterator=searchParam.entrySet().iterator();
        while(iterator.hasNext()){
           Map.Entry mapEntry=(Map.Entry)iterator.next();
           if( mapEntry.getValue() != null &&  ((String) mapEntry.getValue()).trim().length() > 0 && ! "null".equalsIgnoreCase( "" + mapEntry.getValue()))  {
        	   theLogger.debug("Search Keyword " + mapEntry.getValue());
	           if(((String) mapEntry.getKey()).contains("categoryid")){
		           if("0".equalsIgnoreCase(((String) mapEntry.getValue())))
		        	   searchkeywords.append(searchParam.get("schcat0") + "|");
		           else if ("1".equalsIgnoreCase(((String) mapEntry.getValue())))
		    		   searchkeywords.append(searchParam.get("schcat1")  + "|");
		           else if ("2".equalsIgnoreCase(((String) mapEntry.getValue())))
		    		   searchkeywords.append(searchParam.get("schcat2")  + "|");
                   else if ("5".equalsIgnoreCase(((String) mapEntry.getValue())))
                       searchkeywords.append(searchParam.get("schcat5")  + "|");
                   else if ( "0,1,2,3,4,5".equalsIgnoreCase("" + (searchParam.get("categoryid"))) )
		        	   searchkeywords.append(kindergarten + "|" + primary + "|" +  secondary + "|" +  ib + "|");
		       }else if (!"-1".equalsIgnoreCase(((String) mapEntry.getValue())) && ((String) mapEntry.getKey()).contains("metric1")){
	         	   searchkeywords.append(metric1Label + " " + mapEntry.getValue() + "|");
	                	   
	           }else if (!"-1".equalsIgnoreCase(((String) mapEntry.getValue())) && ((String) mapEntry.getKey()).contains("metric2")){
	         	   searchkeywords.append(metric2Label + " " + mapEntry.getValue() + "|");
	                	   
	           }else if (!"-1".equalsIgnoreCase(((String) mapEntry.getValue())) && ((String) mapEntry.getKey()).contains("metric3")){
	         	   searchkeywords.append(metric3Label + " " + mapEntry.getValue() + "|");
	                	   
	           }else if (!"-1".equalsIgnoreCase(((String) mapEntry.getValue())) && ((String) mapEntry.getKey()).contains("metric4")){
	         	   searchkeywords.append(metric4Label + " " + mapEntry.getValue() + "|");
	                	   
	           }else if (!"-1".equalsIgnoreCase(((String) mapEntry.getValue())) && ((String) mapEntry.getKey()).contains("metric5")){
	         	   searchkeywords.append(metric5Label + " " + mapEntry.getValue() + "|");
	                	   
	           }else if (!"-1".equalsIgnoreCase(((String) mapEntry.getValue())) && ((String) mapEntry.getKey()).contains("parentrating")){
	         	   searchkeywords.append(parentratingLabel + " " + mapEntry.getValue() + "|");
	                	   
	           }else if (!"-1".equalsIgnoreCase(((String) mapEntry.getValue())) && ((String) mapEntry.getKey()).contains("systemranking")){
	         	   searchkeywords.append(systemrankingLabel + " " + mapEntry.getValue() + "|");
	                	   
	           }else if (!"-1".equalsIgnoreCase(((String) mapEntry.getValue())) && ((String) mapEntry.getKey()).contains("score")){
	         	   searchkeywords.append(rankingLabel + " " + mapEntry.getValue() + "|");
	                	   
	           }else if (!"-1".equalsIgnoreCase(((String) mapEntry.getValue())) &&  ! ((String) mapEntry.getKey()).contains("schcat") ){
	         	   searchkeywords.append("" + mapEntry.getValue() + "|");
	                	   
	           }
           }
        }
 		
		
		searchParam.put("searchmodeactive","y");
		List <Map<String, Object>> resultList = serviceDAO.searchSite(searchParam);
		StringBuffer compareEntityid = new StringBuffer();
		model.addObject("resultList", resultList );
		int totalschool=0;
		for(int i=0; i<resultList.size();i++){
			if( ((String) (resultList.get(i).get("searchcat")) ).equalsIgnoreCase("school")) {
				compareEntityid.append((Integer) (resultList.get(i).get("id")) + ",");
				totalschool++;
			}
		}
		model.addObject("compareEntityid",compareEntityid.toString() );
		model.addObject("searchmodeactive","y");
		model.addObject("searchkeywords",searchkeywords.toString());
		model.addObject("totalschool",totalschool);

		return model;
	}
	@RequestMapping("/schoolReverseSearch")
	protected ModelAndView getReverseEntityList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		initStaticData(request);
		HttpSession session = request.getSession(true);
		ModelAndView model = new ModelAndView("reverseSearchConsole");	
		HashMap<String,String> searchParam = new HashMap<String,String>();
		String entityid = request.getParameter("reverseentityid") != null ? request.getParameter("reverseentityid") : "5888";
        String allocationyear = request.getParameter("allocationyear") != null ? request.getParameter("allocationyear") : "-1";

        try{
			Integer.parseInt(entityid);
		}catch (Exception ex){
			entityid = "5888";
		}
		
		theLogger.debug("schoolReverseSearch {} , {}" , entityid , allocationyear);
		searchParam.put("entityid",entityid);
        searchParam.put("allocationyear",allocationyear);

        List<Map<String, Object>> result = entityDAO.getReverseEntityList(searchParam);
		String schoolcategory = entityDAO.getLookupMap("entity.category.chi").get("" + (entityDAO.getCategoryEntity(entityid) - 1)) ;
		Map<String,Object> school = entityDAO.getEntityDetails(entityid,"-1","","single");
		String schoolname = (String) school.get("name") ;
		String alocatedschoolnames="";
		model.addObject("total", result.size()  );
		model.addObject("schoolcategory", schoolcategory  );
		model.addObject("schoolname", schoolname  );
        model.addObject("hitcount",entityDAO.getEntityHitCount("1","reversesearch"));
        model.addObject("allocationyear", allocationyear  );
        model.addObject("rankingyear", getRankingYear());
        model.addObject("reverseentityid", entityid  );



        int max=3;
		for(int i=0; i<result.size(); i++){
			Map<String,Object> tmp = result.get(i);
			if(i<max){
				alocatedschoolnames += tmp.get("name") + "\uFF0C";
			}
		}
		if(alocatedschoolnames.contains("\uFF0C"))
			alocatedschoolnames = alocatedschoolnames.substring(0,alocatedschoolnames.length()-1);
		model.addObject("alocatedschoolnames", alocatedschoolnames  );
		model.addObject("schoolList", result  );
		model.addObject("school", school  );
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		String answer=applicationContext.getMessage("label.reversesearchanalytics", new Object[] {result.size() ,schoolcategory,schoolname,schoolcategory,alocatedschoolnames }, Locale.SIMPLIFIED_CHINESE);  
		String moreinfo = "<div class=\"qamoreinfo\"><a class=\"commentschoolcompareqa\" href=\"/school/controller/schoolReverseSearch?reverseentityid=" + entityid + "\" >\u8A73\u60C5\u5206\u6790</a></div>"; 
		
		HashMap<String,String> qamap = new HashMap<String,String>();
		qamap.put("subject", "\u5982\u679C\u60F3\u5165" + schoolname + ", \u8B80\u908A\u9593" + schoolcategory + "\u6A5F\u6703\u5927D?");
		qamap.put("active", "y");
		qamap.put("question", "\u5982\u984C\uFF0C\u8ACB\u5E6B\u5FD9");
		qamap.put("answer", answer + moreinfo);
		qamap.put("signleentityid", entityid);
		qamap.put("tag1", "\u9006\u5411\u641C\u5C0B");
		qamap.put("userid", "1");
		qamap.put("userlike", "0");
		qamap.put("categoryid", "" + school.get("categoryid"));
		qamap.put("type", "q");
		
		if(!blockattack){
			if(!isRobot(request)){
				questionAnswerDAO.saveQuestionWithAnswer(qamap);
			}
		}
		model.addObject("topmenu",buildTopMenu(request));
		model.addObject("reversed","true");
		session.setAttribute("searchCriteria",searchParam);
		
		return model;
	}

	@RequestMapping("/schoolAllocationReport")
	protected ModelAndView getSchoolAllocationReport(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int year = Calendar.getInstance().get(Calendar.YEAR) - 1;
		initStaticData(request);
		ModelAndView model = new ModelAndView("reportConsole");	
		String schoolplacementyear = request.getParameter("schoolplacementyear") != null ? request.getParameter("schoolplacementyear") : "" + year;
		String sortby = request.getParameter("sortby") != null ? request.getParameter("sortby") : "noofschool";
		String sortorder = request.getParameter("sortorder") != null ? request.getParameter("sortorder") : "desc";
		String categoryid = request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "1";
		String sacategoryid ="1";
		try{
			sacategoryid = "" + (Integer.parseInt(categoryid) + 1);
		}catch(Exception ex){
			
		}
		model.addObject("schoolList",entityDAO.getSchoolAllocationReport(sortby, sortorder, categoryid,schoolplacementyear) );
		model.addObject("topmenu",buildTopMenu(request));
		model.addObject("sortorder", "desc".equalsIgnoreCase(sortorder)  ? "asc" : "desc" );
		model.addObject("sortby", sortby );
		model.addObject("schoolallocationcount", entityDAO.getSchoolAllocationCount(categoryid,schoolplacementyear));
		model.addObject("categoryid", categoryid);
		model.addObject("sacategoryid", sacategoryid);
        model.addObject("rankingyear", getRankingYear());

        model.addObject("schoolplacementyear", schoolplacementyear);
		
		return model;
	}
    @RequestMapping("/getHitSchoolReport")
    protected ModelAndView getHitSchoolReport(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int year = Calendar.getInstance().get(Calendar.YEAR) - 1;
        initStaticData(request);
        ModelAndView model = new ModelAndView("entity/hitSchoolReport");
        String schoolyear = request.getParameter("schoolyear") != null ? request.getParameter("schoolyear") : "" + year;
        String sortby = request.getParameter("sortby") != null ? request.getParameter("sortby") : "poaschoolnet asc, overpercent";
        String sortorder = request.getParameter("sortorder") != null ? request.getParameter("sortorder") : "desc";
        String categoryid = request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "1";
        String poaschoolnet = request.getParameter("poaschoolnet") != null ? request.getParameter("poaschoolnet") : "-1";

        model.addObject("hitcount",entityDAO.getEntityHitCount(categoryid,"hitSchool"));
        model.addObject("schoolList",entityDAO.getHitSchoolReport(sortby, sortorder,schoolyear,categoryid,poaschoolnet) );
        model.addObject("poaSchoolNetList", entityDAO.getPoaSchoolNet(categoryid));
        model.addObject("topmenu",buildTopMenu(request));
        model.addObject("sortorder", "desc".equalsIgnoreCase(sortorder)  ? "asc" : "desc" );
        model.addObject("sortby", sortby );
        model.addObject("categoryid", categoryid);
        model.addObject("schoolyear", schoolyear);
        model.addObject("poaschoolnet", poaschoolnet);


        return model;
    }
	@RequestMapping("/privateDssReport")
	protected ModelAndView getPrivateDssReport(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		initStaticData(request);
        String view = request.getAttribute("view") != null ? (String) request.getAttribute("view") : (request.getParameter("view") != null ? request.getParameter("view") :  "list");
        ModelAndView model = new ModelAndView("list".equalsIgnoreCase(view) ? "event/fullEventList" :  "event/fullCalendar");
        request.setAttribute("type", "privatedss");

        //model.addObject("schoolList",entityDAO.getPrivateDssReport() );
		//model.addObject("topmenu",buildTopMenu(request));
		//model.addObject("categoryid","1");

        model.addAllObjects(eventController.getEventFullCalendar(request,response).getModel());


        return model;
	}
	@RequestMapping("/howtouse")
	protected ModelAndView getHowToUse(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		initStaticData(request);
		ModelAndView model = new ModelAndView("howtouse");	
		return model;
	}
	@RequestMapping("/refusepolling/{entityid}")
	protected @ResponseBody String refusePolling(@PathVariable String entityid, HttpServletRequest request) throws Exception {
		request.setAttribute("entityid", entityid);
		Map<String,String> paramMap = extractCommentParam(request);
		paramMap.put("type",  "" + entityDAO.getLookupMap("polling.type").get("active"));
		entityDAO.refusePolling(paramMap);
		return "Done";
		
		
	}
	@RequestMapping("/schoolCompareSelection")
	protected ModelAndView getSchoolCompareSelection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String selectbig = request.getParameter("selectbig") != null ? request.getParameter("selectbig") : "n";
		
		initStaticData(request);
		ModelAndView model = new ModelAndView("schoolCompareSelectionForm");	
		model.addObject("selectbig", selectbig);
		return model;
	}
	@RequestMapping("/searchForm")
	protected ModelAndView getSearchForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		initStaticData(request);
		ModelAndView model = new ModelAndView("searchForm");	
		List<Map<String, Object>> result = entityDAO.getSchoolListByFinanceType("0");
		result.addAll(entityDAO.getSchoolListByFinanceType("2"));
		model.addObject("financetypeSchoolList",result);
		model.addObject("throughtrainSchoolList",entityDAO.getSchoolListByMode("1"));
		model.addObject("schoolSessionList",entityDAO.getSchoolSessionList());
		model.addObject("hitcount",entityDAO.getEntityHitCount("1","searchForm"));
		
		return model;
	}
	@RequestMapping("/reverseSearchForm")
	protected ModelAndView getReverseSearchForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		initStaticData(request);
		ModelAndView model = new ModelAndView("common/reverseSearchFormFull");
		model.addObject("hitcount",entityDAO.getEntityHitCount("1","reversesearch"));
		model.addObject("selectbig","y");
		return model;
	}
	@RequestMapping("/parentRatingListOverlay")
	protected ModelAndView getfavoriteUserListOverlay(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView model = new ModelAndView("parentRatingListOverlay");
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;
		model.addObject("parentRatingList",userDAO.getParentRatingList(userid));
		
		return model;
	}
	@RequestMapping("/parentKidListOverlay")
	protected ModelAndView getParentKidListOverlay(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView model = new ModelAndView("parentKidListOverlay");
		String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");
		
		model.addObject("parentKidList",userDAO.getParentKidListByEntity(entityid));
		model.addObject("schoolname", entityDAO.getEntityDetails(entityid,"-1","","single").get("name") );
		return model;
	}
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	public ResponseEntity<String>  upload (@RequestParam("imageUpload") MultipartFile multipartFile, @RequestParam("imagekey")	String imagekey, HttpServletRequest request) {
		theLogger.debug("Inside file upload " + imagekey);
		long limit = 1024*1024;
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");

	    String prefix = imagekey.contains("mobile") ? "staticimage/entityimage" : "userimages";
		if(imagekey.contains("mobile") || !"-1".equalsIgnoreCase(userid)){
		   theLogger.debug("multipartFile " + multipartFile.getSize());
		    if(multipartFile.getSize() < limit){
			    String path="";
			    String filename= (imagekey.contains("mobile")  ? "" :  userid + "-" ) + multipartFile.getOriginalFilename() ;
			    try{
			    	path = fileUtil.saveFileToServer(multipartFile, request.getServletContext().getRealPath("/") + prefix +  System.getProperty("file.separator"), filename);
			    	path = fileUtil.saveFileToServer(multipartFile, "/home/ubuntu/repository/" +  prefix + "/", filename);
			    	session.setAttribute(imagekey,filename);
			    
			    }catch(Exception ex){
			    	ex.printStackTrace();
			    }
			    return new ResponseEntity<String>( "/school/" + prefix + "/"  +  filename + "?" + new java.util.Date().getTime(), responseHeaders, HttpStatus.CREATED);
		    }else{
		        return new ResponseEntity<String>( "/school/img/filesizeexceed.png"  + "?" + new java.util.Date().getTime(), responseHeaders, HttpStatus.CREATED);
			    
		    }
		}else{
	        return new ResponseEntity<String>( "/school/img/filesizeexceed.png"  + "?" + new java.util.Date().getTime(), responseHeaders, HttpStatus.CREATED);
			
		}
	}
	@RequestMapping("/deleteImage/{imagekey}")
	protected @ResponseBody String deleteImage(@PathVariable String imagekey, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(true);
		session.setAttribute(imagekey,"delete");
		return "success";
	}
	@RequestMapping("/adController")
	protected ModelAndView getAd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView model = new ModelAndView("ads/ad");
		String id = request.getAttribute("id") != null ? (String)  request.getAttribute("id") :  (request.getParameter("id") != null ? request.getParameter("id") : "1");
		model.addObject("adtype",id);
		return model;
	}
	@RequestMapping("/yahooSponsorSearch")
	protected ModelAndView getYahooSponsorSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView model = new ModelAndView("ads/yssResult");
		request.setCharacterEncoding("UTF-8");
		String keywords = request.getAttribute("keywords") != null ? (String)  request.getAttribute("keywords") :  (request.getParameter("keywords") != null ? request.getParameter("keywords") : "1");
		model.addObject("keywords",keywords); 
		model.addObject("ip",getIPaddress(request));
		return model;
	}
	@RequestMapping("/yahooSponsorSearchCommon")
	protected ModelAndView getYahooSponsorSearchCommon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView model = new ModelAndView("ads/yahoosponsorsearch");
		String maxcount = request.getParameter("maxcount") != null ? request.getParameter("maxcount") : "3";
		
		request.setCharacterEncoding("UTF-8");
		model.addObject("ip",getIPaddress(request));
		model.addObject("maxcount",maxcount);
		return model;
	}
	@RequestMapping("/getSchoolSelect")
	protected ModelAndView getSchoolSelect(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String multipleselect = request.getParameter("multipleselect") != null ? request.getParameter("multipleselect") : "n";
		String selectbig = request.getParameter("selectbig") != null ? request.getParameter("selectbig") : "n";
		String hiddenfieldid = request.getParameter("hiddenfieldid") != null ? request.getParameter("hiddenfieldid") : "-1";
		
		initStaticData(request);
		ModelAndView model = new ModelAndView("schoolSelect");	
		model.addObject("multipleselect", multipleselect);
		model.addObject("selectbig", selectbig);
		
		model.addObject("hiddenfieldid", hiddenfieldid);
		
		return model;
	}

	@RequestMapping("/hideComment/{commentid}")
	protected @ResponseBody String hideComment(@PathVariable String commentid) throws Exception {
		serviceDAO.hideComment(commentid);
		return "success";
	}
	@RequestMapping("/hideQA/{qaid}")
	protected @ResponseBody String hideQA(@PathVariable String qaid) throws Exception {
		serviceDAO.hideQA(qaid);
		return "success";
	}
	@RequestMapping("/hideEvent/{eventid}")
	protected @ResponseBody String hideEvent(@PathVariable String eventid) throws Exception {
		serviceDAO.hideEvent(eventid);
		return "success";
	}
	@RequestMapping("/getSliderData")
	protected ModelAndView getSliderData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView model = new ModelAndView("common/sliderData");
		return model;
	}

}
