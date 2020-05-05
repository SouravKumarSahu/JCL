####COMPILE & EXECUTE C & COBOL PROGRAM IN MAINFRAME WITH FILES####

##CREATE FOLLOWING C PROGRAM CHELLO, COBOL PROGRAM CBLHELLO & JCL SCRIPT HELLO IN THE SAME FOLDER##

#C PROGRAM ZC#
/* fgets, fputs, and string function examples */    
#include <stdio.h>                                  
#include <string.h>                                 
int main ()                                         
{                                                   
   FILE *iFile, *oFile;                             
   char recLine  [80];                              
   char * chLine;                                   
   oFile = fopen ("DD:RECOUT","w");                 
   iFile = fopen ("DD:RECIN","r");                  
     if (iFile==NULL) perror ("Error opening file");
     else                                           
     {                                              
       do {                                         
           fgets (recLine,80,iFile);                
           chLine = strstr (recLine,"###");         
           strncpy (chLine,"x86",3);                
           fputs (recLine,oFile);                   
          } while (recLine == NULL);                
       fclose (iFile);                              
       fclose (oFile);                              
     }                                              
   return 0;                                        
}                                                   

#COBOL PROGRAM ZCOBOL#
      *-----------------------                   
       IDENTIFICATION DIVISION.                  
      *-----------------------                   
       PROGRAM-ID.    ZCOBOL                     
       AUTHOR.        Otto B. Fun.               
      *--------------------                      
       ENVIRONMENT DIVISION.                     
      *--------------------                      
       INPUT-OUTPUT SECTION.                     
      *                                          
       FILE-CONTROL.                             
           SELECT REC-OUT    ASSIGN TO RECOUT.   
           SELECT REC-IN     ASSIGN TO RECIN     
                  ORGANIZATION IS SEQUENTIAL.    
      *-------------                             
       DATA DIVISION.                            
      *-------------                             
       FILE SECTION.                             
       FD  REC-IN     RECORDING MODE F.          
       01  REC-IN-MSG         PIC X(80).         
      *                                          
       FD  REC-OUT    RECORDING MODE F.          
       01  REC-OUT-MSG        PIC X(80).         
      *                                          
       WORKING-STORAGE SECTION.                  
       01 FLAGS.                                 
         05 LASTREC           PIC X VALUE SPACE. 
             88 LAST-REC            VALUE "N".   
      *------------------                        
       PROCEDURE DIVISION.                       
      *------------------                        
       OPEN-FILES.                               
           OPEN INPUT  REC-IN.                   
           OPEN OUTPUT REC-OUT.                  
      *                                          
       READ-NEXT-RECORD.                         
           PERFORM UNTIL LAST-REC                
           PERFORM READ-RECORD                
           PERFORM STOP-AT-LAST-RECORD        
           PERFORM CHANGE-RECORD              
           PERFORM WRITE-RECORD               
           END-PERFORM.                       
      *                                       
       READ-RECORD.                           
           READ REC-IN                        
           AT END SET LAST-REC TO TRUE        
           END-READ.                          
      *                                       
       STOP-AT-LAST-RECORD.                   
            IF LAST-REC THEN                  
               CLOSE REC-IN                   
               CLOSE REC-OUT                  
               STOP RUN.                      
      *                                       
       CHANGE-RECORD.                         
           INSPECT REC-IN-MSG                 
           REPLACING ALL "??? ?" by "IBM Z".  
      *                                       
       WRITE-RECORD.                          
           MOVE REC-IN-MSG   TO  REC-OUT-MSG  
           WRITE REC-OUT-MSG.                 
      *                                       
		   
		   
#JCL SCRIPT HELLO TO COMPILE AND EXECUTE C & COBOL PROGRAMS#
//* STEP TO COMPILE COBOL PROGRAM IN CURRENT FOLDER AND STORE EXECUTABLE IN DEFAULT LOAD LIBRARY 
//C       EXEC CBCXCB,MBR=ZC                                    
//*-------------------------------------------------------------
// IF RC = 0 THEN                                               
//*-------------------------------------------------------------
//* STEP TO EXECUTE ABOVE GENERATED C EXECUTABLE FILE FROM LOAD LIBRARY
//* NOTE THE DD NAME IN JCL & C PROGRAM
//CRUN    EXEC PGM=ZC                                           
//STEPLIB DD   DSN=&SYSUID..LOAD,DISP=SHR                       
//RECIN   DD   DSN=ZOS.MTM2019.PUBLIC.SHARED.DATA(MSG1),DISP=SHR
//RECOUT  DD   DSN=&SYSUID..P3.OUTPUT(#04),DISP=SHR             
//CEEDUMP DD   DUMMY                                            
//*-------------------------------------------------------------
// ENDIF                                                        
//*-------------------------------------------------------------
//* STEP TO COMPILE C PROGRAM IN CURRENT FOLDER AND STORE EXECUTABLE IN DEFAULT LOAD LIBRARY 
//COBOL   EXEC IGYWCL,MBR=ZCOBOL                                
//*-------------------------------------------------------------
// IF RC = 0 THEN                                               
//*-------------------------------------------------------------
//* STEP TO EXECUTE ABOVE GENERATED COBOL EXECUTABLE FILE FROM LOAD LIBRARY
//* NOTE THE DD NAME IN JCL & COBOL PROGRAM
//CBLRUN  EXEC PGM=ZCOBOL                                       
//STEPLIB DD   DSN=&SYSUID..LOAD,DISP=SHR                       
//RECIN   DD   DSN=ZOS.MTM2019.PUBLIC.SHARED.DATA(MSG2),DISP=SHR
//        DD   DSN=&SYSUID..P3.OUTPUT(#04),DISP=SHR             
//RECOUT  DD   DSN=&SYSUID..P3.OUTPUT(#04),DISP=SHR             
//CEEDUMP DD   DUMMY                                            
//*-------------------------------------------------------------
// ENDIF                                                        

#TSO COMMAND TO EXECUTE ABOVE GENERATED EXECUTABLE OUTSIDE JCL
tso call load(ZC)
tso call load(ZCOBOL)
