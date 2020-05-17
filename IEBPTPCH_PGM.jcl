//----------Print a PS dataset---------
//STEP1 EXEC PGM=IEBPTPCH
//SYSUT1 DD DSN=Z51555.COURSE.PS1,DISP=SHR           <------ INPUT DATASET
//SYSUT2 DD SYSOUT=*                                 <------ OUTPUT DATASET
//SYSIN DD *
PRINT TYPORG=PS                                      <------ TYPE OF DATASET
/*
//********************************************************************************
//----------Print multiple PS dataset---------
//STEP1 EXEC PGM=IEBPTPCH
//SYSUT1 DD DSN=Z51555.COURSE.PS1,DISP=SHR           <------ INPUT DATASET
// DD DSN=Z51555.COURSE.PS2,DISP=SHR                 <------ INPUT DATASET
//SYSUT2 DD SYSOUT=*                                 <------ OUTPUT DATASET
//SYSIN DD *
PRINT TYPORG=PS                                      <------ TYPE OF DATASET
/*
//********************************************************************************
//----------Print a PDS dataset---------
//STEP1 EXEC PGM=IEBPTPCH
//SYSUT1 DD DSN=Z51555.COURSE.PDS1,DISP=SHR          <------ INPUT DATASET
//SYSUT2 DD SYSOUT=*                                 <------ OUTPUT DATASET
//SYSIN DD *
PRINT TYPORG=PO                                      <------ TYPE OF DATASET
/*
//********************************************************************************
