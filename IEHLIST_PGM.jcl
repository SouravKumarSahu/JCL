//----------LIST one PDS---------
//STEP1 EXEC PGM=IEHLIST
//DD1 DD UNIT=DISK,VOLUME=SER=PUB000,DISP=SHR         <----- LOCATION OF DATASET
//SYSIN DD *
LISTPDS DSNAME=ABHI.COURSE.PDS3,VOLUME=DISK=PUB000    <----- NAME OF THE DATASET TO LIST
/*
//********************************************************************************
//----------LIST multiple PDS on same volume---------
//STEP1 EXEC PGM=IEHLIST
//DD1 DD UNIT=DISK,VOLUME=SER=PUB000,DISP=SHR         <----- LOCATION OF DATASET
//SYSIN DD *
LISTPDS DSNAME=ABHI.COURSE.PDS3,VOLUME=DISK=PUB000    <----- NAME OF THE DATASET TO LIST
LISTPDS DSNAME=ABHI.COURSE.PDS4,VOLUME=DISK=PUB000    <----- NAME OF THE DATASET TO LIST
/*
//********************************************************************************
/----------LIST multiple PDS on different volume---------
//STEP1 EXEC PGM=IEHLIST
//DD1 DD UNIT=DISK,VOLUME=SER=PUB000,DISP=SHR         <----- LOCATION OF DATASET
//DD2 DD UNIT=DISK,VOLUME=SER=PUB001,DISP=SHR         <----- LOCATION OF DATASET
//SYSIN DD *
LISTPDS DSNAME=ABHI.COURSE.PDS3,VOLUME=DISK=PUB000    <----- NAME OF THE DATASET TO LIST
LISTPDS DSNAME=ABHI.COURSE.PDS5,VOLUME=DISK=PUB001    <----- NAME OF THE DATASET TO LIST
/*
//********************************************************************************
//----------LIST a VOLUME---------
//STEP1 EXEC PGM=IEHLIST
//DD1 DD UNIT=DISK,VOLUME=SER=PUB000,DISP=SHR         <----- NAME OF THE VOLUME TO LIST
//SYSIN DD *
LISTVTOC VOLUME=DISK=PUB000                           <----- NAME OF THE VOLUME TO LIST
/*
//********************************************************************************
//----------LIST in Hexadecimal form---------
//STEP1 EXEC PGM=IEHLIST
//DD1 DD UNIT=DISK,VOLUME=SER=PUB000,DISP=SHR         <----- NAME OF THE VOLUME TO LIST
//SYSIN DD *
LISTVTOC DUMP,VOLUME=DISK=PUB000                      <----- NAME OF THE VOLUME TO LIST
/*
//********************************************************************************
