package com.ana.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller(value="caseController")
public class CaseController extends BaseController {
	final static String barwidth="230";
    private final Logger theLogger = LoggerFactory.getLogger(CaseController.class);

    @RequestMapping("/getCaseSharingList")
	protected ModelAndView getCaseSharingList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;
		
		String dataonly = request.getParameter("dataonly") != null  && request.getParameter("dataonly").trim().length() > 0 ? request.getParameter("dataonly") : "-1";
		String view = request.getParameter("view") != null  && request.getParameter("view").trim().length() > 0 ? request.getParameter("view") : "all";
		
		initStaticData(request);
		ModelAndView model = new ModelAndView("caseSharingList");	
		
		HashMap<String,String> searchParam = new HashMap<String,String>();
		if("mycasesharing".equalsIgnoreCase(view)){
			// prevent load all user case for mycasesharing view 
			searchParam.put("userid", "-1".equalsIgnoreCase(userid) ? "0" : userid );
			searchParam.put("approved", "-1");
		}
		if("all".equalsIgnoreCase(view) || "mostviewed".equalsIgnoreCase(view) || "mosthelpful".equalsIgnoreCase(view)){
			searchParam.put("approved", "'y'");
		}
		if("waitingapproval".equalsIgnoreCase(view)){
			searchParam.put("approved", "'w','a'");
		}
		if("rejected".equalsIgnoreCase(view)){
			searchParam.put("approved", "'r'");
		}
		if("viewprofile".equalsIgnoreCase(view)){
			// prevent load all user case for mycasesharing view 
			userid = request.getParameter("userid") != null  && request.getParameter("userid").trim().length() > 0 ? request.getParameter("userid") : "-1";
			searchParam.put("userid", "-1".equalsIgnoreCase(userid) ? "0" : userid );
		}
		
		searchParam.put("view", view);
		model.addObject("view", view);	
		
