package com.ana.controller;

import com.ana.dao.EntityDAO;
import com.ana.dao.EventDAO;
import com.ana.dao.QuestionAnswerDAO;
import com.ana.entity.RssFeedListVO;
import com.ana.entity.RssFeedVO;
import com.ana.entity.impl.*;
import com.ana.util.FileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@RestController
public class SchoolRESTController {

    private final Logger theLogger = LoggerFactory.getLogger(ServiceController.class);
    public static ArrayList <HashMap<String,String>> searchKeyList = new ArrayList<HashMap<String,String>>();
    public static HashMap <String,String> searchKeyMap = new HashMap<String,String>();
    static{
        searchKeyMap.put("title", "(<h3 class=\"title\"><a class=.*?target=\"_blank\">)(.*?)(</a></h3>)");
        searchKeyMap.put("cite", "(<span class=\"cite\">)(.*?)(</span>)");
        searchKeyMap.put("date", "(<span class=\"tri fc-2nd ml-10\">)(.*?)(</span>)");
        searchKeyMap.put("content", "(<div class=\"compText\" ><p class=\"\">)(.*?)(</div>)");
        searchKeyMap.put("url", "(<h3 class=\"title\"><a class=\" fz-m\" href=\")(.*?)(\" target=\"_blank\">)");
        searchKeyList.add(searchKeyMap);
    }
    public final static String BADGEIMAGE = "https://www.bookofschool.com/school/staticimage/CAT";
    HashMap<String,String> params = new HashMap<>();
    protected FileUtil fileUtil;

    @Autowired
    public void setFileUtil(FileUtil fileUtil) {
        this.fileUtil = fileUtil;
    }

    @Autowired
    protected EntityDAO entityDAO;

    public void setEntityDAO(EntityDAO entityDAO) {
        this.entityDAO = entityDAO;
    }

    @Autowired
    protected EventDAO eventDAO;

    public void setEventDAO(EventDAO eventDAO) {
        this.eventDAO = eventDAO;
    }

    @Autowired
    protected QuestionAnswerDAO questionAnswerDAO;

    public void setQuestionAnswerDAO(QuestionAnswerDAO questionAnswerDAO) {
        this.questionAnswerDAO = questionAnswerDAO;
    }

    @RequestMapping(value = "/get_all_schools")
    public SchoolListVO getAllSchools() {
        params = new HashMap<>();
        //params.put("categoryid", "5");
        return getSchools(params);
    }
    @RequestMapping(value = "/api/events/{limit}")
    public @ResponseBody EventListJSON events(@PathVariable String limit, HttpServletRequest request) {
        params = new HashMap<>();
        params.put("limit",limit);
        return getEventsJSON(params,request);
    }
    @RequestMapping(value = "/api/comments/{limit}")
    public @ResponseBody CommentListJSON comments(@PathVariable String limit, HttpServletRequest request) {
        params = new HashMap<>();
        params.put("limit",limit);
        params.put("latest", "latest");
        params.put("categoryid", "all");
        params.put("userlike", "y");
        return getCommentsJSON(params, request);
    }
    @RequestMapping(value = "/api/comments/{limit}/schools/{entityid}")
    public @ResponseBody CommentListJSON getCommentsBySchool(@PathVariable String limit,@PathVariable String entityid, HttpServletRequest request) {
        params = new HashMap<>();
        params.put("limit",limit);
        params.put("latest", "latest");
        params.put("categoryid", "all");
        params.put("userlike", "y");
        params.put("entityid", entityid);

        return getCommentsJSON(params, request);
    }
    @RequestMapping(value = "/api/schools")
    public SchoolListVO schools() {
        params = new HashMap<>();
        return getSchools(params);
    }
    @RequestMapping(value = "/api/categories/{categoryid}/ranking")
    public @ResponseBody SchoolListJSON getSchoolByRanking(@PathVariable String categoryid, HttpServletRequest request) {
        params = new HashMap<>();
        params.put("categoryid",categoryid);
        params.put("ranking","ranking");
        params.put("json","json");
        return getSchoolsJSON(params,request);
    }
    @RequestMapping(value = "/api/categories/{categoryid}/system/{system}")
    public @ResponseBody SchoolListJSON getSchoolBySystem(@PathVariable String categoryid,@PathVariable String system, HttpServletRequest request) {
        params = new HashMap<>();
        params.put("categoryid",categoryid);
        params.put("system",system);
        params.put("json","json");
        return getSchoolsJSON(params,request);
    }

