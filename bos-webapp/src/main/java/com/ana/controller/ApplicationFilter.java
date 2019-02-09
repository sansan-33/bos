package com.ana.controller;

import com.ana.dao.EntityDAO;
import com.ana.dao.ObjectStatDAO;
import com.ana.entity.ObjectStat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

public class ApplicationFilter implements Filter {

    private final Logger theLogger = LoggerFactory.getLogger(ApplicationFilter.class);
    private static HashMap<String, String> ipMap;
	private static HashMap<String, String> urlMap;
	private static HashMap<String, String> adminUrlMap;
	private static HashMap<String, String> urlLikeMap;
	private static HashMap<String, String> urlFormMap;
	private static HashMap<String, String> excludeFileMap;
	private static HashMap<String, String> userMap;
    private static HashMap<String,ObjectStat> objectStatMap = new HashMap<String, ObjectStat>();
    private final static int FLUSH_LIMIT=15;
    private ObjectStatDAO myObjectStatDAO;
    private EntityDAO myEntityDAO;

	public void destroy() {
        try{
            if(objectStatMap != null && !objectStatMap.isEmpty())
            myObjectStatDAO.saveObjectStat(objectStatMap);
        }catch(Exception ex){}
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		String ip = request.getRemoteAddr();
		String url = request.getRequestURI();
		boolean pass = false;
		boolean allowedIP = false;
		boolean checkedURL = false;
        theLogger.debug("no counter update");

		if (checkExcludePath(url)) {
			chain.doFilter(req, res);
		} else {
			HttpSession session = request.getSession(true);
			Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
			//theLogger.debug("url : " + url);
			if (!ipMap.containsKey(ip)) {
				allowedIP = true;
			}

			if (!allowedIP) {
				theLogger.info("filiter ip Blocked:" + ip);
			}else if(checkSpamAttack(request)) {
				theLogger.info("Spam Attack ip {}, url {} " , ip, url);

			}else if(adminUrlMap.containsKey(url) && !checkAdmin(user)) {
				theLogger.info("not admin attack ip {}, url {}", ip, url);

			}else if ( (urlMap.containsKey(url) || checkUrlLike(url)) && !checkAuth(user) ) {
				theLogger.info("not user login url map ip {}, url {}", ip, url);
			}else
			{
				if(!urlMap.containsKey(url)  && !checkUrlLike(url) && !adminUrlMap.containsKey(url) )
					updateCounter(request);
				chain.doFilter(req, res);

			}
		}
	}

	protected boolean checkExcludePath(String url) {
		boolean result = false;

		for (Map.Entry<String, String> entry : excludeFileMap.entrySet()) {
			if (url != null && url.endsWith(entry.getKey())) {
				result = true;
				break;
			}
		}

		return result;
	}

	protected boolean checkUrlLike(String url) {
		boolean result = false;

		for (Map.Entry<String, String> entry : urlLikeMap.entrySet()) {
			if (url != null && url.contains(entry.getKey())) {
				result = true;
				break;
			}
		}

		return result;
	}

	protected boolean checkUrlForm(String url) {
		boolean result = false;

		for (Map.Entry<String, String> entry : urlFormMap.entrySet()) {
			//theLogger.debug("checkurlform " + entry.getKey());
			//theLogger.debug("checkurlform source" + url);
			
			if (url != null && url.contains(entry.getKey())) {
				result = true;
				break;
			}
		}

		return result;
	}

