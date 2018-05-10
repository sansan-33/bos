import org.slf4j.LoggerFactory;


public class MainTest
{

    private final org.slf4j.Logger logger = LoggerFactory.getLogger(MainTest.class);

    public static void main(String[] args) {
            for(int i=0;i<200;i++){
                ObjectStatRunnable myRunnable = new ObjectStatRunnable(i,true);
                Thread t = new Thread(myRunnable);
                System.out.println("Thread: "+ i + " created" );
                t.start();
            }

    }
}
