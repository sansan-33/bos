package com.ana.util;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SpiderSecondary extends Spider{
	
		

	public static final String URL[] = {"http://applications.chsc.hk/ssp2015/sch_detail1.php?lang_id=2&sch_id=",
										"http://applications.chsc.hk/ssp2015/sch_detail2.php?lang_id=1&sch_id=",
										"http://applications.chsc.hk/ssp2015/sch_detail3.php?lang_id=2&sch_id=",
										"http://applications.chsc.hk/ssp2015/sch_detail1.php?lang_id=1&sch_id=",
										"http://applications.chsc.hk/ssp2015/sch_detail4.php?lang_id=1&sch_id=",
										"http://applications.chsc.hk/ssp2015/sch_detail6.php?lang_id=2&sch_id=",
										"http://applications.chsc.hk/ssp2015/sch_detail8.php?lang_id=2&sch_id="
										};
	public static ArrayList <HashMap<String,String>> searchKeyList = new ArrayList<HashMap<String,String>>();
	public static HashMap <String,String> searchKeyMap = new HashMap<String,String>();
	static{
		//searchKeyMap.put("name", "(<td width=\"16%\" rowspan=\"5\" align=\"center\">.*?</td>\\s+.*?<td colspan=\"4\" align=\"left\"><span class=\"sch_detail_header\">)(.*?)(</span></td>)");
        searchKeyMap.put("name", "(<a></td>\\s+.*?<td colspan=\"4\" align=\"left\"><span class=\"sch_detail_header_text\">)(.*?)(</span></td>)");
        searchKeyMap.put("nameeng", "(</tr>\\s+.*?<tr>\\s+.*?<td colspan=\"4\" align=\"left\"><span class=\"sch_detail_header_text\">)(.*?)(</span></td>)");
		searchKeyMap.put("address", "(<td colspan=\"3\" align=\"left\"><span class=\"sch_detail_info\">)(.*?)(</span></td>)");
		searchKeyMap.put("telephone", "(<td width=\"10%\" align=\"left\"><span class=\"sch_detail_info\">)(.*)(</span></td>)");
		searchKeyMap.put("email", "(<td width=\"60%\" align=\"left\"><span class=\"sch_detail_info\">)(.*)(</span></td>)");
		searchKeyMap.put("url", "(<td align=\"left\"><span class=\"sch_detail_info\">\u7DB2\u5740\uFF1A</span></td>\\s+.*?<td align=\"left\">.*?<span class=\"sch_detail_info\">)(.*?)(</span></a></td>)");
		//searchKeyMap.put("poaschoolnet", "(<td width=\"61%\" align=\"left\">)(.*)(</td>)");
		searchKeyMap.put("principal", "(<td align=\"left\">\u6821\u9577</td>\\s+.*?<td>:</td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyMap.put("financetype", "(<td align=\"left\">\u5B78\u6821\u985E\u5225</td>\\s+.*?<td>:</td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyMap.put("sex", "(<td align=\"left\">\u5B78\u751F\u6027\u5225</td>\\s+.*?<td>:</td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyMap.put("area", "(<td align=\"left\">\u5B78\u6821\u4F54\u5730\u9762\u7A4D</td>\\s+.*?<td>:</td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyMap.put("religion", "(<td align=\"left\">\u5B97\u6559</td>\\s+.*?<td>:</td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyMap.put("yearofcommencement", "(<td align=\"left\">\u5275\u6821\u5E74\u4EFD</td>\\s+.*?<td>:</td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyMap.put("discretionaryplaces", "(<td align=\"left\">\u662F\u5426\u63A5\u6536\u4E2D\u4E00\u81EA\u884C\u5206\u914D\u7533\u8ACB</td>\\s+.*?<td>:</td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyMap.put("secondaryoneadmission", "(<td align=\"left\">\u4E2D\u4E00\u5165\u5B78 </td>\\s+.*?<td>:</td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyMap.put("transportation", "(<td align=\"left\">\u76F4\u9054\u5B78\u6821\u7684\u516C\u5171\u4EA4\u901A\u5DE5\u5177  </td>\\s+.*?<td>:</td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyMap.put("schoolmotto", "(<td align=\"left\">\u6821\u8A13</td>\\s+.*?<td>:</td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyMap.put("schoolmission", "(\u8FA6\u5B78\u5B97\u65E8.*?</td>\\s+.*?<td align=\"left\">\\s+.*?)(.*)(\\s+.*?</td>)");
		
		
		searchKeyList.add(searchKeyMap);
		searchKeyMap = new HashMap();
		searchKeyMap.put("schoolfee", "(<td align=\"left\">S1</td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyMap.put("tuitionfee", "(<td align=\"left\">S4</td>\\s+.*?<td align=\"left\">-</td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyList.add(searchKeyMap);
		searchKeyMap = new HashMap();
		searchKeyMap.put("noofspecialroom", "(</tr>\\s+.?<tr class=\"sch_detail_line1_bgcolor\">\\s+.?<td width=\"5%\">&nbsp;</td>\\s+.?<td width=\"92%\" align=\"left\">)(.*)(</td>)");
		searchKeyList.add(searchKeyMap);
		searchKeyMap = new HashMap();
		searchKeyMap.put("poaschoolnet", "(<td width=\"61%\" align=\"left\">)(.*)(</td>)");
		searchKeyList.add(searchKeyMap);
		searchKeyMap = new HashMap();
		searchKeyMap.put("teacherexperience", "(<td align=\"left\">10 years or abov :</td>\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("teachermaster", "(<td align=\"left\">Master / Doctorate Degree or above :</td>\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("teacherbachelor", "(<td align=\"left\">Bachelor Degree:</td>\\s+.*?<td>)(.*)(</td>)");
		searchKeyList.add(searchKeyMap);
		
		searchKeyMap = new HashMap();
		searchKeyMap.put("language", "(<tr class=\"sch_detail_line2_bgcolor\">\\s+.*?<td>&nbsp;</td>\\s+.*?<td align=\"left\">\u4EE5\u82F1\u6587\u70BA\u6559\u5B78\u8A9E\u8A00 :</td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyList.add(searchKeyMap);
		searchKeyMap = new HashMap();
		searchKeyMap.put("languagepolicy", "(<tr class=\"sch_detail_line1_bgcolor\">\\s+.*?<td>&nbsp;</td>\\s+.*?<td align=\"left\">)(.*)(</td>)");
		searchKeyList.add(searchKeyMap);
	}
	
	
	public static void main(String[] args) {

		try {

			SpiderSecondary sp = new SpiderSecondary();

			try {
				sp.onWeb(2,3);

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
					&& "!testing".equalsIgnoreCase(entity.get("nameeng").toString())){
				//System.out.println("chscid " + i + " added");
				resultList.add(entity);
			}
		}
		//System.out.println("Secondary School Size List " + resultList.size() );
			
		return resultList;
		
	
	}
	
	

}
