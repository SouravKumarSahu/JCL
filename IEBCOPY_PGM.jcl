//----------Rename member syntax---------
//STEP1 EXEC PGM=IEBCOPY
//DD1 DD DSN=Z51555.COURSE.PDS1,DISP=SHR            <------- INPUT DATASET
//DD2 DD DSN=Z51555.COURSE.PDS2,DISP=SHR            <------- INPUT DATASET
//DD3 DD DSN=Z51555.COURSE.PDS3,DISP=SHR            <------- OUTPUT DATASET
//SYSIN DD *
COPY OUTDD=DD3                                      <------- DD NAME OF OUTPUT DATASET
INDD=DD1                                            <------- DD NAME OF INPUT DATASET
INDD=DD2                                            <------- DD NAME OF INPUT DATASET
SELECT MEMBER=((MEMBER1,NEWNAME))                   <------- MEMBERS NAMES TO BE RENAMED
/*
//********************************************************************************
//----------Replace member syntax---------
//STEP1 EXEC PGM=IEBCOPY
//DD1 DD DSN=Z51555.COURSE.PDS1,DISP=SHR            <------- INPUT DATASET
//DD2 DD DSN=Z51555.COURSE.PDS2,DISP=SHR            <------- INPUT DATASET
//DD3 DD DSN=Z51555.COURSE.PDS3,DISP=SHR            <------- OUTPUT DATASET
//SYSIN DD *
COPY OUTDD=DD3                                      <------- DD NAME OF OUTPUT DATASET
INDD=DD1                                            <------- DD NAME OF INPUT DATASET
INDD=DD2                                            <------- DD NAME OF INPUT DATASET
SELECT MEMBER=((MEMBER1,,R))                        <------- MEMBERS NAMES TO BE REPLACED
/*
//********************************************************************************
//----------Rename and Replace syntax---------
//STEP1 EXEC PGM=IEBCOPY
//DD1 DD DSN=Z51555.COURSE.PDS1,DISP=SHR            <------- INPUT DATASET
//DD2 DD DSN=Z51555.COURSE.PDS2,DISP=SHR            <------- INPUT DATASET
//DD3 DD DSN=Z51555.COURSE.PDS3,DISP=SHR            <------- OUTPUT DATASET
//SYSIN DD *
COPY OUTDD=DD3                                      <------- DD NAME OF OUTPUT DATASET
INDD=DD1                                            <------- DD NAME OF INPUT DATASET
INDD=DD2                                            <------- DD NAME OF INPUT DATASET
SELECT MEMBER=((MEMBER1,NEWNAME,R))                 <------- MEMBERS NAMES TO BE RENAMED AND REPLACED
/*
//********************************************************************************
//----------Exclude Copy Syntax---------
//STEP1 EXEC PGM=IEBCOPY
//DD1 DD DSN=Z51555.COURSE.PDS1,DISP=SHR            <------- INPUT DATASET
//DD2 DD DSN=Z51555.COURSE.PDS2,DISP=SHR            <------- INPUT DATASET
//DD3 DD DSN=Z51555.COURSE.PDS3,DISP=SHR            <------- OUTPUT DATASET
//SYSIN DD *
COPY OUTDD=DD3                                      <------- DD NAME OF OUTPUT DATASET
INDD=DD1                                            <------- DD NAME OF INPUT DATASET
INDD=DD2                                            <------- DD NAME OF INPUT DATASET
EXCLUDE MEMBER=(MEMBER1,MEMBER4)                    <------- MEMBERS TO BE IGNORED WHILE COPYING
/*
//********************************************************************************
//----------SELECTive Copy Syntax---------
//STEP1 EXEC PGM=IEBCOPY
//DD1 DD DSN=Z51555.COURSE.PDS1,DISP=SHR            <------- INPUT DATASET
//DD2 DD DSN=Z51555.COURSE.PDS2,DISP=SHR            <------- INPUT DATASET
//DD3 DD DSN=Z51555.COURSE.PDS3,DISP=SHR            <------- OUTPUT DATASET
//SYSIN DD *
COPY OUTDD=DD3                                      <------- DD NAME OF OUTPUT DATASET
INDD=DD1                                            <------- DD NAME OF INPUT DATASET
INDD=DD2                                            <------- DD NAME OF INPUT DATASET
SELECT MEMBER=(MEMBER1,MEMBER4)                     <------- MEMBERS NAMES TO BE COPIED
/*
//********************************************************************************
//----------Compression of PDS---------
//STEP1 EXEC PGM=IEBCOPY
//DD1 DD DSN=Z51555.COURSE.PDS1,DISP=SHR            <------- DATASET TO BE COMPRESSED
//SYSIN DD *
COPY OUTDD=DD1                                      <------- DD NAME OF DATASET
INDD=DD1                                            <------- DD NAME OF DATASET
/*
//********************************************************************************