    @RequestMapping(value = "/api/schooldetails/{entityid}")
    public @ResponseBody SchoolDetailsListJSON getSchoolDetails(@PathVariable String entityid, HttpServletRequest request) {
        params = new HashMap<>();
        params.put("entityid",entityid);
        params.put("metric","y");
        return getSchoolDetailsJSON(params,request);
    }
    @RequestMapping(value = "/api/schooldetails/{entityid}/{navtype}/{direction}")
    public @ResponseBody SchoolDetailsListJSON getSchoolDetailsByFlow(@PathVariable String entityid,@PathVariable String direction,@PathVariable String navtype, HttpServletRequest request) {
        params = new HashMap<>();
        try{
            entityid = "" + entityDAO.getPrevNextEntity("" + direction, "" + entityid, navtype);
        }catch(Exception ex){
            // This is the case for 1st and last record
        }
        params.put("entityid",entityid);
        params.put("metric","y");
        return getSchoolDetailsJSON(params,request);
    }

    @RequestMapping(value = "/api/schools/name/{name:.+}")
    public @ResponseBody SchoolListJSON searchSchool(@PathVariable String name, HttpServletRequest request) {
        params = new HashMap<>();
        params.put("name",name);
        return getSchoolsJSON(params,request);
    }
    @RequestMapping(value = "/api/schools/locations/{lat:.+}/{lon:.+}")
    public @ResponseBody SchoolListJSON searchNearbySchool(@PathVariable String lat,@PathVariable String lon, HttpServletRequest request) {

        theLogger.info("lat {}, lon {}" , lat , lon);
        params = new HashMap<>();
        params.put("lat", lat);
        params.put("lon", lon);

        return getSchoolsJSON(params,request);
    }
    @RequestMapping(value = "/api/categories/{categoryid}/districts/{district}")
    public @ResponseBody SchoolListJSON getSchoolByDistrict(@PathVariable String categoryid,@PathVariable String district, HttpServletRequest request) {
        params = new HashMap<>();
        params.put("categoryid",categoryid);
        params.put("district",district);
        params.put("json","json");
        return getSchoolsJSON(params,request);
    }
    @RequestMapping(value = "/api/rssfeeds/{query}")
    public @ResponseBody RssFeedListVO getRssFeeds(@PathVariable String query, HttpServletRequest request) {

        RssFeedListVO feeds = new RssFeedListVO();
        String content="";
        int total=0;
        List<RssFeedVO> result = feeds.getFeeds();
        try {
            String surl = "http://hk.news.search.yahoo.com/rss?ei=UTF-8&p=" + URLEncoder.encode(query, "UTF-8") ;
            //System.out.println(surl);
            content = getURLContent(new URL(surl), "UTF-8");
            //System.out.println("content " + content);
            //System.out.println("1 start index: "   +  content.indexOf("<ol class=\" reg searchCenterMiddle\">"));
            //System.out.println("2 end index: "   +  content.indexOf("</ol></div><style>.searchCenterBottomAds"));
            int start = content.indexOf("<ol class=\" reg searchCenterMiddle\">");
            int end = content.indexOf("</ol></div><style>.searchCenterBottomAds");
            if(start > 0 && end > 0 && end > start)
               content = content.substring(start, end);

            HashMap<String, String> entity = new HashMap <String, String> ();
            HashMap<String,String> map = searchKeyList.get(0);
            for (String key : map.keySet()) {
                Pattern p = Pattern.compile(map.get(key));
                Matcher matcher = p.matcher(content);
                boolean matchFound = matcher.find();
                total=0;
                while(matchFound) {
                    entity.put(key + total,matcher.group(2).trim());
                    total++;
                    matchFound = matcher.find();
                }
            }
            for(int i=0; i<total; i++) {
                result.add(new RssFeedVO(entity.get("title" + i), entity.get("cite" + i), entity.get("content" + i),entity.get("date" + i),entity.get("url" + i),""));
            }
            feeds.setFeeds(result);
            //System.out.println("3 REST Controller: " + feeds.toString());
        }catch (Exception ex){
            ex.printStackTrace();

        }
        return feeds;
    }
    public static String getURLContent(URL url, String encoding) throws IOException {

        try{
            TimeUnit.MILLISECONDS.sleep(100);
        }catch(Exception ex){}
        HttpURLConnection connect = (HttpURLConnection) url.openConnection();
        connect.setRequestProperty("User-agent","Mozilla/4.0");
        connect.connect();
        InputStream is = null;
        try {

            StringBuilder str = new StringBuilder ();
            int BUFFER_SIZE = 1024;
            int charsRead=0;
            is = connect.getInputStream();
            String read="";
            InputStreamReader isr = new InputStreamReader(is, encoding);
            char[] inputBuffer = new char[BUFFER_SIZE];

            while ((charsRead = isr.read(inputBuffer, 0, BUFFER_SIZE)) > 0) {
                read = new String(inputBuffer, 0, charsRead);
                str.append(read);
            }
            return str.toString();

        } catch(Exception ex){
            //ex.printStackTrace();
            return  "fail";
        }
        finally {
            if(is != null)
                is.close();
        }
    }


