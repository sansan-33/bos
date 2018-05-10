package com.ana.util;

import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.util.*;


public class SpiderKindergartenold extends Spider{
    final static String emptyvalue = "0";
    public static final String URL[] = {"http://203.169.204.5/kindergarten2013/services/details.asp?id="};
    public static HashMap <String,String> districtCodeMap = new HashMap<String,String>();

    public static HashMap <String,String> districtMap = new HashMap<String,String>();
    static{
        districtMap.put("kc", "Kwai Tsing");
        districtMap.put("wts", "Wong Tai Sin");
        districtMap.put("su", "Southern");
        districtMap.put("yl", "Yuen Long");
        districtMap.put("tp", "Tai Po");
        districtMap.put("sk", "Sai Kung");
        districtMap.put("tm", "Tuen Mun");
        districtMap.put("st", "Sha Tin");
        districtMap.put("tw", "Tsuen Wan");
        districtMap.put("wc", "Wan Chai");
        districtMap.put("klc", "Kowloon City");
        districtMap.put("kt", "Kwun Tong");
        districtMap.put("ssp", "Sham Shui Po");
        districtMap.put("ea", "East");
        districtMap.put("nr", "North");
        districtMap.put("il", "Islands");
        districtMap.put("ytm", "Yau Tsim Mong Kok");
        districtMap.put("cw", "Central & Western");

    };


