package com.ana.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller(value="tutorController")
public class TutorController extends BaseController {

    private final Logger theLogger = LoggerFactory.getLogger(TutorController.class);

    @RequestMapping("/getCourseList")
	protected ModelAndView getCourseList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		String userid = user != null && user.get("ID") != null &&  (Integer) user.get("ID") > 0  ? ((Integer) user.get("ID")).toString()  : "2";
		
		initStaticData(request);
		HashMap<String,String> searchParam = new HashMap<String,String>();
		String hourlyrate = request.getParameter("hourlyrate") != null && request.getParameter("hourlyrate").trim().length() > 0 ? request.getParameter("hourlyrate") : "-1";
		String tutorcategoryid = request.getParameter("tutorcategoryid") != null  && request.getParameter("tutorcategoryid").trim().length() > 0 ? request.getParameter("tutorcategoryid") : "-1";
		
		String lookuptutorialclassid = request.getParameter("lookuptutorialclassid") != null  && request.getParameter("lookuptutorialclassid").trim().length() > 0 ? request.getParameter("lookuptutorialclassid") : "-1";
		String lookupmusicclassid = request.getParameter("lookupmusicclassid") != null && request.getParameter("lookupmusicclassid").trim().length() > 0 ? request.getParameter("lookupmusicclassid") : "-1";
		String lookupextraclassid = request.getParameter("lookupextraclassid") != null && request.getParameter("lookupextraclassid").trim().length() > 0 ? request.getParameter("lookupextraclassid") : "-1";
		String lookuporalclassid = request.getParameter("lookuporalclassid") != null && request.getParameter("lookuporalclassid").trim().length() > 0 ? request.getParameter("lookuporalclassid") : "-1";
		String lookupsportclassid = request.getParameter("lookupsportclassid") != null  && request.getParameter("lookupsportclassid").trim().length() > 0 ? request.getParameter("lookupsportclassid") : "-1";
		String sex = request.getParameter("sex") != null  && request.getParameter("sex").trim().length() > 0 ? request.getParameter("sex") : "-1";
		String districtlookupid = request.getParameter("districtlookupid") != null  && request.getParameter("districtlookupid").trim().length() > 0 ? request.getParameter("districtlookupid") : "-1";
		String kidgradelookupid = request.getParameter("kidgradelookupid") != null  && request.getParameter("kidgradelookupid").trim().length() > 0 ? request.getParameter("kidgradelookupid") : "-1";
		
		
		String tutortab = request.getParameter("tutortab") != null ? request.getParameter("tutortab") : "0";
		String keywords = request.getParameter("keywords") != null  && request.getParameter("keywords").trim().length() > 0 ? request.getParameter("keywords") : "\u88DC\u7FD2";
		String newsearch = request.getParameter("newsearch") != null  && request.getParameter("newsearch").trim().length() > 0 ? request.getParameter("newsearch") : "-1";
		
		
		ModelAndView model = new ModelAndView("course/courseList");	
		model.addObject("tutorCategoryList",entityDAO.getLookup("tutor.category"));
		
		searchParam.put("hourlyrate",hourlyrate);
		searchParam.put("tutorcategoryid",tutorcategoryid);
		searchParam.put("lookuptutorialclassid",lookuptutorialclassid);
		searchParam.put("lookupmusicclassid",lookupmusicclassid);
		searchParam.put("lookupextraclassid",lookupextraclassid);
		searchParam.put("lookuporalclassid",lookuporalclassid);
		searchParam.put("lookupsportclassid",lookupsportclassid);
		searchParam.put("sex",sex);
		searchParam.put("districtlookupid",districtlookupid);
		searchParam.put("kidgradelookupid",kidgradelookupid);
		searchParam.put("useridforapply",userid);
		
		
		model.addObject("courseList",tutorDAO.getCourseList(searchParam));
		model.addObject("tutorialclasslist",entityDAO.getLookup("tutorial.class"));
		model.addObject("musicclasslist",entityDAO.getLookup("music.class"));
		model.addObject("sportclasslist",entityDAO.getLookup("sport.class"));
		model.addObject("extraclasslist",entityDAO.getLookup("extra.class"));
		model.addObject("oralclasslist",entityDAO.getLookup("oral.class"));
		