    //THIS ONE IS FOR YAHOO XMLAPI
    private SchoolListVO getSchools(HashMap<String, String> params) {
        SchoolListVO schools =  new SchoolListVO() ;

        String categoryid = "";
        String district = "";
        try {
            Map<String, String> districtKindergartenMap = (Map<String, String>) entityDAO.getLookupMap("district.kindergarten");
            Map<String, String> districtMap = (Map<String, String>) entityDAO.getLookupMap("district.poaschoolnetshort2");
            Map<String, String> categoryMap = (Map<String, String>) entityDAO.getLookupMap("entity.category.chi");
            Map<String, String> parentCommentMap = (Map<String, String>) entityDAO.getLookupMap("metric.parent.chi");

            List<Map<String, Object>> result = params.containsKey("categoryid") ? entityDAO.getSchools(params) : entityDAO.getAllSchools();
            for (Map entityObject : result) {
                categoryid = (String) entityObject.get("categoryid");
                district = categoryid.equalsIgnoreCase("0") ? districtKindergartenMap.get((String) entityObject.get("poaschoolnet")) : districtMap.get( (String) entityObject.get("poaschoolnet"));
                SchoolVO sch = new SchoolVO() ;

                    sch.build(
                        ""  + (Integer) entityObject.get("pk"),
                        (String) entityObject.get("name"),
                        (String) entityObject.get("address"),
                        (String) entityObject.get("telephone"),
                        "" + (BigDecimal) entityObject.get("score"),
                        "" + (Integer) entityObject.get("ranking"),
                        (String) entityObject.get("url"),
                        (String) entityObject.get("email"),
                        categoryMap.get(categoryid),
                        district,
                        (String) entityObject.get("principal"),
                        (String) entityObject.get("financetype"),
                        (String) entityObject.get("sex"),
                        (String) entityObject.get("religion"),
                        (String) entityObject.get("systemcomment"),
                        "" + parentCommentMap.get("1") + ":" +  (String) entityObject.get("metricparent1") + ","
                                + parentCommentMap.get("2") + ":"  + (String) entityObject.get("metricparent2") + ","
                                + parentCommentMap.get("3") + ":"  + (String) entityObject.get("metricparent3") + ","
                                + parentCommentMap.get("4") + ":"  + (String) entityObject.get("metricparent4"),
                        (Integer) entityObject.get("parentcommentcount") + "",
                        (String) entityObject.get("lat"),
                        (String) entityObject.get("lng"),
                        (String) entityObject.get("imgpath")
                );
                schools.getSchools().add(sch);
                //entityDAO.updateEntityParentMetric("" + (Integer) entityObject.get("pk"),(String) entityObject.get("metric1"),(String) entityObject.get("metric2"),(String) entityObject.get("metric3"),(String) entityObject.get("metric4"),(Long) entityObject.get("parentcommentcount") + "" );

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return schools;
    }


    private SchoolListJSON getSchoolsJSON(HashMap<String, String> params,HttpServletRequest request ) {

        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
        SchoolListJSON schools =  new SchoolListJSON() ;

        String categoryid = "";
        String district = "";
        String[] labelmetric = new String[5];
        for(int i=0;i<5;i++) {
            labelmetric[i] = applicationContext.getMessage("label.metric" + (i+1), new Object[]{}, Locale.SIMPLIFIED_CHINESE);
        }
        try {
            Map<String, String> districtKindergartenMap = (Map<String, String>) entityDAO.getLookupMap("district.kindergarten");
            Map<String, String> districtMap = (Map<String, String>) entityDAO.getLookupMap("district.poaschoolnetshort2");
            Map<String, String> categoryMap = (Map<String, String>) entityDAO.getLookupMap("entity.category.chi");
            Map<String, String> parentCommentMap = (Map<String, String>) entityDAO.getLookupMap("metric.parent.chi");

            List<Map<String, Object>> result = entityDAO.getSchools(params) ;
            for (Map entityObject : result) {
                categoryid = (String) entityObject.get("categoryid");
                district = categoryid.equalsIgnoreCase("0") ? districtKindergartenMap.get((String) entityObject.get("poaschoolnet")) : districtMap.get( (String) entityObject.get("poaschoolnet"));
                SchoolJSON sch = new SchoolJSON() ;

                sch.build(
                        ""  + (Integer) entityObject.get("pk"),
                        (String) entityObject.get("name"),
                        (String) entityObject.get("nameeng"),
                        (String) entityObject.get("address"),
                        (String) entityObject.get("telephone"),
                        "" + (BigDecimal) entityObject.get("score"),
                        "" + (Integer) entityObject.get("ranking"),
                        (String) entityObject.get("url"),
                        (String) entityObject.get("email"),
                        categoryMap.get(categoryid),
                        district,
                        (String) entityObject.get("principal"),
                        (String) entityObject.get("financetype"),
                        (String) entityObject.get("sex"),
                        (String) entityObject.get("religion"),
                        (String) entityObject.get("systemcomment"),
                        "" + parentCommentMap.get("1") + ":" +  (String) entityObject.get("metricparent1") + ","
                                + parentCommentMap.get("2") + ":"  + (String) entityObject.get("metricparent2") + ","
                                + parentCommentMap.get("3") + ":"  + (String) entityObject.get("metricparent3") + ","
                                + parentCommentMap.get("4") + ":"  + (String) entityObject.get("metricparent4"),
                        (Integer) entityObject.get("parentcommentcount") + "",
                        (String) entityObject.get("lat"),
                        (String) entityObject.get("lng"),
                        (String) entityObject.get("imgpath"),
                        "" + labelmetric[0] + ":" +  (String) entityObject.get("metricoverall1") + ","

                                + ("0".equals(categoryid) ?  "" : labelmetric[1] + ":"  + (String) entityObject.get("metricoverall2") + ","
                                + labelmetric[2] + ":"  + (String) entityObject.get("metricoverall3") + ",")
                                + labelmetric[3] + ":"  + (String) entityObject.get("metricoverall4") + ","
                                + labelmetric[4] + ":"  + (String) entityObject.get("metricoverall5"),
                        categoryid,
                        (String) entityObject.get("sex"),
                        "" + ( entityObject.containsKey("distance") ?   (((Double) entityObject.get("distance")).doubleValue() * 1000) : ""),
                "" + (Integer) entityObject.get("viewcount")
                );
                schools.getSchools().add(sch);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return schools;
    }

    private SchoolDetailsListJSON getSchoolDetailsJSON(HashMap<String, String> params,HttpServletRequest request ) {

        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
        SchoolDetailsListJSON schools =  new SchoolDetailsListJSON() ;

        String categoryid = "";
        String district = "";
        String[] labelmetric = new String[5];
        for(int i=0;i<5;i++) {
            labelmetric[i] = applicationContext.getMessage("label.metric" + (i+1), new Object[]{}, Locale.SIMPLIFIED_CHINESE);
        }
        try {
            Map<String, String> districtKindergartenMap = (Map<String, String>) entityDAO.getLookupMap("district.kindergarten");
            Map<String, String> districtMap = (Map<String, String>) entityDAO.getLookupMap("district.poaschoolnetshort2");
            Map<String, String> categoryMap = (Map<String, String>) entityDAO.getLookupMap("entity.category.chi");
            Map<String, String> parentCommentMap = (Map<String, String>) entityDAO.getLookupMap("metric.parent.chi");


            List<Map<String, Object>> result = entityDAO.getSchools(params) ;
            for (Map entityObject : result) {
                categoryid = (String) entityObject.get("categoryid");
                district = categoryid.equalsIgnoreCase("0") ? districtKindergartenMap.get((String) entityObject.get("poaschoolnet")) : districtMap.get( (String) entityObject.get("poaschoolnet"));
                List<Map<String, Object>> images = entityDAO.getEntityImageList(categoryid, params.get("entityid"));
                SchoolDetailsJSON sch = new SchoolDetailsJSON() ;

                for (Map image : images) {
                    ImageJSON img  = new ImageJSON();
                    img.build("" + image.get("entityimageid"),
                            "" + image.get("fullname"),
                            "" + image.get("imagepath"),
                            categoryid,
                            "" + image.get("id"),
                            "" + image.get("lastmodified") );
                    sch.getImages().add(img);
                }

                sch.build(
                        ""  + (Integer) entityObject.get("pk"),
                        (String) entityObject.get("name"),
                        (String) entityObject.get("nameeng"),
                        (String) entityObject.get("address"),
                        (String) entityObject.get("telephone"),
                        "" + (BigDecimal) entityObject.get("score"),
                        "" + (Integer) entityObject.get("ranking"),
                        (String) entityObject.get("url"),
                        (String) entityObject.get("email"),
                        categoryMap.get(categoryid),
                        district,
                        (String) entityObject.get("principal"),
                        (String) entityObject.get("financetype"),
                        (String) entityObject.get("sex"),
                        (String) entityObject.get("religion"),
                        (String) entityObject.get("systemcomment"),
                        "" + parentCommentMap.get("1") + ":" +  (String) entityObject.get("metricparent1") + ","
                                + parentCommentMap.get("2") + ":"  + (String) entityObject.get("metricparent2") + ","
                                + parentCommentMap.get("3") + ":"  + (String) entityObject.get("metricparent3") + ","
                                + parentCommentMap.get("4") + ":"  + (String) entityObject.get("metricparent4"),
                        (Integer) entityObject.get("parentcommentcount") + "",
                        (String) entityObject.get("lat"),
                        (String) entityObject.get("lng"),
                        (String) entityObject.get("imgpath"),
                        "" + labelmetric[0] + ":" +  (String) entityObject.get("metricoverall1") + ","
                                + ("0".equals(categoryid) ?  "" : labelmetric[1] + ":"  + (String) entityObject.get("metricoverall2") + ","
                                + labelmetric[2] + ":"  + (String) entityObject.get("metricoverall3") + ",")
                                + labelmetric[3] + ":"  + (String) entityObject.get("metricoverall4") + ","
                                + labelmetric[4] + ":"  + (String) entityObject.get("metricoverall5"),
                        categoryid,
                        (String) entityObject.get("sex"),
                        "" + ( entityObject.containsKey("distance") ?   (((Double) entityObject.get("distance")).doubleValue() * 1000) : ""),
                        "" + (Integer) entityObject.get("viewcount")
                );
                sch.buildMetric(
                        (String) entityObject.get("banding"),
                        "" + (BigDecimal)entityObject.get("hkdsepassrate"),
                        "" + (BigDecimal)entityObject.get("chipassrate"),
                        "" + (BigDecimal)entityObject.get("engpassrate"),
                        "" + (BigDecimal)entityObject.get("urate"),
                        "" + (Integer)entityObject.get("sixcoursesratio"),
                        "" + (Integer) entityObject.get("athleticsposmale"),
                        (String) entityObject.get("athleticsdivmale"),
                        "" + (Integer) entityObject.get("athleticsposfemale"),
                        (String) entityObject.get("athleticsdivfemale"),
                        "" + (Integer)entityObject.get("footballpos"),
                        (String) entityObject.get("footballdiv"),
                        "" + (Integer)entityObject.get("swimmingposmale"),
                        (String) entityObject.get("swimmingdivmale"),
                        "" + (Integer)entityObject.get("swimmingposfemale"),
                        (String) entityObject.get("swimmingdivfemale"),
                        "" + (Integer)entityObject.get("basketballposmale"),
                        (String) entityObject.get("basketballdivmale"),
                        "" + (Integer)entityObject.get("basketballposfemale"),
                        (String) entityObject.get("basketballdivfemale"),
                        (String) entityObject.get("athleticsdivname"),
                        "" + (Integer)entityObject.get("choirchinese"),
                        "" + (Integer)entityObject.get("choirforeign"),
                        "" + (Integer)entityObject.get("instrumentchinese"),
                        "" + (Integer)entityObject.get("instrumentwestern"),
                        "" + (Integer)entityObject.get("musicfirst"),
                        "" + (Integer)entityObject.get("musicsecond"),
                        "" + (Integer)entityObject.get("musicthird"),
                        "" + (Integer)entityObject.get("speechfirst"),
                        "" + (Integer)entityObject.get("speechsecond"),
                        "" + (Integer)entityObject.get("speechthird"),
                        "" + (Integer)entityObject.get("musicother"),
                        "" + (Integer)entityObject.get("debatechi"),
                        "" + (Integer)entityObject.get("area"),
                        (String) entityObject.get("noofspecialroom"),
                        "" + (Integer)entityObject.get("teacherexperience"),
                        "" + (Integer)entityObject.get("teachermaster"),
                        "" + (Integer)entityObject.get("teacherbachelor"),
                        "" + (Integer)entityObject.get("teacherforeign"),
                        "" + (Integer)entityObject.get("schoolfee"),
                        "" + (Integer)entityObject.get("tuitionfee"));

                sch.buildMetricKidergarten(
                        "" + (BigDecimal) entityObject.get("schoolallocationscore"),
                        (String) entityObject.get("qareport"),
                        (String) entityObject.get("voucher"),
                        (String) entityObject.get("schoolfeenursery"),
                        ""  +(Integer) entityObject.get("noofclassroom"),
                        (String) entityObject.get("indoorplayground"),
                        (String) entityObject.get("outdoorplayground"),
                        (String) entityObject.get("musicroom"),
                        (String) entityObject.get("noofotherroom"),
                        (String) entityObject.get("teacherpupilam"),
                        (String) entityObject.get("teacherpupilpm"));

                sch.buildMetricPrimary(
                        "" + (Integer) entityObject.get("overpercent"),
                        ""  +(Integer) entityObject.get("noofhall"),
                        (String) entityObject.get("noofplayground"),
                        ""  +(Integer) entityObject.get("nooflibraryroom"));

                schools.getSchools().add(sch);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return schools;
    }

    private EventListJSON getEventsJSON(HashMap<String, String> params,HttpServletRequest request ) {

        int i=0;
        Calendar calendar = Calendar.getInstance();
        EventListJSON events =  new EventListJSON() ;
        int limit = params.containsKey("limit") ? Integer.parseInt(params.get("limit")) : 100;
        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());

        String remain="";
        try {
            List<Map<String, Object>> result = eventDAO.getEventList(-1,0,false,"","home") ;
            for (Map eventObject : result) {
                if(i >=limit){
                    break;
                }
                EventJSON event = new EventJSON() ;
                String note =(String) eventObject.get("note");
                note = note.replaceAll("\"", "'").replaceAll("\r","").replaceAll("\n","");
                remain = getTimeDiff(eventObject,applicationContext,"");

                event.build(
                        ""  + (Integer) eventObject.get("id"),
                        (String) eventObject.get("title"),
                        note,
                        BADGEIMAGE  +  eventObject.get("categoryid") + "/logo_"  +  eventObject.get("chscid") +  ".jpg",
                        (String) eventObject.get("startdate"),
                        (String) eventObject.get("enddate"),
                        "" + (Long) eventObject.get("remainday"),
                        (String) eventObject.get("schoolname"),
                        "" + (Integer) eventObject.get("entityid")
                );
                events.getEvents().add(event);
                i++;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return events;
    }
    private CommentListJSON getCommentsJSON(HashMap<String, String> params, HttpServletRequest request ) {
        int i=0;
        Calendar calendar = Calendar.getInstance();
        CommentListJSON comments =  new CommentListJSON() ;
        int limit = params.containsKey("limit") ? Integer.parseInt(params.get("limit")) : 100;
        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
        String remain = "";
        try {

            List<Map<String, Object>> result = params.containsKey("entityid") ?  entityDAO.getComment(params.get("entityid"),"","ALL") : entityDAO.getCommentList() ;
            String commentText = "";
            for (Map commentObject : result) {
                if(i >=limit){
                    break;
                }
                remain = getTimeDiff(commentObject,applicationContext,"ago");
                commentText = (String) commentObject.get("comment");
                commentText = commentText.replaceAll("<br />" , "");
                //label.parentmetric1=校風
                //label.parentmetric2=老師
                //label.parentmetric3=功課
                //label.parentmetric4=學生
                CommentJSON comment = new CommentJSON() ;
                comment.build(
                        ""  + (Integer) commentObject.get("id"),
                        params.containsKey("entityid") ? (String) commentObject.get("subject") : "家長評級:"  + (String) commentObject.get("ENTITYNAME"),
                       "" + commentText,
                        BADGEIMAGE  +  commentObject.get("categoryid") + "/logo_"  +  commentObject.get("chscid") +  ".jpg",
                        (String) commentObject.get("categoryid"),
                        remain,
                        "" + (String) commentObject.get("ENTITYNAME") ,
                        "" + (Integer) commentObject.get("entityid"),
                        "" + (BigDecimal)commentObject.get("metric4"),
                        "" + (BigDecimal)commentObject.get("metric3"),
                        "" + (BigDecimal)commentObject.get("metric2"),
                        "" + (BigDecimal)commentObject.get("metric1")
                );
                comments.getComments().add(comment);
                i++;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return comments;
    }
    private String getTimeDiff(Map object,ApplicationContext applicationContext,String ago){

        String timediff = "";

        try {
            if (object.containsKey("timediffday")  && (Long) object.get("timediffday") > 0) {
                timediff = object.get("timediffday") + " " + applicationContext.getMessage("label.day" + ago, new Object[]{}, Locale.SIMPLIFIED_CHINESE);
            } else if (object.containsKey("timediffhour")  && (Long) object.get("timediffhour") > 0) {
                timediff = object.get("timediffhour") + " " + applicationContext.getMessage("label.hour" + ago, new Object[]{}, Locale.SIMPLIFIED_CHINESE);
            } else if (object.containsKey("timediffmin")  && (Long) object.get("timediffmin") > 0) {
                timediff = object.get("timediffmin") + " " + applicationContext.getMessage("label.min" + ago, new Object[]{}, Locale.SIMPLIFIED_CHINESE);
            } else if (object.containsKey("timediffsec")  && (Long) object.get("timediffsec") > 0) {
                timediff = object.get("timediffsec") + " " + applicationContext.getMessage("label.sec" + ago, new Object[]{}, Locale.SIMPLIFIED_CHINESE);
            }
        }catch(Exception ex){
            ex.printStackTrace();
            timediff = "error";
        }
        return timediff;
    }
    @RequestMapping(value = "/api/schools/{entityid}/images/{filename:.+}/status/{status}")
    public @ResponseBody String addImage(@PathVariable String entityid,@PathVariable String filename,@PathVariable String status ) throws Exception {
        entityDAO.updateEntityImage(entityid, filename,status);
        return "success";
    }
    @RequestMapping(value = "/api/schools/{entityid}/images/{filename:.+}/status/{status}", method = RequestMethod.DELETE)
    public @ResponseBody String removeImage(@PathVariable String entityid,@PathVariable String filename, HttpServletRequest request ) throws Exception {
        theLogger.info("removeImage");
        String prefix = "staticimage/entityimage";

        try{
            fileUtil.deleteFiletoServer(filename, request.getServletContext().getRealPath("/") + prefix +  System.getProperty("file.separator"));
            fileUtil.deleteFiletoServer(filename, "/home/ubuntu/repository/" +  prefix + "/");

        }catch(Exception ex){
            ex.printStackTrace();
        }
        entityDAO.deleteEntityImage(entityid, filename);
        return "success";
    }

}
