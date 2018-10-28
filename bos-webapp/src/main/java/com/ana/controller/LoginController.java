package com.ana.controller;

import com.ana.util.MailUtil;
import nl.captcha.Captcha;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;


@Controller(value="loginController")
public class LoginController extends BaseController {

    private final Logger theLogger = LoggerFactory.getLogger(AccountController.class);
    @Autowired
	protected EventController eventController;
	@Autowired
	protected MailUtil mailUtil;
	
	public void setEventController(EventController eventController) {
		this.eventController = eventController;
	}
	
	public void setMailUtil(MailUtil mailUtil) {
		this.mailUtil = mailUtil;
	}
	
	@RequestMapping("/home")
	protected ModelAndView getHomeDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(true);
		Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");
		String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");
		String userid = "-1";
		try {
			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1";
		}catch (Exception ex){
			//ex.printStackTrace();
		}
		String period = request.getParameter("period") != null ? request.getParameter("period") : (session.getAttribute("period") != null ? "" + session.getAttribute("period") :  "7");
		session.setAttribute("period", period);
		
		ModelAndView model = new ModelAndView("home");	
		//model.addObject("newsList",entityDAO.getNewsList(entityid,userid) );
		//model.addObject("topKindergartenList",entityDAO.getTopEntity("0"));
		//model.addObject("topPrimaryList",entityDAO.getTopEntity("1"));
		//model.addObject("topSecondaryList",entityDAO.getTopEntity("2"));
		//model.addObject("topUserList",userDAO.getTopUserList(8));
		//model.addObject("topUserList",entityDAO.getTopParentEntityList(8));
		
		
		model.addObject("period",period);
		initStaticData(request);
		
		request.setAttribute("year", "0");
        request.setAttribute("sortby", "home");

        model.addAllObjects(eventController.getEventFullCalendar(request,response).getModel());
		model.addObject("data","month");
		
		if(request.getAttribute(STATUSBOX) != null)
			model.addObject(STATUSBOX,request.getAttribute(STATUSBOX));
		
		theLogger.debug("getHomeDetail session.getAttribute(user) ? " + (session.getAttribute("user") == null) );

		
		String dataonly = "y";
		String view = "all";
		HashMap<String,String> searchParam = new HashMap<String,String>();
		searchParam.put("approved", "'y'");
		searchParam.put("view", view);
        searchParam.put("limit", "10");

        model.addObject("view", view);
		model.addObject("caseSharingList",caseDAO.getCaseSharingList(searchParam));
		model.addObject("dataonly",dataonly);
		model.addObject("mode","main");