	protected boolean checkAuth(Map<String, Object> user) {
		boolean result = false;
		if (user != null && user.get("email") != null
				&& userMap.containsKey("" + user.get("email")))
			result = true;
		return result;
	}
	protected boolean checkAdmin(Map<String, Object> user) {
		boolean result = false;
		if (user != null && user.get("email") != null
				&&  "anthan.wong@gmail.com".equalsIgnoreCase("" + user.get("email")) && "0".equalsIgnoreCase("" + user.get("roleid")) )
			result = true;
		return result;
	}
	public void init(FilterConfig config) throws ServletException {


        WebApplicationContext springContext = WebApplicationContextUtils.getWebApplicationContext(config.getServletContext());
        myObjectStatDAO = (ObjectStatDAO) springContext.getBean("objectStatDAO");
        myEntityDAO = (EntityDAO) springContext.getBean("entityDAO");
        String ip = config.getInitParameter("avoid-ip");
		StringTokenizer token = new StringTokenizer(ip, ",");

		ipMap = new HashMap<String, String>();
		String key = "";
		while (token.hasMoreTokens()) {
			key = token.nextToken();
			ipMap.put(key, key);

		}

		String url = config.getInitParameter("checked-url");
		token = new StringTokenizer(url, ",");

		urlMap = new HashMap<String, String>();

		while (token.hasMoreTokens()) {
			key = token.nextToken();
			urlMap.put(key, key);
			theLogger.debug("checked url " + key);
		}
		
		String adminurl = config.getInitParameter("admin-url");
		token = new StringTokenizer(adminurl, ",");

		adminUrlMap = new HashMap<String, String>();

		while (token.hasMoreTokens()) {
			key = token.nextToken();
			adminUrlMap.put(key, key);
			theLogger.debug("admin url " + key);
		}

		String urlLike = config.getInitParameter("checked-url-like");
		token = new StringTokenizer(urlLike, ",");

		urlLikeMap = new HashMap<String, String>();

		while (token.hasMoreTokens()) {
			key = token.nextToken();
			urlLikeMap.put(key, key);
			theLogger.debug("checked url Like" + key);
		}

		String urlForm = config.getInitParameter("checked-url-form");
		token = new StringTokenizer(urlForm, ",");

		urlFormMap = new HashMap<String, String>();

		while (token.hasMoreTokens()) {
			key = token.nextToken();
			urlFormMap.put(key, key);
			theLogger.debug("checked url Form" + key);
		}

		String user = config.getInitParameter("authorized-user");
		token = new StringTokenizer(user, ",");

		userMap = new HashMap<String, String>();

		while (token.hasMoreTokens()) {
			key = token.nextToken();
			userMap.put(key, key);

		}

		String excludeFile = config.getInitParameter("exclude-file");
		token = new StringTokenizer(excludeFile, ",");

		excludeFileMap = new HashMap<String, String>();

		while (token.hasMoreTokens()) {
			key = token.nextToken();
			excludeFileMap.put(key, key);

		}

	}

	private boolean checkSpamAttack(HttpServletRequest req) {
		boolean result = false;
		theLogger.debug("getRemoteHost " + req.getRemoteHost() );
		theLogger.debug("req.getHeader(referer) " + req.getHeader("referer") );

		if(req.getParameter ("iosswift3") != null) {
			return false;
		}

		if (checkUrlForm(req.getRequestURI())) {
			theLogger.debug("checking spam attack url........");
			if ("POST".equalsIgnoreCase(req.getMethod())) {
				theLogger.info("URL Form is {} , not POST",req.getMethod());
				result = true;
			} else if (!req.getRemoteHost().contains("bookofschool.com") && !req.getRemoteHost().contains("0:0:0:0:0:0:0:1%0") ) {
				theLogger.info("URL Form host name problem, not contain bookofschool -- {} / referer {}",req.getRemoteHost() ,req.getHeader("referer"));
				result = false;
			} else if (!req.getHeader("referer").contains("bookofschool.com") && !req.getHeader("referer").contains("localhost")) {
				theLogger.info("URL Form referer problem, not contain bookofschool / localhost -- {}",req.getHeader("referer"));
				result = true;
			}
		}
		if(req.getParameter("entityid") != null && req.getParameter("entityid").trim().length() > 0){
			try{
				int tmp = Integer.parseInt(req.getParameter("entityid"));
			}catch (NumberFormatException e) {
				theLogger.info("IP: {}, invlaid entityid {} ", req.getRemoteAddr(),  req.getParameter("entityid") );
				result=true;
			}
		}
		if(req.getParameter("id") != null && req.getParameter("id").trim().length() > 0){
			try{
				int tmp = Integer.parseInt(req.getParameter("id"));
			}catch (NumberFormatException e) {
				theLogger.info("IP: {},invlaid id {} ",req.getRemoteAddr(), req.getParameter("id"));
				result=true;
			}
		}
		if(req.getParameter("categoryid") != null && !"all".equals(req.getParameter("categoryid")) && !"".equals(req.getParameter("categoryid")) && req.getParameter("categoryid").trim().length() > 0 ){
			try{
				int tmp = Integer.parseInt(req.getParameter("categoryid"));
			}catch (NumberFormatException e) {
				theLogger.info("IP: {}, invlaid categoryid {}",req.getRemoteAddr(),req.getParameter("categoryid") );
				result=true;
			}
		}
		return result;
	}

