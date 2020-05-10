####COMPILE & EXECUTE JAVA PROGRAM WITH FILES IN MAINFRAME OMVS VIA MVS####

##EXECUTABLE FILE OF JAVA PROGRAM STAYS IN OMVS AND RUNS IN OMVS ONLY##

##TO INTERACT WITH MAINFRAME MVS FILES IN JCL DD STATEMENTS, USE MODULE ZFile IN JAVA PACKAGE com.ibm.jzos##

##CREATE FOLLOWING zjava.java PROGRAM IN OMVS##
import com.ibm.jzos.ZFile;                                           
public class zjava                                                   
{                                                                    
 public static void main(String[] args) throws Exception             
 {                                                                   
// ****************************************************************  
  ZFile zFileIn = new ZFile("//DD:RECIN", "rb,type=record,noseek");  
   long count = 0;                                                   
   try {byte[] recBuf = new byte[zFileIn.getLrecl()];                
   int nRead;                                                        
   while((nRead = zFileIn.read(recBuf)) >= 0)                        
    {String rec = new String(recBuf, 0, nRead);                      
     String newRec = rec.replace("Who said this", "Albert Einstein");
     System.out.println(newRec);                                     
     count++;};                                                      
       } finally {zFileIn.close();}                                  
 }                                                                   
}                                                                    


#COMPILE & EXECUTE zjava.java VIA MVS USING JCL#
//ZJAVA    JOB 1,REGION=0M,NOTIFY=&SYSUID                       
//JAVAC    EXEC PGM=BPXBATCH,                                   
//  PARM='sh javac zjava.java'                                  
//STDOUT   DD SYSOUT=*                                          
//STDERR   DD SYSOUT=*                                          
//CEEDUMP  DD DUMMY                                             
//*
// IF RC = 0 THEN                                               
//JAVA EXEC PROC=JVMPRC86,JAVACLS='zjava'                       
//STEPLIB DD DSN=ZOS.MTM2019.PUBLIC.LOAD,DISP=SHR               
//STDENV  DD DSN=ZOS.MTM2019.PUBLIC.SHARED.DATA(STDENV),DISP=SHR
//RECIN   DD PATH='/z/public/quote',PATHOPTS=ORDONLY            
//STDOUT  DD DSN=&SYSUID..P3.OUTPUT(#06),DISP=SHR               
//STDERR  DD SYSOUT=*                                           
//CEEDUMP DD DUMMY                                              
// ENDIF    
