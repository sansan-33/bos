package com.ana.controller;

import net.sf.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller(value="entityController")
public class EntityController extends BaseController {

    private final Logger theLogger = LoggerFactory.getLogger(EntityController.class);
    static Map<String,List<Map<String, Object>>> baseEntityMetaDataList = new HashMap<String,List<Map<String, Object>>>();
	static HashMap<String,String> baseMetricCategory = new HashMap<String,String>();
	private final static String blockmessage = "http://";
	// ================ Favorite ============================
	
	@RequestMapping("/reminderConsole")
	protected ModelAndView getReminder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView model = new ModelAndView("reminder");
		HttpSession session = request.getSession(true);
		Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");
		String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		; 					String categoryid = request.getAttribute("categoryid") != null ? (String)  request.getAttribute("categoryid") :  (request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "-1");
		String grade = request.getParameter("grade") != null ? request.getParameter("grade") : "-1";
		
		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("userid", userid);
		paramMap.put("entityid", entityid);
		
		theLogger.debug("Rating .... " + grade);
		model.addObject("reminder",entityDAO.getReminder(paramMap));
		model.addObject("categoryid",categoryid);

		return model;
	}
	@RequestMapping("/saveReminder")
	protected ModelAndView saveReminder(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");
		String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		; 					String grade = request.getParameter("grade") != null ? request.getParameter("grade") : "-1";
		String status = request.getParameter("status") != null ? request.getParameter("status") : "-1";
		String application = request.getParameter("application") != null ? request.getParameter("application") : "-1";
		String announcement = request.getParameter("announcement") != null ? request.getParameter("announcement") : "-1";
		String interview = request.getParameter("interview") != null ? request.getParameter("interview") : "-1";

		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("userid", userid);
		paramMap.put("entityid", entityid);
		paramMap.put("grade", grade);
		paramMap.put("status", status);

		theLogger.debug("Rating .... " + grade);
		final String OLD_FORMAT = "MM/dd/yy";
		final String NEW_FORMAT = "yyyy-MM-dd";
		String[] datestring = {"application","interview","announcement"};
		SimpleDateFormat sdf ;
		Date d;
		for(int i=0; i< datestring.length; i++){
			try{
				sdf = new SimpleDateFormat(OLD_FORMAT);
				d = sdf.parse(paramMap.get(datestring[i]));
				sdf.applyPattern(NEW_FORMAT);
				paramMap.put(datestring[i], sdf.format(d));
			}catch(Exception ex){
				paramMap.put(datestring[i], "");
			}
		}

		entityDAO.saveReminder(paramMap);
		request.setAttribute("action", "favorite");
		return getMyFavoriteList(request,response);
	}
	// ===================== Favorite ==============================

	// ================ School Allocation ============================

		@RequestMapping("/getSchoolAllocation")
		protected ModelAndView getSchoolAllocation(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView model = new ModelAndView("schoolAllocation");
			String entityidfrom = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");
			List<Map<String, Object>> schoolallocationlist = new ArrayList <Map<String, Object>> ();
			List<Map<String, Object>> schoolallocationlistyear = new ArrayList<Map<String, Object>>();
			List<List<Map<String, Object>>> schoolallocationlistall = new ArrayList <List<Map<String, Object>>>();
			Map<String,Object> refMap = new HashMap<String,Object>();

			String sacategoryid = (String) (request.getParameter("categoryid") != null ? request.getParameter("categoryid").trim() : "" + entityDAO.getCategoryEntity(entityidfrom));
			theLogger.debug("getSchoolAllocation Edit " + request.getParameter("edit"));

			String edit = request.getParameter("edit") != null ? request.getParameter("edit") : "-1";

			if(!"-1".equalsIgnoreCase(edit)){
				theLogger.debug("getSchoolAllocationReference");

				refMap = entityDAO.getSchoolAllocationReference(entityidfrom);
				if(refMap != null)
				model.addObject("oldref",refMap.get("reference"));
			}
			try{
				sacategoryid = (Integer.parseInt(sacategoryid) + 1 ) + "";
			}catch(Exception ex){

			}
			model.addObject("sacategoryid",sacategoryid);
			model.addObject("entity",entityDAO.getEntityDetails(entityidfrom,"-1","","single"));


			// call from getEntityDetails and it can save some db connection by limit return data. we need sacategoryid only for getEntityDetials
			if(!"y".equalsIgnoreCase("" + request.getAttribute("sacategoryidonly"))){
				String allocationyear = request.getParameter("allocationyear") != null ? request.getParameter("allocationyear").trim() : "-1";
				//if (request.getAttribute("saveSchoolAllocation") != null) {
					allocationyear ="5"; // Show only 5  allocation year after saved new allocation
				//}
				schoolallocationlist = entityDAO.getSchoolAllocation(entityidfrom,allocationyear);
				//model.addObject("schoolAllocation",schoolallocationlist);

				String year = "-1";
				if(schoolallocationlist.size() > 0){

					for(int i=0; i<schoolallocationlist.size(); i++){
						//theLogger.debug("" + schoolallocationlist.get(i).get("allocationyear") + "/" + schoolallocationlist.get(i).get("schoolname"));
						if( ! "-1".equalsIgnoreCase(year) && ! year.equalsIgnoreCase("" + schoolallocationlist.get(i).get("allocationyear"))){
							schoolallocationlistall.add(schoolallocationlistyear);
							schoolallocationlistyear = new  ArrayList<Map<String, Object>>();
							schoolallocationlistyear.add( schoolallocationlist.get(i));
						}else{
							schoolallocationlistyear.add( schoolallocationlist.get(i));
						}
						year = "" + schoolallocationlist.get(i).get("allocationyear");
					}
					if(!schoolallocationlistyear.isEmpty())
					schoolallocationlistall.add(schoolallocationlistyear);
				}
				model.addObject("schoolallocationlistall", schoolallocationlistall);

				model.addObject("entityidfrom",entityidfrom);
				model.addObject("allocationyear",allocationyear);
				model.addObject("rankingyear",getRankingYear());

			}

			return model;
		}
		@RequestMapping("/favoriteUserListOverlay")
		protected ModelAndView getfavoriteUserListOverlay(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView model = new ModelAndView("favoriteUserListOverlay");
			String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");

			model.addObject("favoriteUserList",entityDAO.getFavoriteUserListByEntity(entityid));

			return model;
		}
		@RequestMapping("/schoolAllocationOverlay")
		protected ModelAndView getSchoolAllocationOverlay(HttpServletRequest request, HttpServletResponse response) throws Exception {

			StringBuffer alocatedschoolnames = new StringBuffer();
			String schoolname="";
			ModelAndView model = getSchoolAllocation(request,response);

			List<List<Map<String, Object>>> schoolallocationlistall = (List <List<Map<String, Object>>>) model.getModel().get("schoolallocationlistall");
			List<Map<String, Object>> schoolallocationlist = schoolallocationlistall != null &&  ! schoolallocationlistall.isEmpty() ? schoolallocationlistall.get(0) : null ;
			theLogger.debug("schoolallocationlistall " + schoolallocationlistall.size());
			theLogger.debug("schoolallocationlist " + schoolallocationlist.size());

			ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
			String year = "-1";
			if(schoolallocationlist != null && schoolallocationlist.size() > 0){
				schoolname = (String) schoolallocationlist.get(0).get("schoolname");
				year = "" + schoolallocationlist.get(0).get("allocationyear");
				alocatedschoolnames.append("<br><br>" + year + applicationContext.getMessage("label.year", new Object[] {schoolname,alocatedschoolnames }, Locale.SIMPLIFIED_CHINESE) + "<br>");

				for(int i=0; i<schoolallocationlist.size(); i++){

					alocatedschoolnames.append("" + (i + 1) + "." + schoolallocationlist.get(i).get("name") + schoolallocationlist.get(i).get("nameeng") + "--(" + schoolallocationlist.get(i).get("noofstudent") +  ")<br>");
				}
			}
			String answer= (alocatedschoolnames != null  &&  !alocatedschoolnames.toString().contains("null") ) ?  applicationContext.getMessage("comment.schoolallocationqa", new Object[] {schoolname,alocatedschoolnames }, Locale.SIMPLIFIED_CHINESE) : applicationContext.getMessage("label.noinformation", new Object[] {}, Locale.SIMPLIFIED_CHINESE);
			int categoryid = 0;
			try{
				categoryid = (Integer.parseInt((String) model.getModel().get("sacategoryid")) - 1 );
			}catch(Exception ex){

			}

			String moreinfo = "<div class=\"qamoreinfo\"><a href=\"/school/controller/schoolAllocationOverlay?entityid=" + model.getModel().get("entityidfrom") + "&categoryid=" + categoryid + "\" rel=\"#schoolallocation_overlay\" style=\"text-decoration:none\">\u8A73\u60C5\u5206\u6790</a></div>";

			HashMap<String,String> qamap = new HashMap<String,String>();
			qamap.put("subject", "\u8ACB\u554F" + schoolname + "\u6D3E\u4F4D\u5982\u4F55?");
			qamap.put("active", "y");
			qamap.put("question", "\u5982\u984C\uFF0C\u8ACB\u5E6B\u5FD9"); //as subject pls help ...
			qamap.put("answer", answer + moreinfo);
			qamap.put("signleentityid",  (String) model.getModel().get("entityidfrom"));
			qamap.put("tag1", "2".equalsIgnoreCase((String) model.getModel().get("sacategoryid")) ? "\u5347\u4E2D\u6D3E\u4F4D" : "\u5347\u5C0F\u6D3E\u4F4D"  );
			qamap.put("userid", "1");
			qamap.put("userlike", "0");
			qamap.put("categoryid", "" +categoryid);
			qamap.put("type", "q");

			if(!blockattack){
				if(!isRobot(request)){
				//theLogger.debug("generating q&a : school allocation :" + qamap);
				questionAnswerDAO.saveQuestionWithAnswer(qamap);
				}
			}
			model.setViewName("schoolAllocationOverlay");
			return model;
		}

		@RequestMapping("/schoolEventOverlay")
		protected ModelAndView getSchoolEventOverlay(HttpServletRequest request, HttpServletResponse response) throws Exception {

			String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "5890");


			ModelAndView model = new ModelAndView("entity/schoolEventOverlay");
			model.addObject("schoolEvent",eventDAO.getEventBySchool(entityid));


			return model;
		}

		@RequestMapping(value="/saveSchoolAllocation", method=RequestMethod.POST)
		protected ResponseEntity<String>  saveSchoolAllocation(@RequestParam("nodata") String nodata, @RequestParam("allocationyear") String allocationyear, @RequestParam("entityidfrom") String entityidfrom,@RequestParam("entityidto") String entityidto, @RequestParam("reference") String reference, @RequestParam("sacategoryid") String sacategoryid, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession(true);
			Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");

			request.setCharacterEncoding("UTF-8");

			HashMap<String,String> schoolAllocation = new HashMap<String,String>();
			schoolAllocation.put("nodata",nodata != null ? nodata.trim() : "");
			schoolAllocation.put("allocationyear",allocationyear  != null? allocationyear.trim() : "");
			schoolAllocation.put("entityidfrom",entityidfrom  != null? entityidfrom.trim() : "");
			theLogger.debug("saveSchoolAllocation entityidto: " + entityidto);

			schoolAllocation.put("entityidto",entityidto != null ? entityidto.trim() : "");
			schoolAllocation.put("reference",reference != null ? reference.trim() : "");
			schoolAllocation.put("sacategoryid",sacategoryid != null ? sacategoryid.trim() : "2");
			schoolAllocation.put("userid","" + user.get("ID"));
			String result = "";
			result = entityDAO.saveSchoolAllocation(schoolAllocation);
			if(result != null && result.trim().length() > 0)
				request.setAttribute(STATUSBOX,result);

			//request.setAttribute(STATUSBOX,schoolAllocation.get("entityidto"));
			request.setAttribute("action", "compare");
			request.setAttribute("saveSchoolAllocation", "yes");
			HttpHeaders responseHeaders = new HttpHeaders();
		    responseHeaders.add("Content-Type", "text/html; charset=utf-8");

			return new ResponseEntity<String>((result != null && result.trim().length() > 0) ? result : "Success", responseHeaders, HttpStatus.CREATED);

		}
	// ===================== School Allocation ==============================




		@RequestMapping("/saveEntity")
		protected ModelAndView saveEntity(HttpServletRequest request, HttpServletResponse response) throws Exception {


			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession(true);
			Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");

			Map<String,String> paramMap = new HashMap<String,String>();

			String entityid = request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1";
			String categoryid = request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "-1";
			String year = request.getParameter("year") != null ? request.getParameter("year") : "-1";

			String schoolallocationscore = request.getParameter("schoolallocationscore") != null ? request.getParameter("schoolallocationscore") : "-1";
			String exceedquota = request.getParameter("exceedquota") != null ? request.getParameter("exceedquota") : "-1";
			String banding = request.getParameter("banding") != null ? request.getParameter("banding") : "-1";
			String chipassrate = request.getParameter("chipassrate") != null ? request.getParameter("chipassrate") : "-1";
			String engpassrate = request.getParameter("engpassrate") != null ? request.getParameter("engpassrate") : "-1";
			String urate = request.getParameter("urate") != null ? request.getParameter("urate") : "-1";
			String sixcoursesratio = request.getParameter("sixcoursesratio") != null ? request.getParameter("sixcoursesratio") : "-1";
			String dp = request.getParameter("dp") != null ? request.getParameter("dp") : "-1";
			String igcse = request.getParameter("igcse") != null ? request.getParameter("igcse") : "-1";
			String hkdsepassrate = request.getParameter("hkdsepassrate") != null ? request.getParameter("hkdsepassrate") : "-1";

			String area = request.getParameter("area") != null ? request.getParameter("area") : "-1";
			String noofclassroom = request.getParameter("noofclassroom") != null ? request.getParameter("noofclassroom") : "-1";
			String noofhall = request.getParameter("noofhall") != null ? request.getParameter("noofhall") : "-1";
			String noofplayground = request.getParameter("noofplayground") != null ? request.getParameter("noofplayground") : "-1";
			String nooflibraryroom = request.getParameter("nooflibraryroom") != null ? request.getParameter("nooflibraryroom") : "-1";
			String noofspecialroom = request.getParameter("noofspecialroom") != null ? request.getParameter("noofspecialroom") : "-1";
			String noofotherroom = request.getParameter("noofotherroom") != null ? request.getParameter("noofotherroom") : "-1";
			String indoorplayground = request.getParameter("indoorplayground") != null ? request.getParameter("indoorplayground") : "-1";
			String outdoorplayground = request.getParameter("outdoorplayground") != null ? request.getParameter("outdoorplayground") : "-1";
			String musicroom = request.getParameter("musicroom") != null ? request.getParameter("musicroom") : "-1";


            String qareport = request.getParameter("qareport") != null ? request.getParameter("qareport") : "-1";
            String schoolfee = request.getParameter("schoolfee") != null ? request.getParameter("schoolfee") : "-1";
			String tuitionfee = request.getParameter("tuitionfee") != null ? request.getParameter("tuitionfee") : "-1";
			String voucher = request.getParameter("voucher") != null ? request.getParameter("voucher") : "-1";
			String schoolfeenursery = request.getParameter("schoolfeenursery") != null ? request.getParameter("schoolfeenursery") : "-1";

			String teacherexperience = request.getParameter("teacherexperience") != null ? request.getParameter("teacherexperience") : "-1";
			String teachermaster = request.getParameter("teachermaster") != null ? request.getParameter("teachermaster") : "-1";
			String teacherbachelor = request.getParameter("teacherbachelor") != null ? request.getParameter("teacherbachelor") : "-1";
			String teacherpupilam = request.getParameter("teacherpupilam") != null ? request.getParameter("teacherpupilam") : "-1";
			String teacherpupilpm = request.getParameter("teacherpupilpm") != null ? request.getParameter("teacherpupilpm") : "-1";
			String teacherforeign = request.getParameter("teacherforeign") != null ? request.getParameter("teacherforeign") : "-1";


			String athleticsdivmale = request.getParameter("athleticsposmalediv") != null ? request.getParameter("athleticsposmalediv") : "-1";
			String athleticsposmale = request.getParameter("athleticsposmale") != null ? request.getParameter("athleticsposmale") : "-1";
			String athleticsdivfemale = request.getParameter("athleticsposfemalediv") != null ? request.getParameter("athleticsposfemalediv") : "-1";
			String athleticsposfemale = request.getParameter("athleticsposfemale") != null ? request.getParameter("athleticsposfemale") : "-1";
			String footballdiv = request.getParameter("footballposdiv") != null ? request.getParameter("footballposdiv") : "-1";
			String footballpos = request.getParameter("footballpos") != null ? request.getParameter("footballpos") : "-1";
			String swimmingdivmale = request.getParameter("swimmingposmalediv") != null ? request.getParameter("swimmingposmalediv") : "-1";
			String swimmingposmale = request.getParameter("swimmingposmale") != null ? request.getParameter("swimmingposmale") : "-1";
			String swimmingdivfemale = request.getParameter("swimmingposfemalediv") != null ? request.getParameter("swimmingposfemalediv") : "-1";
			String swimmingposfemale = request.getParameter("swimmingposfemale") != null ? request.getParameter("swimmingposfemale") : "-1";
			String basketballdivmale = request.getParameter("basketballposmalediv") != null ? request.getParameter("basketballposmalediv") : "-1";
			String basketballposmale = request.getParameter("basketballposmale") != null ? request.getParameter("basketballposmale") : "-1";
			String basketballdivfemale = request.getParameter("basketballposfemalediv") != null ? request.getParameter("basketballposfemalediv") : "-1";
			String basketballposfemale = request.getParameter("basketballposfemale") != null ? request.getParameter("basketballposfemale") : "-1";



			String choirchinese = request.getParameter("choirchinese") != null ? request.getParameter("choirchinese") : "-1";
			String choirforeign = request.getParameter("choirforeign") != null ? request.getParameter("choirforeign") : "-1";
			String instrumentchinese = request.getParameter("instrumentchinese") != null ? request.getParameter("instrumentchinese") : "-1";
			String instrumentwestern = request.getParameter("instrumentwestern") != null ? request.getParameter("instrumentwestern") : "-1";
			String musicfirst = request.getParameter("musicfirst") != null && request.getParameter("musicfirst").trim().length() > 0 ? request.getParameter("musicfirst") : "-1";
			String musicsecond = request.getParameter("musicsecond") != null && request.getParameter("musicsecond").trim().length() > 0 ? request.getParameter("musicsecond") : "-1";
            String musicthird = request.getParameter("musicthird") != null && request.getParameter("musicthird").trim().length() > 0 ? request.getParameter("musicthird") : "-1";
            String musicother = request.getParameter("musicother") != null && request.getParameter("musicother").trim().length() > 0 ? request.getParameter("musicother") : "-1";
			String speechfirst = request.getParameter("speechfirst") != null && request.getParameter("speechfirst").trim().length() > 0 ? request.getParameter("speechfirst") : "-1";
			String speechsecond = request.getParameter("speechsecond") != null && request.getParameter("speechsecond").trim().length() > 0 ? request.getParameter("speechsecond") : "-1";
			String speechthird = request.getParameter("speechthird") != null && request.getParameter("speechthird").trim().length() > 0 ? request.getParameter("speechthird") : "-1";
            String debatechi = request.getParameter("debatechi") != null && request.getParameter("debatechi").trim().length() > 0 ? request.getParameter("debatechi") : "-1";


			paramMap.put("id", entityid);
			paramMap.put("year", year);

			paramMap.put("schoolallocationscore", schoolallocationscore);
			paramMap.put("exceedquota", exceedquota);
			paramMap.put("banding", banding);
			paramMap.put("chipassrate", chipassrate);
			paramMap.put("engpassrate", engpassrate);
			paramMap.put("urate", urate);
			paramMap.put("sixcoursesratio", sixcoursesratio);
			paramMap.put("dp", dp);
			paramMap.put("igcse", igcse);
			paramMap.put("hkdsepassrate", hkdsepassrate);


			paramMap.put("area", area);
			paramMap.put("noofclassroom", noofclassroom);
			paramMap.put("noofhall", noofhall);
			paramMap.put("noofplayground", noofplayground);
			paramMap.put("nooflibraryroom", nooflibraryroom);
			paramMap.put("noofspecialroom", noofspecialroom);
			paramMap.put("noofotherroom", noofotherroom);
			paramMap.put("indoorplayground", indoorplayground);
			paramMap.put("outdoorplayground", outdoorplayground);
			paramMap.put("musicroom", musicroom);
            paramMap.put("musicother", musicother);
            paramMap.put("debatechi", debatechi);
			paramMap.put("schoolfee", schoolfee);
            paramMap.put("qareport",qareport);
			paramMap.put("tuitionfee", tuitionfee);
			paramMap.put("voucher", voucher);
			paramMap.put("schoolfeenursery", schoolfeenursery);

			paramMap.put("teacherexperience", teacherexperience);
			paramMap.put("teachermaster", teachermaster);
			paramMap.put("teacherbachelor", teacherbachelor);
			paramMap.put("teacherpupilam", teacherpupilam);
			paramMap.put("teacherpupilpm", teacherpupilpm);
			paramMap.put("teacherforeign", teacherforeign);

			paramMap.put("athleticsdivmale", athleticsdivmale);
			paramMap.put("athleticsposmale", athleticsposmale);
			paramMap.put("athleticsdivfemale", athleticsdivfemale);
			paramMap.put("athleticsposfemale", athleticsposfemale);
			paramMap.put("swimmingdivmale", swimmingdivmale);
			paramMap.put("swimmingposmale", swimmingposmale);
			paramMap.put("swimmingdivfemale", swimmingdivfemale);
			paramMap.put("swimmingposfemale", swimmingposfemale);
			paramMap.put("basketballdivmale", basketballdivmale);
			paramMap.put("basketballposmale", basketballposmale);
			paramMap.put("basketballdivfemale", basketballdivfemale);
			paramMap.put("basketballposfemale", basketballposfemale);
			paramMap.put("footballdiv", footballdiv);
			paramMap.put("footballpos", footballpos);


			paramMap.put("choirchinese", choirchinese);
			paramMap.put("choirforeign", choirforeign);
			paramMap.put("instrumentchinese", instrumentchinese);
			paramMap.put("instrumentwestern", instrumentwestern);
			paramMap.put("musicfirst", musicfirst);
			paramMap.put("musicsecond", musicsecond);
			paramMap.put("musicthird", musicthird);
            paramMap.put("musicother", musicother);
            paramMap.put("speechfirst", speechfirst);
			paramMap.put("speechsecond", speechsecond);
			paramMap.put("speechthird", speechthird);

			paramMap.put("userid", "" + user.get("ID"));



			entityDAO.saveEntity(paramMap);


			HashMap<String,String> schoolAllocation = new HashMap<String,String>();
			schoolAllocation.put("nodata",request.getParameter("nodata") != null ? request.getParameter("nodata").trim() : "");
			schoolAllocation.put("allocationyear",year);
			schoolAllocation.put("entityidfrom",entityid);
			schoolAllocation.put("schoolupdate","y");


			StringBuffer entityidto = new StringBuffer();

			List<Map<String, Object>> schlist = "0".equalsIgnoreCase(categoryid) ? primarySchoolList : "1".equalsIgnoreCase(categoryid) ? secondarySchoolList : null ;

			if(schlist != null){
				//theLogger.debug("schlist size" + schlist.size());
				for(int i=0; i < schlist.size(); i++){
					//theLogger.debug("entityid-" + schlist.get(i).get("value") + " : " + request.getParameter("entityid-" + schlist.get(i).get("value") ));
					if(request.getParameter("entityid-" + schlist.get(i).get("value") ) != null && request.getParameter("entityid-" + schlist.get(i).get("value")).trim().length() > 0 ){
						try{
							entityidto.append(schlist.get(i).get("value") + "-" + Integer.parseInt(request.getParameter("entityid-" + schlist.get(i).get("value"))) + ",");
						}catch(Exception ex){

						}
					}
				}
			}
			schoolAllocation.put("entityidto",entityidto.toString());

			schoolAllocation.put("reference",request.getParameter("reference") != null ? request.getParameter("reference").trim() : "");
			schoolAllocation.put("userid", "" + user.get("ID"));

			entityDAO.saveSchoolAllocation(schoolAllocation);


			return getEntityDetails(request,response);
		}

		@RequestMapping("/saveEntityEvent")
		protected ModelAndView saveEntityEvent(HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession(true);
			Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");
            String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;

			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id") != null && request.getParameter("id").trim().length() > 0 ? request.getParameter("id") : "-1";

			HashMap<String,String> event = new HashMap<String,String>();
			event.put("id",id);
			event.put("title",request.getParameter("title") != null ? request.getParameter("title").trim() : "");
			event.put("note",request.getParameter("note") != null ? request.getParameter("note").trim() : "");
			event.put("entityid",request.getParameter("entityid") != null ? request.getParameter("entityid") : "");
			event.put("startdate",request.getParameter("startdate") != null && request.getParameter("startdate").trim().length() > 0  ? request.getParameter("startdate") : "");
			event.put("enddate",request.getParameter("enddate") != null && request.getParameter("enddate").trim().length() > 0 ? request.getParameter("enddate") : "");
			event.put("eventtype",request.getParameter("eventtype") != null ? request.getParameter("eventtype") : "");
			event.put("active",request.getParameter("active") != null ? request.getParameter("active") : "");


			theLogger.debug("Rating .... " + request.getParameter("grade"));
			final String OLD_FORMAT = "MM/dd/yy";
			final String NEW_FORMAT = "yyyy-MM-dd";
			String[] datestring = {"startdate","enddate"};
			SimpleDateFormat sdf ;
			Date d;
			for(int i=0; i< datestring.length; i++){
				try{
					sdf = new SimpleDateFormat(OLD_FORMAT);
					d = sdf.parse(event.get(datestring[i]));
					sdf.applyPattern(NEW_FORMAT);
					event.put(datestring[i], sdf.format(d));
				}catch(Exception ex){
					event.put(datestring[i], "");
				}
			}
			if("principalsay".equalsIgnoreCase(""  + event.get("eventtype"))){
				Date date = new Date();
				sdf = new SimpleDateFormat(NEW_FORMAT);
				event.put("startdate","" + sdf.format(date));
				event.put("enddate","" + sdf.format(date));

			}
			theLogger.debug("eventtype " + event.get("eventtype"));
			theLogger.debug("startdate " + event.get("startdate"));
			theLogger.debug("saveEntityEvent" + event);
            if( ! "-1".equalsIgnoreCase(userid)){
                eventDAO.saveEvent(event);
            }
			return getEntityDetails(request,response);

		}
	@RequestMapping("/myFavoriteConsole")
	protected ModelAndView getMyFavoriteList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		initStaticData(request);
		StringBuffer entityids = new StringBuffer();

		HttpSession session = request.getSession(true);
		Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");
		String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		; 					String action = request.getAttribute("action") != null ? (String)  request.getAttribute("action") :  (request.getParameter("action") != null ? request.getParameter("action") : "compare");
		String categoryid = request.getAttribute("categoryid") != null ? (String)  request.getAttribute("categoryid") :  (request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "-1");
		String roleid = request.getParameter("roleid") != null ? request.getParameter("roleid")  : (user != null && user.get("ROLEID") != null &&  (Integer) user.get("ROLEID") > 0  ? ((Integer) user.get("ROLEID")).toString()  : "-1" );

		ModelAndView model = new ModelAndView("account/myFavoritesConsole");
		List<List<Map<String, Object>>> eventList = new ArrayList<List<Map<String, Object>>>();
		List<Map<String, Object>> favoritelist = entityDAO.getUserEntityList(entityid,categoryid,userid,action,roleid);
		categoryid = ! favoritelist.isEmpty() ?  (String) favoritelist.get(0).get("categoryid") : "0";
		String tab = request.getParameter("tab") != null && request.getParameter("tab").trim().length() > 0 ? request.getParameter("tab") : "favoritetab";
		theLogger.debug("request.setAttribute(\"categoryid\")" + categoryid);
		request.setAttribute("categoryid",categoryid);

		//model.addObject("schoolList",entityDAO.getTopEntity(categoryid,"10"));
		model.addObject("myFavoriteSchoolList",favoritelist );
		model.addObject("action",action);
		model.addObject("categoryid",categoryid);
		for(int i=0; i<favoritelist.size(); i++){
			entityids.append((Integer) favoritelist.get(i).get("entityid") + ",");
			eventList.add(eventDAO.getEventBySchool((Integer) favoritelist.get(i).get("entityid") + ""));
		}
		String entityidstostring= entityids != null && entityids.length() > 0  ? entityids.toString() : "";
		if(entityidstostring.endsWith(",") )
			entityidstostring = entityidstostring.substring(0, entityidstostring.lastIndexOf(","));
		request.setAttribute("entityids",entityidstostring);
		//model.addAllObjects(schoolCompare(request,response).getModel());

		model.addObject("favoriteCount",entityDAO.getUserFavoriteCount(entityidstostring));
		model.addObject("schoolEvent",eventList);
		model.addObject("userid",userid);
		model.addObject("topmenu", new ArrayList<Map<String,String>>());

		String id= (user !=null  && user.get("kidentityid")  != null ) ? ""  + user.get("kidentityid") : "-1";
		model.addObject("school",entityDAO.getEntityDetails(id,"-1","","single"));
		model.addObject("tab",tab);
		return model;
	}

	@RequestMapping("/primarySchoolConsole")
	protected ModelAndView getPrimarySchoolList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		initStaticData(request);
		String categoryid = request.getAttribute("categoryid") != null ? (String)  request.getAttribute("categoryid") :  (request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "-1");
		ModelAndView model = new ModelAndView("entity/primarySchoolConsole");

		model.addObject("topmenu",buildTopMenu(request));
		model.addObject("schoolList",entityDAO.getSchoolListByDistrict(categoryid));
		model.addObject("financetypeSchoolList",entityDAO.getSchoolListByFinanceType(categoryid));
		model.addObject("throughtrainSchoolList",entityDAO.getSchoolListByMode(categoryid));
		model.addObject("poaschoolnet",entityDAO.getPOASchoolNet());
		model.addObject("topnmap",getTopNPerDistrict(categoryid));
		model.addObject("categoryid", "" + categoryid);

		return model;
	}
	@RequestMapping("/kindergartenConsole")
	protected ModelAndView getKindergartenEntityList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		initStaticData(request);
		String categoryid = request.getAttribute("categoryid") != null ? (String)  request.getAttribute("categoryid") :  (request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "-1");
		ModelAndView model = new ModelAndView("entity/kindergartenConsole");

		model.addObject("topmenu",buildTopMenu(request));
		model.addObject("schoolList",entityDAO.getSchoolListByDistrict(categoryid));
		theLogger.debug("before financetypeSchoolList ");
		model.addObject("financetypeSchoolList",entityDAO.getSchoolListByFinanceType(categoryid));
		model.addObject("topnmap",getTopNPerDistrict(categoryid));
		model.addObject("categoryid", "" + categoryid);

		return model;
	}
	@RequestMapping("/secondarySchoolConsole")
	protected ModelAndView getSecondaryEntityList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		initStaticData(request);
		String categoryid = request.getAttribute("categoryid") != null ? (String)  request.getAttribute("categoryid") :  (request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "-1");
		ModelAndView model = new ModelAndView("entity/secondaryConsole");

		model.addObject("topmenu",buildTopMenu(request));
		model.addObject("schoolList",entityDAO.getSchoolListByDistrict(categoryid));
		model.addObject("topnmap",getTopNPerDistrict(categoryid));


		model.addObject("financetypeSchoolList",entityDAO.getSchoolListByFinanceType(categoryid));
		model.addObject("categoryid", categoryid);

		return model;
	}
	@RequestMapping("/intlSchoolConsole")
	protected ModelAndView getIntlSchoolList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		initStaticData(request);
		ModelAndView model = new ModelAndView("entity/intlSchoolConsole");

		model.addObject("topmenu",buildTopMenu(request));
		model.addObject("schoolList",entityDAO.getSchoolListByIBSystem());
		model.addObject("categoryid", "5");

		return model;
	}
	private HashMap<String,Object> getTopNPerDistrict(String categoryid) throws Exception{
		HashMap<String,Object> topNMap = new HashMap<String,Object>();
		Map<String,Object> result = new HashMap<String,Object>();
		String district="";
		String prevdistrict="";
		StringBuffer desc = new StringBuffer();
		ArrayList<String> tmp = new ArrayList<String>();
		int count=0;
		List<Map<String, Object>> topNList = null;
		topNList = entityDAO.getTopNPerDistrict(categoryid,"3");
		String name="";
		int maxlength=15;
		for(int i=0; i< topNList.size(); i++){
			result  = topNList.get(i);
			name = ""  + result.get("name");
			boolean alpha = name.matches("[a-zA-Z]+");
			maxlength = alpha ? 30 : 15;

			name = (name != null && name.length() < maxlength  ) ? name : name.substring(0, maxlength-1) + " ... ";
			district = ""  +result.get("district");
			if(alpha || name.contains("ST. CATHERINE"))
				theLogger.debug(result.get("district") + "|" + result.get("name"));
			if( ! "".equalsIgnoreCase(prevdistrict) && ! prevdistrict.equalsIgnoreCase(district) ){
				tmp.add(desc.toString());
				tmp.add("" + count)
;				topNMap.put(prevdistrict.trim(), tmp );
				//theLogger.debug(prevdistrict + ":" + desc.toString());
				desc = new StringBuffer();
				tmp = new ArrayList<String>();
				count=0;
			}
			if(count < 9){
				desc.append("<a href=\"/school/controller/entityDetails?action=compare&entityid=" + result.get("id")  + " \">" + name  +"-" + result.get("score") + " </a><br>");
				count++;
			}
			prevdistrict = district;
		}
		tmp.add(desc.toString());
		tmp.add("" + count)
;		topNMap.put(prevdistrict.trim(), tmp );

		return topNMap;
	}
	@RequestMapping("/ibConsole")
	protected ModelAndView getIBSchoolList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		initStaticData(request);
		HttpSession session = request.getSession(true);
		HashMap<String,String> paramMap = (HashMap<String,String>) extractParam(request);
		HashMap<String,String> searchParam = new HashMap<String,String>();
		String schoolsystem = request.getParameter("schoolsystem") != null && request.getParameter("schoolsystem").trim().length() > 0 ? request.getParameter("schoolsystem") : "-1";
		theLogger.debug("schoolsystem " + schoolsystem);
		searchParam.put("nominated","-1");
		searchParam.put("throughtrain","-1");
		searchParam.put("feeder","-1");
		searchParam.put("poaschoolnet","-1");
		searchParam.put("poaschoolnets","-1");
		searchParam.put("district","-1");
		searchParam.put("financetype","-1");
		paramMap.put("schoolsystem",schoolsystem);

		ModelAndView model = new ModelAndView("entity/ibConsole");
		model.addObject("topmenu",buildTopMenu(request));
		model.addObject("schoolList",entityDAO.getEntity(paramMap,"y"));
		model.addObject("category","ib");
		model.addObject("searchmodeactive","y");
		session.setAttribute("searchCriteria",searchParam);
		return model;
	}
	protected ModelAndView getEntityList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(true);
		Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");
		String action = request.getAttribute("action") != null ? (String)  request.getAttribute("action") :  (request.getParameter("action") != null ? request.getParameter("action") : "compare");
		String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");
		String categoryid = request.getAttribute("categoryid") != null ? (String)  request.getAttribute("categoryid") :  (request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "-1");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		; 					String roleid = request.getParameter("roleid") != null ? request.getParameter("roleid")  : (user != null && user.get("ROLEID") != null &&  (Integer) user.get("ROLEID") > 0  ? ((Integer) user.get("ROLEID")).toString()  : "-1" );

		ModelAndView model = new ModelAndView("entityConsole");

		JSONArray entity = new JSONArray();
		if("favorite".equalsIgnoreCase(action))
			entity.addAll(entityDAO.getUserEntityList(entityid,categoryid,userid,action,roleid));
		else
			entity.addAll(entityDAO.getEntityList(entityid,categoryid,userid,action));
		model.addObject("jsonEntityList",entity );
		model.addObject("financeTypeList",entityDAO.getSearchField("financeType",categoryid));
		model.addObject("districtList",entityDAO.getLookup( "0".equalsIgnoreCase(categoryid) ? "district.kindergarten" :  "district.poaschoolnet"));
		model.addObject("topmenu",buildTopMenu(request));
		model.addObject("action",action);
		model.addObject("categoryid",categoryid);

		return model;
	}

	@RequestMapping("/saveFavorite/{favoriteid}/{userid}/{action}/{categoryid}")
	protected @ResponseBody String saveFavorite(@PathVariable String favoriteid, @PathVariable String userid, @PathVariable String action, @PathVariable String categoryid, HttpSession session) throws Exception {

        if(isSignIn(session)) {
            ArrayList<Map<String, String>> favorite = new ArrayList<Map<String, String>>();

            theLogger.debug(favoriteid);
            StringTokenizer st = new StringTokenizer(favoriteid, ",");
            while (st.hasMoreTokens()) {
                HashMap<String, String> map = new HashMap<String, String>();
                map.put("favoriteid", st.nextToken());
                map.put("userid", userid);
                map.put("categoryid", categoryid);
                map.put("action", action);
                favorite.add(map);
            }
            entityDAO.saveFavorite(favorite);
            questionAnswerDAO.saveChatChannelUser(favorite);
            int favoritecount = entityDAO.getFavoriteCount(userid);
            session.setAttribute("favoritecount", favoritecount);
            return "" + favoritecount;
        }else{
            return "";
        }
	}
	@RequestMapping("/saveSchoolCompare/{favoriteid}")
	protected ResponseEntity<String> saveSchoolCompare(@PathVariable String favoriteid, HttpSession session) throws Exception {
		theLogger.debug("saving school compare");
        //if(isSignIn(session)) {

            HashMap<String, String> entityVsIdMap = new HashMap<String, String>();
            String schoolvstext = "";
            try {
                if (session.getAttribute("entityvsidmap") != null) {
                    entityVsIdMap = (HashMap<String, String>) session.getAttribute("entityvsidmap");
                }
                int schoolcount = 0;
                StringTokenizer st = new StringTokenizer(favoriteid, ",");

                while (st.hasMoreTokens()) {
                    String id = st.nextToken();
                    String name = (String) entityDAO.getEntityDetailsLimit(id, "-1", "", "single").get("name");
                    theLogger.debug("id:" + id + ", name: " + name);
                    entityVsIdMap.put(id, name);
                }
                schoolcount = entityVsIdMap.size();

                StringBuffer entityid = new StringBuffer();
                for (Object key : entityVsIdMap.keySet()) {
                    entityid.append(key.toString() + ",");
                }

                session.setAttribute("viewedentityid", entityid.toString());
                session.setAttribute("entityvsidmap", entityVsIdMap);


                session.setAttribute("schoolvscount", String.valueOf(schoolcount).toString());
                schoolvstext = getSchoolVsText(entityVsIdMap);

                session.setAttribute("schoolvstext", schoolvstext);

                HttpHeaders responseHeaders = new HttpHeaders();
                responseHeaders.add("Content-Type", "text/html; charset=utf-8");

                return new ResponseEntity<String>(schoolvstext, responseHeaders, HttpStatus.CREATED);
            } catch (Exception ex) {
                ex.printStackTrace();
                HttpHeaders responseHeaders = new HttpHeaders();
                responseHeaders.add("Content-Type", "text/html; charset=utf-8");

                return new ResponseEntity<String>(ex.toString(), responseHeaders, HttpStatus.CREATED);
            }

       // }else{
       //     return null;
       // }
	}
	@RequestMapping("/clearSchoolCompare/{favoriteid}")
	protected ResponseEntity<String> clearSchoolCompare(@PathVariable String favoriteid, HttpSession session) throws Exception {
		try{
			HashMap<String,String> entityVsIdMap = new HashMap<String,String>();

			if("all".equalsIgnoreCase(favoriteid)){
				session.removeAttribute("entityvsidmap");
				session.removeAttribute("viewedentityid");
				session.removeAttribute("schoolvscount");
				session.removeAttribute("schoolvstext");
			}else{
				theLogger.debug("clearSchoolCompare " + favoriteid);
				entityVsIdMap  = (HashMap<String,String>) session.getAttribute("entityvsidmap");
				entityVsIdMap.remove(favoriteid);
			}

			String schoolvstext=getSchoolVsText(entityVsIdMap);
			session.setAttribute("schoolvstext", schoolvstext);
			session.setAttribute("entityvsidmap",entityVsIdMap);
			StringBuffer entityid = new StringBuffer();
			for (Object key: entityVsIdMap.keySet()) {
				entityid.append( key.toString() + ",");
	        }
			session.setAttribute("viewedentityid", entityid.toString());

			HttpHeaders responseHeaders = new HttpHeaders();
		    responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		    return new ResponseEntity<String>(schoolvstext, responseHeaders, HttpStatus.CREATED);

			//return schoolvstext;
		}catch (Exception ex){
			ex.printStackTrace();
			HttpHeaders responseHeaders = new HttpHeaders();
		    responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		    return new ResponseEntity<String>(ex.toString(), responseHeaders, HttpStatus.CREATED);
		}
	}
	private String getSchoolVsText(HashMap<String, String>  entityVsIdMap){
		int rowCounter=1;
		StringBuffer schoolvstext = new StringBuffer();

		for (Map.Entry<String, String> entry : entityVsIdMap.entrySet()) {

			theLogger.debug("getSchoolVsText:" + entry.getValue() + "\n");
			schoolvstext.append("<div><span class=\"row1" +  rowCounter % 2 + "\">\n");

			schoolvstext.append("<a href='/school/controller/entityDetails?entityid=" + entry.getKey() +"&action=compare'>\n");
			schoolvstext.append("<font class=\"viewedschool\">" + rowCounter + ": " +  (entry.getValue().length() > 15 ? entry.getValue().substring(0,15) + "..." : entry.getValue())  + "</font></a>\n");
			schoolvstext.append("<a style=\"float:right\" href=\"#\" onClick=\"javascript:clearSchoolCompare('" + entry.getKey() +"')\" class=\"closeschool button\"></a>\n");
			schoolvstext.append("</span></div>\n");
			rowCounter++;
      }

		return schoolvstext.toString();
	}
	@RequestMapping("/entityForm")
	protected ModelAndView getEntityForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
			theLogger.debug("getEntityForm");
			// Special case handling if entityid is empty, or when user switch language, will load Diocesan Girls' School by default.
			String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "5890");
			String year =  request.getParameter("year") != null && request.getParameter("year").trim().length() > 0 ? request.getParameter("year") : "2012";
			request.setAttribute("entityid",entityid);

			ModelAndView model = transformRowToColumnEntity(request,response);

			model.setViewName("entity/entityForm");
            model.addObject("schoolAllocation",entityDAO.getSchoolAllocationMap(entityid,year));
			model.addObject("schoolAllocationReference",entityDAO.getSchoolAllocationReference(entityid, year));
			return model;
	}

	@RequestMapping("/entityDetails")
	protected ModelAndView getEntityDetails(HttpServletRequest request, HttpServletResponse response) throws Exception {

		final long start = System.nanoTime();
		// Special case handling if entityid is empty, or when user switch language, will load Diocesan Girls' School by default.
		String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "5890");
		String type = request.getParameter("type") != null ? request.getParameter("type") : "-1";

		request.setAttribute("entityid",entityid);

		try{
			if("next".equalsIgnoreCase(request.getParameter("nav"))){
				request.setAttribute("entityid", "" + entityDAO.getPrevNextEntity("next", "" +request.getAttribute("entityid"), request.getParameter("navtype")) );
			}else if("prev".equalsIgnoreCase(request.getParameter("nav"))){
				request.setAttribute("entityid", "" + entityDAO.getPrevNextEntity("prev", "" +request.getAttribute("entityid"), request.getParameter("navtype")) );
			}
			entityid = "" +request.getAttribute("entityid");

		}catch(Exception ex){
			// This is the case for 1st and last record
		}


		String sacategoryid = (String) (request.getParameter("categoryid") != null ? request.getParameter("categoryid").trim() : "" + entityDAO.getCategoryEntity(entityid));
		try{
			sacategoryid = (Integer.parseInt(sacategoryid) + 1 ) + "";
		}catch(Exception ex){

		}


		HttpSession session = request.getSession(true);
		session.setAttribute("navtype",request.getParameter("navtype"));
		if(session.getAttribute("autoPollingPopUp") != null )
			session.setAttribute("autoPollingPopUp", "n");
		else
			session.setAttribute("autoPollingPopUp", "y");

		ModelAndView model = transformRowToColumnEntity(request,response);
		model.addAllObjects(spiderEntity(request,response).getModel());
		model.addAllObjects(getComment(request,response).getModel());
		request.setAttribute("sacategoryidonly", "y");
		// This is for school placement update
		//model.addAllObjects(getSchoolAllocation(request,response).getModel());
		model.addObject("newslist",getNewsList(request));
		model.addObject("caseslist",caseDAO.getRelatedCaseSharingList(entityid));


		// Chat Msg

		HashMap<String,String> qaMap = new HashMap<String,String>();
		qaMap.put("entityid", entityid);
		qaMap.put("type", "e");
		String questionanswerid = ""  + questionAnswerDAO.getQAParentID(qaMap);
		model.addObject("questionanswerid",questionanswerid);
		HashMap<String,String> searchParam = new HashMap<String,String>();
		searchParam.put("id", questionanswerid);
		model.addObject("chatmsg",getChatMsg(questionAnswerDAO.getQAListByID(searchParam),request, new Date()));
		model.addObject("chattitle" ,request.getAttribute("chattitle") );
		model.addObject("type","e");

		// End of chat message

		model.addObject("entityImages",entityDAO.getEntityImageList("-1",entityid));
		model.addObject("eventHistory",eventDAO.getEventByEntity(entityid,"principalsay"));
		//model.addObject("schoolEvent",eventDAO.getEventBySchool(entityid));


		model.addObject("action","entityDetails");
		model.addObject("mode" ,"details" );
		model.addObject("sacategoryid",sacategoryid);
        model.addObject("rankingyear", getRankingYear());


        try{
			if("polling".equalsIgnoreCase(type)){
				ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
				request.setAttribute(STATUSBOX, applicationContext.getMessage("label.thankyoupolling",new Object[] {},Locale.SIMPLIFIED_CHINESE));
			}
		}catch(Exception ex){

		}
		model.setViewName("entity/entityDetails");
		final long end = System.nanoTime();

		theLogger.debug("Took: " + ((end - start) / 1000000) + "s");


		return model;
	}
	protected List<Map<String,Object>> getNewsList(HttpServletRequest request) throws Exception {

		String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "5890");
		String categoryid = request.getAttribute("categoryid") != null ? (String)  request.getAttribute("categoryid") : request.getParameter("categoryid") != null && request.getParameter("categoryid").trim().length() > 0 ? request.getParameter("categoryid") : "-1";
		String tag = request.getParameter("tag") != null && request.getParameter("tag").trim().length() > 0 ? request.getParameter("tag") : "-1";


		HashMap<String,String> searchParam = new HashMap<String,String>();
		searchParam.put("type", "q");
		searchParam.put("entityid", entityid);
		searchParam.put("categoryid", categoryid);
		searchParam.put("tag", tag);
		searchParam.put("all","y");
		searchParam.put("isnewspaper", "y");
		return questionAnswerDAO.getForumContentList(searchParam);
	}

	@RequestMapping("/schoolCompare")
	protected ModelAndView schoolCompare(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String firstentityid = "-1";
		String selectbig = request.getParameter("selectbig") != null ? request.getParameter("selectbig") : "n";
		theLogger.debug("selectbig " + selectbig);
		request.setAttribute("schoolcompare", "y");
		try{

			HttpSession session = request.getSession(true);
			HashMap<String,String> entityVsIdMap = new HashMap<String,String>();
			if(session.getAttribute("entityvsidmap") !=null)
				entityVsIdMap = (HashMap<String,String>) session.getAttribute("entityvsidmap");

			StringBuffer entityidsb = new StringBuffer();
			String entityid = "-1";
			firstentityid = "-1";

			Iterator it = entityVsIdMap.keySet().iterator();
		    while (it.hasNext()) {
			  entityid = (String)it.next();
			  theLogger.debug("entityVsIdMap " + entityid);
		    	if("-1".equalsIgnoreCase(firstentityid)){
		    		firstentityid = entityid;
		    	}
		    	entityidsb.append(entityid).append(",");

		    }
		    if(request.getParameter("entityids") != null && request.getParameter("entityids").contains(",")){
		    	firstentityid =  request.getParameter("entityids").substring(0, request.getParameter("entityids").indexOf(",") );
		    }else if(request.getAttribute("entityids") != null &&  ((String) request.getAttribute("entityids")).contains(",")){
		    	firstentityid =  ((String) request.getAttribute("entityids")).substring(0, ((String) request.getAttribute("entityids")).indexOf(",") );

		    }
		    request.setAttribute("entityid", request.getParameter("entityids") != null  ? request.getParameter("entityids") : request.getAttribute("entityids") != null ? request.getAttribute("entityids") : entityidsb.toString());
			request.setAttribute("action", "compare");
			request.setAttribute("categoryid", "" + entityDAO.getCategoryEntity(firstentityid));

		    if(request.getAttribute("entityid") == null || ((String) request.getAttribute("entityid")).trim().length() < 1 || "y".equalsIgnoreCase(request.getParameter("compareselectionmode"))   ){
		    	theLogger.debug("School Compare Selection Mode");
		    	theLogger.debug("selectbig " + selectbig);

		    	initStaticData(request);
				ModelAndView model = new ModelAndView("schoolCompareSelectionForm");
				model.addObject("selectbig", selectbig);

				return model;
			 }
			 else{
				theLogger.debug("School Compare Mode");
				//saveNetworkTraffic(request);
				return transformRowToColumnEntity(request,response);
			 }
		}catch(Exception ex){
			ex.printStackTrace();
			//request.setAttribute(STATUSBOX,"Compare List is empty, please choose the school first.");
			theLogger.debug("School Compare Exception Mode");
			initStaticData(request);
			ModelAndView model = new ModelAndView("schoolCompareSelectionForm");
			//model.addObject("newsList",entityDAO.getNewsList(paramMap.get("entityid"),paramMap.get("userid")) );
			//model.addObject("topKindergartenList",entityDAO.getTopEntity("0"));
			//model.addObject("topPrimaryList",entityDAO.getTopEntity("1"));
			//model.addObject("topSecondaryList",entityDAO.getTopEntity("2"));
			//model.addObject("topExtraCurricularActivitiesList",entityDAO.getTopEntity("4"));
			//model.addObject("commentCount", entityDAO.getCommentCount());
			//model.addObject("averageScore", entityDAO.getAverageScore());

			return model;
		}
	}


	protected ModelAndView transformRowToColumnEntity(HttpServletRequest request, HttpServletResponse response) throws Exception {

		theLogger.debug("request attribute entityid " + request.getAttribute("entityid"));
		//String entityid = "-1";
		String chscid = "";


		initStaticData(request);
		HttpSession session = request.getSession(true);
		Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");

		String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");
		String categoryid = request.getAttribute("categoryid") != null ? (String)  request.getAttribute("categoryid") :  (request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "-1");
		String action = request.getAttribute("action") != null ? (String)  request.getAttribute("action") :  (request.getParameter("action") != null ? request.getParameter("action") : "compare");
		String userid = "-1";
		try {
			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1";
		}catch (Exception ex){}
			String year = request.getParameter("year") != null ? request.getParameter("year") : "-1";


		ModelAndView model = new ModelAndView("compareConsole");
		String entityids="";
		StringBuffer entityidscap= new StringBuffer();
		//theLogger.debug("paramMap is null ? " + (paramMap == null));
		if(entityid.contains(",") && entityid.endsWith(",") )
			entityids = entityid.substring(0, entityid.lastIndexOf(","));
		else
			entityids = entityid;

		try{
			String [] entityidsarray = entityids.split("\\,");
			int max=entityidsarray.length > 20 ? 20 : entityidsarray.length;
			entityid = entityidsarray[0];
			for(int i=0; i<max; i++){
				entityidscap.append(entityidsarray[i] + ",");
			}
			entityids = entityidscap.toString();
			if(entityids.contains(",") && entityids.endsWith(","))
				entityids = entityids.substring(0, entityids.lastIndexOf(","));
		}catch(Exception ex){

		}

		request.setAttribute("entityids",entityids);
		//saveNetworkTraffic(request);

		//if(! "favorite".equalsIgnoreCase(paramMap.get("action")) &&  ! "1".equalsIgnoreCase(paramMap.get("roleid")))
			saveSchoolCompare(entityids,request.getSession(true));


		if("-1".equalsIgnoreCase(categoryid)){
			if(entityids.contains(","))
				categoryid = "" + entityDAO.getCategoryEntity(entityids.substring(0, entityids.indexOf(",")));
			else
				categoryid =  "" + entityDAO.getCategoryEntity(entityids);
			request.setAttribute("categoryid", categoryid);
		}

		List<Map<String, Object>> entityList =  null;
		if("y".equalsIgnoreCase("" +  request.getAttribute("schoolcompare"))){
			entityList = entityDAO.getEntityList(entityids ,categoryid,userid,action) ;
		}else{
			entityList = entityDAO.getSingleEntityYearList(entityids ,categoryid,userid,action,year);
			//entityList.remove(0);
		}


		if( !this.baseEntityMetaDataList.containsKey(categoryid)){
			theLogger.debug("Suppose static baseEntityMetaDataList list should show once");
			this.baseEntityMetaDataList.put(categoryid, entityDAO.getEntityMetaData(categoryid));
		}
		List<Map<String, Object>> entityMetaDataList =this.baseEntityMetaDataList.get(categoryid);


		ArrayList<List> fieldCategoryList = new ArrayList<List> ();
		ArrayList<String[]> field = new ArrayList<String[]> ();
		String prevFieldCategory="empty";
		String fieldCategory="";

		if(this.baseMetricCategory.isEmpty() ){
			baseMetricCategory = (HashMap<String,String>) entityDAO.getLookupMap("metrics.category");
		}
		HashMap<String,String> metricCategory = baseMetricCategory;

		HashMap<String,String> excludeCompare = new HashMap<String,String>();
		//filed name, label, category
		for(int i=0; i<entityMetaDataList.size(); i++ ){
			HashMap<String,String> tmp = (HashMap) entityMetaDataList.get(i);
			fieldCategory = tmp.get("fieldcategory");
			excludeCompare.put(tmp.get("fieldlabel"), "y".equalsIgnoreCase(tmp.get("excludecompare")) ? "y" : "n");

			//theLogger.debug("Meta Data " + i + " prevFieldCategory:" + prevFieldCategory + "/fieldCategory:" + fieldCategory);
			if(prevFieldCategory.equalsIgnoreCase(fieldCategory)){
				field.add(new String [] {tmp.get("fieldname") ,tmp.get("fieldlabel")} );
			}else{
				fieldCategoryList.add(field);
				field = new ArrayList<String[]> ();
				field.add(new String [] {tmp.get("fieldcategory") , tmp.get("fieldcategory") });
				field.add(new String [] {tmp.get("fieldname") ,tmp.get("fieldlabel")} );
			}
			prevFieldCategory = tmp.get("fieldcategory");
		}
		fieldCategoryList.add(field);

		ArrayList<List> entityVerticalCategoryList = new ArrayList<List>();
		int noOfRow = "y".equalsIgnoreCase("" +  request.getAttribute("schoolcompare")) || "edit".equalsIgnoreCase(action) ? entityList.size() : entityList.size() - 1;
		for(int k=0; k<fieldCategoryList.size(); k++ ){
			field = (ArrayList<String[]>) fieldCategoryList.get(k);
			int noOfField = field.size();
			String [][] entityVertical = new String [noOfField][noOfRow];

			int start = "y".equalsIgnoreCase("" +  request.getAttribute("schoolcompare")) || "edit".equalsIgnoreCase(action) ? 0 : 1;
			for(int i=start; i<entityList.size(); i++ ){
				HashMap tmp = (HashMap) entityList.get(i);
				for(int j=0; j<noOfField; j++ ){
					entityVertical[j][i-start] = (tmp.get(field.get(j)[0]) != null ? tmp.get(field.get(j)[0]) + "" : "");
					//entityVertical[j][i] += (tmp.get(field.get(j)[0] +"eng" ) != null ?  " " + tmp.get(field.get(j)[0] +"eng") + "" : "");
				}
			}

			ArrayList<HashMap<String,String>> entityVerticalList = new ArrayList<HashMap<String,String>>();
			HashMap<String,String> map= new HashMap<String,String>();
			for(int i=0; i<noOfField; i++ ){
				map = new HashMap<String,String>();
				for(int j=0; j<noOfRow; j++){
					map.put(field.get(i)[1] + j, entityVertical[i][j]);
				}
				map.put("key", field.get(i)[1]);
				//if("edit".equalsIgnoreCase(paramMap.get("action"))) open for all right now bcos wannt show sport div and pos at the same line
					map.put("fieldname", field.get(i)[0]);

				entityVerticalList.add(map);
			}
			if(entityVerticalList.size() > 0){
				entityVerticalCategoryList.add(entityVerticalList);
			}
		}

		// Case one for school comparison and case two for single entity
		ArrayList<Map<String, String>> scoreList = new ArrayList<Map<String, String>>();
		ArrayList<String> entityIDList = new ArrayList<String>();
		ArrayList<String> chscidList = new ArrayList<String>();
        ArrayList<Map<String, String>> rankingList = new ArrayList<Map<String, String>>();

        if(entityids.indexOf(",") >0){
			List<Map<String, Object>> commentList = entityDAO.getCommentSpider(entityids,userid,categoryid, "compare");
			HashMap scoreMap = new HashMap();
            HashMap<String,String> rankingMap = new HashMap<String,String>();
			HashMap tmp = new HashMap();


			for(int i=0; i<commentList.size(); i++  ){
				scoreMap = new HashMap();
                rankingMap = new HashMap();

                tmp = (HashMap<String,Object>) commentList.get(i);
				entityid = ((Integer) tmp.get("entityid")).toString();
				if(tmp.get("chscid") != null){
					chscid = ((Integer) tmp.get("chscid")).toString();
				}
				scoreMap.put("a", "0.0".equalsIgnoreCase(""+tmp.get("metric1")) ? "?" : tmp.get("metric1"));
				scoreMap.put("s", "0.0".equalsIgnoreCase(""+tmp.get("metric2")) ? "?" : tmp.get("metric2"));
				scoreMap.put("m", "0.0".equalsIgnoreCase(""+tmp.get("metric3")) ? "?" : tmp.get("metric3"));
				scoreMap.put("c", "0.0".equalsIgnoreCase(""+tmp.get("metric4")) ? "?" : tmp.get("metric4"));
				scoreMap.put("t", "0.0".equalsIgnoreCase(""+tmp.get("metric5")) ? "?" : tmp.get("metric5"));

                scoreMap.put("acurrentyear", "0.0".equalsIgnoreCase(""+tmp.get("currentyearmetric1")) ? "?" : tmp.get("currentyearmetric1"));
                scoreMap.put("scurrentyear", "0.0".equalsIgnoreCase(""+tmp.get("currentyearmetric2")) ? "?" : tmp.get("currentyearmetric2"));
                scoreMap.put("mcurrentyear", "0.0".equalsIgnoreCase(""+tmp.get("currentyearmetric3")) ? "?" : tmp.get("currentyearmetric3"));
                scoreMap.put("ccurrentyear", "0.0".equalsIgnoreCase(""+tmp.get("currentyearmetric4")) ? "?" : tmp.get("currentyearmetric4"));
                scoreMap.put("tcurrentyear", "0.0".equalsIgnoreCase(""+tmp.get("currentyearmetric5")) ? "?" : tmp.get("currentyearmetric5"));


				scoreMap.put("alastyear", "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric1")) ? "?" : tmp.get("lastyearmetric1"));
				scoreMap.put("slastyear", "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric2")) ? "?" : tmp.get("lastyearmetric2"));
				scoreMap.put("mlastyear", "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric3")) ? "?" : tmp.get("lastyearmetric3"));
				scoreMap.put("clastyear", "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric4")) ? "?" : tmp.get("lastyearmetric4"));
				scoreMap.put("tlastyear", "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric5")) ? "?" : tmp.get("lastyearmetric5"));
                rankingMap.put("ranking", "" + tmp.get("ranking"));
                rankingMap.put("score","" + tmp.get("score"));

                scoreList.add(scoreMap);
				entityIDList.add(entityid);
				chscidList.add(chscid);
                rankingList.add(rankingMap);
		    }
		}else{
			 Map<String,Object> entity =  entityDAO.getEntityDetailsLimit(entityid,"-1","-1","single");
			 chscid = ((Integer) entity.get("chscid")).toString();
			 request.setAttribute("chattitle",entity.get("name"));

		}
		// end of school compare / single entity

		try{
        	int index = entityList.size() > 0 ? entityList.size() -1 : 0;
			model.addObject("score",entityList.get(index).get("score"));
			model.addObject("parentscore",entityList.get(index).get("parentscore"));
			model.addObject("ranking",entityList.get(index).get("ranking"));
			model.addObject("rankingdistrict",entityList.get(index).get("rankingdistrict"));
			model.addObject("rankingfinancetype",entityList.get(index).get("rankingfinancetype"));
			if(!"Testing School".equalsIgnoreCase((String) entityList.get(index).get("nameeng"))) {
				model.addObject("alsoViewedSchool", entityDAO.getEntity(entityDAO.getCompareMap(entityList.get(index))));
			}else{
				model.addObject("alsoViewedSchool","");
			}
			model.addObject("hitcount",entityDAO.getEntityHitCount(entityid,"entity"));
			model.addObject("favoriteCount", entityDAO.getUserFavoriteCount(entityid));
			model.addObject("infavoritelist", entityDAO.getInUserFavoriteList(entityid,userid));


			int iranking = entityList.get(index).get("ranking") != null ? ((Integer) entityList.get(index).get("ranking")).intValue() : 0;
			int irankingdistrict = entityList.get(index).get("rankingdistrict") != null ? ((Integer) entityList.get(index).get("rankingdistrict")).intValue() : 0;
			int irankingfinancetype = entityList.get(index).get("rankingfinancetype") != null ? ((Integer) entityList.get(index).get("rankingfinancetype")).intValue() : 0;
			int[] i1 = new int[]{iranking,irankingdistrict,irankingfinancetype};
			Arrays.sort(i1);
			for(int i=0; index < i1.length ; i++) {
				model.addObject("ranking" + i, i1[i]);
			}

		}catch(Exception ex){
			//Catch for zero empty result set.
			//ex.printStackTrace();
		}

		if(entityids.indexOf(",") >0){
			Map<String,String>analyticsmap = generateAnalytics(WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()),entityids);
			model.addObject("mode" ,"compare" );
			model.addObject("schoolCompareAnalytics" ,analyticsmap );
			if("n".equalsIgnoreCase(analyticsmap.get("error"))){
				analyticsmap.put("signleentityid", entityids.substring(0, entityids.indexOf(",")));
				analyticsmap.put("categoryid",categoryid);
				if(!blockattack){
					if(!isRobot(request)){
						questionAnswerDAO.saveQuestionWithAnswer(analyticsmap);
					}
				}
			}

			model.addObject("scoreList" ,scoreList );
            model.addObject("rankingList" ,rankingList );
            model.addObject("entityIDList" ,entityIDList );
			model.addObject("chscidList" ,chscidList );
		}




		model.addObject("chscid" ,chscid );
		model.addObject("excludeCompare",excludeCompare);
		model.addObject("metricCategory" ,metricCategory );
		model.addObject("entityVerticalCategoryList" ,entityVerticalCategoryList );
		model.addObject("recordCount" ,noOfRow );
		model.addObject("topmenu",buildTopMenu(request));
		model.addObject("category",entityDAO.getLookupMap("entity.category").get(categoryid != null && ! "-1".equalsIgnoreCase(categoryid )  ? categoryid : "0") );
		model.addObject("categoryid",categoryid);

		model.addObject("year" , year );


		return model;
	}

	@RequestMapping("/spiderEntity")
	protected ModelAndView spiderEntity(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(true);
		Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");

		String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");
		String categoryid = request.getAttribute("categoryid") != null ? (String)  request.getAttribute("categoryid") :  (request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "-1");
		String action = request.getAttribute("action") != null ? (String)  request.getAttribute("action") :  (request.getParameter("action") != null ? request.getParameter("action") : "compare");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		String academic = applicationContext.getMessage("label.academic",new Object[] {},Locale.SIMPLIFIED_CHINESE);
		String sport = applicationContext.getMessage("label.sport",new Object[] {},Locale.SIMPLIFIED_CHINESE);
		String music = applicationContext.getMessage("label.music",new Object[] {},Locale.SIMPLIFIED_CHINESE);
		String campus = applicationContext.getMessage("label.campus",new Object[] {},Locale.SIMPLIFIED_CHINESE);
		String teacher = applicationContext.getMessage("label.teacher",new Object[] {},Locale.SIMPLIFIED_CHINESE);


		String [][] metricIndex = {{academic,sport,music,campus,teacher},{"Teacher","School Fee","Environment","Location","Courses"}};

		int metricIndexKey = "compareextracurricularactivities".equalsIgnoreCase(action) ? 1 : 0 ;
		theLogger.debug("spider entity " + request.getRequestURI());

		ModelAndView model = new ModelAndView("spiderChart");
		String entityids ="";
		if(entityid.contains(",")  && entityid.endsWith(","))
			entityids = entityid.substring(0,entityid.lastIndexOf(","));
		else
			entityids = entityid;

		if("-1".equalsIgnoreCase(categoryid)){
			if(entityids.contains(","))
				categoryid = "" + entityDAO.getCategoryEntity(entityids.substring(0, entityids.indexOf(",")));
			else
				categoryid = "" + entityDAO.getCategoryEntity(entityids);

		}

		List<Map<String, Object>> commentList = entityDAO.getCommentSpider(entityids,userid,categoryid,"");

		ArrayList<HashMap> spiderList = new ArrayList<HashMap>();
		HashMap<String,Object> tmp = new HashMap<String,Object>() ;
		HashMap<String,Object> tmpmax = new HashMap<String,Object>() ;

		JSONArray entity = new JSONArray();
		HashMap spiderMap = new HashMap();
		HashMap scoreMap = new HashMap();
		HashMap<String,Object> jsonMap = new HashMap<String,Object>();
        //HashMap<String,Object> jsonMapLastYear = new HashMap<String,Object>();

        //String entityid = "";
		if(commentList.size() > 0 ){
			tmp = (HashMap<String,Object>) commentList.get(0);
			spiderMap.put("name", tmp.get("name"));
			entityid = ((Integer) tmp.get("entityid")).toString() ;

			scoreMap.put("a", "0.0".equalsIgnoreCase(""+tmp.get("metric1")) ? "?" : tmp.get("metric1"));
			scoreMap.put("s", "0.0".equalsIgnoreCase(""+tmp.get("metric2")) ? "?" : tmp.get("metric2"));
			scoreMap.put("m", "0.0".equalsIgnoreCase(""+tmp.get("metric3")) ? "?" : tmp.get("metric3"));
			scoreMap.put("c", "0.0".equalsIgnoreCase(""+tmp.get("metric4")) ? "?" : tmp.get("metric4"));
			scoreMap.put("t", "0.0".equalsIgnoreCase(""+tmp.get("metric5")) ? "?" : tmp.get("metric5"));

            scoreMap.put("acurrentyear", "0.0".equalsIgnoreCase(""+tmp.get("currentyearmetric1")) ? "?" : tmp.get("currentyearmetric1"));
            scoreMap.put("scurrentyear", "0.0".equalsIgnoreCase(""+tmp.get("currentyearmetric2")) ? "?" : tmp.get("currentyearmetric2"));
            scoreMap.put("mcurrentyear", "0.0".equalsIgnoreCase(""+tmp.get("currentyearmetric3")) ? "?" : tmp.get("currentyearmetric3"));
            scoreMap.put("ccurrentyear", "0.0".equalsIgnoreCase(""+tmp.get("currentyearmetric4")) ? "?" : tmp.get("currentyearmetric4"));
            scoreMap.put("tcurrentyear", "0.0".equalsIgnoreCase(""+tmp.get("currentyearmetric5")) ? "?" : tmp.get("currentyearmetric5"));

            scoreMap.put("alastyear", "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric1")) ? "?" : tmp.get("lastyearmetric1"));
			scoreMap.put("slastyear", "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric2")) ? "?" : tmp.get("lastyearmetric2"));
			scoreMap.put("mlastyear", "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric3")) ? "?" : tmp.get("lastyearmetric3"));
			scoreMap.put("clastyear", "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric4")) ? "?" : tmp.get("lastyearmetric4"));
			scoreMap.put("tlastyear", "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric5")) ? "?" : tmp.get("lastyearmetric5"));

			scoreMap.put("lastyearranking", tmp.get("lastyearranking"));
			scoreMap.put("lastyearrankingfinancetype", tmp.get("lastyearrankingfinancetype"));
			scoreMap.put("lastyearrankingdistrict", tmp.get("lastyearrankingdistrict"));

			jsonMap.put(metricIndex[metricIndexKey][0], "0.0".equalsIgnoreCase(""+tmp.get("metric1")) ? 1 : tmp.get("metric1"));
			jsonMap.put(metricIndex[metricIndexKey][1], "0.0".equalsIgnoreCase(""+tmp.get("metric2")) ? 1 : tmp.get("metric2"));
			jsonMap.put(metricIndex[metricIndexKey][2], "0.0".equalsIgnoreCase(""+tmp.get("metric3")) ? 1 : tmp.get("metric3"));
			jsonMap.put(metricIndex[metricIndexKey][3], "0.0".equalsIgnoreCase(""+tmp.get("metric4")) ? 1 : tmp.get("metric4"));
			jsonMap.put(metricIndex[metricIndexKey][4], "0.0".equalsIgnoreCase(""+tmp.get("metric5")) ? 1 : tmp.get("metric5"));
