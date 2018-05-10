package com.ana.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller(value="accountController")
public class AccountController extends BaseController {

    private final Logger theLogger = LoggerFactory.getLogger(AccountController.class);

	@RequestMapping("/getMyForumContentList")
	protected ModelAndView getMyForumContentList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());

		HttpSession session = request.getSession(true);
		HashMap<String,Object> user = (HashMap<String,Object>) session.	getAttribute("user");
		initStaticData(request);
		
		String userid = request.getParameter("userid") != null && request.getParameter("userid").trim().length() > 0 ? request.getParameter("userid") : "-1";
		
		String tab = request.getParameter("tab") != null && request.getParameter("tab").trim().length() > 0 ? request.getParameter("tab") : "favoritetab";
		
		ModelAndView model = new ModelAndView("forumContentList");
		
		model.addObject("mypost","y");
		model.addObject("requestuserid",!"-1".equalsIgnoreCase(userid) ? userid : ( user != null && user.get("id") != null ?  ""  +user.get("id") : "-1"));
		
		model.addObject("school",loadProfileSummary(request,response));
		model.addObject("tab",tab);
		
		return model;
	}
	@RequestMapping("/getMessageDetails")
	protected ModelAndView getMessageDetails(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HttpSession session = request.getSession(true);
		HashMap<String,Object> user = (HashMap<String,Object>) session.	getAttribute("user");
		String userid = user != null && user.get("ID") != null &&  (Integer) user.get("ID") > 0  ? ((Integer) user.get("ID")).toString()  : "2";
		String tab = request.getParameter("tab") != null && request.getParameter("tab").trim().length() > 0 ? request.getParameter("tab") : "favoritetab";
		
		
		ModelAndView model = new ModelAndView("account/myMessageDetails");	
		String id = request.getParameter("id") != null && request.getParameter("id").trim().length() > 0 ? request.getParameter("id") : "-1";
		String type = request.getParameter("type") != null && request.getParameter("type").trim().length() > 0 ? request.getParameter("type") : "-1";
		HashMap<String,String> searchParam = new HashMap<String,String>();
		initStaticData(request);
		
		
		model.addObject("entity",entityDAO.getEntityDetails(id,"-1","","single"));
		List <Map<String,Object>> userlist = questionAnswerDAO.getReceiveUserID(id);
		if(userlist.size() > 0){
			model.addObject("user",userDAO.viewProfile( userid.equalsIgnoreCase( "" + userlist.get(0).get("createdby")) ? "" + userlist.get(0).get("receivedby") : "" + userlist.get(0).get("createdby")  ));
		}
		
		// Generate comment module	
		HashMap<String,String> qaMap = new HashMap<String,String>();
		qaMap.put("userid",userid);
		qaMap.put("entityid",id);
		qaMap.put("type", type); //  t / e-entity / c-course / case-case
		String questionanswerid = ""  + questionAnswerDAO.getQAParentID(qaMap);
		model.addObject("questionanswerid",questionanswerid);
		searchParam = new HashMap<String,String>();
		searchParam.put("id", questionanswerid);
		searchParam.put("style", "facebook");
		
		List<Map<String, Object>> qalist = questionAnswerDAO.getQAListByID(searchParam);
		
		
		List<Map<String,Object>> result = questionAnswerDAO.getUnreadTimestamp(userid, id);
	    Date lastread = null;
	    if(result != null && result.size() > 0){
	    	lastread = (Date) result.get(0).get("lastread");
	    	//theLogger.debug("lastread "  + result.get(0).get("lastread"));
	    }
			   
		questionAnswerDAO.updateInbox(id,userid,"read");
		
		model.addObject("chatmsg",getChatMsg(qalist,request,lastread));
		model.addObject("chatmsgcount","" + qalist.size());
		model.addObject("type",type);
		model.addObject("style","facebook");
		model.addObject("entityid",id);
		model.addObject("textareawidth","360"); //px
		model.addObject("textareaheight","1.6"); //em
		model.addObject("refreshdisabled","y");
		model.addObject("school",loadProfileSummary(request,response));
		//model.addObject("touchtablename","casesharing");
		//model.addObject("touchtableid",id);
		// ENd of Generate comment module	
		
		model.addObject("tab",tab);
		return model;
	}
	@RequestMapping("/getMessageUserList")
	protected ModelAndView getMessageUserList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		initStaticData(request);
		HttpSession session = request.getSession(true);
		
		Map user = (Map) session.getAttribute("user");
		String userid = user != null && user.get("ID") != null &&  (Integer) user.get("ID") > 0  ? ((Integer) user.get("ID")).toString()  : "2";
		String mode = request.getParameter("mode") != null && request.getParameter("mode").trim().length() > 0 ? request.getParameter("mode") : "-1";
		String tab = request.getParameter("tab") != null && request.getParameter("tab").trim().length() > 0 ? request.getParameter("tab") : "favoritetab";
		
		StringBuffer entityids = new StringBuffer();
		StringBuffer privateEntityids = new StringBuffer();
		List<Map<String, Object>> favoritelist = entityDAO.getUserEntityList("","-1",userid,"favorite","");
		Map<String,Object> summary = loadProfileSummary(request,response);
		favoritelist.add(0, summary);
		
		for(int i=0; i<favoritelist.size(); i++){
			if(favoritelist.get(i) != null && favoritelist.get(i).get("entityid") != null )
			entityids.append((Integer) favoritelist.get(i).get("entityid") + ",");
		}
		String entityidstostring= entityids != null && entityids.length() > 0  ? entityids.toString() : "";
		if(entityidstostring.endsWith(",") )
			entityidstostring = entityidstostring.substring(0, entityidstostring.lastIndexOf(","));
		
		List<Map<String, Object>> privatelist = questionAnswerDAO.getPrivateMessageUserList(userid);
		for (int i=0; i<privatelist.size(); i++ ){
			if(privatelist.get(i) != null && privatelist.get(i).get("entityid") != null )
				privateEntityids.append((Integer) privatelist.get(i).get("entityid") + ",");
		}
		String privateentityidstostring= privateEntityids != null && privateEntityids.length() > 0  ? privateEntityids.toString() : "";
		if(privateentityidstostring.endsWith(",") )
			privateentityidstostring = privateentityidstostring.substring(0, privateentityidstostring.lastIndexOf(","));
		
		ModelAndView model = new ModelAndView("account/myMessageList");	
		model.addObject("myFavoriteSchoolList",favoritelist );
		
		model.addObject("favoriteCount",userDAO.getParentPerGroup(entityidstostring));
		model.addObject("lastmessage",questionAnswerDAO.getLastMessagePerGroup(entityidstostring,"e"));
		model.addObject("lastprivatemessage",questionAnswerDAO.getLastMessagePerGroup(privateentityidstostring,"private"));
		
		model.addObject("school",summary);
		model.addObject("privateList",privatelist);
		model.addObject("mode",mode);
		model.addObject("tab",tab);
		
		
		
		return model;
	}
	@RequestMapping("/accountInfo")
	protected ModelAndView saveAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		initStaticData(request);
		String tab = request.getParameter("tab") != null && request.getParameter("tab").trim().length() > 0 ? request.getParameter("tab") : "favoritetab";

		HttpSession session = request.getSession(true);
		Map<String,String> paramMap = extractParam(request);
		ModelAndView accountConsoleModel = new ModelAndView("account/myFavoritesConsole");
		ModelAndView accountInfoModel = new ModelAndView("account/accountInfo");
		HashMap<String,Object> user = (HashMap<String,Object>) session.	getAttribute("user");
		
		theLogger.debug("Account Console Action " + paramMap.get("action"));
		if("update".equalsIgnoreCase(paramMap.get("action")) && user != null){
		 	user =( HashMap<String,Object>)  userDAO.getUserInfo(paramMap); 
		 	String filename = session.getAttribute("userprofile") != null ? "" + session.getAttribute("userprofile") : "";
		 	if(filename !=null && filename.trim().length() > 0){
		 		userDAO.updateUserProfile(filename,"" + user.get("id"));
		 		user.put("userprofile",filename);
		 	}
		    session.setAttribute("user",user);
		    accountConsoleModel.addObject("school",loadProfileSummary(request,response));
		    accountConsoleModel.addObject("tab",tab);
		    
			return accountConsoleModel;
		}else{
			try{
				accountInfoModel.addObject("selectedSchool",user.get("kidentityid") );
				accountInfoModel.addObject("reverseSelectedSchool",user.get("parententityid") );
				accountInfoModel.addObject("parentSchoolCategory",  entityDAO.getCategoryEntity("" + user.get("parententityid")) );
				accountInfoModel.addObject("chainedSchoolCategory", entityDAO.getCategoryEntity("" + user.get("kidentityid")) );
				accountInfoModel.addObject("tutorCategoryList",entityDAO.getLookup("tutor.category"));
				accountInfoModel.addObject("districtlist",entityDAO.getLookup("district.kindergarten"));
				accountInfoModel.addObject("school",loadProfileSummary(request,response));
				accountInfoModel.addObject("tab",tab);

			}catch(Exception ex){
				ex.printStackTrace();
			}
			return accountInfoModel;
		}
	}
	private Map<String,Object> loadProfileSummary(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		String userid = user != null && user.get("ID") != null &&  (Integer) user.get("ID") > 0  ? ((Integer) user.get("ID")).toString()  : "2";
		String id= (user !=null  && user.get("kidentityid")  != null ) ? ""  + user.get("kidentityid") : "-1";
			
		return  entityDAO.getEntityDetails(id,"-1",userid,"single");
		
	}
	
	@RequestMapping("/viewProfile")
	protected ModelAndView viewProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		theLogger.debug("viewProfile");
		initStaticData(request);
		String userid = request.getParameter("userid") != null && request.getParameter("userid").trim().length() > 0 ? request.getParameter("userid") : "-1";
		ModelAndView model = new ModelAndView("account/viewProfile");
		model.addObject("user",userDAO.viewProfile(userid));
		
		return model;
	}
}
