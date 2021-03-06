//----------Copy between PS and PDS members---------
//STEP1 EXEC PGM=IEBGENER
//SYSUT1 DD DSN=Z51555.COURSE.PDS1(MEMBER1),DISP=SHR <------ INPUT DATASET
//SYSUT2 DD DSN=Z51555.COURSE.PS2,DISP=SHR           <------ OUTPUT DATASET
//SYSIN DD DUMMY
/*
//********************************************************************************
//----------Generate PDS member while copying---------
//STEP1 EXEC PGM=IEBGENER
//SYSUT1 DD DSN=Z51555.COURSE.PS1,DISP=SHR           <------ INPUT DATASET
//SYSUT2 DD DSN=Z51555.COURSE.PDS2,DISP=SHR          <------ OUTPUT DATASET
//SYSIN DD *
GENERATE MAXNAME=1
MEMBER NAME=MEMBER1
/*
//********************************************************************************
//----------Copy a PDS member---------
//STEP1 EXEC PGM=IEBGENER
//SYSUT1 DD DSN=Z51555.COURSE.PDS1(MEMBER1),DISP=SHR <------ INPUT DATASET
//SYSUT2 DD DSN=Z51555.COURSE.PDS2(MEMBER2),DISP=SHR <------ OUTPUT DATASET
//SYSIN DD DUMMY
/*
//********************************************************************************
//----------Merge PDS members---------
//STEP1 EXEC PGM=IEBGENER
//SYSUT1 DD DSN=Z51555.COURSE.PDS1(MEMBER1),DISP=SHR <------ INPUT DATASET
// DD DSN=Z51555.COURSE.PDS1(MEMBER2),DISP=SHR       <------ INPUT DATASET
// DD DSN=Z51555.COURSE.PDS1(MEMBER3),DISP=SHR       <------ INPUT DATASET
//SYSUT2 DD DSN=Z51555.COURSE.PDS2(MEMBER4),DISP=SHR <------ OUTPUT DATASET
//SYSIN DD DUMMY
/*
//********************************************************************************
//----------Copy a PS---------
//STEP1 EXEC PGM=IEBGENER
//SYSUT1 DD DSN=Z51555.COURSE.PS1,DISP=SHR           <------ INPUT DATASET
//SYSUT2 DD DSN=Z51555.COURSE.PS2,DISP=SHR           <------ OUTPUT DATASET
//SYSIN DD DUMMY
/*
//********************************************************************************
//----------Merge PS datasets---------
//STEP1 EXEC PGM=IEBGENER
//SYSUT1 DD DSN=Z51555.COURSE.PS1,DISP=SHR           <------ INPUT DATASET
// DD DSN=Z51555.COURSE.PS2,DISP=SHR                 <------ INPUT DATASET
// DD DSN=Z51555.COURSE.PS3,DISP=SHR                 <------ INPUT DATASET
//SYSUT2 DD DSN=Z51555.COURSE.PS4,DISP=SHR           <------ OUTPUT DATASET
//SYSIN DD DUMMY
/*
//********************************************************************************