		return model;
	}
	@RequestMapping("/getLatestNewsTextList")
	protected ModelAndView getLatestNewsTextList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView model = new ModelAndView("latestNewsText");	
		String type = request.getParameter("type") != null ? request.getParameter("type") : "-1";
		HashMap<String,String> searchParam = new HashMap<String,String>();
		searchParam.put("latest", "latest");
		searchParam.put("categoryid", type);
		searchParam.put("userlike", "y");
		
		model.addObject("categoryid",type);
		model.addObject("latestnews",questionAnswerDAO.getQAList(searchParam));
		
		return model;
	}
	@RequestMapping("/getEntityMainList")
	protected ModelAndView getEntityMainList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try{
			
			
			StringBuffer entityids = new StringBuffer();
			ModelAndView model = new ModelAndView("entity/entityMainList");	
			String type = request.getParameter("type") != null ? request.getParameter("type") : "f";
            HttpSession session = request.getSession(true);
            String period = request.getParameter("period") != null ? request.getParameter("period") : session.getAttribute("period") != null ? "" + session.getAttribute("period") :  "7";
			session.setAttribute("period",period);

			
			Map user = (Map) session.getAttribute("user");
			String userid = "";
			String roleid="";
			userid = user != null && user.get("ID") != null &&  (Integer) user.get("ID") > 0  ? ((Integer) user.get("ID")).toString()  : "";
			roleid=  user != null && user.get("ROLEID") != null  ? ((Integer) user.get("ROLEID")).toString()  : "";

			List<Map<String, Object>> entitylist = null;
			if("f".equalsIgnoreCase(type))
				entitylist=entityDAO.getUserEntityList("","-1",userid,"favorite", roleid);
			else
				entitylist = entityDAO.getTopEntity(type,period);
			
			for(int i=0; i<entitylist.size(); i++){
				entityids.append((Integer) entitylist.get(i).get("entityid") + ",");
			}
			
			String entityidstostring= entityids != null && entityids.length() > 0  ? entityids.toString() : "";
			if(entityidstostring.endsWith(",") )
				entityidstostring = entityidstostring.substring(0, entityidstostring.lastIndexOf(","));
			request.setAttribute("entityids",entityidstostring);
			
			model.addObject("entitylist",entitylist);
			
			
			model.addObject("favoriteCount",entityDAO.getUserFavoriteCount(entityidstostring));
			model.addObject("parentCommentCount",entityDAO.getParentCommentCount(entityidstostring));
			return model;
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}
	@RequestMapping("/loginForm")
	protected ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView model = new ModelAndView("signUp");	
		initStaticData(request);
		String loginType = request.getParameter("loginType") != null ? request.getParameter("loginType") : "login";
        String isnew = request.getParameter("isnew") != null ? request.getParameter("isnew") : "false";
        model.addObject("tutorCategoryList",entityDAO.getLookup("tutor.category"));
		model.addObject("districtlist",entityDAO.getLookup("district.kindergarten"));
		model.addObject("loginType",loginType);
        model.addObject("isnew",isnew);
		return model;
	}
	@RequestMapping("/login")
	protected ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HttpSession session = request.getSession(true);
		Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
	    request.setCharacterEncoding("UTF-8"); // Do this so we can capture non-Latin chars
	    String answer = request.getParameter("answer") != null ? request.getParameter("answer")  : "-1" ;
	    String action = request.getParameter("action") != null ? request.getParameter("action")  : "-1" ;
		 
        
		Map<String,String> paramMap = extractParam(request);
		String usercomment = request.getParameter("usercommenttext") != null && request.getParameter("usercommenttext").trim().length() > 0 ? request.getParameter("usercommenttext") : "-1";
		paramMap.put("usercomment",usercomment);
		try{
			paramMap.put("metric1half", "" + Integer.parseInt(paramMap.get("metric1")) / 2 );
			paramMap.put("metric2half","" + Integer.parseInt(paramMap.get("metric2")) / 2);
			paramMap.put("metric3half","" + Integer.parseInt(paramMap.get("metric3")) / 2);
			paramMap.put("metric4half","" + Integer.parseInt(paramMap.get("metric4")) / 2);
		}catch(Exception ex){
			
		}
		
		// Prevent robot create new account 
		if("new".equalsIgnoreCase(action) && captcha == null){
			theLogger.debug("robot :" + paramMap.get("ip"));
			return null;
		
		}
		// Prevent robot update account 
		if("update".equalsIgnoreCase(action) && "-1".equalsIgnoreCase(paramMap.get("userid"))){
			theLogger.debug("robot :" + paramMap.get("ip"));
			return null;
		}
		// THis is probably human input error
		if("new".equalsIgnoreCase(action) && captcha != null && !captcha.isCorrect(answer)){
			ModelAndView model = loginForm(request,response);
			model.addObject("loginType", "0".equalsIgnoreCase(paramMap.get("roleid")) ? "signup" : "signuptutor" );
			model.addObject("param", paramMap);
			model.addObject("chainedSchoolCategory", request.getParameter("category"));
			model.addObject("selectedSchool", paramMap.get("entityid"));
			model.addObject("parentSchoolCategory", request.getParameter("parentcategory"));
			model.addObject("reverseSelectedSchool", paramMap.get("parententityid"));
			
			ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
			request.setAttribute(STATUSBOX, applicationContext.getMessage("error.captcha",new Object[] {},Locale.SIMPLIFIED_CHINESE) );
			
			return model;
		}else{
			
			
			Map<String,Object> user = userDAO.getUserInfo(paramMap); 
			
			if(user.get("errorstatus") == null ){
				userDAO.updateCounterByEmail("logincount", paramMap.get("email"));
				
				ArrayList<Map<String, String>> favorite = new ArrayList <Map<String, String>> ();
				String favoriteid = (String) session.getAttribute("viewedentityid");
				System.out.print("viewedentityid favorite id " + session.getAttribute("viewedentityid"));
				HashMap <String, String> map = null;
				if("new".equalsIgnoreCase((String) paramMap.get("action")) ){
					
					theLogger.debug("=========================================");
					theLogger.debug("New account created:");
					theLogger.debug(paramMap.toString());
					theLogger.debug("All param displayed end:");
					theLogger.debug("=========================================");
					
					if(favoriteid != null && favoriteid.trim().length() > 0){
						StringTokenizer st = new StringTokenizer(favoriteid,",");
						
						while (st.hasMoreTokens()) {
							map = new HashMap <String, String> ();
							map.put("favoriteid",st.nextToken());
							System.out.print("favorite  id " + map.get("favoriteid"));
							map.put("userid",((Integer) user.get("id")).toString());
							map.put("action","like");
							favorite.add(map);
						}
						
						entityDAO.saveFavorite(favorite);
					}
					map = new HashMap <String, String> ();
					map.put("favoriteid", ""  + user.get("kidentityid") );
					map.put("userid",((Integer) user.get("id")).toString());
					map.put("action","like");
					favorite.add(map);
					theLogger.debug("favorite " + favorite);
					questionAnswerDAO.saveChatChannelUser(favorite);
					
				}
				int favoritecount = 0;
				session.setAttribute("user",user);
				favoritecount = entityDAO.getFavoriteCount( ((Integer) user.get("id")).toString() );
				session.setAttribute("favoritecount",favoritecount);
				if("new".equalsIgnoreCase((String) paramMap.get("action")) && "0".equalsIgnoreCase(paramMap.get("roleid"))){
					saveComment(request,response);
				}
				theLogger.info("login controller session.getAttribute(user) " + session.getAttribute("user") );
				return getHomeDetail(request,response);
			}else{
				theLogger.debug("login controller session.getAttribute(user) " + (session.getAttribute("user") == null) );
			
				if(user.get("errorstatus") != null &&  ((String) user.get("errorstatus")).contains("password")) {
					ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
					request.setAttribute(STATUSBOX, applicationContext.getMessage("error.wrongpassword",new Object[] {},Locale.SIMPLIFIED_CHINESE));
					request.setAttribute("loginType","login");
					ModelAndView model = loginForm(request,response);
					return model;
				}else{
				
				ModelAndView model = loginForm(request,response);
				model.addObject("loginType", "2".equalsIgnoreCase(paramMap.get("roleid")) ? "signuptutor" : "signup" );
				model.addObject("param", paramMap);
				model.addObject("parentSchoolCategory", request.getParameter("parentcategory"));
				model.addObject("reverseSelectedSchool", paramMap.get("parententityid"));
				model.addObject("chainedSchoolCategory", request.getParameter("category"));
				model.addObject("selectedSchool", paramMap.get("entityid"));
				ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
				request.setAttribute(STATUSBOX, applicationContext.getMessage("error.sameemail",new Object[] {},Locale.SIMPLIFIED_CHINESE));
				
				return model;
				}
			}
				
		}
	}
	@RequestMapping("/resetPassword")
	protected ModelAndView resetPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String email = request.getParameter("email") != null ? request.getParameter("email") : "-1";
		String error = userDAO.resetPassword(email); 
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		String subject = applicationContext.getMessage("passwordreset.subject", new Object[] {}, Locale.SIMPLIFIED_CHINESE);
		String text = applicationContext.getMessage("passwordreset.text", new Object[] {email,"123456"}, Locale.SIMPLIFIED_CHINESE);
		if("n".equalsIgnoreCase(error))
		mailUtil.sendMail(email,subject,text);
		request.setAttribute(STATUSBOX, applicationContext.getMessage( "n".equalsIgnoreCase(error) ? "passwordreset.done" : "passwordreset.fail" , new Object[] {}, Locale.SIMPLIFIED_CHINESE) );
		return getHomeDetail(request,response);
	}
	@RequestMapping("/logout")
	protected ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {

		theLogger.debug("Logout now ..... ");
		ModelAndView model = new ModelAndView("home");	
		HttpSession session = request.getSession(true);
		try{
			session.removeAttribute("user");
			session.removeAttribute("favoritecount");
			session.removeAttribute("autoEventPopUp");
			session.removeAttribute("autoPollingPopUp");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		theLogger.debug("Logout Done !  ");
		session.invalidate();
		model.addObject("dataonly","y");
		return model;
	}
	
	@RequestMapping(value="/sociallogin/{socialid}/{socialtype}/{name}/{email:.*}/{randomnumber}", method = RequestMethod.POST)
	protected ResponseEntity<String>  sociallogin(@PathVariable("socialid") String socialid, @PathVariable("socialtype") String socialtype, @PathVariable("name") String name,@PathVariable("email") String email, @PathVariable("randomnumber") String randomnumber, HttpServletRequest request) throws Exception {

		
		theLogger.debug("logincontroller.socialid " + socialid + " /socialtype: " + socialtype + " /name: " + name + " /email: " + email + " /randomnumber: " + randomnumber);
		userDAO.updateCounterByEmail("logincount", email);
		
		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("socialid",socialid);
		paramMap.put("socialtype",socialtype);
		paramMap.put("namesocial", name);
		paramMap.put("namelocal", name);
		paramMap.put("email", email);
		paramMap.put("anonymous", "n");
		paramMap.put("roleid", "0");
		paramMap.put("selfdesc", "n/a");
		
		Map<String,Object> user = userDAO.getUserInfo(paramMap); 
		int favoritecount = 0;
		try{
			if(user.get("errorstatus") == null ){
			HttpSession session = request.getSession(true);
			session.setAttribute("user",user);
			favoritecount = entityDAO.getFavoriteCount( ((Integer) user.get("id")).toString() );
			session.setAttribute("favoritecount",favoritecount);
			theLogger.debug("social Login session saved " + ((Map)session.getAttribute("user")).get("userid") +  "=" + ((Map)session.getAttribute("user")).get("namelocal")  +  "=" +  ((Map)session.getAttribute("user")).get("email")  );
			}
		}catch(Exception ex){
			ex.printStackTrace();
			if(user != null ){
				theLogger.debug("social Login session problem");
				HttpSession session = request.getSession(true);
				session.setAttribute("user",user);
				favoritecount = entityDAO.getFavoriteCount( ((Integer) user.get("id")).toString() );
				session.setAttribute("favoritecount",favoritecount);
			}
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");

	    return new ResponseEntity<String>("login succeed", responseHeaders, HttpStatus.CREATED);
		
	}
	@RequestMapping(value="/sociallogout/{randomnumber}", method = RequestMethod.POST)
	protected ResponseEntity<String> sociallogout(@PathVariable("randomnumber") String randomnumber, HttpServletRequest request) throws Exception {
		theLogger.debug("Calling social logout ... ");
		HttpSession session = request.getSession(true);
		session.removeAttribute("user");
		session.removeAttribute("favoritecount");
		session.invalidate();
		theLogger.debug("Done social logout!!! ");
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");

	    return new ResponseEntity<String>("logout succeed", responseHeaders, HttpStatus.CREATED);

	}
	protected void saveComment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		Map<String,String> paramMap = extractCommentParam(request);
		String usercomment = request.getParameter("usercommenttext") != null ? request.getParameter("usercommenttext") : "-1";
		Map<String,Object> entity = entityDAO.getEntityDetails( paramMap.get("entityid"),"-1","-1","single");
		String schoolname = ""  + entity.get("name");
		String categoryid = ""  + entity.get("categoryid");
		
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
        String anonymous = applicationContext.getMessage("label.anonymous",new Object[] {},Locale.SIMPLIFIED_CHINESE).trim();
		String commentsubject = applicationContext.getMessage("label.parentratedsubject",new Object[] { "y".equalsIgnoreCase((String) user.get("anonymous")) || user == null ? anonymous : user.get("namelocal") },Locale.SIMPLIFIED_CHINESE).trim();
		paramMap.put("subject", commentsubject);
		
		String parentrating = applicationContext.getMessage("label.parentrating",new Object[] {},Locale.SIMPLIFIED_CHINESE).trim();
		
		Map<String,Object> parentScore = new HashMap<String,Object>();
		parentScore.put("single","y");
		parentScore.put("name", ""  );
		try{
			parentScore.put("metric1", new BigDecimal (Integer.parseInt(paramMap.get("metric1")))  );
			parentScore.put("metric2", new BigDecimal (Integer.parseInt(paramMap.get("metric2")))  );
			parentScore.put("metric3", new BigDecimal (Integer.parseInt(paramMap.get("metric3")))  );
			parentScore.put("metric4", new BigDecimal (Integer.parseInt(paramMap.get("metric4")))  );
		}catch(Exception ex){
			parentScore.put("metric1", new BigDecimal (Integer.parseInt("0"))  );
			paramMap.put("metric1", "0");
			parentScore.put("metric2", new BigDecimal (Integer.parseInt("0"))  );
			paramMap.put("metric2", "0");
			parentScore.put("metric3", new BigDecimal (Integer.parseInt("0"))  );
			paramMap.put("metric3", "0");
			parentScore.put("metric4", new BigDecimal (Integer.parseInt("0"))  );
			paramMap.put("metric4", "0");
		}

		paramMap.put("userlike","2");
		paramMap.put("comment",  usercomment );
			
		//Auto create parent in question and answer section.
		HashMap<String,String> parentcomment = new HashMap<String,String>();
		parentcomment.put("subject", parentrating + " : " +  schoolname);
		parentcomment.put("active", "y");
		parentcomment.put("question", paramMap.get("subject")); //as subject pls help ...
		parentcomment.put("answer", usercomment);
		parentcomment.put("signleentityid",  paramMap.get("entityid"));
		parentcomment.put("tag1", parentrating  );
		parentcomment.put("userid", paramMap.get("userid"));
		parentcomment.put("userlike", paramMap.get("userlike"));
		parentcomment.put("ipaddr", paramMap.get("ip"));
		parentcomment.put("categoryid", categoryid );
		try{
			if( Integer.parseInt(paramMap.get("userlike")) > 1 && Integer.parseInt(paramMap.get("metric1")) > 0 && Integer.parseInt(paramMap.get("metric2")) > 0 &&  Integer.parseInt(paramMap.get("metric3")) > 0 &&  Integer.parseInt(paramMap.get("metric4")) > 0  ){
				String key = questionAnswerDAO.saveQuestionWithAnswer(parentcomment);
				entityDAO.getEntityHitCount(key,"forum");
			}
		}catch(Exception ex){}
		
		entityDAO.saveComment(paramMap);
		// Update current session userscore / parentratingcount 
		if( ! "-1".equalsIgnoreCase(paramMap.get("grade")) ){
			
			try{
				if(user != null){
					user.put("userscore",  (((Integer) user.get("userscore")).intValue() + 1) );
					user.put("parentratingcount", (((Integer) user.get("parentratingcount")).intValue() + 1) );
					session.setAttribute("user",user);
					// update in EnityDAO savecomment directly
					//userDAO.updateCounter("parentratingcount", "" + user.get("id"));
				}
			}catch(Exception ex){
				theLogger.debug("Update current session userscore / parentratingcount ");
				ex.printStackTrace();
			}
		}	
		
	}
	
}
