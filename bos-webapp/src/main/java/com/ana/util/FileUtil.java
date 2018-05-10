package com.ana.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

public class FileUtil {

    private final Logger theLogger = LoggerFactory.getLogger(FileUtil.class);

	public String saveFileToServer(MultipartFile multifile, String path, String filename)  throws IOException {  
        File dir = new File(path);  
        if (!dir.exists()) {  
            dir.mkdir();  
        }  
       
        InputStream inputStream = multifile.getInputStream();  
        theLogger.debug("PATH:  " + path + multifile.getOriginalFilename());
        OutputStream outputStream = new FileOutputStream(path  +  filename);  
        byte[] buffer = multifile.getBytes();  
        theLogger.debug("buffer size) " + buffer.length );
        int bytesum = 0;  
        int byteread = 0;  
        while ((byteread = inputStream.read(buffer)) != -1) {  
            bytesum += byteread;  
            outputStream.write(buffer, 0, byteread);  
            outputStream.flush();  
            theLogger.debug("bytesum  " + bytesum);
        }  
        outputStream.close();  
        inputStream.close();  
        theLogger.debug("All closed " );
        
        return path + multifile.getOriginalFilename();  
    }  
    public boolean deleteFiletoServer(String file, String path)  
            throws IOException {  
        boolean success = Boolean.FALSE;
        theLogger.info("deleteFiletoServer : " + path+file);
        File f = new File(path+file);  
        if (f.exists()) {  
           f.delete();  
           success = Boolean.TRUE;  
        }  
  
        return success;  
    }  

}
