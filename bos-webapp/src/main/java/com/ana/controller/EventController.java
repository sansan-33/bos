package com.ana.controller;

import nl.captcha.Captcha;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller(value="eventController")
public class EventController extends BaseController {

    private final Logger theLogger = LoggerFactory.getLogger(EventController.class);

	@RequestMapping("/eventCalendar")
	protected ModelAndView getEventCalendar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(true);
		if(session.getAttribute("autoEventPopUp") != null )
			session.setAttribute("autoEventPopUp", "n");
		else	
			session.setAttribute("autoEventPopUp", "y");
	
		
		ModelAndView model = new ModelAndView("event/eventCalendar");	
		Calendar calendar = Calendar.getInstance();
		String month = request.getParameter("month") != null ? request.getParameter("month").trim() : "";
		String year = request.getParameter("year") != null ? request.getParameter("year").trim()  : "";
		String eventType = request.getAttribute("eventType") != null ? (String) request.getAttribute("eventType") : (request.getParameter("eventType") != null ? request.getParameter("eventType") :  "");
		theLogger.debug("month " + month );
		int imonth = 0;
		int iyear = 0;
		try{
			imonth = Integer.parseInt(month);
		}catch(Exception ex){
			imonth =  calendar.get(Calendar.MONTH); 
		}
		try{
			iyear = Integer.parseInt(year);
		}catch(Exception ex){
			iyear = calendar.get(Calendar.YEAR) ;
		}
		theLogger.debug("month " + imonth );
		theLogger.debug("year " + iyear );
		
		calendar.set(Calendar.YEAR , iyear);
		calendar.set(Calendar.MONTH, imonth);
		calendar.set(Calendar.DAY_OF_MONTH, 1);

		theLogger.debug("calendar.getTime() " + calendar.getTime());
		theLogger.debug("getFirstDayOfWeek() " + calendar.getFirstDayOfWeek() );
		//theLogger.debug("getWeekYear() " + calendar.getWeekYear() );
		theLogger.debug("DAY_OF_WEEK_IN_MONTH " + calendar.get(Calendar.DAY_OF_WEEK) );
		theLogger.debug("WEEK_OF_YEAR " + calendar.get(Calendar.WEEK_OF_YEAR) );
		theLogger.debug("calendar.getActualMaximum(Calendar.DATE) " + calendar.getActualMaximum(Calendar.DATE) );
		
		
		//The day-of-week is an integer value where 1 is Sunday, 2 is Monday, ..., and 7 is Saturday 
		int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
		int dayOfMonth = -1 * dayOfWeek + 2;
		int weekYear = calendar.get(Calendar.WEEK_OF_YEAR);
		int lastDate = calendar.getActualMaximum(Calendar.DATE);
		ArrayList<Map<String,String>> weekList = new ArrayList<Map<String,String>>();
		
		for(int i=0; i<5; i++){
			HashMap<String,String> weekMap = new HashMap<String,String>();
			weekMap.put("week", "" + (weekYear++));
			for(int j=0; j<7; j++){
				if(dayOfMonth > 0 && dayOfMonth <= lastDate )
					weekMap.put( "" + j , "" + dayOfMonth);
				else
					weekMap.put( "" + j , "&nbsp;");
				dayOfMonth++;	
			}
			weekList.add(weekMap);
		}
		
		DateFormat df = new SimpleDateFormat("MMM yyyy");
		Date target = calendar.getTime();       
		
		model.addObject("title", df.format(target) );
		model.addObject("currentmonth",  calendar.get(Calendar.MONTH) );
		model.addObject("currentyear",  calendar.get(Calendar.YEAR) );
		
