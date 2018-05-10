import com.ana.dao.ObjectStatDAO;
import com.ana.entity.ObjectStat;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Hashtable;

public class ObjectStatRunnable implements Runnable {

    private final org.slf4j.Logger logger = LoggerFactory.getLogger(ObjectStatRunnable.class);
    private String threadNumber="";
    private boolean update = true;
    Hashtable<String,ObjectStat> objectStatMap = new Hashtable<String, ObjectStat>();


    public
    ObjectStatRunnable(int aThreadNumber,boolean aUpdate)
    {
        threadNumber = "" + aThreadNumber;
        update = aUpdate;
        initData();
    }

    public
    String getThreadNumber()
    {
        return threadNumber;
    }

    public
    void setThreadNumber(String aThreadNumber)
    {
        threadNumber = aThreadNumber;
    }

    public void initData(){
        ApplicationContext context = new ClassPathXmlApplicationContext("application-core-config.xml");
        ObjectStatDAO objectStatDAO = (ObjectStatDAO) context.getBean("objectStatDAO") ;

        if(update){
            try{
                objectStatMap = new Hashtable<String, ObjectStat>();
                java.util.List<HashMap> objectStatList = objectStatDAO.getObjectStatByType("test");
                int i=0;
                for(HashMap<String,Object> aMap : objectStatList){
                    objectStatMap.put("" + i, new ObjectStat((Integer) aMap.get("objectid"), "test", ((Integer) aMap.get("hitcounter")) + 1 ));
                    i++;
                }
                //System.out.println("objectStatMap size : " + objectStatMap.size());
            }catch(Exception ex){
                ex.printStackTrace();
                objectStatMap = new Hashtable<String, ObjectStat>();
            }
        }else{
            objectStatMap = new Hashtable<String, ObjectStat>();
            for(int j=1; j<= 100; j++){
                objectStatMap.put(j + "", new ObjectStat(j,"test",1));
            }
        }

    }
    @Transactional
    public void run() {
        ApplicationContext context = new ClassPathXmlApplicationContext("application-core-config.xml");
        ObjectStatDAO objectStatDAO = (ObjectStatDAO) context.getBean("objectStatDAO") ;
        try{
            objectStatDAO.saveTranObjectStat(objectStatMap);
        }catch(Exception ex){
            logger.error("saveTranObjectStat {}", ex);
        }finally{
            System.out.println("Thread: "+ threadNumber + "done !");
        }
    }
}