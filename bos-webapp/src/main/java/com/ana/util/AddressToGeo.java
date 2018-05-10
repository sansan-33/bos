package com.ana.util;

import java.io.*;
import java.net.URLConnection;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
import javax.xml.xpath.XPathConstants;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.*;

/**
 * This class will get the lat long values.
 * @author SANTHOSH REDDY MANDADI
 * @version 1.0
 * @since 20-Sep-2012
 */
public class AddressToGeo
{
    public static void main(String[] args) throws Exception
    {
        int i=0;
        StringBuilder  resultsb  = new StringBuilder();
        ArrayList<String[]> schools = getAllSchools();
        for(String[] address : schools) {
            //if(i > 100){
            //    break;
            //}
            resultsb.append(getLatLongPositions(address[0], address[1]));
            i++;
        }
        saveToFile(resultsb);
    }

    public static void saveToFile(StringBuilder sb){
        File file = new File("geo.sql");
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
        String api = "http://localhost:9999/school/controller/get_all_schools?category=5";
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
                            String address = el.getElementsByTagName("name").item(0).getTextContent() ;
                            address = fixAddress(address);

                            System.out.printf("id %s / address %s", id ,address);
                            result.add(new String[] {id,address});
                        }
                    }
                }
            }
        }
        return result;
    }

    private static String fixAddress(String address) {

        address = address.indexOf("CDATA") > 0 ? address.substring(9, address.length() - 3) : address;
        /*address = address.replaceFirst("新界", "");
        address = address.replaceFirst("九龍", "");
        address = address.replaceFirst("香港", "");
        address = address.lastIndexOf("地下") > 0 ? address.substring(0, address.indexOf("地下")) : address ;
        address = address.lastIndexOf("字樓") > 0 ? address.substring(0, address.indexOf("字樓")) : address ;
        address = address.lastIndexOf("平台") > 0 ? address.substring(0, address.indexOf("平台")) : address ;
        address = address.lastIndexOf("中心") > 0 ? address.substring(0, address.indexOf("中心")) : address ;
        address = address.lastIndexOf("樓") > 0 ? address.substring(0, address.indexOf("樓")) : address ;
        address = address.lastIndexOf("期") > 0 ? address.substring(0, address.indexOf("期")) : address ;
        address = address.lastIndexOf("－") > 0 ? address.substring(0, address.indexOf("－")) : address ;

        */return address;
    }

    public static String getLatLongPositions(String id, String address) throws Exception
    {
        String result = "";
        int responseCode = 0;
        String api = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + URLEncoder.encode(address, "UTF-8") + "&key=AIzaSyDvklaED8nVPIai_v0H2xkF1cibULNpE_w";
        System.out.println("address: "  +api);

        URL url = new URL(api);

        HttpURLConnection httpConnection = (HttpURLConnection)url.openConnection();
        httpConnection.connect();
        responseCode = httpConnection.getResponseCode();
        StringBuilder jsonResults = new StringBuilder();

        if(responseCode == 200)
        {
            InputStreamReader in = new InputStreamReader(httpConnection.getInputStream());

            int read;
            char[] buff = new char[1024];
            while ((read = in.read(buff)) != -1) {
                jsonResults.append(buff, 0, read);
            }
            try {
                // Create a JSON object hierarchy from the results
                JSONObject jsonObj = new JSONObject(jsonResults.toString());
                if(jsonObj.length() > 0 && jsonObj.getJSONArray("results").length() > 0 ) {
                    JSONObject jsonGeoObj = ((JSONObject) jsonObj.getJSONArray("results").get(0)).getJSONObject("geometry").getJSONObject("location");
                    System.out.println("jsonResults.toString() " + jsonObj.toString());
                    String lat = "" + jsonGeoObj.get("lat");
                    String lng = "" + jsonGeoObj.get("lng");
                    lat = lat.length() > 9 ? lat.substring(0,9) : lat ;
                    lng = lng.length() > 9 ? lng.substring(0,9) : lng ;

                    result = "update entitybasic set lat='" + lat + "', lng='" + lng  + "' where entityid=" + id + ";";
                }else{
                    result = "Error " + address + ", id:" + id;
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        return result + "\n";
    }

}


