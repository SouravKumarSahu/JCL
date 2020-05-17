//------------Uncatalog a dataset-------------
//STEP1 EXEC PGM=IEHPROGM
//DD1 DD UNIT=DISK,VOLUME=SER=PUB000,DISP=SHR          <---- LOCATION OF THE DATASET
//SYSIN DD *
UNCATLG DSNAME=Z51555.COURSE.PDS5,                     <---- DATASET NAME
VOL=DISK=PUB000
/*
//********************************************************************************
//------------Scratch(Delete) a PDS member-------------
//STEP1 EXEC PGM=IEHPROGM
//DD1 DD UNIT=DISK,VOLUME=SER=PUB000,DISP=SHR          <---- LOCATION OF THE DATASET
//SYSIN DD *
SCRATCH DSNAME=Z51555.COURSE.PDS5,                     <---- DATASET NAME
VOL=DISK=PUB000,
MEMBER=MEMBER1 <---- MEMBER TO DELETE
/*
//********************************************************************************
//------------Scratch(Delete) a PDS-------------
//STEP1 EXEC PGM=IEHPROGM
//DD1 DD UNIT=DISK,VOLUME=SER=PUB000,DISP=SHR          <---- LOCATION OF THE DATASET
//SYSIN DD *
SCRATCH DSNAME=Z51555.COURSE.PDS5,                     <---- DATASET NAME
VOL=DISK=PUB000
/*
//********************************************************************************