		model.addObject("caseSharingList",caseDAO.getCaseSharingList(searchParam));
		model.addObject("dataonly",dataonly);
		model.addObject("topmenu",buildCaseSharingMenu(request)); // build forum menu
		model.addObject("topUserList",caseDAO.getTopCaseSharingList(5));
		model.addObject("barwidth",barwidth);
		model.addObject("bartype","case");
		
		
		return model;
	}
	@RequestMapping("/getCaseSharingDetails")
	protected ModelAndView getCaseDetails(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		initStaticData(request);
		String id = request.getParameter("id") != null  && request.getParameter("id").trim().length() > 0 ? request.getParameter("id") : "-1";
		String mode = request.getParameter("mode") != null  && request.getParameter("mode").trim().length() > 0 ? request.getParameter("mode") : "-1";
		
		if("add".equalsIgnoreCase(mode))
			id="0";
		
		HashMap<String,String> searchParam = new HashMap<String,String>();
		ModelAndView model = new ModelAndView("caseSharingDetails");	
		searchParam.put("id", id);
		List<Map<String, Object>> caselist = caseDAO.getCaseSharingList(searchParam);
		
		if(!caselist.isEmpty())
			model.addObject("casedetails",  caselist.get(0) );
		
		// Only increase counter for approved case
		if(!caselist.isEmpty() && "y".equalsIgnoreCase("" + caselist.get(0).get("approved")) )
			model.addObject("hitcount",entityDAO.getEntityHitCount(id,"case",getIPaddress(request)));
		
		model.addObject("userimage",serviceDAO.getUserImageList(id) );
		try{
			model.addObject("categoryid",entityDAO.getCategoryEntity( ""  + caselist.get(0).get("targetentityid") ));
		}catch (Exception ex){
			model.addObject("categoryid","1");
		}
		
		
		
		 List<Map<String, Object>> casesharingentitylist = caseDAO.getCaseSharingEntityList(searchParam);
		    
		    String offerentityids="";
		    String offerentitynames="";
		    String entityids="";
		    String entitynames="";
		    
		    for(int i=0; i< casesharingentitylist.size(); i++){
		    	Map<String, Object> caseMap = casesharingentitylist.get(i);
		    	if("y".equalsIgnoreCase("" + caseMap.get("offer"))){
		    		offerentityids = offerentityids + (offerentityids.trim().length() < 1 ? "" : "," ) + caseMap.get("entityid");
		    		offerentitynames = offerentitynames + (offerentitynames.trim().length() < 1 ? "" : "," ) + caseMap.get("appliedentity");
		    	}else{
		    		entityids = entityids + (entityids.trim().length() < 1 ? "" : "," ) + caseMap.get("entityid");
		    		entitynames = entitynames + (entitynames.trim().length() < 1 ? "" : "," ) + caseMap.get("appliedentity");
		    	}
		    }
			
		    model.addObject("appliedschoolofferids",offerentityids);
		    model.addObject("appliedschooloffernames",offerentitynames);
			model.addObject("appliedschoolids",entityids);
			model.addObject("appliedschoolnames",entitynames);
			model.addObject("topUserList",caseDAO.getTopCaseSharingList(8));
			model.addObject("barwidth",barwidth);
			model.addObject("bartype","case");
	
		// Generate comment module	
		HashMap<String,String> qaMap = new HashMap<String,String>();
		qaMap.put("entityid",id);
		qaMap.put("type", "case"); //  t / e-entity / c-course / case-case
		String questionanswerid = ""  + questionAnswerDAO.getQAParentID(qaMap);
		model.addObject("questionanswerid",questionanswerid);
		searchParam = new HashMap<String,String>();
	    searchParam.put("id", questionanswerid);
	    searchParam.put("style", "facebook");
		
	    List<Map<String, Object>> qalist = questionAnswerDAO.getQAListByID(searchParam);
	    
	   
	    
	    model.addObject("chatmsg",getChatMsg(qalist,request,new Date()));
	    model.addObject("chatmsgcount","" + qalist.size());
		model.addObject("type","case");
		model.addObject("style","facebook");
		model.addObject("entityid",id);
		model.addObject("textareawidth","540"); //px
		model.addObject("textareaheight","1.6"); //em
		model.addObject("refreshdisabled","y");
		model.addObject("touchtablename","casesharing");
		model.addObject("touchtableid",id);
		// ENd of Generate comment module	
		
		if(!caselist.isEmpty())
			request.setAttribute("lastitemname", caselist.get(0).get("title"));
		else
			request.setAttribute("lastitemname", applicationContext.getMessage("label.newcase", null, Locale.SIMPLIFIED_CHINESE) );
			
		model.addObject("topmenu",buildCaseSharingMenu(request)); // build forum menu
		
		Calendar cal = Calendar.getInstance(); 
		model.addObject("eventsMap",caseDAO.getTopCaseSharingList(3, "" + (cal.get(Calendar.MONTH)) ));
		
		return model;
	}
	@RequestMapping("/getCaseSharingEntityList")
	protected ModelAndView getCaseSharingEntityList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		theLogger.debug("getCaseSharingEntityList");
		initStaticData(request);
		HashMap<String,String> searchParam = new HashMap<String,String>();
		String id = request.getParameter("id") != null  && request.getParameter("id").trim().length() > 0 ? request.getParameter("id") : "-1";
		searchParam.put("id", id);
		ModelAndView model = new ModelAndView("caseSharingEntityList");	
		
		model.addObject("casesharingentitylist",caseDAO.getCaseSharingEntityList(searchParam));
		model.addObject("topUserList",caseDAO.getTopCaseSharingList(8));
		return model;
	}
	
	@RequestMapping("/editCaseSharingDetails")
	protected ModelAndView editCase(HttpServletRequest request, HttpServletResponse response) throws Exception {
		theLogger.debug("editCaseSharingDetails");
		
		ModelAndView model = new ModelAndView("caseSharingDetailsEdit");	
		
		model.addAllObjects(getCaseDetails(request,response).getModel());
		model.addObject("topUserList",caseDAO.getTopCaseSharingList(8));
		model.addObject("barwidth",barwidth);
		model.addObject("bartype","case");
		
		return model;
	}
	@RequestMapping("/approveCase")
	protected ModelAndView approveCase(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HashMap<String,String> approveCaseMap = new HashMap<String,String>();
		
		String id = request.getParameter("id") != null  && request.getParameter("id").trim().length() > 0 ? request.getParameter("id") : "-1";
		String approved = request.getParameter("approved") != null  && request.getParameter("approved").trim().length() > 0 ? request.getParameter("approved") : "-1";
		
		approveCaseMap.put("id", id);
		approveCaseMap.put("approved", approved);
		caseDAO.approveCase(approveCaseMap);
		
		if("r".equalsIgnoreCase(approved)){
			approveCaseMap.put("publish", "n");
			caseDAO.publishCase(approveCaseMap);
		}
		ModelAndView model = new ModelAndView("caseSharingList");	
		model.addAllObjects(getCaseSharingList(request,response).getModel());
		
		return model;
	}
	@RequestMapping("/saveCase")
	protected ModelAndView saveCase(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		theLogger.debug("Save case now");
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;
		if(! "-1".equalsIgnoreCase(userid)){
			theLogger.debug("userid not -1");
			
			try{
				String id = request.getParameter("id") != null  && request.getParameter("id").trim().length() > 0 ? request.getParameter("id") : "-1";
				String currententity = request.getParameter("currententity") != null  && request.getParameter("currententity").trim().length() > 0 ? request.getParameter("currententity") : "-1";
				String firstchoice = request.getParameter("firstchoice") != null  && request.getParameter("firstchoice").trim().length() > 0 ? request.getParameter("firstchoice") : "-1";
				String finalentity = request.getParameter("finalentity") != null  && request.getParameter("finalentity").trim().length() > 0 ? request.getParameter("finalentity") : "-1";
				
				
				String title = request.getParameter("title") != null  && request.getParameter("title").trim().length() > 0 ? request.getParameter("title") : "";
				String analysis = request.getParameter("analysis") != null  && request.getParameter("analysis").trim().length() > 0 ? request.getParameter("analysis") : "";
				String applicationyear = request.getParameter("applicationyear") != null  && request.getParameter("applicationyear").trim().length() > 0 ? request.getParameter("applicationyear") : "-1";
				String applicationresult = request.getParameter("applicationresult") != null  && request.getParameter("applicationresult").trim().length() > 0 ? request.getParameter("applicationresult") : "";
				String sex = request.getParameter("sex") != null  && request.getParameter("sex").trim().length() > 0 ? request.getParameter("sex") : "-1";
				String age = request.getParameter("age") != null  && request.getParameter("age").trim().length() > 0 ? request.getParameter("age") : "-1";
				String monthofbirth = request.getParameter("monthofbirth") != null  && request.getParameter("monthofbirth").trim().length() > 0 ? request.getParameter("monthofbirth") : "-1";
				String bigsmallkid = request.getParameter("bigsmallkid") != null  && request.getParameter("bigsmallkid").trim().length() > 0 ? request.getParameter("bigsmallkid") : "-1";
				String content = request.getParameter("content") != null  && request.getParameter("content").trim().length() > 0 ? request.getParameter("content") : "";
				String characterkid = request.getParameter("characterkid") != null  && request.getParameter("characterkid").trim().length() > 0 ? request.getParameter("characterkid") : "";
				String publish = request.getParameter("publish") != null  && request.getParameter("publish").trim().length() > 0 ? request.getParameter("publish") : "n";
				
				String appliedschooloffer = request.getParameter("appliedschooloffer") != null  && request.getParameter("appliedschooloffer").trim().length() > 0 ? request.getParameter("appliedschooloffer") : "-1";
				String appliedschool = request.getParameter("appliedschool") != null  && request.getParameter("appliedschool").trim().length() > 0 ? request.getParameter("appliedschool") : "-1";
				String payeename = request.getParameter("payeename") != null  && request.getParameter("payeename").trim().length() > 0 ? request.getParameter("payeename") : "";
				String approved = request.getParameter("approved") != null  && request.getParameter("approved").trim().length() > 0 ? request.getParameter("approved") : "-1";
				
				
				
				//userid,title,applicationyear,monthofbirth,characterkid,bigsmallkid,currententityid,finalentityid,age,sex,content,analysis,targetentityid,applicationresult,publish,lastmodified,created) 
		
				HashMap<String,String> caseMap = new HashMap<String,String>();
				caseMap.put("id", id);
				caseMap.put("currententityid", currententity);
				caseMap.put("targetentityid", firstchoice);
				caseMap.put("finalentityid", finalentity);
				
				caseMap.put("title", title);
				caseMap.put("analysis", analysis);
				caseMap.put("applicationyear", applicationyear);
				caseMap.put("applicationresult", applicationresult);
				caseMap.put("sex", sex);
				caseMap.put("age", age);
				caseMap.put("monthofbirth", monthofbirth);
				caseMap.put("bigsmallkid", bigsmallkid);
				caseMap.put("content", content);
				caseMap.put("userid", userid);
				caseMap.put("characterkid", characterkid);
				caseMap.put("publish", publish);
				caseMap.put("payeename", payeename);
				caseMap.put("approved", "y".equalsIgnoreCase(publish) ? approved : "0"); // this is for initial create new one and publish at the same time
				
				caseMap.put("appliedschooloffer", appliedschooloffer);
				caseMap.put("appliedschool", appliedschool);
                caseMap.put("type", "case");

                String filename1 = session.getAttribute("casesharing1") != null ? "" + session.getAttribute("casesharing1") : "-1";
				String filename2 = session.getAttribute("casesharing2") != null ? "" + session.getAttribute("casesharing2") : "-1";
				String filename3 = session.getAttribute("casesharing3") != null ? "" + session.getAttribute("casesharing3") : "-1";
				String imgdesc1 = request.getParameter("imgdesc1") != null  && request.getParameter("imgdesc1").trim().length() > 0 ? request.getParameter("imgdesc1") : " ";
				String imgdesc2 = request.getParameter("imgdesc2") != null  && request.getParameter("imgdesc2").trim().length() > 0 ? request.getParameter("imgdesc2") : " ";
				String imgdesc3 = request.getParameter("imgdesc3") != null  && request.getParameter("imgdesc3").trim().length() > 0 ? request.getParameter("imgdesc3") : " ";
				
				
				theLogger.debug("caseMap " + caseMap);
				String caseid = caseDAO.saveCase(caseMap);
				
				HashMap<String,String> userImageMap = new HashMap<String,String>();
				userImageMap.put("referenceid", caseid);
				userImageMap.put("imagetype", "casesharing");
				userImageMap.put("filename", filename1);
				userImageMap.put("sortorder", "1");
				userImageMap.put("description", imgdesc1);
				if(!"-1".equalsIgnoreCase(filename1))
					serviceDAO.saveUserImage(userImageMap);
				userImageMap.put("filename", filename2);
				userImageMap.put("sortorder", "2");
				userImageMap.put("description", imgdesc2);
				if(!"-1".equalsIgnoreCase(filename2))
					serviceDAO.saveUserImage(userImageMap);
				userImageMap.put("filename", filename3);
				userImageMap.put("sortorder", "3");
				userImageMap.put("description", imgdesc3);
				if(!"-1".equalsIgnoreCase(filename3))
					serviceDAO.saveUserImage(userImageMap);
				
				if("y".equalsIgnoreCase(publish)){   // this case for update existing case to publish and approve to a
					HashMap<String,String> approveCaseMap = new HashMap<String,String>();
					approveCaseMap.put("id", id);
					approveCaseMap.put("approved", "a");
					caseDAO.approveCase(approveCaseMap);
					userDAO.updateCounter("casesharingcount", userid);
				}
			}catch(Exception ex){
				theLogger.debug("save Case Error");
				ex.printStackTrace();
			}
		}
		ModelAndView model = new ModelAndView("caseSharingList");	
		
		model.addAllObjects(getCaseSharingList(request,response).getModel());
		
		return model;
	}
	//@RequestMapping(value="/touchTableRecordAJAX/{touchtableid}/{touchtablename}", method=RequestMethod.POST)
	protected ResponseEntity<String> touchTableRecordAJAX(@PathVariable("touchtableid") String touchtableid, @PathVariable("touchtablename") String touchtablename, HttpServletRequest request) throws Exception {
		try{
			
			//caseDAO.touchRecord(touchtableid, touchtablename);
			HttpHeaders responseHeaders = new HttpHeaders();
		    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			return new ResponseEntity<String>("Done", responseHeaders, HttpStatus.CREATED);


		}catch (Exception ex){
			ex.printStackTrace();
			HttpHeaders responseHeaders = new HttpHeaders();
		    responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		    return new ResponseEntity<String>(ex.toString(), responseHeaders, HttpStatus.CREATED);
		}
	}
	protected ArrayList<Map<String,String>> buildCaseSharingMenu(HttpServletRequest request){
		
		ArrayList<Map<String,String>> caseMenu = new ArrayList<Map<String,String>>();
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		String lastitemname = request.getAttribute("lastitemname") != null ? "" + request.getAttribute("lastitemname") : "-1";
		boolean entityexist = false;
		
		if(!"-1".equalsIgnoreCase(lastitemname)){
			entityexist = true;
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
		
		caseMenu.add(topmenu);
		topmenu = new HashMap<String,String>(); 
	
		topmenu.put("URI","getCaseSharingList");
		topmenu.put("NAME",applicationContext.getMessage("label.casesharing", null, Locale.SIMPLIFIED_CHINESE)) ;
		caseMenu.add(topmenu);
		
		
		if(!entityexist){
			theLogger.debug("Not found ");
			caseMenu.get(0).put("LAST", caseMenu.get(caseMenu.size()-1).get("NAME"));
			caseMenu.remove(caseMenu.size()-1);
			
		}
		
		return caseMenu;
	}
	@RequestMapping("/voteHelpfulCase/{id}")
	protected @ResponseBody String voteHelpfulCase(@PathVariable String id, HttpServletRequest request) throws Exception {
		
		int helpfulcount = caseDAO.voteHelpfulCase(id);
		return "" + helpfulcount;
	}
	

}
