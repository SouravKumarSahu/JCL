####COMPILE & EXECUTE JAVA PROGRAM WITH DB2 IN MAINFRAME OMVS VIA MVS####

##EXECUTABLE FILE OF JAVA PROGRAM STAYS IN OMVS AND RUNS IN OMVS ONLY##

##TO INTERACT WITH MAINFRAME MVS DB2, USE com.ibm.db2.jcc.DB2Driver##


##CREATE FOLLOWING db2java.java PROGRAM IN OMVS##
// --------------------------------------------------
//#LOAD REUSABLE JAVA CODE NEEDED FOR THE DB2 API (APPLICATION PROGRAM INTERFACE)#         
// --------------------------------------------------
import java.sql.Connection;                          
import java.sql.DriverManager;                       
import java.sql.ResultSet;                           
import java.sql.SQLException;                        
import java.sql.Statement;                           
// --------------------------------------------------
//#DECLARE FIELDS, METHODS, AND BLOCKS OF CODE       
// --------------------------------------------------
public class db2java                                 
{                                                    
// --------------------------------------------------
//#DECLARE A 'METHOD' IN 'CLASS' NAMED DB2JAVA       
// --------------------------------------------------
  public static void main(String[] args)             
 {                                                   
// --------------------------------------------------
//#TRY BLOCK IS A SET OF STATEMENTS WHERE AN EXCEPTION CAN OCCUR                         
// --------------------------------------------------
   try                                               
  {                                                  
// --------------------------------------------------
//#LOAD THE DB2 DRIVER                               
// --------------------------------------------------
    Class.forName("com.ibm.db2.jcc.DB2Driver");      
// --------------------------------------------------
//#ESTABLISH A CONNECTION TO DB2                     
// --------------------------------------------------
    Connection db2Conn = DriverManager.getConnection 
     ("jdbc:db2://192.86.32.91:5040/DALLASC:"        
      + "user=z57312;" + "password=jann2020;");      
// --------------------------------------------------
//#USE A STATEMENT TO GATHER DATA FROM THE DATABASE  
// --------------------------------------------------         
    Statement st = db2Conn.createStatement();                 
    String myQuery =                                          
     "SELECT employeenumber from ibmuser.vphone " +           
        "where phonenumber = '2167'";                         
// --------------------------------------------------         
//#EXECUTE THE QUERY                                          
// --------------------------------------------------         
    ResultSet resultSet = st.executeQuery(myQuery);           
// --------------------------------------------------         
//#CYCLE THROUGH THE RESULTSET                                
// --------------------------------------------------         
    while (resultSet.next())                                  
      {                                                       
       String empnum  = resultSet.getString("employeenumber");
// --------------------------------------------------         
//#DISPLAY OUTPUT                                             
// --------------------------------------------------         
       System.out.println("Employee Number:" + empnum);       
      }                                                       
// --------------------------------------------------         
//#CLEAN UP RESOURCES                                         
// --------------------------------------------------         
     resultSet.close();                                       
     st.close();                                              
     db2Conn.close();                                         
// --------------------------------------------------         
//#CLOSE 'TRY' BLOCK OF CODE                                  
// --------------------------------------------------         
  }                                                           
// --------------------------------------------------         
//#IF EXECUTION PROBLEMS, REPORT DETAILS OF PROBLEM           
// --------------------------------------------------         
   catch (ClassNotFoundException cnfe)                        
    {                                                         
     cnfe.printStackTrace();                                  
    }                                                         
   catch (SQLException sqle)                                  
    {                                                
     sqle.printStackTrace();                         
    }                                                
// --------------------------------------------------
//#CLOSE 'MAIN' METHOD AND 'CLASS'                   
// --------------------------------------------------
 }                                                   
}        



#COMPILE & EXECUTE db2java.java VIA MVS USING JCL#
//DB2JAVA  JOB 1,REGION=0M,NOTIFY=&SYSUID         
//JAVAC    EXEC PGM=BPXBATCH,                     
//  PARM='sh javac db2java.java'                  
//STDOUT   DD SYSOUT=*                            
//STDERR   DD SYSOUT=*                            
//CEEDUMP  DD DUMMY    
//*                           
// IF RC = 0 THEN                                 
//JAVA     EXEC PGM=BPXBATCH,                     
//  PARM='sh java db2java'                        
//STDOUT   DD DSN=&SYSUID..P3.OUTPUT(#09),DISP=SHR
//STDERR   DD SYSOUT=*                            
//CEEDUMP  DD DUMMY                               
// ENDIF 