    public static void main(String[] args) {
        //System.out.println("ST. CATHERINE".matches("[a-zA-Z]+"));
        try {

            SpiderKindergarten sp = new SpiderKindergarten();

            try {
                sp.onWeb(1057,1058);

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
                String result = getURLContent(url,"ISO-8859-1") ;

                try {
                    //System.out.println(result);
                    // read JSON from a file
                    Map<String, Object> schoolMap = readValue(
                        result);
				   /*
			 	   System.out.println(schoolMap.get("ID"));
				   System.out.println(schoolMap.get("Degree"));
				   System.out.println(schoolMap.get("SchoolName_EN"));
				   System.out.println(schoolMap.get("Experience7Above"));
				   System.out.println(schoolMap.get("AMRatio"));
				   System.out.println(schoolMap.get("PMRatio"));
				   System.out.println(schoolMap.get("AMNurseryFees"));
				   System.out.println(schoolMap.get("OutdoorPlygrnd"));
				   System.out.println(schoolMap.get("MusicRoom"));
				   System.out.println(schoolMap.get("IndoorPlygrnd"));
				   System.out.println(schoolMap.get("Classroom"));
				   
				   System.out.println(schoolMap.get("AMLowerFees"));
				   */
                    entity.put("nameeng", schoolMap.get("SchoolName_EN"));
                    entity.put("name",  "null".equalsIgnoreCase( "" + schoolMap.get("SchoolName_CN")) || "-1".equalsIgnoreCase(ucs2ToUTF8("" + schoolMap.get("SchoolName_CN")))  ?  schoolMap.get("SchoolName_EN") : ucs2ToUTF8("" + schoolMap.get("SchoolName_CN")) );
                    entity.put("teacherexperience", formatNumber("" + schoolMap.get("Experience7Above")));
                    entity.put("teacherbachelor", formatNumber("" + schoolMap.get("Degree")));
                    entity.put("teacherpupilam", ("" + schoolMap.get("AMRatio")).trim().length() > 1 ?  schoolMap.get("AMRatio") : "沒有資料");
                    if(i == 462)
                        entity.put("teacherpupilpm", "1 : 10.0");
                    else
                        entity.put("teacherpupilpm", ("" + schoolMap.get("PMRatio")).trim().length() > 1 ?  schoolMap.get("PMRatio") : "沒有資料");
                    entity.put("schoolfeenursery", schoolMap.get("AMNurseryFees"));


                    entity.put("outdoorplayground", ("" + schoolMap.get("OutdoorPlygrnd")).trim().length() > 1 ?  ("" + schoolMap.get("OutdoorPlygrnd")).trim().length() == 6 ? "有" : "沒有" : "沒有資料");
                    entity.put("indoorplayground", ("" + schoolMap.get("IndoorPlygrnd")).trim().length() > 1 ?  ("" + schoolMap.get("IndoorPlygrnd")).trim().length() == 6 ? "有" : "沒有" : "沒有資料");
                    entity.put("musicroom", ("" + schoolMap.get("MusicRoom")).trim().length() > 1 ?  ("" + schoolMap.get("MusicRoom")).trim().length() == 6 ? "有" : "沒有" : "沒有資料");

                    entity.put("schoolfee", formatNumber("" + schoolMap.get("AMLowerFees")));
                    entity.put("noofclassroom", schoolMap.get("Classroom"));
                    //entity.put("email", schoolMap.get("AttnEmail"));
                    //entity.put("voucher", ("" + schoolMap.get("Voucher")).trim().length() > 1 ?  ("" + schoolMap.get("Voucher")).trim().length() == 6 ? "有" : "沒有" : "沒有資料");
                    String qualityReview = ("" +  schoolMap.get("QualityReview")).trim();
                    entity.put("qareport", qualityReview.length() > 1 ?  qualityReview.contains("Meeting the prescribed standards") ? "符合要求" : "-" : "-");
                    entity.put("qareporturl", qualityReview.length() > 1 && qualityReview.lastIndexOf("<br \\/>") >  0 ?  qualityReview.substring (qualityReview.lastIndexOf("<br \\/>") + 7) : "");
                    entity.put("noofotherroom", ucs2ToUTF8("" + schoolMap.get("OtherSpecialRoom")));


                    entity.put("url", schoolMap.get("SchoolURL"));
                    entity.put("financetype", ucs2ToUTF8("" + schoolMap.get("SchoolType")));
                    entity.put("sex", ucs2ToUTF8("" + schoolMap.get("SchoolGender")) );
                    entity.put("telephone", schoolMap.get("Tel"));
                    entity.put("email", schoolMap.get("AttnEmail"));
                    entity.put("address", ucs2ToUTF8("" + schoolMap.get("Address_CN")));
                    entity.put("voucher", ucs2ToUTF8("" + schoolMap.get("Voucher")));
                    entity.put("principal", ucs2ToUTF8("" + schoolMap.get("PrincipalName")));
                    if(entity.get("principal") == null || ((String) entity.get("principal")).trim().length() < 1){
                        if(schoolMap.get("NewPrincipalName") != null &&  ((String) schoolMap.get("NewPrincipalName")).trim().length() > 1  )
                            entity.put("principal", ucs2ToUTF8("" + schoolMap.get("NewPrincipalName")));
                    }

                    entity.put("schoolmission", ucs2ToUTF8("" + schoolMap.get("SchoolMission")));

                    if("-1".equalsIgnoreCase("" + entity.get("schoolmission")) ){
                        entity.remove("schoolmission");
                    }
                    try{
                        entity.put("poaschoolnet", districtMap.get(("" + schoolMap.get("districtCode")).toLowerCase()) );
                    }catch(Exception ex){
                        ex.printStackTrace();
                    }
                    districtCodeMap.put("" + schoolMap.get("districtCode"), ucs2ToUTF8("" + schoolMap.get("District")));

                    entity.put("categoryid", "0");
                    entity.put("chscid", "" + i);


                    if( entity.get("noofclassroom") != null){
                        try{
                            Integer.parseInt((String) entity.get("noofclassroom"));
                        }catch (Exception ex){
                            entity.put("noofclassroom",emptyvalue);
                        }
                    }else{
                        entity.put("noofclassroom",emptyvalue);
                    }
                    try{
                        Integer.parseInt((String) entity.get("schoolfee"));
                    }catch (Exception ex){
                        entity.put("schoolfee",0);
                    }

                    if(!entity.isEmpty() && entity.containsKey("nameeng") && entity.get("nameeng") != null &&  ((String) entity.get("nameeng")).trim().length() > 0   ){
                        //System.out.println("chscid " + i + " added");
                        //System.out.println(entity.get("name") + " /" + ("" + schoolMap.get("SchoolName_CN")).trim().length());
                        //System.out.println(entity.get("principal") );

                        resultList.add(entity);
                    }


                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }

        /*
        for (Map.Entry<String, String> entry : districtCodeMap.entrySet()) {
            System.out.println("Key : " + entry.getKey() + " Value : "
                + entry.getValue());
        }
*/

        return resultList;


    }
    public Map<String, Object> readValue(String source){

        Map<String, Object> result= new HashMap<String, Object>();
        if(source.startsWith("["))
            source = source.substring(1);
        if(source.startsWith("{"))
            source = source.substring(1);
        if(source.endsWith("]")){
            source = source.substring(0,source.length()-1);
        }
        if(source.endsWith("}"))
            source = source.substring(0,source.length()-1);

        //System.out.println(source);

        StringTokenizer st = new StringTokenizer(source,",");
        String  element ="";
        String [] keyvalue = new String[2];
        while (st.hasMoreElements()) {
            element = "" + st.nextElement();
            keyvalue = element.split("\":\"");
            if(keyvalue.length > 1 ){
                result.put(removeDoubleQuote(keyvalue[0]), removeDoubleQuote(keyvalue[1]));
                //System.out.println(removeDoubleQuote(keyvalue[0]) + ","  + removeDoubleQuote(keyvalue[1]));

            }
        }
        //AMNurseryFees
        String fee = "";
        String voucher = "";

        if( result.containsKey("Voucher")  && ((String) result.get("Voucher")).trim().length() == 6 ){
            voucher = "Annual";
        }
        try{
            if( ("" + result.get("AMNursery" + voucher + "Fees")).trim().length() > 1 && ! ("" + result.get("AMNursery" + voucher + "Fees")).contains("$0"))  //e.g. "AMNurseryAnnualFees":"$0 (12)"
                fee = source.substring(source.indexOf("AMNursery" + voucher + "Fees") + 16 + voucher.length() , source.indexOf("AMNursery" + voucher + "Fees") + 50 + voucher.length());
            else if(("" + result.get("PMNursery" + voucher + "Fees")).trim().length() > 1 && ! ("" + result.get("PMNursery" + voucher + "Fees")).contains("$0"))
                fee = source.substring(source.indexOf("PMNursery" + voucher + "Fees") + 16 + voucher.length() , source.indexOf("PMNursery" + voucher + "Fees") + 50 + voucher.length());
            else
                fee = source.substring(source.indexOf("\"Nursery" + voucher + "Fees") + 15 + voucher.length() , source.indexOf("\"Nursery" + voucher + "Fees") + 50 + voucher.length());
            //System.out.println(fee + ("" + result.get("AMNursery" + voucher + "Fees")).contains("$0") + ": " + (("" + result.get("AMNursery" + voucher + "Fees"))) );

            fee = fee.substring(0,fee.indexOf("\",\""));
            if(fee.trim().length() == 0)
                fee = emptyvalue;
        }catch(Exception ex){
            fee = emptyvalue;
        }
        result.put("AMNurseryFees", fee);
        try{
            if( ("" + result.get("AMLower" + voucher + "Fees")).trim().length() > 1 && ! ("" + result.get("AMLower" + voucher + "Fees")).contains("$0") )
                fee = source.substring(source.indexOf("AMLower" + voucher + "Fees") + 14 + voucher.length(), source.indexOf("AMLower" + voucher + "Fees") + 50 + voucher.length());
            else if(("" + result.get("PMLower" + voucher + "Fees")).trim().length() > 1 && ! ("" + result.get("PMLower" + voucher + "Fees")).contains("$0"))
                fee = source.substring(source.indexOf("PMLower" + voucher + "Fees") + 14 + voucher.length(), source.indexOf("PMLower" + voucher + "Fees") + 50 + voucher.length());
            else
                fee = source.substring(source.indexOf("\"Lower" + voucher + "Fees") + 13 + voucher.length(), source.indexOf("\"Lower" + voucher + "Fees") + 50 + voucher.length());
            //System.out.println(fee);
            fee = fee.substring(0,fee.indexOf("\",\""));
            if(fee.trim().length() == 0)
                fee = emptyvalue;

        }catch(Exception ex){
            fee = emptyvalue ;
        }
        result.put("AMLowerFees", fee);

        return result;


    }
    private String removeDoubleQuote (String source){
        if(source.startsWith("\""))
            source = source.substring(1);
        if(source.endsWith("\"")){
            source = source.substring(0,source.length()-1);
        }
        //source = source.replace("\n", "").replace("\r", "");
        return source;
    }
    public String ucs2ToUTF8(String src) throws UnsupportedEncodingException
    {
        String converted="";
        try{
            converted = org.apache.commons.lang.StringEscapeUtils.unescapeJava(src);
            return converted;
        }catch(Exception ex){
            //ex.printStackTrace();
            return "-1";
        }

    }

}