    private void updateCounter(HttpServletRequest request){

        try{
            boolean valid = true;
            String key = "";
            String name= "";
            String id = "";
            theLogger.debug("request.getPathInfo() {}", request.getRequestURI());
            if(request.getRequestURI().contains("entityDetails")  &&  request.getParameter("entityid") != null){
                name = "entity";
                id = request.getParameter("entityid");
                if(id !=null)
                    id = id.trim();
                try{
                    if("next".equalsIgnoreCase(request.getParameter("nav"))){
                        id = "" + myEntityDAO.getPrevNextEntity("next", "" +request.getParameter("entityid"), request.getParameter("navtype")) ;
                    }else if("prev".equalsIgnoreCase(request.getParameter("nav"))){
                        id ="" + myEntityDAO.getPrevNextEntity("prev", "" +request.getParameter("entityid"), request.getParameter("navtype")) ;
                    }
                }catch(Exception ex){
                    // This is the case for 1st and last record
                }

            }else if(request.getRequestURI().contains("getCMSDetails")  && request.getParameter("id") != null){
                name = "cms";
                id = request.getParameter("id");
            }else if(request.getRequestURI().contains("Calendar") ){
                name = "eventCalendar";
                id = "1";
            }else if(request.getRequestURI().contains("getForumDetails")  && request.getParameter("id") != null){
                name = "forum";
                id = request.getParameter("id");
            }else if(request.getRequestURI().contains("getHitSchoolReport")){
                name = "hitSchool";
                id = request.getParameter("categoryid") !=null ? request.getParameter("categoryid") : "1";
            }else if(request.getRequestURI().contains("getCourseDetails")  && request.getParameter("id") != null){
                name = "course";
                id = request.getParameter("id");
            }else if(request.getRequestURI().contains("kidEducationConsole") ){
                name = "kidedu";
                id = "1";
            }else if(request.getRequestURI().contains("getCaseSharingDetails") && request.getParameter("id") != null ){
                name = "case";
                id = request.getParameter("id");
            }else if(request.getRequestURI().contains("searchForm") ){
                name = "searchForm";
                id = "1";
            }else if(request.getRequestURI().contains("reverseSearch") || request.getRequestURI().contains("schoolReverseSearch") ){
				name = "reverseSearch";
				id = "1";
			}else if(request.getRequestURI().contains("schoolCompare") || request.getRequestURI().contains("schoolCompare") ){
				name = "schoolCompare";
				id = "1";
			}else if(request.getRequestURI().contains("getCaseSharingList") || request.getRequestURI().contains("getCaseSharingList") ){
				name = "caseSharing";
				id = "1";
			}else{
                valid = false;
            }
            if(valid){
                key = name + "-" + id;
                if(objectStatMap.size() > FLUSH_LIMIT){
                    theLogger.debug("FLUSH_LIMIT: {}" , FLUSH_LIMIT);
                    flushViewStat();

                }
                // increase counter by one
                if(name != null && name.trim().length() > 0 ){
                    ObjectStat myObjectStat = new ObjectStat(1,"",1);
                    if(objectStatMap.get(key) != null){
                        myObjectStat = objectStatMap.get(key);
                        myObjectStat.updateHitCount();
                        objectStatMap.put(key, myObjectStat);
                    }else{
                         myObjectStat =  myObjectStatDAO.getObjectStatByKey(Integer.parseInt(id),name);
                        if(myObjectStat != null){
                            myObjectStat.updateHitCount();
                        }else{
                            myObjectStat =  new ObjectStat(Integer.parseInt(id),name, 1);
                        }
                        objectStatMap.put(key, myObjectStat) ;
                    }
					theLogger.debug("myViewStat {}" , myObjectStat);
				}
                request.getServletContext().setAttribute("objectStatMap", objectStatMap);
            }
        }catch(Exception ex){
            ex.printStackTrace();;
        }
    }
    private void flushViewStat(){
        try{
            synchronized(objectStatMap) {
                myObjectStatDAO.saveTranObjectStat(objectStatMap);
                objectStatMap = new HashMap<String, ObjectStat>();
            }
        }catch(Exception ex){
            //ex.printStackTrace();
        }
    }

}
