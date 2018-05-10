package com.ana.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller(value="cmsController")
public class CMSController extends BaseController {

    private final Logger theLogger = LoggerFactory.getLogger(CMSController.class);

    @RequestMapping("/getCMSDetails")
	protected ModelAndView getCMSDetails(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		initStaticData(request);
		String id = request.getParameter("id") != null  && request.getParameter("id").trim().length() > 0 ? request.getParameter("id") : "-1";
		HashMap<String,String> searchParam = new HashMap<String,String>();
		ModelAndView model = new ModelAndView("cms/cmsDetails");	
		searchParam.put("id", id);
		List<Map<String, Object>> cmslist = cmsDAO.getCMSList(searchParam);
		
		if(!cmslist.isEmpty())
			model.addObject("cms",  cmslist.get(0) );
		
		model.addObject("hitcount",entityDAO.getEntityHitCount(id,"cms"));
		
		
		// Generate comment module	
		HashMap<String,String> qaMap = new HashMap<String,String>();
		qaMap.put("entityid",id);
		qaMap.put("type", "cms"); //  t / e-entity / c-course / a-case / s-cms
		String questionanswerid = ""  + questionAnswerDAO.getQAParentID(qaMap);
		model.addObject("questionanswerid",questionanswerid);
		searchParam = new HashMap<String,String>();
	    searchParam.put("id", questionanswerid);
	    searchParam.put("style", "facebook");
	    List<Map<String, Object>> qalist = questionAnswerDAO.getQAListByID(searchParam);
	    
	   
	    
	    model.addObject("chatmsg",getChatMsg(qalist,request,new Date()));
	    model.addObject("chatmsgcount","" + qalist.size());
		model.addObject("type","cms");
		model.addObject("style","facebook");
		model.addObject("entityid",id);
		model.addObject("textareawidth","600"); //px
		model.addObject("textareaheight","2.4"); //em
		model.addObject("refreshdisabled","y");
		model.addObject("touchtablename","cms");
		model.addObject("touchtableid",id);
		// ENd of Generate comment module
		
		return model;
		

	}
	
	

}
