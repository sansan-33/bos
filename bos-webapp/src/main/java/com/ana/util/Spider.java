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

	public static final String URL[] = {"http://applications.chsc.hk/psp2016/sch_detail1.php?lang_id=2&sch_id=",
	  									"http://applications.chsc.hk/psp2016/sch_detail2.php?lang_id=2&sch_id=",
	  									"http://applications.chsc.hk/psp2016/sch_detail3.php?lang_id=1&sch_id=",
	  									"http://applications.chsc.hk/psp2016/sch_detail3.php?lang_id=2&sch_id=",
	  									"http://applications.chsc.hk/psp2016/sch_detail4.php?lang_id=1&sch_id=",
	  									"http://applications.chsc.hk/psp2016/sch_detail9.php?lang_id=2&sch_id=",
                                        "http://applications.chsc.hk/psp2016/sch_detail6.php?lang_id=2&sch_id="
	  									};
	public static ArrayList <HashMap<String,String>> searchKeyList = new ArrayList<HashMap<String,String>>();
	public static HashMap <String,String> searchKeyMap = new HashMap<String,String>();
	static{
        //TODO td format changed in the src
		searchKeyMap.put("name", "(<span class=\"sch_detail_header\">)(.*)(</span></td>)");
		searchKeyMap.put("address", "(<span class=\"sch_detail_info\">\u5730\u5740:</span></td>\\s+.*?<span class=\"sch_detail_info\">)(.*?)(</span></td>)");
		searchKeyMap.put("email", "(<span class=\"sch_detail_info\">\u96FB\u90F5:</span></td>\\s+.*?<span class=\"sch_detail_info\">)(.*?)(</span></a></td>)");

        searchKeyMap.put("poaschoolnet", "(<span class=\"sch_detail_poa\">)(.*)(</span></td>)");
		searchKeyMap.put("url", "(<span class=\"sch_detail_info\">\u7DB2\u5740:</span></td>\\s+.*?<span class=\"sch_detail_info\">)(.*?)(</span></a></td>)");
		searchKeyMap.put("language", "(<td.*?>\u6559\u5B78\u8A9E\u8A00</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("financetype", "(<td.*?>\u5B78\u6821\u985E\u5225</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("area", "(<td.*?>\u5B78\u6821\u4F54\u5730\u9762\u7A4D</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("direct", "(<td.*?>\u76F4\u5C6C\u4E2D\u5B78</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("throughtrain", "(<td.*?>\u4E00\u689D\u9F8D\u4E2D\u5B78</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("feeder", "(<td.*?>\u76F4\u5C6C\u4E2D\u5B78</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("nominated", "(<td.*?>\u806F\u7E6B\u4E2D\u5B78</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("religion", "(<td.*?>\u5B97\u6559</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("sex", "(<td.*?>\u5B78\u751F\u6027\u5225</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("principal", "(<td.*?>\u6821\u9577</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("schoolmotto",  "(<td.*?>\u6821\u8A13</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("yearofcommencement", "(<tr class=\"sch_detail_line2_bgcolor\">\\s+.*?<td>&nbsp;</td>\\s+.*?<td.*?>\u5275\u6821\u5E74\u4EFD</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*?)(</td>)");
		
		searchKeyList.add(searchKeyMap);
		searchKeyMap = new HashMap();
		searchKeyMap.put("schoolfee", "(<td width=\"293\".*?>)(.*)(</td>)");
		searchKeyMap.put("tuitionfee", "(<td.*?>\u5802\u8CBB [(]\u5E74\u8CBB[)]</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyList.add(searchKeyMap);
		searchKeyMap = new HashMap();
		searchKeyMap.put("noofclassroom", "(<td width=\"293\".*?>)(.*)(</td>)");
		searchKeyMap.put("noofhall", "(<td.*?>Number of School Hall</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("nooflibraryroom", "(<td.*?>Number of Library</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyList.add(searchKeyMap);
		searchKeyMap = new HashMap();
		searchKeyMap.put("noofspecialroom", "(<td.*?>\u7279\u5225\u5BA4</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("noofotherroom", "(<td.*?>\u5176\u4ED6</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("noofplayground", "(<td.*?>\u64CD.*?</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		
		searchKeyList.add(searchKeyMap);
		searchKeyMap = new HashMap();
        searchKeyMap.put("telephone", "(Phone:.*?\\s+.*?sch_detail_info\">)(.*?)(</span></td>)");
		searchKeyMap.put("teacherexperience", "(<td.*?>&nbsp;&nbsp;&nbsp;&nbsp;10 years or above</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("teachermaster", "(<td.*?>&nbsp;&nbsp;&nbsp;&nbsp;Master/ Doctorate Degree or above</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");
		searchKeyMap.put("teacherbachelor", "(<td.*?>&nbsp;&nbsp;&nbsp;&nbsp;Bachelor Degree</td>\\s+.*?<td.*?>:</td>\\s+.*?<td.*?>)(.*)(</td>)");

        searchKeyList.add(searchKeyMap);
		searchKeyMap = new HashMap();
		searchKeyMap.put("schoolmission", "(<td width=\"506\".*?>)(.*)(</td>)");
		searchKeyList.add(searchKeyMap);

        searchKeyMap = new HashMap();
        searchKeyMap.put("nooftest", "(全年全科測驗次數</td>\\s+<td width=\"20\" align=\"left\">:</td>\\s+<td width=\"293\" align=\"left\">)(.*?)(</td>)");
        searchKeyMap.put("noofexam", "(全年全科考試次數</td>\\s+<td align=\"left\">:</td>\\s+<td align=\"left\">)(.*?)(</td>)");
        searchKeyMap.put("elite", "(分班安排</td>\\s+<td align=\"left\">:</td>\\s+<td width=\"293\" align=\"left\">)(.*?)(</td>)");

        searchKeyList.add(searchKeyMap);


    }
	
	
	public static void main(String[] args) {

		try {

			Spider sp = new Spider();

			try {
				sp.onWeb(528,529);

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
			String result="";
			for(int j=0; j<URL.length; j++){
				URL url = new URL(URL[j] + i);
				result = getURLContent(url,"UTF-8");
				
				//result = result.replaceAll("<br>", "");
				result = result.replaceAll("<p align='left'>-</p>", "");
				
		
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
								|| "nooflibraryroom".equalsIgnoreCase(key)  || "noofhall".equalsIgnoreCase(key)  || "noofclassroom".equalsIgnoreCase(key) ){
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
				        eng++;
				    }
				}

			}
			entity.put("categoryid", "1");
			entity.put("chscid", "" + i);

			if(!entity.isEmpty() && entity.containsKey("name") && i!=531
						&& entity.get("name") != null && entity.get("name").toString().trim().length() > 0
						&& !"testing".equalsIgnoreCase(entity.get("nameeng").toString())){
				//System.out.println("chscid " + i + " added");
				resultList.add(entity);
			}
		}
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
            //System.out.println(str.toString());
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