		model.addObject("kidgradelist",entityDAO.getLookup("kid.grade"));
		model.addObject("musicrangelist",entityDAO.getLookup("class.range.music"));
		
		
		model.addObject("districtlist",entityDAO.getLookup("district.kindergarten"));
		
		model.addObject("tutortab",tutortab);
		model.addObject("keywords",keywords);
		
		if("y".equalsIgnoreCase(newsearch)){
			session.removeAttribute("courseSearch");
		}
		HashMap<String,String> resultParam = new HashMap<String,String>();
		Iterator iterator=searchParam.entrySet().iterator();
        while(iterator.hasNext()){
           Map.Entry mapEntry=(Map.Entry)iterator.next();
           if(!"-1".equalsIgnoreCase(((String) mapEntry.getValue())))
        	   resultParam.put( "" + mapEntry.getKey(), "" + mapEntry.getValue());
        }
        theLogger.debug("session courseSearch: " + resultParam);
        session.setAttribute("courseSearch",resultParam);
		
		return model;
	}
	@RequestMapping("/getTutorConsole")
	protected ModelAndView getTutorConsole(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HashMap<String,String> searchParam = new HashMap<String,String>();
		initStaticData(request);
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		String userid = user != null && user.get("ID") != null &&  (Integer) user.get("ID") > 0  ? ((Integer) user.get("ID")).toString()  : "0";
		
		String tutortab = request.getParameter("tutortab") != null ? request.getParameter("tutortab") : "0";
		
		ModelAndView model = new ModelAndView("course/tutorConsole");	
		model.addObject("tutortab",tutortab);
		searchParam.put("userid",userid);
		searchParam.put("useridforapply",userid);
		
		model.addObject("tutorCategoryList",tutorDAO.getTutorRegisteredClass(searchParam));
		model.addObject("courseList",tutorDAO.getCourseList(searchParam));
		model.addObject("appliedUserCountList",tutorDAO.getAppliedUserCountList(searchParam));
		
		
		return model;
	}
	@RequestMapping("/getCourseForm")
	protected ModelAndView getCourseForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HashMap<String,String> searchParam = new HashMap<String,String>();
		String coursedetails = request.getAttribute("coursedetails") != null  && ((String) request.getAttribute("coursedetails")).trim().length() > 0 ? "" + request.getAttribute("coursedetails") : "-1";
		
		String tutorcategoryid = request.getParameter("tutorcategoryid") != null  && request.getParameter("tutorcategoryid").trim().length() > 0 ? request.getParameter("tutorcategoryid") : "-1";
		String id = request.getParameter("id") != null  && request.getParameter("id").trim().length() > 0 ? request.getParameter("id") : "-1";
		String courseform = "";
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;
		ModelAndView model = new ModelAndView(courseform);	
		
		if("0".equalsIgnoreCase(tutorcategoryid) ){
			courseform = "tutorCourseForm";
			model.addAllObjects(getTutorCourseForm(request,response).getModel());
		}else if("1".equalsIgnoreCase(tutorcategoryid) ){
			courseform = "musicCourseForm";
			model.addAllObjects(getMusicCourseForm(request,response).getModel());
		}else if("2".equalsIgnoreCase(tutorcategoryid) ){
			courseform = "oralCourseForm";
			model.addAllObjects(getOralCourseForm(request,response).getModel());
		}else if("3".equalsIgnoreCase(tutorcategoryid) ){
			courseform = "extraCourseForm";
			model.addAllObjects(getExtraCourseForm(request,response).getModel());
		}else{
			courseform = "sportCourseForm";
			model.addAllObjects(getSportCourseForm(request,response).getModel());
		}
		
		searchParam.put("id",id);
		searchParam.put("useridforapply",userid);
		// prevent fliter course list for view course details.
		if(!"y".equalsIgnoreCase(coursedetails)){
			searchParam.put("userid",userid);
		}
		try{
			model.addObject("courseform",tutorDAO.getCourseList(searchParam).get(0));
		}catch(Exception ex){
			ex.printStackTrace();
		}
		model.addObject("tutorcategoryid",tutorcategoryid);
		model.setViewName("course/" + courseform);
		
		return model;
	}
	@RequestMapping("/getTutorCourseForm")
	protected ModelAndView getTutorCourseForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		ModelAndView model = new ModelAndView("course/tutorCourseForm");	
		String coursetype = request.getParameter("coursetype") != null ? request.getParameter("coursetype") : "1";
		try{
			model.addObject("coursetype", ((HashMap) entityDAO.getLookup("tutor.category").get(Integer.parseInt(coursetype)) ).get("description"));
		}catch(Exception ex){
			ex.printStackTrace();
			model.addObject("coursetype", "Error");
			
		}
		model.addObject("tutorialclasslist",entityDAO.getLookup("tutorial.class"));
		model.addObject("tutorialclassrangelist",entityDAO.getLookup("class.range.tutorial"));
		model.addObject("tutorcategoryid",coursetype);
	
		return model;
	}
	@RequestMapping("/getRequestTutorForm")
	protected ModelAndView getRequestTutorForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		
		ModelAndView model = new ModelAndView("course/requestTutorForm");	
		
		HashMap<String,String> parentRequestParam = new HashMap<String,String>();
		Map user = (Map) session.getAttribute("user");
		String userid = user != null && user.get("ID") != null &&  (Integer) user.get("ID") > 0  ? ((Integer) user.get("ID")).toString()  : "2";
		String tutortab = request.getParameter("tutortab") != null ? request.getParameter("tutortab") : "0";
		String id = request.getParameter("id") != null ? request.getParameter("id") : "-1";
		
		String coursetype = request.getParameter("coursetype") != null ? request.getParameter("coursetype") : "1";
		try{
			model.addObject("coursetype", ((HashMap) entityDAO.getLookup("tutor.category").get(Integer.parseInt(coursetype)) ).get("description"));
		}catch(Exception ex){
			ex.printStackTrace();
			model.addObject("coursetype", "Error");
			
		}
		
		model.addObject("reqtutorCategoryList",entityDAO.getLookup("tutor.category"));
		model.addObject("reqtutorialclasslist",entityDAO.getLookup("tutorial.class"));
		model.addObject("reqmusicclasslist",entityDAO.getLookup("music.class"));
		model.addObject("reqsportclasslist",entityDAO.getLookup("sport.class"));
		model.addObject("reqextraclasslist",entityDAO.getLookup("extra.class"));
		model.addObject("reqoralclasslist",entityDAO.getLookup("oral.class"));
		
		model.addObject("reqkidgradelist",entityDAO.getLookup("kid.grade"));
		model.addObject("reqdistrictlist",entityDAO.getLookup("district.kindergarten"));
		model.addObject("tutortab",tutortab);
		model.addObject("id",id);
		
		
		model.addObject("tutorcategoryid",coursetype);
		parentRequestParam.put("userid",userid);
		parentRequestParam.put("id", id);
		
		Map<String,Object> parentRequestMap = new HashMap<String,Object>();
		if(!"-1".equalsIgnoreCase(id)){
			parentRequestMap = tutorDAO.getParentTutorSearch(parentRequestParam).get(0);
		}
		String tmpclass[] =  {"tutorial","music", "extra", "oral", "sport"};
		int tmpclassindex = 0;
		try{
			tmpclassindex = Integer.parseInt( "" + parentRequestMap.get("tutorcategoryid"));
		}catch(Exception ex){
			//ex.printStackTrace();
		}
		
		parentRequestMap.put( "lookup" + tmpclass[tmpclassindex]  + "classid" , "" + parentRequestMap.get("lookupclassid")  );
		
		
     	session.setAttribute("courseSearch",parentRequestMap);
		
		return model;
	}
	@RequestMapping("/getMusicCourseForm")
	protected ModelAndView getMusicCourseForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		ModelAndView model = new ModelAndView("course/musicCourseForm");	
		String coursetype = request.getParameter("coursetype") != null ? request.getParameter("coursetype") : "1";
		try{
			model.addObject("coursetype", ((HashMap) entityDAO.getLookup("tutor.category").get(Integer.parseInt(coursetype)) ).get("description"));
		}catch(Exception ex){
			ex.printStackTrace();
			model.addObject("coursetype", "Error");
			
		}
		model.addObject("musicclasslist",entityDAO.getLookup("music.class"));
		model.addObject("tutorialclassrangelist",entityDAO.getLookup("class.range.tutorial"));
		model.addObject("musicclassrangelist",entityDAO.getLookup("class.range.music"));
		model.addObject("tutorcategoryid",coursetype);
		return model;
	}
	@RequestMapping("/getOralCourseForm")
	protected ModelAndView getOralCourseForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		ModelAndView model = new ModelAndView("course/oralCourseForm");	
		String coursetype = request.getParameter("coursetype") != null ? request.getParameter("coursetype") : "1";
		try{
			model.addObject("coursetype", ((HashMap) entityDAO.getLookup("tutor.category").get(Integer.parseInt(coursetype)) ).get("description"));
		}catch(Exception ex){
			ex.printStackTrace();
			model.addObject("coursetype", "Error");
			
		}
		model.addObject("oralclasslist",entityDAO.getLookup("oral.class"));
		model.addObject("tutorialclassrangelist",entityDAO.getLookup("class.range.tutorial"));
		model.addObject("musicclassrangelist",entityDAO.getLookup("class.range.music"));
		model.addObject("tutorcategoryid",coursetype);
		return model;
	}
	
	@RequestMapping("/getExtraCourseForm")
	protected ModelAndView getExtraCourseForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		ModelAndView model = new ModelAndView("course/extraCourseForm");	
		String coursetype = request.getParameter("coursetype") != null ? request.getParameter("coursetype") : "1";
		try{
			model.addObject("coursetype", ((HashMap) entityDAO.getLookup("tutor.category").get(Integer.parseInt(coursetype)) ).get("description"));
		}catch(Exception ex){
			ex.printStackTrace();
			model.addObject("coursetype", "Error");
			
		}
		model.addObject("extraclasslist",entityDAO.getLookup("extra.class"));
		model.addObject("tutorialclassrangelist",entityDAO.getLookup("class.range.tutorial"));
		model.addObject("musicclassrangelist",entityDAO.getLookup("class.range.music"));
		model.addObject("tutorcategoryid",coursetype);
		return model;
	}
	
	@RequestMapping("/getSportCourseForm")
	protected ModelAndView getSportCourseForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		ModelAndView model = new ModelAndView("course/sportCourseForm");	
		String coursetype = request.getParameter("coursetype") != null ? request.getParameter("coursetype") : "1";
		try{
			model.addObject("coursetype", ((HashMap) entityDAO.getLookup("tutor.category").get(Integer.parseInt(coursetype)) ).get("description"));
		}catch(Exception ex){
			ex.printStackTrace();
			model.addObject("coursetype", "Error");
			
		}
		model.addObject("sportclasslist",entityDAO.getLookup("sport.class"));
		model.addObject("tutorialclassrangelist",entityDAO.getLookup("class.range.tutorial"));
		model.addObject("musicclassrangelist",entityDAO.getLookup("class.range.music"));
		model.addObject("tutorcategoryid",coursetype);
		return model;
	}
	
	@RequestMapping("/saveCourseForm")
	protected ModelAndView saveCourseForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView model = new ModelAndView("course/tutorConsole");	
		HttpSession session = request.getSession(true);
		HashMap<String,String> courseParam = new HashMap<String,String>();
		Map user = (Map) session.getAttribute("user");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;
		String notes = request.getParameter("notes") != null ? request.getParameter("notes") : "-1";
		String coursetype = request.getParameter("coursetype") != null ? request.getParameter("coursetype") : "-1";
		
		String id = request.getParameter("id") != null && request.getParameter("id").trim().length() > 0 ? request.getParameter("id") : "-1";
		String coursedesc = request.getParameter("coursedesc") != null ? request.getParameter("coursedesc") : "-1";
		String courseimg = request.getParameter("courseimg") != null ? request.getParameter("courseimg") : "-1";
		String tutorcategoryid = request.getParameter("tutorcategoryid") != null ? request.getParameter("tutorcategoryid") : "-1";
		String remark = request.getParameter("remark") != null ? request.getParameter("remark") : "-1";

		String lookupclassid = request.getParameter("lookupclassid") != null ? request.getParameter("lookupclassid") : "-1";
		String range = "";
		if("m1".equalsIgnoreCase(lookupclassid)){
			range= "music";
		}else{
			range= "tutorial";
		}
		String lookupclassrangestartid = request.getParameter("lookup" + range + "classrangestartid") != null ? request.getParameter("lookup" + range + "classrangestartid") : "-1";
		String lookupclassrangeendid = request.getParameter("lookup" + range + "classrangeendid") != null ? request.getParameter("lookup" + range + "classrangeendid") : "-1";
		String lookupclassrangetype = request.getParameter("lookupclassrangetype") != null ? request.getParameter("lookupclassrangetype") : "kid.grade";
		
		String hourlyrate = request.getParameter("hourlyrate") != null ? request.getParameter("hourlyrate") : "-1";
		
		
		courseParam.put("id",id);
		courseParam.put("coursedesc",coursedesc);
		courseParam.put("courseimg",courseimg);
		courseParam.put("userid",userid);
		
		courseParam.put("tutorcategoryid",tutorcategoryid);
		courseParam.put("hourlyrate",hourlyrate);
		courseParam.put("notes",notes);
		courseParam.put("coursetype",coursetype);
		courseParam.put("remark",remark);
		
		courseParam.put("lookupclassid",lookupclassid);
		courseParam.put("lookupclassrangestartid",lookupclassrangestartid);
		courseParam.put("lookupclassrangeendid",lookupclassrangeendid);
		courseParam.put("lookupclassrangetype",lookupclassrangetype);
		
		
		if(!"-1".equalsIgnoreCase(userid))		
			tutorDAO.saveTutorCourse(courseParam);
		
		model.addObject("tutorCategoryList",entityDAO.getLookup("tutor.category"));
		HashMap<String,String> searchParam = new HashMap<String,String>();
		
		searchParam.put("userid",userid);
		searchParam.put("useridforapply",userid);
		model.addObject("courseList",tutorDAO.getCourseList(searchParam));
		
		return model;
	}
	@RequestMapping("/saveRequestTutor")
	protected ModelAndView saveRequestTutor(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(true);
		HashMap<String,String> parentRequestParam = new HashMap<String,String>();
		Map user = (Map) session.getAttribute("user");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;
		String specialrequest = request.getParameter("specialrequest") != null ? request.getParameter("specialrequest") : "-1";
		String sex = request.getParameter("reqsex") != null ? request.getParameter("reqsex") : "-1";
		
		String id = request.getParameter("id") != null ? request.getParameter("id") : "-1";
		String tutorcategoryid = request.getParameter("reqtutorcategoryid") != null ? request.getParameter("reqtutorcategoryid") : "-1";
		String lookupclassid = "-1";
		String hourlyrate = request.getParameter("reqhourlyrate") != null ? request.getParameter("reqhourlyrate") : "-1";
		String kidgradelookupid = request.getParameter("reqkidgradelookupid") != null ? request.getParameter("reqkidgradelookupid") : "-1";
		String districtlookupid = request.getParameter("reqdistrictlookupid") != null ? request.getParameter("reqdistrictlookupid") : "-1";
		
		String lookuptutorialclassid = request.getParameter("reqlookuptutorialclassid") != null  && request.getParameter("reqlookuptutorialclassid").trim().length() > 0 ? request.getParameter("reqlookuptutorialclassid") : "-1";
		String lookupmusicclassid = request.getParameter("reqlookupmusicclassid") != null && request.getParameter("reqlookupmusicclassid").trim().length() > 0 ? request.getParameter("reqlookupmusicclassid") : "-1";
		String lookupextraclassid = request.getParameter("reqlookupextraclassid") != null && request.getParameter("reqlookupextraclassid").trim().length() > 0 ? request.getParameter("reqlookupextraclassid") : "-1";
		String lookuporalclassid = request.getParameter("reqlookuporalclassid") != null && request.getParameter("reqlookuporalclassid").trim().length() > 0 ? request.getParameter("reqlookuporalclassid") : "-1";
		String lookupsportclassid = request.getParameter("reqlookupsportclassid") != null  && request.getParameter("reqlookupsportclassid").trim().length() > 0 ? request.getParameter("reqlookupsportclassid") : "-1";
		
		if ("0".equalsIgnoreCase(tutorcategoryid) && !"-1".equalsIgnoreCase(lookuptutorialclassid))
			lookupclassid = lookuptutorialclassid;
		else if ("1".equalsIgnoreCase(tutorcategoryid) && !"-1".equalsIgnoreCase(lookupmusicclassid))
			lookupclassid = lookupmusicclassid;
		else if ("2".equalsIgnoreCase(tutorcategoryid) && !"-1".equalsIgnoreCase(lookupextraclassid))
			lookupclassid = lookupextraclassid;
		else if ("3".equalsIgnoreCase(tutorcategoryid) && !"-1".equalsIgnoreCase(lookuporalclassid))
			lookupclassid = lookuporalclassid;
		else if ("4".equalsIgnoreCase(tutorcategoryid) &&  !"-1".equalsIgnoreCase(lookupsportclassid))
			lookupclassid = lookupsportclassid;
		
		theLogger.debug("tutorcategoryid / lookupclassid" + tutorcategoryid + "/" + lookuptutorialclassid + lookupmusicclassid + lookupextraclassid + lookuporalclassid + lookupsportclassid );
		
		parentRequestParam.put("id",id.trim());
		parentRequestParam.put("specialrequest",specialrequest);
		parentRequestParam.put("sex",sex);
		parentRequestParam.put("kidgradelookupid",kidgradelookupid);
		parentRequestParam.put("districtlookupid",districtlookupid);
		
		parentRequestParam.put("userid",userid);
		parentRequestParam.put("tutorcategoryid",tutorcategoryid);
		parentRequestParam.put("hourlyrate",hourlyrate);
		parentRequestParam.put("lookupclassid",lookupclassid);
		
		theLogger.debug("saving saveParentTutorSearch " + parentRequestParam);	
		if(!"-1".equalsIgnoreCase(userid))		
			tutorDAO.saveParentTutorSearch(parentRequestParam);
		
		ModelAndView model = new ModelAndView("course/parentTutorConsole");	
		String tutortab = request.getParameter("tutortab") != null ? request.getParameter("tutortab") : "1";
		parentRequestParam.put("id","-1");
		model.addObject("parentTutorList",tutorDAO.getParentTutorSearch(parentRequestParam));
		model.addObject("tutortab",tutortab);
		
		HashMap<String,String> searchParam = new HashMap<String,String>();
		searchParam.put("applied","y");
		searchParam.put("userid",userid);
		searchParam.put("useridforapply",userid);
		
		model.addObject("appliedcourselist",tutorDAO.getCourseList(searchParam));
		
		return model;
	}
	@RequestMapping("/getParentTutorConsole")
	protected ModelAndView getParentTutorList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(true);
		HashMap<String,String> parentRequestParam = new HashMap<String,String>();
		Map user = (Map) session.getAttribute("user");
		String userid = user != null && user.get("ID") != null &&  (Integer) user.get("ID") > 0  ? ((Integer) user.get("ID")).toString()  : "2";
		String tutortab = request.getParameter("tutortab") != null ? request.getParameter("tutortab") : "0";
		parentRequestParam.put("useridtutor",userid);
		
		ModelAndView model = new ModelAndView("course/parentTutorConsole");	

		model.addObject("parentTutorList",tutorDAO.getParentTutorSearch(parentRequestParam));
		model.addObject("tutortab",tutortab);
		HashMap<String,String> searchParam = new HashMap<String,String>();
		searchParam.put("applied","y");
		searchParam.put("userid",userid);
		searchParam.put("useridforapply",userid);
		
		
		model.addObject("appliedcourselist",tutorDAO.getCourseList(searchParam));
		
		return model;
	}
	@RequestMapping("/getMatchedCourseConsole")
	protected ModelAndView getMatchedCourseConsole(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(true);
		HashMap<String,String> parentRequestParam = new HashMap<String,String>();
		Map user = (Map) session.getAttribute("user");
		String userid = user != null && user.get("ID") != null &&  (Integer) user.get("ID") > 0  ? ((Integer) user.get("ID")).toString()  : "2";
		String tutortab = request.getParameter("tutortab") != null ? request.getParameter("tutortab") : "0";
		parentRequestParam.put("userid",userid);
		
		ModelAndView model = new ModelAndView("course/matchedCourseConsole");	
		model.addObject("matchedcourselist",tutorDAO.getMatchedCourseList(parentRequestParam));
		model.addObject("tutortab",tutortab);
		
		return model;
	}
	@RequestMapping("/getAppliedUserList")
	protected ModelAndView getAppliedUserList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(true);
		HashMap<String,String> appliedParam = new HashMap<String,String>();
		Map user = (Map) session.getAttribute("user");
		String userid = user != null && user.get("ID") != null &&  (Integer) user.get("ID") > 0  ? ((Integer) user.get("ID")).toString()  : "2";
		String tutortab = request.getParameter("tutortab") != null ? request.getParameter("tutortab") : "0";
		String courseid = request.getParameter("courseid") != null ? request.getParameter("courseid") : "-1";
		
		appliedParam.put("userid",userid);
		appliedParam.put("courseid",courseid);
		
		ModelAndView model = new ModelAndView("course/appliedUserList");	
		model.addObject("applieduserlist",tutorDAO.getAppliedUserList(appliedParam));
		model.addObject("courseid",courseid);
		
		model.addObject("tutortab",tutortab);
		
		return model;
	}
	@RequestMapping("/getCourseDetails")
	protected ModelAndView getCourseDetails(HttpServletRequest request, HttpServletResponse response) throws Exception {
		initStaticData(request);
		String tutoruserid = request.getParameter("tutoruserid") != null ? request.getParameter("tutoruserid") : "-1";
		String id = request.getParameter("id") != null  && request.getParameter("id").trim().length() > 0 ? request.getParameter("id") : "-1";
		
		request.setAttribute("coursedetails", "y");
		ModelAndView model = new ModelAndView("course/courseDetails");	
		model.addAllObjects(getCourseForm(request,response).getModel());
		model.addObject("tutor",userDAO.getUserTutorCategoryMap(tutoruserid));
		model.addObject("hitcount",entityDAO.getEntityHitCount(id,"course"));
		model.setViewName("course/courseDetails");
		return model;
	}
	
}
