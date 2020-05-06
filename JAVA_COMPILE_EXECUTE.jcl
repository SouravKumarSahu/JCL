####COMPILE & EXECUTE JAVA PROGRAM IN MAINFRAME OMVS via OMVS/MVS/SSH####

##EXECUTABLE FILE OF JAVA PROGRAM STAYS IN OMVS AND RUNS IN OMVS ONLY## 

##CREATE FOLLOWING pgmjava.java PROGRAM IN OMVS##
public class pgmjava {                         
 public static void main(String[] args) {      
System.out.println(" Java says Hello World! ");
 }                                             
}

#COMPILE pgmjava.java WITHIN OMVS#
javac pgmjava.java

#IF MEMORY ERROR IS ENCOUNTERED; CONNECT TO OMVS VIA SSH FROM YOUR LOCAL MACHINE AND TRY TO COMPILE AGAIN#
ssh Z####@xxx.xx.xx.xx
<password>
javac pgmjava.java


#EXECUTE pgmjava.java WITHIN OMVS or SSH#
java pgmjava


#COMPILE pgmjava.java VIA MVS USING JCL#
//JAVAC    EXEC PGM=BPXBATCH,  
//  PARM='sh javac pgmjava.java' 
//STDOUT   DD SYSOUT=*         
//STDERR   DD SYSOUT=*         
//CEEDUMP  DD DUMMY            


#EXECUTE pgmjava.java VIA MVS USING JCL#
//JAVAC    EXEC PGM=BPXBATCH,REGION=0M,   
//  PARM='sh java pgmjava'                
//STDOUT   DD DSN=&SYSUID..P3.OUTPUT(#05),
//            DISP=(MOD,CATLG,DELETE)     
//STDERR   DD SYSOUT=*                    
//CEEDUMP  DD DUMMY   
