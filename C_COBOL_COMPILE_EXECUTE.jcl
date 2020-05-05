####COMPILE & EXECUTE C & COBOL PROGRAM IN MAINFRAME####

##CREATE FOLLOWING C PROGRAM CHELLO, COBOL PROGRAM CBLHELLO & JCL SCRIPT HELLO IN THE SAME FOLDER##

#C PROGRAM CHELLO#
# include <stdio.h>             
int main() {                    
    printf("\nC says Hello!\n");
}                               


#COBOL PROGRAM CBLHELLO#
        identification division.       
        program-id. hello .            
        procedure division.            
           display "COBOL says Hello!".
           goback.                     
		   
		   
#JCL SCRIPT HELLO TO COMPILE AND EXECUTE C & COBOL PROGRAMS#
//* STEP TO COMPILE COBOL PROGRAM IN CURRENT FOLDER AND STORE EXECUTABLE IN DEFAULT LOAD LIBRARY 
//COBOL   EXEC IGYWCL,MBR=CBLHELLO       
//*-----------------------------------
//* STEP TO EXECUTE ABOVE GENERATED COBOL EXECUTABLE FILE FROM LOAD LIBRARY
//RUN     EXEC PGM=CBLHELLO              
//STEPLIB DD   DSN=&SYSUID..LOAD,DISP=SHR
//*-----------------------------------   
//* STEP TO COMPILE C PROGRAM IN CURRENT FOLDER AND STORE EXECUTABLE IN DEFAULT LOAD LIBRARY 
//C       EXEC CBCXCB,MBR=CHELLO         
//*-----------------------------------
//* STEP TO EXECUTE ABOVE GENERATED C EXECUTABLE FILE FROM LOAD LIBRARY
//RUN     EXEC PGM=CHELLO                
//STEPLIB DD   DSN=&SYSUID..LOAD,DISP=SHR

#TSO COMMAND TO EXECUTE ABOVE GENERATED EXECUTABLE OUTSIDE JCL
tso call load(chello)
tso call load(cblhello)
