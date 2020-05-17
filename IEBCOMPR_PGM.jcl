//------------Compare Data Sets Program-------------
//STEP1 EXEC PGM=IEBCOMPR
//SYSUT1 DD DSN=Z51555.COURSE.PS1,DISP=SHR             <---- DATASETS TO BE COMPARED
//SYSUT2 DD DSN=Z51555.COURSE.PS2,DISP=SHR             <---- DATASETS TO BE COMPARED
//SYSIN DD *
COMPARE TYPORG=PS                                      ----> GIVE PS FOR PS FILES OR PO FOR PDS, PDSE FILES
/*
//* RC = 0 FOR IDENTICAL DATASETS
//* RC = 8 FOR NON-IDENTICAL DATASETS
//********************************************************************************
