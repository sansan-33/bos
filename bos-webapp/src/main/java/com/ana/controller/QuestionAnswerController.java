package com.ana.controller;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller(value="questionAnswerController")
public class QuestionAnswerController extends BaseController {

    private final Logger theLogger = LoggerFactory.getLogger(QuestionAnswerController.class);

    @RequestMapping("/getForumContentList")
	protected ModelAndView getForumContentList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		initStaticData(request);
		String type = request.getParameter("type") != null && request.getParameter("type").trim().length() > 0 ? request.getParameter("type") : "-1";
		String categoryid = request.getParameter("categoryid") != null && request.getParameter("categoryid").trim().length() > 0 ? request.getParameter("categoryid") : "-1";
		
		HashMap<String,String> searchParam = new HashMap<String,String>();
		searchParam.put("hot", "hot");
		ModelAndView model = new ModelAndView("forumContentList");
		searchParam.put("type", type);
		searchParam.put("categoryid", categoryid);
		  
		model.addObject("topmenu",buildForumMenu(request)); // build forum menu
		model.addObject("categoryid", categoryid);
		model.addObject("type", type);
		
		return model;
	}
	@RequestMapping("/getForumContentListData")
	protected ResponseEntity<String> getForumContentListData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		String anonymous = applicationContext.getMessage("label.anonymous", null, Locale.SIMPLIFIED_CHINESE);
		int amount = 25;
	    int start = 0;
	    String dir = "desc";
	    String sStart = request.getParameter("iDisplayStart");
	    String sdir = request.getParameter("sSortDir_0");
	   
	    if (sStart != null) {
	        start = Integer.parseInt(sStart);
	        if (start < 0)
	            start = 0;
	    }
	    if (sdir != null) {
	        if (!sdir.equals("asc"))
	            dir = "desc";
	    }
	    String colName = "sortabledate";
	    
		JSONObject result = new JSONObject();
	    JSONArray array = new JSONArray();
	    
		String type = request.getParameter("type") != null && request.getParameter("type").trim().length() > 0 ? request.getParameter("type") : "-1";
		String categoryid = request.getParameter("categoryid") != null && request.getParameter("categoryid").trim().length() > 0 ? request.getParameter("categoryid") : "-1";
		String maincategoryname = request.getParameter("maincategoryname") != null && request.getParameter("maincategoryname").trim().length() > 0 ? request.getParameter("maincategoryname") : "-1";
		
		//HttpSession session = request.getSession(true);
		initStaticData(request);
		
		String userid = request.getParameter("userid") != null && request.getParameter("userid").trim().length() > 0 ? request.getParameter("userid") : "-1";
		String isparentrating = request.getParameter("isparentrating") != null && request.getParameter("isparentrating").trim().length() > 0 ? request.getParameter("isparentrating") : "-1";
		
		
		HashMap<String,String> searchParam = new HashMap<String,String>();
		searchParam.put("hot", "hot");
		searchParam.put("type", type);
		searchParam.put("categoryid", categoryid);
		searchParam.put("all", "y");
		searchParam.put("isparentrating", "y".equalsIgnoreCase(isparentrating) ? applicationContext.getMessage("label.parentrating",new Object[] {},Locale.SIMPLIFIED_CHINESE) : "-1");
		searchParam.put("userid", userid );
		searchParam.put("mypost","y");
		int total = questionAnswerDAO.getForumContentList(searchParam).size();
		result.put("iTotalRecords", "" + total);
		result.put("iTotalDisplayRecords", "" + total);
         
		searchParam.put("all", "n");
		searchParam.put("colName", colName);
		searchParam.put("dir", dir);
		searchParam.put("start", "" + start);
		searchParam.put("amount", "" + amount);
		
		
		List<Map<String, Object>> forumcontentlist = questionAnswerDAO.getForumContentList(searchParam);
		String lastupdated = "";
		for(int i=0; i<forumcontentlist.size(); i++){
			JSONArray ja = new JSONArray();
			  
	            ja.put("<a href='#' onclick=\"getForumContent('" + forumcontentlist.get(i).get("id") + "','" + categoryid + "','" +type +"','" + maincategoryname + "','getForumContent')\"><font class='fontxlarge d3-color-black' style='line-height:150%;'>" + forumcontentlist.get(i).get("subject") + "</font></a>");
	            ja.put("y".equalsIgnoreCase("" + forumcontentlist.get(i).get("anonymous")) || "1".equalsIgnoreCase("" + forumcontentlist.get(i).get("userid")) || forumcontentlist.get(i).get("username") == null ? anonymous : forumcontentlist.get(i).get("username"));
	            ja.put(forumcontentlist.get(i).get("totalreply") + "/" + forumcontentlist.get(i).get("hitcounter"));
	            
	            try{
	            if( Integer.parseInt("" + forumcontentlist.get(i).get("timediffday"))  > 0 )
	            	lastupdated = forumcontentlist.get(i).get("timediffday") + applicationContext.getMessage("label.dayago", null, Locale.SIMPLIFIED_CHINESE);
	            else if ( Integer.parseInt("" + forumcontentlist.get(i).get("timediffhour")) > 0 )
	              	lastupdated = forumcontentlist.get(i).get("timediffhour") + applicationContext.getMessage("label.hourago", null, Locale.SIMPLIFIED_CHINESE);
	            else if (Integer.parseInt("" + forumcontentlist.get(i).get("timediffmin")) > 0 )
	              	lastupdated = forumcontentlist.get(i).get("timediffmin") + applicationContext.getMessage("label.minago", null, Locale.SIMPLIFIED_CHINESE);
	            else if (Integer.parseInt("" + forumcontentlist.get(i).get("timediffsec")) > 0 )
	              	lastupdated = forumcontentlist.get(i).get("timediffsec") + applicationContext.getMessage("label.secago", null, Locale.SIMPLIFIED_CHINESE);
	            }catch (Exception ex){
	              	lastupdated = "?" + applicationContext.getMessage("label.dayago", null, Locale.SIMPLIFIED_CHINESE);
	   	         
	            }
	            
				
	            
	            ja.put(lastupdated);
	            
	            array.put(ja);
	        }
		  
		result.put("aaData", array);
        
        
        HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "application/json; charset=utf-8");
	    responseHeaders.add("Cache-Control", "no-store");
	    return new ResponseEntity<String>(result.toString(), responseHeaders, HttpStatus.CREATED);

	    
		
	}
	@RequestMapping("/askQuestion")
	protected ModelAndView getAskQuestionForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		initStaticData(request);
		
		String id = request.getParameter("id") != null ? request.getParameter("id") : "-1";
		String categoryid = request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "-1";
		String type = request.getParameter("type") != null ? request.getParameter("type") : "-1";
		String tag = request.getParameter("tag") != null ? request.getParameter("tag") : "-1";
		String maincategoryname = request.getParameter("maincategoryname") != null && request.getParameter("maincategoryname").trim().length() > 0 ? request.getParameter("maincategoryname") : "-1";
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		
		HashMap<String,String> searchParam = new HashMap<String,String>();
		searchParam.put("id", id);
		searchParam.put("tag", tag);
		
		ModelAndView model = new ModelAndView("askQuestion");
		
		if("0".equalsIgnoreCase(categoryid))
			model.addObject("schoollist",kindergartenSchoolList);
		else if("1".equalsIgnoreCase(categoryid))
			model.addObject("schoollist",primarySchoolList);
		else if("2".equalsIgnoreCase(categoryid))
			model.addObject("schoollist",secondarySchoolList);
		
		model.addObject("categoryid",categoryid);
		model.addObject("type",type);
		model.addObject("maincategoryname",maincategoryname);
		
		try{
			tag = applicationContext.getMessage(maincategoryname, null, Locale.SIMPLIFIED_CHINESE);
		}catch(Exception ex){
			tag = "";
		}
		
		model.addObject("tag",tag);
		
		
		model.addObject("topmenu",buildForumMenu(request)); // build forum menu
		return model;
	}
	
	@RequestMapping(value="/saveQuestionAnswerAJAX", method=RequestMethod.POST)
	protected ResponseEntity<String> saveQuestionAnswerAJAX(@RequestParam String entityid, @RequestParam String type, @RequestParam String subject, @RequestParam String parentid, @RequestParam String questionanswer, @RequestParam String refresh, HttpSession session, HttpServletRequest request) throws Exception {
		try{
			
			//return null;
			Map user = (Map) session.getAttribute("user");
			//theLogger.debug("saveQuestionAnswerAJAX .... " + user);
			String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		; 			            String isrobot = request.getParameter("isrobot") != null && request.getParameter("isrobot").trim().length() > 0 ?  request.getParameter("isrobot") : "-1";
            if(! "bos".equalsIgnoreCase(isrobot) ){
				return null;
			}else if("".equalsIgnoreCase(questionanswer) ){
                return null;
            }else if (isFoulLanguage(questionanswer)){
				return null;
			}
            else{
			String chatlistsize = request.getParameter("chatlistsize") != null && request.getParameter("chatlistsize").trim().length() > 0 ?  request.getParameter("chatlistsize") : "-1";
			String style = request.getParameter("style") != null && request.getParameter("style").trim().length() > 0 ?  request.getParameter("style") : "-1";
			String userids[] = request.getParameterValues("userid") != null && request.getParameterValues("userid").length > 0 ?  request.getParameterValues("userid") : null;
			String channeltype = request.getParameter("channeltype") != null && request.getParameter("channeltype").trim().length() > 0 ?  request.getParameter("channeltype") : "-1";
			String createchannel = request.getParameter("createchannel") != null && request.getParameter("createchannel").trim().length() > 0 ?  request.getParameter("createchannel") : "-1";
			String channelname = request.getParameter("channelname") != null && request.getParameter("channelname").trim().length() > 0 ?  request.getParameter("channelname") : "-1";
			String touchtableid = request.getParameter("touchtableid") != null && request.getParameter("touchtableid").trim().length() > 0 ?  request.getParameter("touchtableid") : "-1";
			String touchtablename = request.getParameter("touchtablename") != null && request.getParameter("touchtablename").trim().length() > 0 ?  request.getParameter("touchtablename") : "-1";

			StringBuffer useridsb = new StringBuffer();
			String useridstr="";
			
			if("y".equalsIgnoreCase(createchannel)){
				for(int i=0; i<userids.length ;i++ ){
					useridsb.append(userids[i] + ",");
				}
				useridstr = useridsb.toString();
				useridstr = useridstr.substring(0, useridstr.length() -1 );
			}
			
			HashMap<String,String> searchParam = new HashMap<String,String>();
			String ipaddr = getIPaddress(request);
			searchParam.put("subject", subject);
			searchParam.put("questionanswer", questionanswer);
			searchParam.put("userid", userid);
			searchParam.put("userlike", "0");
			searchParam.put("userdislike", "0");
			searchParam.put("type", type);
			searchParam.put("active", "y");
			searchParam.put("entityid", entityid);
			searchParam.put("parentid", parentid);
			searchParam.put("ipaddr", ipaddr);
			searchParam.put("userids", useridstr);
			searchParam.put("channeltype", channeltype);
			searchParam.put("channelname", channelname);
			searchParam.put("receivedby", userids != null && userids.length > 0 ? userids[0] : "0");
			searchParam.put("createchannel", createchannel);
			
			
			theLogger.debug("saveQuestionAnswerAJAX " + searchParam);
			int id = questionAnswerDAO.getQAParentID(searchParam);
			if(id > 0){
				searchParam.put("parentid", "" + id);
			}
			if("y".equalsIgnoreCase(createchannel)){
				searchParam.put("entityid", questionAnswerDAO.saveChatChannel(searchParam));
			}
			
			//No need to save if refresh only .... 
			String newparentid="";
			if(!"y".equalsIgnoreCase(refresh))
				newparentid = questionAnswerDAO.saveQuestionAnswer(searchParam);
			
			
			questionAnswerDAO.updateInbox(searchParam.get("entityid"),userid,"add");
			
			StringBuffer html = new StringBuffer();
			HttpHeaders responseHeaders = new HttpHeaders();
		    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		    
		    searchParam.put("id",  id > 0 ? ""  + id : newparentid);
		    searchParam.put("style",  style);
			
		    request.setAttribute("chatlistsize", chatlistsize);
		    
		    if(! "-1".equalsIgnoreCase(touchtablename) && ! "-1".equalsIgnoreCase(touchtableid))
		    	caseDAO.touchRecord(touchtableid, touchtablename);
			
		    
		    return new ResponseEntity<String>(getChatMsg(questionAnswerDAO.getQAListByID(searchParam),request, new Date()), responseHeaders, HttpStatus.CREATED);
			}
			
		}catch (Exception ex){
			ex.printStackTrace();
			HttpHeaders responseHeaders = new HttpHeaders();
		    responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		    return new ResponseEntity<String>(ex.toString(), responseHeaders, HttpStatus.CREATED);
		}
	}
	
	
	
	
	@RequestMapping("/saveQuestionAnswer")
	protected ModelAndView saveQuestionAnswer(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		initStaticData(request);
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		theLogger.info("saveQuestionAnswer start");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;
		if(user != null && !"-1".equalsIgnoreCase(userid)){
	
			String id = request.getParameter("id") != null && request.getParameter("id").trim().length() > 0 ?  request.getParameter("id") : "-1";
			String tag = request.getParameter("tag") != null && request.getParameter("tag").trim().length() > 0 ? request.getParameter("tag") : "-1";
			String subject = request.getParameter("subject") != null && request.getParameter("subject").trim().length() > 0 ? request.getParameter("subject") : "-1";
			String questionanswer = request.getParameter("questionanswer") != null && request.getParameter("questionanswer").trim().length() > 0 ? request.getParameter("questionanswer") : "-1";
			String type = request.getParameter("type") != null && request.getParameter("type").trim().length() > 0 ? request.getParameter("type") : "-1";
			String entityid = request.getParameter("entityid") != null && request.getParameter("entityid").trim().length() > 0 ? request.getParameter("entityid") : "0";
			String categoryid = request.getParameter("categoryid") != null && request.getParameter("categoryid").trim().length() > 0 ? request.getParameter("categoryid") : "0";
			theLogger.info("saveQuestionAnswer " + request.getParameter("entityid"));
			String parentid = request.getParameter("parentid") != null && request.getParameter("parentid").trim().length() > 0 ? request.getParameter("parentid") : "0";
			
			HashMap<String,String> searchParam = new HashMap<String,String>();
			searchParam.put("id", id);
			String ipaddr = getIPaddress(request);
			
			searchParam.put("subject", subject);
			searchParam.put("questionanswer", questionanswer);
			searchParam.put("userid", userid);
			searchParam.put("userlike", "2");
			searchParam.put("userdislike", "0");
			searchParam.put("type", type);
			searchParam.put("active", "y");
			searchParam.put("entityid", entityid);
			searchParam.put("parentid", parentid);
			searchParam.put("categoryid", categoryid);
			searchParam.put("ipaddr", ipaddr);
			
			if(!"-1".equalsIgnoreCase(tag)){
				StringTokenizer st = new StringTokenizer(tag," ");
				//String[] delimiter = {" ",";",","};
				String[] delimiter = {","};
				ArrayList<String> tagList = new ArrayList<String>();
				String tagst="";
				String previoudtagst="";
				for(int i=0; i<delimiter.length; i++ ){
					st = new StringTokenizer(tag,delimiter[i]);
						while (st.hasMoreTokens()) {
							tagst=st.nextToken();
							if(tagst != null && tagst.trim().length() > 0 && ! tagst.equalsIgnoreCase(previoudtagst) ){
								tagList.add(tagst.trim());
							}
							previoudtagst = tagst;
						}
				}
				int tagListSize = tagList.size() > 5 ? 5 : tagList.size();
				for(int i=0; i<tagListSize; i++){
					//if(!tag.equalsIgnoreCase(tagList.get(i)))
						searchParam.put("tag" + (i+1), tagList.get(i));
				}
			}
			
			userDAO.updateCounter("postcount", userid);
			String key = questionAnswerDAO.saveQuestionAnswer(searchParam);
			theLogger.info("parentid " + parentid);
			if(!"0".equalsIgnoreCase(parentid)){
				questionAnswerDAO.updateQuestionAnswerTotalReply(parentid);
				theLogger.debug("update total reply  " + parentid);
			}else{
				entityDAO.getEntityHitCount(key,"forum");
			}
			String defaultview = "forumContentList";
			
			defaultview = request.getParameter("viewname") != null && request.getParameter("viewname").trim().length() > 0 ?  request.getParameter("viewname") : defaultview;
			ModelAndView model = new ModelAndView(defaultview);
			//model.addObject("questionAnswerList","chat".equalsIgnoreCase(defaultview) ?  questionAnswerDAO.getQAListByID(searchParam) : questionAnswerDAO.getQATag(searchParam) );
			model.addObject("questionAnswerList","chat".equalsIgnoreCase(defaultview) ?  questionAnswerDAO.getQAListByID(searchParam) : null );
			
			if("forumContentList".equalsIgnoreCase(defaultview))
				model.addAllObjects(getForumContentList(request,response).getModel());
		
			return model;
		
		}else{
			return null;
		}
		
	
	}
	@RequestMapping("/likeQuestionAnswer")
	protected ModelAndView likeQuestionAnswer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		initStaticData(request);
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		
		String id = request.getParameter("id") != null ? request.getParameter("id") : "-1";
		String parentid = request.getParameter("parentid") != null ? request.getParameter("parentid") : "-1";
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		; 					String ip = request.getHeader("X-Forwarded-For");
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
		
		questionAnswerDAO.likeQuestionAnswer(id,userid,ip);
		ModelAndView model = new ModelAndView("askQuestion");
		request.setAttribute("id", parentid);
		model.addAllObjects(getForumDetails(request, response).getModel());
		model.setViewName("forumDetails");

		return model;
	}
	/*
	@RequestMapping("/acceptAnswer")
	protected ModelAndView accpetAnswer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		initStaticData(request);
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		
		String id = request.getParameter("id") != null ? request.getParameter("id") : "-1";
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		; 					String parentid = request.getParameter("parentid") != null ? request.getParameter("parentid") : "-1";
		
		questionAnswerDAO.acceptAnswer(id,userid,parentid);
		ModelAndView model = new ModelAndView("askQuestion");
		request.setAttribute("id", parentid);
		model.addAllObjects(getQAListByID(request, response).getModel());
		model.setViewName("answerQuestion");
		return model;
	}
	*/
	@RequestMapping("/getChatDialog")
	protected ModelAndView getChatDialog(HttpServletRequest request, HttpServletResponse response) throws Exception {
		theLogger.debug("Inside chat dialog ... ");
		ModelAndView model = new ModelAndView("chat");
		
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;
		String questionanswerid = request.getParameter("id") != null ? request.getParameter("id") : "-1";
		String entityid = request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1";
		String type = request.getParameter("type") != null ? request.getParameter("type") : "-1";
		
		HashMap<String,String> searchParam = new HashMap<String,String>();
	    searchParam.put("id", questionanswerid);
	    theLogger.debug("calling questionAnswerDAO ... ");
	    try{
		    if("e".equalsIgnoreCase(type)){
		    	model.addObject("chattitle", entityDAO.getEntityDetails(entityid,"-1","-1","single").get("name") );
		    }
		}catch(Exception ex){
	    	ex.printStackTrace();
	    }
	    
	    model.addObject("chatmsg",getChatMsg(questionAnswerDAO.getQAListByID(searchParam),request,new Date()));
		model.addObject("entityid",entityid);
		model.addObject("type",type);
		model.addObject("questionanswerid",questionanswerid);
		model.addObject("textareaheight","4");
		model.addObject("textareawidth","200");
		model.setViewName("chat");
		return model;
	}
	@RequestMapping("/getForumDetails")
	protected ModelAndView getForumDetails(HttpServletRequest request, HttpServletResponse response) throws Exception {

		initStaticData(request);
		String id =  (request.getAttribute("id") != null && ! "-1".equalsIgnoreCase((String) request.getAttribute("id")) ? (String) request.getAttribute("id") : (request.getParameter("id") != null ? request.getParameter("id") : "-1"));
		String type = request.getParameter("type") != null && request.getParameter("type").trim().length() > 0 ? request.getParameter("type") : "-1";
		String categoryid = request.getParameter("categoryid") != null && request.getParameter("categoryid").trim().length() > 0 ? request.getParameter("categoryid") : "-1";
		String maincategoryname = request.getParameter("maincategoryname") != null && request.getParameter("maincategoryname").trim().length() > 0 ? request.getParameter("maincategoryname") : "-1";
		
		HashMap<String,String> searchParam = new HashMap<String,String>();
		searchParam.put("id", id);
        searchParam.put("order", "asc");


        ModelAndView model = new ModelAndView("forumDetails");
		List<Map<String, Object>> qalist = questionAnswerDAO.getQAListByID(searchParam);
		model.addObject("questionAnswerList",qalist);
		model.addObject("hitcount",entityDAO.getEntityHitCount(id,"forum"));
		request.setAttribute("lastitemname", qalist.isEmpty() ? "" :  qalist.get(0).get("SUBJECT"));
		model.addObject("categoryid",categoryid);
		model.addObject("type",type);
		model.addObject("maincategoryname",maincategoryname);
		model.addObject("topmenu",buildForumMenu(request)); // build forum menu
		
		return model;
	}
	@RequestMapping("/getForumMenu")
	protected ModelAndView getForumMenu(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		initStaticData(request);
		ModelAndView model = new ModelAndView("forumMenu");
		model.addObject("forumcount",questionAnswerDAO.getForumCount("1")); // get Today Count
		model.addObject("topmenu",buildForumMenu(request)); // build forum menu
		return model;
	}
	protected ArrayList<Map<String,String>> buildForumMenu(HttpServletRequest request){
		
		ArrayList<Map<String,String>> forumMenu = new ArrayList<Map<String,String>>();
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		String type = request.getParameter("type") != null && request.getParameter("type").trim().length() > 0 ? request.getParameter("type") : "-1";
		String categoryid = request.getParameter("categoryid") != null && request.getParameter("categoryid").trim().length() > 0 ? request.getParameter("categoryid") : "-1";
		
		String maincategoryname = request.getParameter("maincategoryname") != null && request.getParameter("maincategoryname").trim().length() > 0 ? request.getParameter("maincategoryname") : "-1";
		String maincategoryuri = request.getParameter("maincategoryuri") != null && request.getParameter("maincategoryuri").trim().length() > 0 ? request.getParameter("maincategoryuri") : "-1";
		String lastitemname = request.getAttribute("lastitemname") != null ? "" + request.getAttribute("lastitemname") : "-1";
		String id = request.getParameter("id") != null && request.getParameter("id").trim().length() > 0 ? request.getParameter("id") : "-1";
		boolean entityexist = false;
		
		
		if(!"-1".equalsIgnoreCase(id)){
			entityexist = true;
			if("0".equalsIgnoreCase(id))
				lastitemname=applicationContext.getMessage("label.askquestion", null, Locale.SIMPLIFIED_CHINESE);
		}else{
			entityexist = false;
			
		}
		HashMap<String,String> topmenu = new HashMap<String,String>();
		if(entityexist){
			topmenu.put("LAST", lastitemname);
			topmenu.put("ENTITYEXIST", "true");
		}
		topmenu.put("URI","home");
		topmenu.put("NAME",applicationContext.getMessage("label.home", null, Locale.SIMPLIFIED_CHINESE)) ;
		
		forumMenu.add(topmenu);
		topmenu = new HashMap<String,String>(); 
	
		topmenu.put("URI","getForumMenu");
		topmenu.put("NAME",applicationContext.getMessage("label.forum", null, Locale.SIMPLIFIED_CHINESE)) ;
		forumMenu.add(topmenu);
		
		if(!"-1".equalsIgnoreCase(maincategoryname) && !"-1".equalsIgnoreCase(maincategoryuri) ){
			topmenu = new HashMap<String,String>(); 
			topmenu.put("URI",maincategoryuri);
			topmenu.put("URI","javascript:" + maincategoryuri + "('-1','" + categoryid +"','" + type +"','" + maincategoryname +"','" + maincategoryuri + "')");
			topmenu.put("NAME",applicationContext.getMessage(maincategoryname, null, Locale.SIMPLIFIED_CHINESE)) ;
			topmenu.put("SCRIPT","true") ;
			forumMenu.add(topmenu);
		}
		if(!entityexist){
			theLogger.debug("Not found ");
			forumMenu.get(0).put("LAST", forumMenu.get(forumMenu.size()-1).get("NAME"));
			forumMenu.remove(forumMenu.size()-1);
			
		}
		forumMenu.get(0).put("type", type);
		forumMenu.get(0).put("categoryid", categoryid);
		forumMenu.get(0).put("maincategoryname", maincategoryname);
		forumMenu.get(0).put("maincategoryuri", maincategoryuri);
		
		return forumMenu;
	}
}
