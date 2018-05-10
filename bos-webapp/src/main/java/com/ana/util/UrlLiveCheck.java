package com.ana.util;

import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

public class UrlLiveCheck
{
    public static void main(String[] args) throws Exception
    {
        int i=0;
        StringBuilder  resultsb  = new StringBuilder();
        ArrayList<String[]> schools = getAllSchools();
        for(String[] website : schools) {
            //if(i > 100){
            //    break;
            //}
            String result = checkLiveness(website[0], website[1]);
            if(result.length() > 0)
                resultsb.append(result);
            i++;
        }
        saveToFile(resultsb);
    }

    private static String checkLiveness(String s, String s1) {

        String result = "";
        try{
            final URL url = new URL(s1);
            HttpURLConnection huc = (HttpURLConnection) url.openConnection();
            huc.setFollowRedirects(true);
            //huc.setRequestMethod("HEAD");
            int responseCode = huc.getResponseCode();

            if (responseCode != 404) {
                result = "";
            } else {
                result = "ID:" + s + ", URL: " + s1 + "     is dead";
                System.out.println(result);
            }
        }catch (Exception ex){
            //ex.printStackTrace();
            result = "ID:" + s + ", URL: " + s1 + "       is dead";
        }
        return result;
    }

    public static void saveToFile(StringBuilder sb){
        File file = new File("liveness.sql");
        file.delete();
        try (FileOutputStream oS = new FileOutputStream(file)) {
            oS.write(sb.toString().getBytes());
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    public static ArrayList<String[]> getAllSchools() throws Exception
    {
        ArrayList<String[]> result = new ArrayList<String[]>();
        int responseCode = 0;
        String api = "http://www.bookofschool.com/school/controller/get_all_schools";
        URL url = new URL(api);
        HttpURLConnection httpConnection = (HttpURLConnection)url.openConnection();
        httpConnection.connect();
        responseCode = httpConnection.getResponseCode();
        if(responseCode == 200)
        {
            DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();;
            Document document = builder.parse(httpConnection.getInputStream());
            Element docEle = document.getDocumentElement();
            NodeList nl = docEle.getChildNodes();
            if (nl != null) {
                int length = nl.getLength();
                for (int i = 0; i < length; i++) {
                    if (nl.item(i).getNodeType() == Node.ELEMENT_NODE) {
                        Element el = (Element) nl.item(i);
                        if (el.getNodeName().contains("school")) {
                            String id = el.getElementsByTagName("id").item(0).getTextContent();
                            String website = "";
                            if(el.getElementsByTagName("website") != null && el.getElementsByTagName("website").item(0) != null  && el.getElementsByTagName("website").item(0).getTextContent() != null)
                               website = el.getElementsByTagName("website").item(0).getTextContent() ;

                            //System.out.printf("id %s / website %s", id ,website);
                            result.add(new String[] {id,website});
                        }
                    }
                }
            }
        }
        return result;
    }



}


