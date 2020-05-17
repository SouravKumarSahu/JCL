//----------SORT Syntax---------
//STEP1 EXEC PGM=SORT
//SORTIN DD DSN=Z51555.COURSE.IMDB,DISP=SHR         <------- INPUT DATASET
//SORTOUT DD DSN=Z51555.COURSE.IMDB.OUTPUT,DISP=SHR <------- OUTPUT DATASET
//SYSIN DD *
SORT FIELDS=(55,4,CH,A)                             <------- SORT CARD
/*
//********************************************************************************
//----------SORT with INCLUDE Syntax---------
//STEP1 EXEC PGM=SORT
//SORTIN DD DSN=Z51555.COURSE.IMDB,DISP=SHR         <------- INPUT DATASET
//SORTOUT DD DSN=Z51555.COURSE.IMDB.OUTPUT,DISP=SHR <------- OUTPUT DATASET
//SYSIN DD *
SORT FIELDS=(55,4,CH,A)                             <------- SORT CARD
INCLUDE COND=(55,4,CH,GT,C’2018’)
/*
//********************************************************************************
//----------SORT with multiple INCLUDE Syntax---------
//STEP1 EXEC PGM=SORT
//SORTIN DD DSN=Z51555.COURSE.IMDB,DISP=SHR         <------- INPUT DATASET
//SORTOUT DD DSN=Z51555.COURSE.IMDB.OUTPUT,DISP=SHR <------- OUTPUT DATASET
//SYSIN DD *
SORT FIELDS=(55,4,CH,A)                             <------- SORT CARD
INCLUDE COND=(55,4,CH,GT,C’2018’,AND<OR>,219,1,CH,EQ,C’Y’)
/*
//********************************************************************************
//----------SORT with OMIT Syntax---------
//STEP1 EXEC PGM=SORT
//SORTIN DD DSN=Z51555.COURSE.IMDB,DISP=SHR         <------- INPUT DATASET
//SORTOUT DD DSN=Z51555.COURSE.IMDB.OUTPUT,DISP=SHR <------- OUTPUT DATASET
//SYSIN DD *
SORT FIELDS=(55,4,CH,A)                             <------- SORT CARD
OMIT COND=(55,4,CH,GT,C’2018’)
/*
//********************************************************************************
//----------SORT with OUTREC Syntax---------
//STEP1 EXEC PGM=SORT
//SORTIN DD DSN=Z51555.COURSE.IMDB,DISP=SHR         <------- INPUT DATASET
//SORTOUT DD DSN=Z51555.COURSE.IMDB.OUTPUT,DISP=SHR <------- OUTPUT DATASET
//SYSIN DD *
SORT FIELDS=(55,4,CH,A)                             <------- SORT CARD
OUTREC FIELDS=(55,4)
/
//********************************************************************************
/----------SORT with JOINKEYS Syntax 1---------
//STEP1 EXEC PGM=SORT
//SORTJNF1 DD DSN=Z51555.IP1,DISP=SHR               <------- INPUT DATASET
//SORTJNF2 DD DSN=Z51555.IP2,DISP=SHR               <------- INPUT DATASET
//SORTOUT DD DSN=Z51555.OUT,DISP=SHR                <------- OUTPUT DATASET
//SYSPRINT DD SYSOUT=*
//SYSOUT DD SYSOUT=*
//SYSIN DD *
SORT FIELDS=COPY                                    <------- SORT CARD
JOINKEYS FILE=F1,FIELDS=(1,88,A)
JOINKEYS FILE=F2,FIELDS=(1,88,A)
REFORMAT FIELDS=(F1:1,71,F2:1,9)
/
//********************************************************************************
/----------SORT with JOINKEYS Syntax 2---------
//STEP1 EXEC PGM=SORT
//IP1 DD DSN=Z51555.IP1,DISP=SHR                    <------- INPUT DATASET
//IP2 DD DSN=Z51555.IP2,DISP=SHR                    <------- INPUT DATASET
//SORTOUT DD DSN=Z51555.OUT,DISP=SHR                <------- OUTPUT DATASET
//SYSPRINT DD SYSOUT=*
//SYSOUT DD SYSOUT=*
//SYSIN DD *
SORT FIELDS=COPY                                    <------- SORT CARD
JOINKEYS F1=IP1,FIELDS=(1,88,A)
JOINKEYS F2=IP2,FIELDS=(1,88,A)
REFORMAT FIELDS=(F1:1,71,F2:1,9)
/*
//********************************************************************************
//***JOIN TYPE***|***FILE-1***|***FILE-2***|***OUTPUT***|
//               |Albert      |Albert      |Albert      |
//               |Dennis      |Dennis      |Dennis      |
//               |Gary        |Gary        |Gary        |
//   Inner Join  |Jake        |            |            |
//               |Kyle        |            |            |
//               |            |Matt        |            |
//               |            |            |            |
//*******************************************************
//***JOIN TYPE***|***FILE-1***|***FILE-2***|***OUTPUT***|
//               |Albert      |Albert      |            |
//               |Dennis      |Dennis      |            |
//               |Gary        |Gary        |            |
// UNPAIRED,     |Jake        |            |Jake        |
// F1,F2,ONLY    |Kyle        |            |Kyle        |
//               |            |Matt        |Matt        |
//               |            |            |            |
//*******************************************************
//***JOIN TYPE***|***FILE-1***|***FILE-2***|***OUTPUT***|
//               |Albert      |Albert      |Albert      |
//               |Dennis      |Dennis      |Dennis      |
//               |Gary        |Gary        |Gary        |
// Left Outer    |Jake        |            |Jake        |
// Join          |Kyle        |            |Kyle        |
//               |            |Matt        |            |
//               |            |            |            |
//*******************************************************
//***JOIN TYPE***|***FILE-1***|***FILE-2***|***OUTPUT***|
//               |Albert      |Albert      |Albert      |
//               |Dennis      |Dennis      |Dennis      |
//               |Gary        |Gary        |Gary        |
// Right Outer   |Jake        |            |            |
// Join          |Kyle        |            |            |
//               |            |Matt        |Matt        |
//               |            |            |            |
//*******************************************************
//***JOIN TYPE***|***FILE-1***|***FILE-2***|***OUTPUT***|
//               |Albert      |Albert      |Albert      |
//               |Dennis      |Dennis      |Dennis      |
//               |Gary        |Gary        |Gary        |
// Full Outer    |Jake        |            |Jake        |
// Join          |Kyle        |            |Kyle        |
//               |            |Matt        |Matt        |
//               |            |            |            |
//*******************************************************
//***JOIN TYPE***|***FILE-1***|***FILE-2***|***OUTPUT***|
//               |Albert      |Albert      |            |
//               |Dennis      |Dennis      |            |
//               |Gary        |Gary        |            |
// UNPAIRED,F1,  |Jake        |            |Jake        |
// ONLY          |Kyle        |            |Kyle        |
//               |            |Matt        |            |
//               |            |            |            |
//*******************************************************
//***JOIN TYPE***|***FILE-1***|***FILE-2***|***OUTPUT***|
//               |Albert      |Albert      |            |
//               |Dennis      |Dennis      |            |
//               |Gary        |Gary        |            |
// UNPAIRED,F2,  |Jake        |            |            |
// ONLY          |Kyle        |            |            |
//               |            |Matt        |Matt        |
//               |            |            |            |
//*******************************************************
