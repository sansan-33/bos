package com.ana.util;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SpiderSecondary extends Spider{


	public static final String URL[] = {"https://www.chsc.hk/ssp2018/sch_detail.php?lang_id=2&sch_id=","https://www.chsc.hk/ssp2018/sch_detail.php?lang_id=1&sch_id="};
										//"http://www.chsc.hk/ssp2017/sch_detail.php?lang_id=1&sch_id=",
										//"http://www.chsc.hk/ssp2017/sch_detail.php?lang_id=2&sch_id=",
										//"http://www.chsc.hk/ssp2017/sch_detail.php?lang_id=1&sch_id=",
										//"http://www.chsc.hk/ssp2017/sch_detail.php?lang_id=1&sch_id=",
										//"http://www.chsc.hk/ssp2017/sch_detail.php?lang_id=2&sch_id=",
										//"http://www.chsc.hk/ssp2017/sch_detail.php?lang_id=2&sch_id="
										//};
	public static ArrayList <HashMap<String,String>> searchKeyList = new ArrayList<HashMap<String,String>>();
	public static HashMap <String,String> searchKeyMap = new HashMap<String,String>();
	static{
		//searchKeyMap.put("name", "(<td width=\"16%\" rowspan=\"5\" align=\"center\">.*?</td>\\s+.*?<td colspan=\"4\" align=\"left\"><span class=\"sch_detail_header\">)(.*?)(</span></td>)");
        searchKeyMap.put("name", "(<dd class=\"xxzl-info-tit\">\\s+.*?)(.*?)(<Br>)");
        searchKeyMap.put("nameeng", "(<dd class=\"xxzl-info-tit\">\\s+.*?<Br>\\s+.*?)(.*?)(</dd>)");
		searchKeyMap.put("address", "(<td colspan=\"4\">)(.*?)(</td>)");
		searchKeyMap.put("telephone", "(電話:&nbsp;&nbsp;</td>\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("email", "(電郵:&nbsp;&nbsp;</td>\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("url", "(網址:&nbsp;&nbsp;</td>\\s+.*?<td>)(.*?)(</td>)");
		//searchKeyMap.put("poaschoolnet", "(<td width=\"61%\" align=\"left\">)(.*)(</td>)");
		searchKeyMap.put("principal", "(校長</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("financetype", "(學校類別</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("sex", "(學生性別</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("area", "(學校佔地面積</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("religion", "(宗教</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("yearofcommencement", "(創校年份</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		//searchKeyMap.put("discretionaryplaces", "(校長</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		//searchKeyMap.put("secondaryoneadmission", "(校長</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		//searchKeyMap.put("transportation", "(校長</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("schoolmotto", "(校訓</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		//searchKeyMap.put("schoolmission", "(校長</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		
		
		//searchKeyList.add(searchKeyMap);
		//searchKeyMap = new HashMap();
		searchKeyMap.put("schoolfee", "(中六.*?</strong></td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyMap.put("tuitionfee", "(中六.*?</strong></td>\\s+.*?<td align=\"left\">.*?</td>\\s+.*?<td.*?>)(.*)(</td>)");

		//searchKeyList.add(searchKeyMap);
		//searchKeyMap = new HashMap();
		searchKeyMap.put("noofspecialroom", "(學校設施：</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");

		//searchKeyList.add(searchKeyMap);
		//searchKeyMap = new HashMap();

		//searchKeyList.add(searchKeyMap);
		//searchKeyMap = new HashMap();
		searchKeyMap.put("teacherexperience", "(10 年或以上</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("teachermaster", "(碩士、博士或以上</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("teacherbachelor", "(學士： </td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");

		searchKeyList.add(searchKeyMap);
		searchKeyMap = new HashMap();
		searchKeyMap.put("poaschoolnet", "(District</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		//searchKeyMap.put("language", "(教學語言</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");

		//searchKeyList.add(searchKeyMap);
		//searchKeyMap = new HashMap();
		//searchKeyMap.put("languagepolicy", "(學費</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyList.add(searchKeyMap);
	}
	
	
	public static void main(String[] args) {

		try {

			SpiderSecondary sp = new SpiderSecondary();

			try {
				sp.onWeb(459,465);

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} catch (Exception ex) {
		}
	}

	public List<Map<String, Object>> onWeb(int start, int end) throws Exception {

		ArrayList <Map<String, Object>> resultList  = new ArrayList <Map<String, Object>>();		
		int eng=0; 
		for(int i=start; i<end; i++){
			
			HashMap <String, Object> entity = new HashMap <String, Object> ();
			
			for(int j=0; j<URL.length; j++){
				//URL url = new URL(URL[j] );
				URL url = new URL(URL[j] + i );
				//System.out.println(url.toString());
				String result = getURLContent(url,"UTF-8") ;
				
				//result = result.replaceAll("<br>", "");
				result = result.replaceAll("<p align='left'>-</p>", "");

				HashMap<String,String> map = searchKeyList.get(j);
				//System.out.println(result);

				for (String key : map.keySet()) {
					eng=0;
					Pattern p = Pattern.compile(map.get(key));
				    Matcher matcher = p.matcher(result);
				    boolean matchFound = matcher.find();
				    if(matchFound) {
				    	//System.out.println(key + " " + matcher.group(2));

				        if("financetype".equalsIgnoreCase(key) && matcher.group(2).contains("<br>") ){
				    		String tmp[] = matcher.group(2).split("<br>");
				    		if(tmp.length > 1){
				    			entity.put((eng==0) ? key : key+ "eng", tmp[0] );
				    			entity.put((eng==0) ? "session" : key+ "eng", tmp[1] );
				    		}
				    	}else if("schoolfee".equalsIgnoreCase(key) || "schoolfeevoucher".equalsIgnoreCase(key) || "tuitionfee".equalsIgnoreCase(key) || "area".equalsIgnoreCase(key)			
				    			|| "teacherexperience".equalsIgnoreCase(key) || "teachermaster".equalsIgnoreCase(key)  || "teacherbachelor".equalsIgnoreCase(key)  ){
						    
				    		entity.put((eng==0) ? key : key+ "eng", formatNumber(matcher.group(2)) );
				    	}else if("language".equalsIgnoreCase(key)){
				    		if(matcher.group(2).contains("\u6578\u5B78") || matcher.group(2).contains("\u79D1\u5B78") || matcher.group(2).contains("\u6B77\u53F2") || matcher.group(2).contains("\u5730\u7406"))
				    			entity.put((eng==0) ? key : key+ "eng", "\u82F1\u6587");
				    		else
				    			entity.put((eng==0) ? key : key+ "eng", "\u4E2D\u6587");
				    	}else if("languagepolicy".equalsIgnoreCase(key)){
				    		matchFound = matcher.find();
				    		if(matchFound)
				    			entity.put((eng==0) ? key : key+ "eng", matcher.group(2).trim());
				    	}else{
				    		entity.put((eng==0) ? key : key+ "eng", matcher.group(2).trim());
				    	}
				        try{
				        	//System.out.println(key + " " + matcher.group(2).trim());
				        }catch(Exception ex){
				        	ex.printStackTrace();
				        }
				        //matchFound = matcher.find(matcher.end());
				        eng++;
				    }
				}
			}
			if( "\u6709".equalsIgnoreCase((String) entity.get("voucher"))){
				entity.put("schoolfee", entity.get("schoolfeevoucher"));
			}
			if( entity.get("noofclassroom") != null){
				try{
					Integer.parseInt((String) entity.get("noofclassroom"));
				}catch (Exception ex){
					entity.put("noofclassroom",0);
				}
			}
			try{
				Integer.parseInt((String) entity.get("schoolfee"));
			}catch (Exception ex){
				entity.put("schoolfee",0);
			}
			//System.out.println("name " + entity.get("name"));
			entity.remove("schoolfeevoucher");
						
			entity.put("categoryid", "2");
			entity.put("chscid", "" + i);

			if(!entity.isEmpty() && entity.containsKey("name")
					&& entity.get("name") != null && entity.get("name").toString().trim().length() > 0
					){
				System.out.println("chscid " + i + " added");
				resultList.add(entity);
			}
		}
		//System.out.println("Secondary School Size List " + resultList.size() );
			
		return resultList;
		
	
	}
	
	

}
