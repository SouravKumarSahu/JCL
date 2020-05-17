//----------EDIT Job stream Program---------
//STEP1 EXEC PGM=IEBEDIT
//SYSUT1 DD DSN=Z51555.COURSE.PS1,DISP=SHR           <------ INPUT DATASET
//SYSUT2 DD DSN=Z51555.COURSE.PS4,DISP=SHR           <------ OUTPUT DATASET
//SYSIN DD *
EDIT START=JOB1,TYPE=EXCLUDE,STEPNAME=STEPB          <------ JOBNAME TO COPY
/*
//********************************************************************************
//----------Copy multiple JOBs into another dataset---------
//STEP1 EXEC PGM=IEBEDIT
//SYSUT1 DD DSN=Z51555.COURSE.PS1,DISP=SHR           <------ INPUT DATASET
// DD DSN=Z51555.COURSE.PS2,DISP=SHR                 <------ INPUT DATASET
//SYSUT2 DD DSN=Z51555.COURSE.PS3,DISP=SHR           <------ OUTPUT DATASET
//SYSIN DD *
EDIT START=JOB1 <------ JOBNAME TO COPY
EDIT START=JOB2 <------ JOBNAME TO COPY
/*
//********************************************************************************
//----------Copy Steps using INCLUDE---------
//STEP1 EXEC PGM=IEBEDIT
//SYSUT1 DD DSN=Z51555.COURSE.PS1,DISP=SHR           <------ INPUT DATASET
//SYSUT2 DD DSN=Z51555.COURSE.PS4,DISP=SHR           <------ OUTPUT DATASET
//SYSIN DD *
EDIT START=JOB1,TYPE=INCLUDE,STEPNAME=STEPB          <------ JOBNAME TO COPY
/*
//********************************************************************************
//----------Copy Steps using POSITION---------
//STEP1 EXEC PGM=IEBEDIT
//SYSUT1 DD DSN=Z51555.COURSE.PS1,DISP=SHR           <------ INPUT DATASET
//SYSUT2 DD DSN=Z51555.COURSE.PS4,DISP=SHR           <------ OUTPUT DATASET
//SYSIN DD *
EDIT START=JOB1,TYPE=POSITION,STEPNAME=STEPB         <------ JOBNAME TO COPY
/*
//********************************************************************************
//----------Copy entire JOB into another dataset---------
//STEP1 EXEC PGM=IEBEDIT
//SYSUT1 DD DSN=Z51555.COURSE.PS1,DISP=SHR           <------ INPUT DATASET
//SYSUT2 DD DSN=Z51555.COURSE.PS2,DISP=SHR           <------ OUTPUT DATASET
//SYSIN DD *
EDIT START=JOB1                                      <------ JOBNAME TO COPY
/*
//********************************************************************************
