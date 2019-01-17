package com.ana.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Spider {

	public static final String URL[] = {"https://www.chsc.hk/psp2018/sch_detail.php?lang_id=2&sch_id="};
/*
	  									"http://www.chsc.hk/psp2017/sch_detail.php?lang_id=2&sch_id=",
	  									"http://www.chsc.hk/psp2017/sch_detail.php?lang_id=2&sch_id=",
	  									"http://www.chsc.hk/psp2017/sch_detail.php?lang_id=2&sch_id=",
	  									"http://www.chsc.hk/psp2017/sch_detail.php?lang_id=2&sch_id=",
	  									"http://www.chsc.hk/psp2017/sch_detail.php?lang_id=2&sch_id=",
                                        "http://www.chsc.hk/psp2017/sch_detail.php?lang_id=2&sch_id="
	  									};
	  									*/

	public static ArrayList <HashMap<String,String>> searchKeyList = new ArrayList<HashMap<String,String>>();
	public static HashMap <String,String> searchKeyMap = new HashMap<String,String>();
	static{
        //TODO td format changed in the src
		searchKeyMap.put("name", "(<dd class=\"xxzl-info-tit\">\\s+.*?)(.*)(<Br>)");
		searchKeyMap.put("address", "(<td colspan=\"4\">)(.*?)(</td>)");
		searchKeyMap.put("email", "(<td width=\"15%\">電郵:&nbsp;&nbsp;</td>\\s+.*?<td>)(.*?)(</td>)");

        searchKeyMap.put("poaschoolnet", "(校網編號 : )(.*)(</span>)");
		searchKeyMap.put("url", "(<td>網址:&nbsp;&nbsp;</td>\\s+.*?<td>)(.*?)(</td>)");
		searchKeyMap.put("language", "(教學語言</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("financetype", "(類別</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(<br>)");
		searchKeyMap.put("area", "(學校佔地面積</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("direct", "(直屬中學</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("throughtrain", "(一條龍中學</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("feeder", "(直屬中學</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("nominated", "(聯繫中學</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("religion", "(宗教</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("sex", "(學生性別</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("principal", "(校長</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("schoolmotto",  "(校訓</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("yearofcommencement", "(創校年份</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		
		//searchKeyList.add(searchKeyMap);
		//searchKeyMap = new HashMap();
		searchKeyMap.put("schoolfee", "(學費</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("tuitionfee", "(堂費</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		//searchKeyList.add(searchKeyMap);
		//searchKeyMap = new HashMap();
		searchKeyMap.put("noofclassroom", "(課室數目</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("noofhall", "(禮堂數目</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("nooflibraryroom", "(圖書館數目</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		//searchKeyList.add(searchKeyMap);
		//searchKeyMap = new HashMap();
		searchKeyMap.put("noofspecialroom", "(特別室</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("noofotherroom", "(其他</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("noofplayground", "(操場數目</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		
		//searchKeyList.add(searchKeyMap);
		//searchKeyMap = new HashMap();
        searchKeyMap.put("telephone", "(<td>電話:&nbsp;&nbsp;</td>\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("teacherexperience", "(10年或以上</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("teachermaster", "(碩士、博士或以上</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
		searchKeyMap.put("teacherbachelor", "(學士</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");

        //searchKeyList.add(searchKeyMap);
		//searchKeyMap = new HashMap();
		//searchKeyMap.put("schoolmission", "(<dd class=\"xmcslr09\">\\s+.*?<div.*?>\\s+.*?<table.*?>\\s+.*?<colgroup>\\s+.*?<col.*?>\\s+.*?<col.*?>\\s+.*?<col.*?>\\s+.*?</colgroup>\\s+.*?<tbody>\\s+.*?<tr>\\s+.*?<td.*?>)(.*)(</td>)");

		//searchKeyList.add(searchKeyMap);
		//searchKeyMap = new HashMap();
        searchKeyMap.put("nooftest", "(全年全科測驗次數</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
        searchKeyMap.put("noofexam", "(全年全科考試次數</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");
        searchKeyMap.put("elite", "(分班安排</td>\\s+.*?<td.*?> :\\s+.*?<td>)(.*)(</td>)");

        searchKeyList.add(searchKeyMap);


    }
	
	
	public static void main(String[] args) {

		try {

			Spider sp = new Spider();

			try {
				sp.onWeb(95,96);

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
				URL url = new URL(URL[j] + i);
				String result = getURLContent(url,"UTF-8");
				
				//result = result.replaceAll("<br>", "");
				//result = result.replaceAll("<p align='left'>-</p>", "");
				
		
				HashMap<String,String> map = searchKeyList.get(j);
				for (String key : map.keySet()) {
					//System.out.println(key + " " + map.get(key));
					eng=0;		
					Pattern p = Pattern.compile(map.get(key));
				    Matcher matcher = p.matcher(result);
				    boolean matchFound = matcher.find();
				    while(matchFound) {
                        //if(i==528)
                        //System.out.println(key + " " + matcher.group(2));
				    	if("financ1etype".equalsIgnoreCase(key) && matcher.group(2).contains("<br>") ){
				    		String tmp[] = matcher.group(2).split("<br>");
				    		if(tmp.length > 1){
				    			entity.put((eng==0) ? key : key+ "eng", tmp[0] );
				    			entity.put((eng==0) ? "session" : key+ "eng", tmp[1] );
				    		}
				    	}else if("schoolfee".equalsIgnoreCase(key) || "tuitionfee".equalsIgnoreCase(key) || "area".equalsIgnoreCase(key) 
				    			|| "teacherexperience".equalsIgnoreCase(key) || "teachermaster".equalsIgnoreCase(key)  || "teacherbachelor".equalsIgnoreCase(key)
								|| "nooflibraryroom".equalsIgnoreCase(key)  || "noofhall".equalsIgnoreCase(key)  || "noofclassroom".equalsIgnoreCase(key)  ){
				    		entity.put((eng==0) ? key : key+ "eng", formatNumber(matcher.group(2)) );
				    	}else if("throughtrain".equalsIgnoreCase(key) || "feeder".equalsIgnoreCase(key) || "nominated".equalsIgnoreCase(key)){
				    		entity.put(key, "<p align='left'>-</p>".equalsIgnoreCase(matcher.group(2)) ? "" : matcher.group(2)); 
				    	}else if("financetype".equalsIgnoreCase(key) ) {
				    		String financetype="";
				    		if(matcher.group(2).contains("\u5B98"))  // Gov.
				    			financetype = "\u5B98\u7ACB" ; 
				    		else if(matcher.group(2).contains("\u76F4")) // Jac 
				    			financetype = "\u76F4\u8CC7" ; 
				    		else if(matcher.group(2).contains("\u79C1") || matcher.group(2).contains("\u7ACB")) //Private
				    			financetype = "\u79C1\u7ACB" ; 
				    		else if(matcher.group(2).contains("\u8CC7") || matcher.group(2).contains("\u52A9") ) // Sponsor
				    			financetype ="\u8CC7\u52A9" ; 
				    		
				    		//System.out.println(matcher.group(2) + " VS" + financetype);
				    		entity.put((eng==0) ? key : key+ "eng", financetype ); 
				    		
				    		String tmp[] = matcher.group(2).split("<br>");
				    		if(tmp.length > 1){
				    			entity.put((eng==0) ? "session" : key+ "eng", tmp[1] );
				    		}
				    		
				        		
				    	}else if("poaschoolnet".equalsIgnoreCase(key)){
                            if(eng == 1)
                               entity.put( key , matcher.group(2));

                        }else{
				    		entity.put((eng==0) ? key : key+ "eng", matcher.group(2));
				    	}
				    	matchFound = matcher.find(matcher.end());
				    	if("noofotherroom".equalsIgnoreCase(key)){
				    		matchFound=false;
						}
				        eng++;
				    }
				}
				//System.out.println("loop out all map keys");

			}
			entity.put("categoryid", "1");
			entity.put("chscid", "" + i);

			if(!entity.isEmpty() && entity.containsKey("name") && i!=531
						&& entity.get("name") != null && entity.get("name").toString().trim().length() > 0
						){
				System.out.println("chscid " + i + " added");
				resultList.add(entity);
			}
		}
		//System.out.println("resultList size  " + resultList.size());

		return resultList;
		
	
	}
	
	public static String getURLContentOriginal(URL url,String encoding) throws IOException {
		  URLConnection conn = url.openConnection();
		  //encoding = conn.getContentEncoding();
		  //StringBuilder sb = new StringBuilder(16384);
		  BufferedReader br =null;
		  StringBuffer buffer=null;
		  //if (encoding == null) {
		  //  encoding = "UTF-8";
		  //}
		  try {
			  br = new BufferedReader(new InputStreamReader(conn.getInputStream(), encoding));
			//  String line;
			//  while ((line = br.readLine()) != null) {
			//	  sb.append(line);
			//	  sb.append('\n');
		    
			  buffer = new StringBuffer();
			  
			  int ch;
			  while ((ch = br.read()) > -1) {
				  buffer.append((char)ch);
			  }
			  
			  
		  } catch(Exception ex){
			  ex.printStackTrace();
		  } 
		  finally {
		    
		    if(br != null){
		    	br.close();
		    }
		   
		  }
		  String   result   =   new   String( buffer.toString().getBytes( encoding), "UTF-8");
		  return result;
	}
	public static String getURLContent(URL url,String encoding) throws IOException {

		//System.out.println("connect : " + url);

		try{
            TimeUnit.MILLISECONDS.sleep(100);
        }catch(Exception ex){ex.printStackTrace();}
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestProperty("accept", "*/*");
		connection.setRequestProperty("connection", "Keep-Alive");
		connection.setRequestProperty("User-agent","Mozilla/4.0");
		connection.connect();
	    InputStream is = null;
		try {

            StringBuilder str = new StringBuilder ();
            int BUFFER_SIZE = 1024;
            int charsRead=0;
            is = connection.getInputStream();
            String read="";
            InputStreamReader isr = new InputStreamReader(is, encoding);
            char[] inputBuffer = new char[BUFFER_SIZE];

            while ((charsRead = isr.read(inputBuffer, 0, BUFFER_SIZE)) > 0) {
                read = new String(inputBuffer, 0, charsRead);
                str.append(read);
            }
            //System.out.println(str.toString());
            return str.toString();

		  } catch(Exception ex){
            ex.printStackTrace();
			return  "fail";
		  } 
		  finally {
			//System.out.println("connect : " + url + " done ");

			connection.disconnect();
            if(is != null)
			    is.close();
		  }
	}
	protected static String formatNumber(String value){
		String result = "";
		if(value == null || value.trim().length() == 0  ){
			result = "0";
		}else{

			value = value.replaceAll(",", "");
			value = value.replaceAll("%", "");
			value = value.replaceAll("-", "0");
			value = value.replaceAll("\u7D04", "");
			value = value.replaceAll("\u5E73\u65B9\u7C73", "");
			if(value.indexOf("(") > 0)
				value  = value.substring(0, value.indexOf("(") ).trim(); 
			if( value.contains("$") && value.indexOf("$") == 0 )
				value = value.substring(1).trim(); 
			if(value.indexOf(" ") > 0)
				value  = value.substring(0, value.indexOf(" ") ).trim(); 
			if(value.contains("\u5C0F\u4E00")){
				value = value.substring(0, value.indexOf("\u5C0F\u4E00")).trim(); 
			}
			result = value.trim();
			
		}
		//System.out.println(value + " -- " + result);
		try{
			Integer.parseInt(result);
		}catch(Exception ex){
			result = "0";
		}
		
		return result;
	}
	protected static String removeString(String value, String remove){
		String result = "";
		if(value == null || value.trim().length() == 0  ){
			result = "N/A";
		}else{

			value = value.replaceAll(remove, "");
			value = value.replaceAll("  ", " ");
			
			result = value.trim();
			
		}
		//System.out.println(value + " -- " + result);
		return result;
	}
	
	

}
