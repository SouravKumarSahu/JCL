//----------Rename member syntax---------
//STEP1 EXEC PGM=IEBCOPY
//DD1 DD DSN=ABHI.COURSE.PDS1,DISP=SHR              <------- INPUT DATASET
//DD2 DD DSN=ABHI.COURSE.PDS2,DISP=SHR              <------- INPUT DATASET
//DD3 DD DSN=ABHI.COURSE.PDS3,DISP=SHR              <------- OUTPUT DATASET
//SYSIN DD *
COPY OUTDD=DD3                                      <------- DD NAME OF OUTPUT DATASET
INDD=DD1                                            <------- DD NAME OF INPUT DATASET
INDD=DD2                                            <------- DD NAME OF INPUT DATASET
SELECT MEMBER=((MEMBER1,NEWNAME))                   <------- MEMBERS NAMES TO BE RENAMED
/*
//********************************************************************************
//----------Replace member syntax---------
//STEP1 EXEC PGM=IEBCOPY
//DD1 DD DSN=ABHI.COURSE.PDS1,DISP=SHR              <------- INPUT DATASET
//DD2 DD DSN=ABHI.COURSE.PDS2,DISP=SHR              <------- INPUT DATASET
//DD3 DD DSN=ABHI.COURSE.PDS3,DISP=SHR              <------- OUTPUT DATASET
//SYSIN DD *
COPY OUTDD=DD3                                      <------- DD NAME OF OUTPUT DATASET
INDD=DD1                                            <------- DD NAME OF INPUT DATASET
INDD=DD2                                            <------- DD NAME OF INPUT DATASET
SELECT MEMBER=((MEMBER1,,R))                        <------- MEMBERS NAMES TO BE REPLACED
/*
//********************************************************************************
//----------Rename and Replace syntax---------
//STEP1 EXEC PGM=IEBCOPY
//DD1 DD DSN=ABHI.COURSE.PDS1,DISP=SHR              <------- INPUT DATASET
//DD2 DD DSN=ABHI.COURSE.PDS2,DISP=SHR              <------- INPUT DATASET
//DD3 DD DSN=ABHI.COURSE.PDS3,DISP=SHR              <------- OUTPUT DATASET
//SYSIN DD *
COPY OUTDD=DD3                                      <------- DD NAME OF OUTPUT DATASET
INDD=DD1                                            <------- DD NAME OF INPUT DATASET
INDD=DD2                                            <------- DD NAME OF INPUT DATASET
SELECT MEMBER=((MEMBER1,NEWNAME,R))                 <------- MEMBERS NAMES TO BE RENAMED AND REPLACED
/*
//********************************************************************************
