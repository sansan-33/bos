package com.ana.util;

import com.ana.entity.RssFeedListVO;
import com.ana.entity.RssFeedVO;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SpiderRss extends Spider{

	public static final String URL[] = {"http://kgp2016.highlight.hk/web/schoolinfo.php?schid=","http://kgp2016.highlight.hk/web/schoolinfo.php?lang=en&schid=" };

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
    public static void main(String[] args) {
        try {

            SpiderRss sp = new SpiderRss();
            try {
				sp.onWeb();
            } catch (Exception ex) {
				ex.printStackTrace();
			}
		} catch (Exception ex) {
		}
	}

	public RssFeedListVO onWeb() throws Exception {
        String query = "\u570b\u969b\u82f1\u6587\u5e7c\u7a1a\u5712";
        return getRssFeeds(query);
    }
    public RssFeedListVO getRssFeeds(String query) {

        RssFeedListVO feeds = new RssFeedListVO();
        String content="";
        int total=0;

        try {
            String surl = "http://hk.news.search.yahoo.com/rss?ei=UTF-8&p=" + URLEncoder.encode(query, "UTF-8") ;
            System.out.println(surl);
            content = getURLContent(new URL(surl), "UTF-8");
            //System.out.println("content " + content);
            System.out.println("start index: "   +  content.indexOf("<ol class=\" reg searchCenterMiddle\">"));
            System.out.println("end index: "   +  content.indexOf("</ol></div><style>.searchCenterBottomAds"));

            content = content.substring(content.indexOf("<ol class=\" reg searchCenterMiddle\">"), content.indexOf("</ol></div><style>.searchCenterBottomAds"));
            System.out.println(content);
            HashMap <String, String> entity = new HashMap <String, String> ();
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
                feeds.getFeeds().add(new RssFeedVO(entity.get("title" + i), entity.get("cite" + i), entity.get("content" + i),entity.get("date" + i),entity.get("url" + i),""));
            }
            System.out.println(feeds.toString());
        }catch (Exception ex){
            ex.printStackTrace();

        }
        return feeds;

    }

}