/*
            jsonMapLastYear.put(metricIndex[metricIndexKey][0], "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric1")) ? 1 : tmp.get("lastyearmetric1"));
            jsonMapLastYear.put(metricIndex[metricIndexKey][1], "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric2")) ? 1 : tmp.get("lastyearmetric2"));
            jsonMapLastYear.put(metricIndex[metricIndexKey][2], "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric3")) ? 1 : tmp.get("lastyearmetric3"));
            jsonMapLastYear.put(metricIndex[metricIndexKey][3], "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric4")) ? 1 : tmp.get("lastyearmetric4"));
            jsonMapLastYear.put(metricIndex[metricIndexKey][4], "0.0".equalsIgnoreCase(""+tmp.get("lastyearmetric5")) ? 1 : tmp.get("lastyearmetric5"));
*/
		}else{
			spiderMap.put("name", "NO COMMENT YET");
			jsonMap.put(metricIndex[metricIndexKey][0], 1);
			jsonMap.put(metricIndex[metricIndexKey][1], 1);
			jsonMap.put(metricIndex[metricIndexKey][2], 1);
			jsonMap.put(metricIndex[metricIndexKey][3], 1);
			jsonMap.put(metricIndex[metricIndexKey][4], 1);
          /*
            jsonMapLastYear.put(metricIndex[metricIndexKey][0], 1);
            jsonMapLastYear.put(metricIndex[metricIndexKey][1], 1);
            jsonMapLastYear.put(metricIndex[metricIndexKey][2], 1);
            jsonMapLastYear.put(metricIndex[metricIndexKey][3], 1);
            jsonMapLastYear.put(metricIndex[metricIndexKey][4], 1);
            */
		}
		entity.add(jsonMap);
		spiderMap.put("json",entity);
		spiderMap.put("color","black" );
		spiderList.add(spiderMap);
        String attributename = "";
        String attributeval = "";

        for (Map.Entry<String, Object> entry : jsonMap.entrySet()) {
            attributename += "'" + entry.getKey() + "',";
            attributeval +=  entry.getValue() + ",";
        }
        model.addObject("attributename" ,attributename.substring(0,attributename.length() -1 ) );
        model.addObject("attributevalue" ,attributeval.substring(0,attributeval.length() -1 ) );

        //attributename="";
        //attributeval="";
        //for (Map.Entry<String, Object> entry : jsonMapLastYear.entrySet()) {
            //attributename += "'" + entry.getKey() + "',";
            //attributeval +=  entry.getValue() + ",";
        //}
        //model.addObject("attributenameLastYear" ,attributename.substring(0,attributename.length() -1 ) );
        //model.addObject("attributevaluelastyear" ,attributeval.substring(0,attributeval.length() -1 ) );


        entity = new JSONArray();
		spiderMap = new HashMap();
		jsonMap = new HashMap();
		theLogger.debug("commentList.size() " + commentList.size());
		theLogger.debug("previous entityid " + entityid);
		spiderMap.put("name", "Top School");
		jsonMap.put(metricIndex[metricIndexKey][0], 9.9);
		jsonMap.put(metricIndex[metricIndexKey][1], 9.9);
		jsonMap.put(metricIndex[metricIndexKey][2], 9.9);
		jsonMap.put(metricIndex[metricIndexKey][3], 9.9);
		jsonMap.put(metricIndex[metricIndexKey][4], 9.9);
		entity.add(jsonMap);
		spiderMap.put("json",entity );
		spiderMap.put("color","white" );
		spiderList.add(spiderMap);


		entity = new JSONArray();
		spiderMap = new HashMap();
		jsonMap = new HashMap();
		spiderMap.put("name", "Dummy");
		jsonMap.put(metricIndex[metricIndexKey][0], 0.1);
		jsonMap.put(metricIndex[metricIndexKey][1], 0.1);
		jsonMap.put(metricIndex[metricIndexKey][2], 0.1);
		jsonMap.put(metricIndex[metricIndexKey][3], 0.1);
		jsonMap.put(metricIndex[metricIndexKey][4], 0.1);
		entity.add(jsonMap);
		spiderMap.put("json",entity );
		spiderMap.put("color","white" );
		spiderList.add(spiderMap);

		model.addObject("spiderList" ,spiderList );
		model.addObject("scoreMap" ,scoreMap );


		return model;
	}
	@RequestMapping("/barEntity")
	protected ModelAndView barEntity(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");

		ModelAndView model = new ModelAndView("barChart");
		String entityids ="";
		if(entityid.contains(",")  && entityid.endsWith(","))
			entityids = entityid.substring(0, entityid.lastIndexOf(","));
		else
			entityids = entityid;

		model.addObject("poll",entityDAO.getParentScore(entityid));

		return model;
	}
	@RequestMapping("/pieChart")
	protected ModelAndView pieChart(HttpServletRequest request, HttpServletResponse response) throws Exception {


		ModelAndView model = new ModelAndView("pieChart");
		List<Map<String, Object>> schoolList = new ArrayList<Map<String, Object>>();
		String entityids ="";
		if(request.getAttribute("schoolList") != null && ! ((List) request.getAttribute("schoolList")).isEmpty() )
			schoolList = (List) request.getAttribute("schoolList");


		JSONArray entity = new JSONArray();
		HashMap pieChartMap = new HashMap();
		HashMap jsonMap = new HashMap();

		HashMap<String,Object> tmp = new HashMap<String,Object>();
		List pieChartList = new ArrayList();

		if(schoolList.size() > 0 ){
			for(int i=0; i<schoolList.size(); i++ ){
				tmp = (HashMap<String,Object>) schoolList.get(i);
				jsonMap = new HashMap();
				//jsonMap.put("x", (i + 1));
				//jsonMap.put("y", tmp.get("schoolallocation"));
				//jsonMap.put("tooltip", tmp.get("name"));
                jsonMap.put("name",tmp.get("name"));
                jsonMap.put("y",tmp.get("schoolallocation"));

                entity.add(jsonMap);
			}
			pieChartMap.put("json",entity);
			pieChartList.add(pieChartMap);
		}


		model.addObject("pieChartList" ,pieChartList );


		return model;
	}
	@RequestMapping("/commentConsole")
	protected ModelAndView getComment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String entityids ="";
		Map<String,String> paramMap = new HashMap<String,String>();
		HttpSession session = request.getSession(true);
		Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");

		String entityid = request.getAttribute("entityid") != null ? (String)  request.getAttribute("entityid") :  (request.getParameter("entityid") != null ? request.getParameter("entityid") : "-1");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		; 					//String type = "polling";

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


		ModelAndView model = new ModelAndView("commentConsole");
		if(entityid.contains(","))
			entityids = entityid.substring(0, entityid.indexOf(","));
		else
			entityids = entityid;

		model.addObject("entityid",entityids);
		model.addObject("comments", entityDAO.getComment(entityids,userid,"ALL"));
		model.addObject("systemcomment", entityDAO.getComment(entityids,userid,"SYSTEM"));
		//model.addObject("owncomments", entityDAO.getComment(entityids,paramMap.get("userid"),"OWN"));
		Map<String, Object> parentScore=entityDAO.getParentScore(entityid);
		//paramMap.put("type", "" + entityDAO.getLookupMap("polling.type").get("active") ); hardcoded here to gain better performance and pervent out of memory
		paramMap.put("entityid", entityid);
		paramMap.put("userid", userid);
		paramMap.put("ip", ip);
		paramMap.put("type", "polling");

		//model.addObject("polled", entityDAO.isPolled(paramMap) ? "y" : "n");

		model.addObject("poll",parentScore);
		entityDAO.updateEntityParentMetric(entityids, ((BigDecimal) parentScore.get("metric1")).toString() , ((BigDecimal)parentScore.get("metric2")).toString() ,  ((BigDecimal)parentScore.get("metric3")).toString() ,  ((BigDecimal) parentScore.get("metric4")).toString(),  ((Long) parentScore.get("noofparent")).toString()  );
		model.addObject("pollingtype",paramMap.get("type"));

		String tmpParentComment =generateParentComment(parentScore,request);
		model.addObject("parentscorecomment",tmpParentComment);
		model.addObject("schoolparentcount",userDAO.getSchoolParentCount(entityid));
		model.addObject("yourscore",entityDAO.getYourScore(entityid,userid,ip ));
		/*
		List<Map<String, Object>> commentVS = entityDAO.getCommentVS(entityids,paramMap.get("userid"));
		if(commentVS.size() > 1)
			commentVS.get(1).put("COMMENT",tmpParentComment );
		model.addObject("commentVS", commentVS);
		*/
		return model;
	}
	@RequestMapping("/saveComment")
	protected ModelAndView saveComment(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String usercomment = request.getParameter("usercommenttext") != null ? request.getParameter("usercommenttext") : "-1";

        //check for usercomment and prevent spam attack, block message is "http://www for example
        if(usercomment.contains(blockmessage) || isFoulLanguage(usercomment)){
        	theLogger.info("Foul Language " + usercomment);
            return null;
        }
        theLogger.debug("Inside save comment ");
		Map<String,String> paramMap = extractCommentParam(request);
		String commentid = request.getParameter("commentid") != null && request.getParameter("commentid").trim().length() > 0 ? request.getParameter("commentid") : "-1";
		String schoolname = request.getParameter("schoolname") != null ? request.getParameter("schoolname") : "";
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());

		String defaultmsg = applicationContext.getMessage("label.optionalcomment",new Object[] {},Locale.SIMPLIFIED_CHINESE).trim();
		String defaultmsgeng = applicationContext.getMessage("label.optionalcomment",new Object[] {},Locale.ENGLISH ).trim();

		String parentrating = applicationContext.getMessage("label.parentrating",new Object[] {},Locale.SIMPLIFIED_CHINESE).trim();
		theLogger.debug("Polling type " + request.getParameter("type"));
		theLogger.debug("Metric 1 " + request.getParameter("metric1"));
		theLogger.debug("Metric 2 " + request.getParameter("metric2"));
		theLogger.debug("Polling usercommenttext " + request.getParameter("usercommenttext"));

		if("polling".equalsIgnoreCase(paramMap.get("type"))){
			Map<String,Object> parentScore = new HashMap<String,Object>();
			parentScore.put("single","y");
			parentScore.put("name", ""  );
			try{
				parentScore.put("metric1", new BigDecimal (Integer.parseInt(paramMap.get("metric1")))  );
			}catch(Exception ex){
				parentScore.put("metric1", new BigDecimal (Integer.parseInt("0"))  );
				paramMap.put("metric1", "0");
			}
			try{
				parentScore.put("metric2", new BigDecimal (Integer.parseInt(paramMap.get("metric2")))  );
			}catch(Exception ex){
				parentScore.put("metric2", new BigDecimal (Integer.parseInt("0"))  );
				paramMap.put("metric2", "0");
			}
			try{
				parentScore.put("metric3", new BigDecimal (Integer.parseInt(paramMap.get("metric3")))  );
			}catch(Exception ex){
				parentScore.put("metric3", new BigDecimal (Integer.parseInt("0"))  );
				paramMap.put("metric3", "0");
			}
			try{
				parentScore.put("metric4", new BigDecimal (Integer.parseInt(paramMap.get("metric4")))  );
			}catch(Exception ex){
				parentScore.put("metric4", new BigDecimal (Integer.parseInt("0"))  );
				paramMap.put("metric4", "0");
			}

			String comment = usercomment;
			if("-1".equalsIgnoreCase(usercomment) || defaultmsg.equalsIgnoreCase(usercomment.trim()) || defaultmsgeng.equalsIgnoreCase(usercomment.trim()) ||  usercomment.startsWith(parentrating) ){
					comment =  paramMap.get("comment") +":" + generateParentComment( parentScore, request) ;
					paramMap.put("userlike","0");
			}else {
					comment = usercomment;
					paramMap.put("userlike","2");
					//if(usercomment.trim().length() > 10)
					//paramMap.put("userlike",  "" + usercomment.trim().length()); // User typed comment will have higher rate!!
			}
			paramMap.put("comment",  comment );

			//Auto create parent in question and answer section.
			HashMap<String,String> parentcomment = new HashMap<String,String>();
			parentcomment.put("subject", parentrating + " : " +  schoolname);
			parentcomment.put("active", "y");
			parentcomment.put("question", paramMap.get("subject")); //as subject pls help ...
			parentcomment.put("answer", comment);
			parentcomment.put("signleentityid",  paramMap.get("entityid"));
			parentcomment.put("tag1", parentrating  );
			parentcomment.put("userid", paramMap.get("userid"));
			parentcomment.put("userlike", paramMap.get("userlike"));
			parentcomment.put("ipaddr", paramMap.get("ip"));
			parentcomment.put("categoryid", paramMap.get("categoryid"));

			try{
				if( Integer.parseInt(paramMap.get("userlike")) > 1 && Integer.parseInt(paramMap.get("metric1")) > 0 && Integer.parseInt(paramMap.get("metric2")) > 0 &&  Integer.parseInt(paramMap.get("metric3")) > 0 &&  Integer.parseInt(paramMap.get("metric4")) > 0  ){
					//questionAnswerDAO.saveQuestionWithAnswer(parentcomment);
					String key = questionAnswerDAO.saveQuestionWithAnswer(parentcomment);
					entityDAO.getEntityHitCount(key,"forum");
				}
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		else if( ("" + paramMap.get("type")).startsWith("polling")){
			paramMap.put("comment",  usercomment );
		}
		entityDAO.saveComment(paramMap);
		// Update current session userscore / parentratingcount
		if("polling".equalsIgnoreCase(paramMap.get("type")) && ! "-1".equalsIgnoreCase(paramMap.get("grade")) && ! "-1".equalsIgnoreCase(commentid) ){
			HttpSession session = request.getSession(true);
			Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");
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
		return getEntityDetails(request,response);
	}


	@RequestMapping("/likeComment/{id}/{action}")
	protected ResponseEntity<String> likeComment(@PathVariable String id,@PathVariable String action, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		; 					ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());

		String defaultmsg = applicationContext.getMessage("label.thankyoucomment",new Object[] {},Locale.SIMPLIFIED_CHINESE).trim();


		entityDAO.likeComment(id,"like".equalsIgnoreCase(action) ? true : false, userid );

		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");

	    return new ResponseEntity<String>(defaultmsg, responseHeaders, HttpStatus.CREATED);

	}
	private Map<String,String> generateAnalytics(ApplicationContext applicationContext, String entityids) throws Exception {

		HashMap<String,String> result = new HashMap<String,String>();

		theLogger.debug("1 generateAnalytics ... ");
		try{
		String schoolvsname = "";
		String schoolvsnamekeyword = "";

		String moreinfo="";
		String analytics="";
		String orderkey="";
		String firstschoolid="";
		String firstschoolname="";
		String secondschoolname="";
		String firstschoolfee="";
		String firstschoolfacilities="";
		String firstschoollanguage="";
		String firstschoolfinancetype="";
		String firstschoolsex="";
		String secondschoolsex="";
		String firstteacherpupilratio = "";
		String area="";
		String categoryid = "";
		String analyticsdesc ="";
		String answer="";
		String feeder = "";
		String nominated = "";
		String throughtrain = "";

		float[] firstmetricscore = {0,0,0,0,0,0};

		String[] firstmetric = {"","","","","",""};
		firstmetric[0] = applicationContext.getMessage("label.academic", new Object[] {}, Locale.SIMPLIFIED_CHINESE);
		firstmetric[1] = applicationContext.getMessage("label.sport", new Object[] {}, Locale.SIMPLIFIED_CHINESE);
		firstmetric[2] = applicationContext.getMessage("label.music", new Object[] {}, Locale.SIMPLIFIED_CHINESE);
		firstmetric[3] = applicationContext.getMessage("label.campus", new Object[] {}, Locale.SIMPLIFIED_CHINESE);
		firstmetric[4] = applicationContext.getMessage("label.teacher", new Object[] {}, Locale.SIMPLIFIED_CHINESE);
		firstmetric[5] = applicationContext.getMessage("label.schoolfee", new Object[] {}, Locale.SIMPLIFIED_CHINESE);
		String firstmetrictext="";
		String secondmetrictext="";

		theLogger.debug("2 generateAnalytics ... ");

   	    List<Map<String, Object>> entityList = entityDAO.getSchoolCompareAnalyticsList(entityids);
   	   theLogger.debug("3 generateAnalytics entityList ... " + entityList.size());

   	    if(entityList.size() > 1){
			for(int i=0; i<entityList.size();i++ ){
				Map<String, Object> entity = entityList.get(i);
				schoolvsname += (String) entity.get("name") + " vs ";
				if(i==0){
					categoryid = "" + entity.get("categoryid");
					firstschoolname =  (String) entity.get("name") ;
					firstschoolfee = "" + entity.get("fschoolfee");
					firstschoolsex = (String) entity.get("sex");
					//theLogger.debug("generateAnalytics noofotherroom: " + entity.get("noofotherroom"));
					firstschoolfacilities = "" + ("0".equalsIgnoreCase(categoryid) ? entity.get("noofotherroom") : entity.get("noofspecialroom"));
					//theLogger.debug("generateAnalytics firstschoolfacilities: " + firstschoolfacilities);

					area="" + entity.get("area");
					firstschoollanguage = "" + entity.get("language");
					firstschoolfinancetype = "" + entity.get("financetype");
					feeder = "" + entity.get("feeder");
					nominated = "" + entity.get("nominated");
					throughtrain = ""+ entity.get("throughtrain");

					firstschoolid = "" + entity.get("id");
					firstteacherpupilratio = "" + entity.get("teacherpupilam");
					for(int j=0;j<5;j++){
						firstmetricscore[j] = ((BigDecimal) entity.get("metric" + (j+1))).floatValue();
						if("0".equalsIgnoreCase(categoryid) && (j==1 || j==2) ){
							firstmetric[j] = "empty";
						}
					}
					//theLogger.debug("First " + entity.get("nameeng") + "===" + firstmetricscore[0] +"/"+ firstmetricscore[1] +"/"+ firstmetricscore[2] +"/"+ firstmetricscore[3] +"/"+ firstmetricscore[4] +"\n");

				}else{
					for(int k=0;k<5;k++){
						//theLogger.debug("Record " + entity.get("nameeng") + "---firstmetricscore " + k + ":" + firstmetricscore[k] + " smaller than " + entity.get("metric" + (k+1)) +"\n");

						if(firstmetricscore[k] < ((BigDecimal) entity.get("metric" + (k+1))).floatValue() ){

							if(i==1){
							    secondmetrictext += "empty".equalsIgnoreCase(firstmetric[k]) ? "" : firstmetric[k] + "\uFF0C";
						    }
							firstmetric[k] = "empty";
						}
					}
				}
				if(i==1){
					secondschoolname = (String) entity.get("name");
					secondschoolsex  = (String) entity.get("sex");
				}
			}

			for(int j=0;j<5;j++){
				if(! "empty".equalsIgnoreCase(firstmetric[j])  ){
					firstmetrictext += firstmetric[j] + "\uFF0C" ;
				}
			}
			if(firstmetrictext.length() > 1)
				firstmetrictext = firstmetrictext.substring(0,firstmetrictext.length()-1);
			if(secondmetrictext.length() > 1)
				secondmetrictext = secondmetrictext.substring(0,secondmetrictext.length()-1);

			if(schoolvsname.trim().length() > 2){
				schoolvsname = schoolvsname.trim();
				schoolvsname = schoolvsname.substring(0, schoolvsname.length() - 2);
				schoolvsnamekeyword = schoolvsname;
				schoolvsname = "<font class=\"fontxxlarge fontbold\">" + schoolvsname + "</font>";
			}
			String analyticsbetter1=applicationContext.getMessage("analytics.better1", new Object[] {firstmetrictext,firstschoolname }, Locale.SIMPLIFIED_CHINESE);
			String analyticsbetter2= secondmetrictext.trim().length() > 0 ?  applicationContext.getMessage("analytics.better2", new Object[] {secondmetrictext}, Locale.SIMPLIFIED_CHINESE) : "";
			String analyticsschoolfeefacilities="";
			//theLogger.debug("generateAnalytics firstschoolfacilities2: " + firstschoolfacilities);


			if("\u975E\u725F\u5229".equalsIgnoreCase(firstschoolfinancetype))
				analyticsschoolfeefacilities=applicationContext.getMessage("analytics.schoolfeefacilitiesnonprofit", new Object[] {firstteacherpupilratio,firstschoolfacilities }, Locale.SIMPLIFIED_CHINESE);
			else{
				if("0".equalsIgnoreCase(categoryid))
					analyticsschoolfeefacilities=applicationContext.getMessage("analytics.schoolfeefacilities0", new Object[] {firstschoolfee,firstteacherpupilratio,firstschoolfacilities }, Locale.SIMPLIFIED_CHINESE);
				else
					analyticsschoolfeefacilities=applicationContext.getMessage("analytics.schoolfeefacilities", new Object[] {firstschoolfee,area,firstschoolfacilities }, Locale.SIMPLIFIED_CHINESE);

			}
			String analyticsconclusion="";
			if("0".equalsIgnoreCase(categoryid)){
				if(firstschoolname.contains("\u570B\u969B") || firstschoolname.toLowerCase().contains("international")) //international kindergarten
					analyticsconclusion=applicationContext.getMessage("analytics.conclusioninternational0", new Object[] {firstschoolname}, Locale.SIMPLIFIED_CHINESE);
				else
					analyticsconclusion=applicationContext.getMessage("analytics.conclusion0", new Object[] {firstschoolname}, Locale.SIMPLIFIED_CHINESE);
			}else{
				//theLogger.debug("generateAnalytics categoryid " + categoryid);
				//theLogger.debug("generateAnalytics throughtrain + nominated + feeder " + throughtrain + nominated + feeder);

				if("1".equalsIgnoreCase(categoryid) &&  (
							(throughtrain != null && throughtrain.trim().length() > 0 && ! "null".equalsIgnoreCase(throughtrain.trim()))
						|| (feeder != null && feeder.trim().length() > 0 && ! "null".equalsIgnoreCase(feeder.trim()))
						|| (nominated != null && nominated.trim().length() > 0 && ! "null".equalsIgnoreCase(nominated.trim()))
						)){
					theLogger.debug("analytics.conclusionsecondarysextrain true ? " + "1".equalsIgnoreCase(categoryid));
					analyticsconclusion=applicationContext.getMessage("analytics.conclusionsecondarysextrain", new Object[] {firstschoolname,throughtrain + nominated + feeder,firstschoolname,firstschoolsex,firstschoollanguage}, Locale.SIMPLIFIED_CHINESE);
				}else if(firstschoolfinancetype.contains("\u76F4\u8CC7") || firstschoolfinancetype.contains("\u79C1\u7ACB") ){ //private school
					analyticsconclusion=applicationContext.getMessage("analytics.conclusionfinance", new Object[] {firstschoolname,firstschoolfinancetype,firstschoolsex,firstschoollanguage,firstschoolname}, Locale.SIMPLIFIED_CHINESE);
				}else{
					analyticsconclusion=applicationContext.getMessage("analytics.conclusiongov", new Object[] {firstschoolname,firstschoolfinancetype,firstschoolsex,firstschoollanguage,firstschoolname}, Locale.SIMPLIFIED_CHINESE);
				}
				if(firstschoolsex.contains(secondschoolsex) || secondschoolsex.contains(firstschoolsex) ){ // sex matching
					analyticsconclusion+=applicationContext.getMessage("analytics.conclusionsecond", new Object[] {secondschoolname}, Locale.SIMPLIFIED_CHINESE);
				}
			}

			moreinfo = "<div class=\"qamoreinfo\"><a class=\"commentschoolcompareqa\" href=\"/school/controller/schoolCompare?entityids=" + entityids + "\" rel=\"#overlay\" >\u8A73\u60C5\u5206\u6790</a></div>";
			answer = analyticsbetter1 + analyticsbetter2 + analyticsschoolfeefacilities + "<br>" + analyticsconclusion;
			analytics = schoolvsname + "<br><br><font class=\"fontxxlarge\">"  + analyticsbetter1 + analyticsbetter2 + analyticsschoolfeefacilities + "<br><br>" + analyticsconclusion + "</font>";
			analyticsdesc  = schoolvsnamekeyword + " " + analyticsbetter1 + analyticsbetter2 + analyticsschoolfeefacilities + " " + analyticsconclusion;

	    }else{
	    	analytics = "n\\a";
	    }
   	    String schoolcategory = entityDAO.getLookupMap("entity.category.chi").get(categoryid) ;
		String subject = "\u5982\u4F55\u6BD4\u8F03" + schoolvsnamekeyword.replaceAll(" vs ", "\uFF0C") + "\u9019" + entityList.size() + "\u9593" + schoolcategory + "?";
		if(subject.length() > 1000){
			subject = subject.substring(0,999);
		}
   	    result.put("content", analytics);
		result.put("keyword", schoolvsnamekeyword + " \u6BD4\u8F03" );
		result.put("title", schoolvsnamekeyword);
		result.put("desc", analyticsdesc);
		result.put("subject", subject );
		result.put("active", "y");
		result.put("question", "\u5982\u984C\uFF0C\u8ACB\u5E6B\u5FD9");
		result.put("answer", answer + moreinfo);
		result.put("entityid", firstschoolid);
		result.put("tag1", schoolcategory + "VS");
		result.put("tag2", schoolcategory + "\u6BD4\u8F03");
		result.put("userid", "1");
		result.put("userlike", "0");
		result.put("error", "n");

   	    return result;
		}catch(Exception ex){
			ex.printStackTrace();
			result.put("error", "y");
			return result;
		}
	}
	@RequestMapping("/getSecondaryListForm")
	protected ModelAndView getSecondaryListForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView model = new ModelAndView("entity/secondaryListForm");
		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		String roleid = user != null && user.get("ROLEID") != null &&  (Integer) user.get("ROLEID") > 0  ? ((Integer) user.get("ROLEID")).toString()  : "-1";
		List<Map<String, Object>> school = (List<Map<String, Object>>)  entityDAO.getSecondarySchoolList("", "", roleid, "");
		model.addObject("schoolList", school);

		return model;
	}
    @RequestMapping("/getPrimaryListForm")
    protected ModelAndView getPrimaryListForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ModelAndView model = new ModelAndView("entity/primaryListForm");
        List<Map<String, Object>> school = (List<Map<String, Object>>)  entityDAO.getPrimarySchoolList("", "", "", "");
        model.addObject("schoolList", school);

        return model;
    }
	@RequestMapping("/saveSecondaryListForm")
	protected ModelAndView saveSchoolListForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView model = new ModelAndView("adminConsole");

		HttpSession session = request.getSession(true);
		Map user = (Map) session.getAttribute("user");
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		; 					String roleid = user != null && user.get("ROLEID") != null &&  (Integer) user.get("ROLEID") > 0  ? ((Integer) user.get("ROLEID")).toString()  : "-1";

		if("1".equalsIgnoreCase(userid) || "5".equals(roleid)){
			request.setCharacterEncoding("UTF-8");
			String[] id = request.getParameterValues("id") != null ? request.getParameterValues("id") : new String[] {""};
			String[] banding = request.getParameterValues("banding") != null ? request.getParameterValues("banding") : new String[] {""};
			String[] alpassrate = request.getParameterValues("alpassrate") != null ? request.getParameterValues("alpassrate") : new String[] {""};
			String[] chipassrate = request.getParameterValues("chipassrate") != null ? request.getParameterValues("chipassrate") : new String[] {""};
			String[] engpassrate = request.getParameterValues("engpassrate") != null ? request.getParameterValues("engpassrate") : new String[] {""};
			String[] urate = request.getParameterValues("urate") != null ? request.getParameterValues("urate") : new String[] {""};
			String[] sixcoursesratio = request.getParameterValues("sixcoursesratio") != null ? request.getParameterValues("sixcoursesratio") : new String[] {""};
			String[] hkdsepassrate = request.getParameterValues("hkdsepassrate") != null ? request.getParameterValues("hkdsepassrate") : new String[] {""};
			String[] teacherforeign = request.getParameterValues("teacherforeign") != null ? request.getParameterValues("teacherforeign") : new String[] {""};
			String[] musicfirst = request.getParameterValues("musicfirst") != null ? request.getParameterValues("musicfirst") : new String[] {""};
			String[] musicsecond = request.getParameterValues("musicsecond") != null ? request.getParameterValues("musicsecond") : new String[] {""};
			String[] musicthird = request.getParameterValues("musicthird") != null ? request.getParameterValues("musicthird") : new String[] {""};
			String[] musicother = request.getParameterValues("musicother") != null ? request.getParameterValues("musicother") : new String[] {""};
			String[] speechfirst = request.getParameterValues("speechfirst") != null ? request.getParameterValues("speechfirst") : new String[] {""};
			String[] speechsecond = request.getParameterValues("speechsecond") != null ? request.getParameterValues("speechsecond") : new String[] {""};
			String[] speechthird = request.getParameterValues("speechthird") != null ? request.getParameterValues("speechthird") : new String[] {""};

			theLogger.debug("saveSchoolListForm size " + request.getParameterValues("id").length);
			HashMap<String,String> school = new HashMap<String,String>();
			for(int i=0;i<id.length;i++){
				school = new HashMap<String,String>();
				if(id[i] != null && chipassrate[i] !=null && engpassrate[i] != null &&  urate[i] != null &&  hkdsepassrate[i] != null  ){
					school.put("id",id[i]);
					school.put("banding",banding[i]);
					school.put("sixcoursesratio",sixcoursesratio[i]);
					school.put("alpassrate",alpassrate[i]);
					school.put("chipassrate",chipassrate[i]);
					school.put("engpassrate",engpassrate[i]);
					school.put("urate",urate[i]);
					school.put("hkdsepassrate",hkdsepassrate[i]);
					school.put("teacherforeign",teacherforeign[i]);
					school.put("musicfirst",musicfirst[i]);
					school.put("musicsecond",musicsecond[i]);
					school.put("musicthird",musicthird[i]);
					school.put("musicother",musicother[i]);
					school.put("speechfirst",speechfirst[i]);
					school.put("speechsecond",speechsecond[i]);
					school.put("speechthird",speechthird[i]);
					school.put("userid", userid);
                    school.put("year", getRankingYear());
                    school.put("roleid",roleid);
					entityDAO.saveEntity(school);
				}
			}


			Calendar calendar = Calendar.getInstance();
			int iyear = calendar.get(Calendar.YEAR);
			int	imonth =  calendar.get(Calendar.MONTH);

			model.addObject("userList",userDAO.getUserList() );
			model.addObject("eventList",eventDAO.getEventList(iyear,imonth+1,true,"","") );
		}
		return model;
	}
    @RequestMapping("/savePrimaryListForm")
    protected ModelAndView savePrimaryListForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ModelAndView model = new ModelAndView("adminConsole");

        HttpSession session = request.getSession(true);
        Map user = (Map) session.getAttribute("user");
        String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		; 			        if(isSignIn(session)){
            request.setCharacterEncoding("UTF-8");
            String[] id = request.getParameterValues("id") != null ? request.getParameterValues("id") : new String[] {""};
            String[] vacancy = request.getParameterValues("vacancy") != null ? request.getParameterValues("vacancy") : new String[] {""};
            String[] admitted = request.getParameterValues("admitted") != null ? request.getParameterValues("admitted") : new String[] {""};


            theLogger.debug("savePrimaryListForm size " + request.getParameterValues("id").length);
            HashMap<String,String> school = new HashMap<String,String>();
            for(int i=0;i<id.length;i++){
                school = new HashMap<String,String>();
                if(id[i] != null  ){
                    school.put("id",id[i]);
                    school.put("vacancy",vacancy[i]);
                    school.put("admitted",admitted[i]);
                    school.put("year", getRankingYear());
                    school.put("userid", userid);
                    try {
                        theLogger.debug("Diff {}" , (Integer.parseInt(vacancy[i]) - Integer.parseInt(admitted[i])) );
                        theLogger.debug("Diff * 100  / {} {}" , Integer.parseInt(vacancy[i]), (Integer.parseInt(vacancy[i]) - Integer.parseInt(admitted[i])) * 100   / Integer.parseInt(vacancy[i]) );

                        school.put("exceedquota", "" + ((Integer.parseInt(vacancy[i]) - Integer.parseInt(admitted[i])) * 100 / Integer.parseInt(vacancy[i])) );
                    }catch(Exception ex){
                        //ex.printStackTrace();
                        school.put("exceedquota", "0");
                    }
                    entityDAO.saveEntity(school);
                }
            }


            Calendar calendar = Calendar.getInstance();
            int iyear = calendar.get(Calendar.YEAR);
            int	imonth =  calendar.get(Calendar.MONTH);

            model.addObject("userList",userDAO.getUserList() );
            model.addObject("eventList",eventDAO.getEventList(iyear,imonth+1,true,"","") );
        }
        return model;
    }
	public String generateParentComment(Map<String, Object> parentScore, HttpServletRequest request){
		StringBuffer result = new StringBuffer();
		int metric1=0;
		int metric2=0;
		int metric3=0;
		int metric4=0;
		//int metric5=0;
		//int metric6=0;
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());

		if( ! "0".equalsIgnoreCase( "" + parentScore.get("noofparent")) ){
			try{
				metric1=((BigDecimal) parentScore.get("metric1")).intValue();
				metric2=((BigDecimal) parentScore.get("metric2")).intValue();
				metric3=((BigDecimal) parentScore.get("metric3")).intValue();
				metric4=((BigDecimal) parentScore.get("metric4")).intValue();
				//metric5=((BigDecimal) parentScore.get("metric5")).intValue();
				//metric6=((BigDecimal) parentScore.get("metric6")).intValue();
			}catch (Exception ex){
				theLogger.debug("Rating conversation exception  " + ex.toString());
			}
			String start = "<b>" + applicationContext.getMessage("label.parentrating",new Object[] {},Locale.SIMPLIFIED_CHINESE) + "</b> : ";
			String count = applicationContext.getMessage("label.noofparentpoll2",new Object[] {parentScore.get("noofparent")},Locale.SIMPLIFIED_CHINESE)+ "\uFF0C";
			String thisschool = applicationContext.getMessage("label.thisschool",new Object[] {parentScore.get("name")},Locale.SIMPLIFIED_CHINESE);
			
			String school = applicationContext.getMessage("label.school." + pollScoreToComment(metric1) ,new Object[] {},Locale.SIMPLIFIED_CHINESE) + "\uFF0C";
			String teacher = applicationContext.getMessage("label.parentmetric2",new Object[] {},Locale.SIMPLIFIED_CHINESE) + applicationContext.getMessage("label.teacher." + pollScoreToComment(metric2) ,new Object[] {},Locale.SIMPLIFIED_CHINESE) + "\u3002";
			String studentandhomeworkaspect = applicationContext.getMessage("label.studenthomework",new Object[] {},Locale.SIMPLIFIED_CHINESE);
			String homework = applicationContext.getMessage("label.parentmetric3",new Object[] {},Locale.SIMPLIFIED_CHINESE) + applicationContext.getMessage("label.quantity",new Object[] {},Locale.SIMPLIFIED_CHINESE) + applicationContext.getMessage("label.homework." + pollScoreToComment(metric3) ,new Object[] {},Locale.SIMPLIFIED_CHINESE) + "\uFF0C";
			String stduent = applicationContext.getMessage("label.parentmetric4",new Object[] {},Locale.SIMPLIFIED_CHINESE) + applicationContext.getMessage("label.conduct",new Object[] {},Locale.SIMPLIFIED_CHINESE) + applicationContext.getMessage("label." + pollScoreToComment(metric4) ,new Object[] {},Locale.SIMPLIFIED_CHINESE) + "\u3002";
			String voteresult = applicationContext.getMessage("label.voteaverage",new Object[] {},Locale.SIMPLIFIED_CHINESE) +   parentScore.get("parentscore")  + "\u3002";
			
			if(! "y".equalsIgnoreCase((String) parentScore.get("single"))){
				result.append(start).append(count);
			}
			result.append(thisschool).append(metric1 > 5 ? school : "").append(metric2 > 5 ? teacher : "").append((metric3 > 5  || metric4 > 5) ? studentandhomeworkaspect : "").append(metric3 > 5 ? homework : "").append(metric4 > 5 ? stduent :  "");
			
			if(! "y".equalsIgnoreCase((String) parentScore.get("single"))){
				result.append(voteresult);
			}	
			
			if(metric1 < 5 && metric2 < 5 && metric3 < 5 && metric4 < 5){
				result = new StringBuffer();
				result.append(applicationContext.getMessage("label.parentmetric1" ,new Object[] {},Locale.SIMPLIFIED_CHINESE) + "\uFF0C");
				result.append(applicationContext.getMessage("label.parentmetric2" ,new Object[] {},Locale.SIMPLIFIED_CHINESE) + "\uFF0C");
				result.append(applicationContext.getMessage("label.parentmetric3" ,new Object[] {},Locale.SIMPLIFIED_CHINESE) + "\uFF0C");
				result.append(applicationContext.getMessage("label.parentmetric4" ,new Object[] {},Locale.SIMPLIFIED_CHINESE));
				result.append(applicationContext.getMessage("label.overall" ,new Object[] {},Locale.SIMPLIFIED_CHINESE));
				result.append(applicationContext.getMessage("label." + pollScoreToComment(5) ,new Object[] {},Locale.SIMPLIFIED_CHINESE));
			}
		}
		return result.toString();
	}
	private String pollScoreToComment(int score){
		
		if(score <= 2 )
			return "poor";
		else if(score <= 4 )
			return "bad";
		else if(score <= 6 )
			return "average";
		else if(score <= 8 )
			return "good";
		else
			return "excellent";
	}
	
	@RequestMapping("/kidEducationConsole")
	protected ModelAndView getKidEducationConsole(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView model = new ModelAndView("entity/kidEducation");
		model.addObject("hitcount",entityDAO.getEntityHitCount("1","kidedu"));
		initStaticData(request);
		return model;
	}

    private boolean isSignIn(HttpSession session){

        boolean result=false;
        Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");
        String userid = "-1";
        try {
            userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1";
        }catch(Exception ex){}
        if("-1".equalsIgnoreCase(userid))
            result = false;
        else
            result =true;

        return result;
    }

    @RequestMapping("/getSynchronizationForm")
    protected ModelAndView getSynchronizationForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView model = new ModelAndView("common/synchronization");
        return model;
    }
    @RequestMapping("/testing")
    protected ModelAndView testing(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView model = new ModelAndView("common/testing");
        return model;
    }

}