		calendar.add(Calendar.MONTH, -1);// minus one month 
		model.addObject("prevyear", calendar.get(Calendar.YEAR) );
		model.addObject("prevmonth",  calendar.get(Calendar.MONTH) );
		calendar.add(Calendar.MONTH, +2);// add two month 
		model.addObject("nextyear", calendar.get(Calendar.YEAR) );
		model.addObject("nextmonth", calendar.get(Calendar.MONTH) );
		
		
		// because month start with 0, i.e. january = 0
		model.addObject("eventsMap", "list".equalsIgnoreCase(eventType) ? eventDAO.getEventList(-1,iyear,false,"","") : getEventsMap(imonth+1,iyear));
		model.addObject("weekList", weekList);
		model.addObject("eventType","calendar");
		model.addObject("hitcount",entityDAO.getEntityHitCount("1","eventCalendar"));
		if(request.getAttribute("event") != null){
			
			session.setAttribute("event", request.getAttribute("event"));
			model.addObject("popup","y");
		}
		initStaticData(request);
		return model;
	}
    @RequestMapping("/eventFullCalendar")
    protected ModelAndView getEventFullCalendar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        if(session.getAttribute("autoEventPopUp") != null )
            session.setAttribute("autoEventPopUp", "n");
        else
            session.setAttribute("autoEventPopUp", "y");


        Calendar calendar = Calendar.getInstance();
        String month = request.getParameter("month") != null ? request.getParameter("month").trim() : "";
        //String year = request.getParameter("year") != null ? request.getParameter("year").trim()  : "";
        String year = request.getAttribute("year") != null ? (String) request.getAttribute("year") : (request.getParameter("year") != null ? request.getParameter("year") :  "");
        String view = request.getAttribute("view") != null ? (String) request.getAttribute("view") : (request.getParameter("view") != null ? request.getParameter("view") :  "");
        String data = request.getAttribute("data") != null ? (String) request.getAttribute("data") : (request.getParameter("data") != null ? request.getParameter("data") :  "");
        String type = request.getAttribute("type") != null ? (String) request.getAttribute("type") : (request.getParameter("type") != null ? request.getParameter("type") :  "");
        String sortby = request.getAttribute("sortby") != null ? (String) request.getAttribute("sortby") : (request.getParameter("sortby") != null ? request.getParameter("sortby") :  "");

        ModelAndView model = new ModelAndView("list".equalsIgnoreCase(view) ? "event/fullEventList" :  "event/fullCalendar");

        theLogger.debug("sortby " + sortby );
        theLogger.debug("month " + month );
        int imonth = 0;
        int iyear = 0;
        try{
            imonth = Integer.parseInt(month);
        }catch(Exception ex){
            imonth =  calendar.get(Calendar.MONTH);
        }
        try{
            iyear = Integer.parseInt(year);
        }catch(Exception ex){
            iyear = calendar.get(Calendar.YEAR) ;
        }
        theLogger.debug("month " + imonth );
        theLogger.debug("year " + iyear );

        calendar.set(Calendar.YEAR , iyear);
        calendar.set(Calendar.MONTH, imonth);
        calendar.set(Calendar.DAY_OF_MONTH, 1);

        theLogger.debug("calendar.getTime() " + calendar.getTime());
        theLogger.debug("getFirstDayOfWeek() " + calendar.getFirstDayOfWeek() );
        //theLogger.debug("getWeekYear() " + calendar.getWeekYear() );
        theLogger.debug("DAY_OF_WEEK_IN_MONTH " + calendar.get(Calendar.DAY_OF_WEEK) );
        theLogger.debug("WEEK_OF_YEAR " + calendar.get(Calendar.WEEK_OF_YEAR) );
        theLogger.debug("calendar.getActualMaximum(Calendar.DATE) " + calendar.getActualMaximum(Calendar.DATE) );


        //The day-of-week is an integer value where 1 is Sunday, 2 is Monday, ..., and 7 is Saturday
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        int dayOfMonth = -1 * dayOfWeek + 2;
        int weekYear = calendar.get(Calendar.WEEK_OF_YEAR);
        int lastDate = calendar.getActualMaximum(Calendar.DATE);
        ArrayList<Map<String,String>> weekList = new ArrayList<Map<String,String>>();

        for(int i=0; i<5; i++){
            HashMap<String,String> weekMap = new HashMap<String,String>();
            weekMap.put("week", "" + (weekYear++));
            for(int j=0; j<7; j++){
                if(dayOfMonth > 0 && dayOfMonth <= lastDate )
                    weekMap.put( "" + j , "" + dayOfMonth);
                else
                    weekMap.put( "" + j , "&nbsp;");
                dayOfMonth++;
            }
            weekList.add(weekMap);
        }

        DateFormat df = new SimpleDateFormat("MMM yyyy");
        Date target = calendar.getTime();

        model.addObject("title", df.format(target) );
        model.addObject("currentmonth",  calendar.get(Calendar.MONTH) );
        model.addObject("currentyear",  calendar.get(Calendar.YEAR) );

        calendar.add(Calendar.MONTH, -1);// minus one month
        model.addObject("prevyear", calendar.get(Calendar.YEAR) );
        model.addObject("prevmonth",  calendar.get(Calendar.MONTH) );
        calendar.add(Calendar.MONTH, +2);// add two month
        model.addObject("nextyear", calendar.get(Calendar.YEAR) );
        model.addObject("nextmonth", calendar.get(Calendar.MONTH) );


        // because month start with 0, i.e. january = 0
        //model.addObject("eventsMap", "list".equalsIgnoreCase(view) ? eventDAO.getEventList(-1,iyear,true) : getEventsMap(imonth+1,iyear));
        model.addObject("eventsMap",  eventDAO.getEventList(-1, iyear, "all".equalsIgnoreCase(data) ? true : false, type, sortby  ) );

        model.addObject("weekList", weekList);
        model.addObject("data", data);
        model.addObject("year", year);
        model.addObject("type", type);

        model.addObject("eventType","calendar");
        model.addObject("rankingyear",getRankingYear());
        model.addObject("hitcount",entityDAO.getEntityHitCount("1","eventCalendar"));
        model.addObject("mode", "calendar");

        if(request.getAttribute("event") != null){
            session.setAttribute("event", request.getAttribute("event"));
            model.addObject("popup","y");
        }
        initStaticData(request);
        return model;
    }

	public Map<String, Object>  getEventsMap(int month, int year){
		try{
			List<Map<String, Object>> eventList = eventDAO.getEventList(month,year,false,"","");
			Map<String, Object> eventsMap = new HashMap<String,Object>();
			ArrayList<Map<String, Object>> eventsOfDayList = new ArrayList<Map<String, Object>>();
			Map<String, Object> resultMap = new HashMap<String,Object>();
			
			String prevEventDay = "X";
			String currEventDay = "0";
			
			
			
			for(int i=0; i<eventList.size(); i++ ){
				resultMap = eventList.get(i);
				currEventDay = resultMap.get("eday") + "";
				theLogger.debug("i " + i + "\n");
				
				theLogger.debug("currEventDay " + currEventDay);
				theLogger.debug("prevEventDay " + prevEventDay);
				theLogger.debug("title / note " + resultMap.get("title") + " / " + resultMap.get("note"));
				
				if(i ==0 ||  prevEventDay.equalsIgnoreCase(currEventDay)){
					theLogger.debug("added case 1");
					eventsOfDayList.add(resultMap);
				}else{
					theLogger.debug("added case 2");
					theLogger.debug("eventsOfDayList size:" + eventsOfDayList.size());
					eventsMap.put(prevEventDay,eventsOfDayList);
					eventsOfDayList = new ArrayList<Map<String, Object>>();
					eventsOfDayList.add(resultMap);
				}
				prevEventDay = resultMap.get("eday") + "";
			}
			eventsMap.put(prevEventDay,eventsOfDayList);
			
			theLogger.debug("eventsMap " + eventsMap);
			return eventsMap;
		}catch (Exception ex){
			ex.printStackTrace();
			return null;
		}
	}
	@RequestMapping("/getCalendarEventView")
	protected ModelAndView getCalendarEventView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView model = new ModelAndView("event/calendarEventView");
		
		initStaticData(request);
		String id = request.getParameter("id") != null ? request.getParameter("id") : "";
		
		HashMap<String,Object> event = (HashMap<String,Object>)  eventDAO.getEvent(id); 
		model.addObject("event", event);
		
		// Generate comment module	
		
		HashMap<String,String> qaMap = new HashMap<String,String>();
		qaMap.put("entityid",id);
		qaMap.put("type", "event"); //  t / e-entity / c-course / case-case / event-event
		String questionanswerid = ""  + questionAnswerDAO.getQAParentID(qaMap);
		model.addObject("questionanswerid",questionanswerid);
		HashMap<String,String> searchParam = new HashMap<String,String>();
		searchParam.put("id", questionanswerid);
		searchParam.put("style", "facebook");
				
		List<Map<String, Object>> qalist = questionAnswerDAO.getQAListByID(searchParam);
			    
		model.addObject("chatmsg",getChatMsg(qalist,request,new Date()));
		model.addObject("chatmsgcount","" + qalist.size());
		model.addObject("type","event");
		model.addObject("style","facebook");
		model.addObject("entityid",id);
        model.addObject("textareawidth","520"); //px
        model.addObject("textareaheight","2.4"); //em
		model.addObject("refreshdisabled","y");
		model.addObject("touchtablename","event");
		model.addObject("touchtableid",id);
		
		// ENd of Generate comment module	
				
				
		return model;
	}

	@RequestMapping("/getEntityEventForm")
	protected ModelAndView getEntityEventForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		initStaticData(request);
		String entityid = request.getParameter("entityid") != null ? request.getParameter("entityid") : "";
		String eventtype = request.getParameter("eventtype") != null ? request.getParameter("eventtype") : "";
		
		ModelAndView model = new ModelAndView("entity/entityEventForm");
		HashMap<String,Object> event = (HashMap<String,Object>)  eventDAO.getEventByEntity(entityid,eventtype); 
		model.addObject("event", event);
		model.addObject("eventtype", eventtype);
		model.addObject("entityid", entityid);

		return model;
	}
	@RequestMapping("/getCalendarEventForm")
	protected ModelAndView getCalendarEventForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		initStaticData(request);
		String eventid = request.getParameter("eventid") != null ? request.getParameter("eventid") : "";
        String view = request.getParameter("view") != null ? request.getParameter("view") : "";

        ModelAndView model = new ModelAndView("event/calendarEventForm");
		HashMap<String,Object> event = (HashMap<String,Object>)  eventDAO.getEventByID(eventid); 
		model.addObject("event", event);
        model.addObject("view", view);

		return model;
	}
	@RequestMapping("/saveEvent")
	protected ModelAndView saveEvent(HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession(true);
        Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");
        String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;

        request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id") != null ? request.getParameter("id") : "";

        HashMap<String,String> event = new HashMap<String,String>();
		event.put("id",id);
		event.put("title",request.getParameter("title") != null ? request.getParameter("title").trim() : "");
		event.put("note",request.getParameter("note") != null ? request.getParameter("note").trim() : "");
		event.put("entityid",request.getParameter("entityid") != null ? request.getParameter("entityid") : "");
		event.put("startdate",request.getParameter("startdate") != null ? request.getParameter("startdate") : "");
		event.put("active",request.getParameter("active") != null ? request.getParameter("active") : "");
		event.put("eventtype",request.getParameter("eventtype") != null ? request.getParameter("eventtype") : "");
		
		if("principalsay".equalsIgnoreCase(""  + event.get("eventtype"))){
			event.put("startdate","now()");
				
		}
		theLogger.debug("eventtype " +  event.get("eventtype"));
		theLogger.debug("startdate " +  event.get("startdate"));

        if( ! "-1".equalsIgnoreCase(userid)){
		    eventDAO.saveEvent(event);
        }
		ModelAndView model = new ModelAndView("adminConsole");	

		Calendar calendar = Calendar.getInstance();
		int iyear = calendar.get(Calendar.YEAR);
		int	imonth =  calendar.get(Calendar.MONTH);
		
		model.addObject("userList",userDAO.getUserList() );
		model.addObject("eventList",eventDAO.getEventList(iyear,imonth+1,true,"","") );
				
		return model;
	}
	@RequestMapping("/getTimeline")
	protected ModelAndView getTimeline(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String entityids = "1";
		String userid = "1";
		String categoryid = "1";
		
		theLogger.debug("entityids " + request.getAttribute("entityids") );
		theLogger.debug("userid " + request.getAttribute("userid") );
		theLogger.debug("categoryid " + request.getParameter("categoryid") );
		
		
		if(request.getAttribute("entityids") != null )
			entityids = (String)request.getAttribute("entityids");
		if(request.getAttribute("userid") != null  )
			userid = (String)request.getAttribute("userid");
		if(request.getParameter("categoryid") != null  )
			categoryid = (String)request.getParameter("categoryid");
		
		ModelAndView model = new ModelAndView("account/timeline");
		List<Map<String, Object>> eventList = eventDAO.getEventListByUser(userid,entityids,categoryid);
		int eventstart=1;
		for(int i=0; i< eventList.size(); i++){
			if("today".equalsIgnoreCase((String) eventList.get(i).get("title")))
					eventstart = i+ 1;
		}
		model.addObject("eventlist", eventList);
		model.addObject("eventstart", eventstart);
		
		
		return model;
	}
	@RequestMapping("/saveEventCalendar")
	protected ModelAndView saveEventCalendar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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
		String userid = "-1"; 		try { 			userid = user != null && user.get("ID") != null && (Integer) user.get("ID") > 0 ? ((Integer) user.get("ID")).toString() : "-1"; 		}catch (Exception ex){ 	 		}		;
		Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
	    request.setCharacterEncoding("UTF-8"); // Do this so we can capture non-Latin chars
	    String answer = request.getParameter("answer") != null ? request.getParameter("answer")  : "-1" ;
	    String id = request.getParameter("id") != null && request.getParameter("id").trim().length() > 0 ? request.getParameter("id") : "-1";
        String view = request.getParameter("view") != null ? request.getParameter("view") : "";

        session.removeAttribute("event");
	    
		HashMap<String,String> event = new HashMap<String,String>();
		event.put("id",id);
		
		event.put("ipaddr",ip);
		event.put("userid",userid);
		event.put("title",request.getParameter("title") != null ? request.getParameter("title").trim() : "");
		event.put("note",request.getParameter("note") != null ? request.getParameter("note").trim() : "");
		event.put("entityid",request.getParameter("entityid") != null ? request.getParameter("entityid") : "");
		event.put("startdate",request.getParameter("startdate") != null && request.getParameter("startdate").trim().length() > 0  ? request.getParameter("startdate") : "");
		event.put("enddate",request.getParameter("enddate") != null && request.getParameter("enddate").trim().length() > 0 ? request.getParameter("enddate") : "");
		event.put("eventtype",request.getParameter("eventtype") != null ? request.getParameter("eventtype") : "");
		event.put("active",request.getParameter("active") != null ? request.getParameter("active") : "");

        request.setAttribute("view", view);
	    if(captcha == null){
	    	//spam attack
	    	theLogger.debug("spam attack");
	    	return null;
	    }else if ( !captcha.isCorrect(answer)){
	    	theLogger.debug("Human error");
	    	theLogger.debug("event" + event);
	    	event.put("error.captcha", "y");
	    	request.setAttribute("event", event);
	    	return getEventFullCalendar(request, response);
	    }else{
	    		
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
			
			theLogger.debug("eventtype " +  event.get("eventtype"));
			theLogger.debug("startdate " +  event.get("startdate"));
			theLogger.debug("saveEntityEvent" + event);
			
			eventDAO.saveEvent(event);
			return getEventFullCalendar(request, response);
	    }
	}
}
