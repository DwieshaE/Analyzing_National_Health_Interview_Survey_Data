
## Nhanes data set
setwd("C:/Users/Eric/Desktop/NHANES")
library(rio); install_formats()
library(dplyr); library(survey)
### reading dat files form nhanes sascii package is required
library(SAScii) ###Load Packages


### Reading functional disability .dat files 2011 - 2014. The 2015 to 2017 were already in csv

##?SAScii; ?read.SAScii
## functional disability 2014
NHISlocation <- "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2014/funcdisb.zip"
NHISread.in.instructions <- "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2014/funcdisb.sas"

X.df <- read.SAScii(NHISlocation, 
                NHISread.in.instructions, zipped = T)

export(X.df, "fdb2014.csv")

###Functional disability 2013
NHISlocation <- "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2013/funcdisb.zip"
NHISread.in.instructions <- "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2013/funcdisb.sas"

X1.df <- read.SAScii(NHISlocation, 
                    NHISread.in.instructions, zipped = T)

export(X1.df, "fdb2013.csv")


###Functional disability 2012
NHISlocation <- "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2012/funcdisb.zip"
NHISread.in.instructions <- "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2012/funcdisb.sas"
X2.df <- read.SAScii(NHISlocation, 
                     NHISread.in.instructions, zipped = T)

export(X2.df, "fdb2012.csv")

###Functional disability 2011
NHISlocation <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2011/funcdisb.zip"
NHISread.in.instructions <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2011/funcdisb.sas"
X3.df <- read.SAScii(NHISlocation, 
                     NHISread.in.instructions, zipped = T)

export(X3.df, "fdb2011.csv")

### Reading the Sample adult population
##1 2014
NHISlocation <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2014/samadult.zip"
NHISread.in.instructions <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2014/samadult.sas"
y1.df <- read.SAScii(NHISlocation, 
                     NHISread.in.instructions, zipped = T)

export(y1.df, "sampadult14.csv")

##2 2013
NHISlocation <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2013/samadult.zip"
NHISread.in.instructions <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2013/samadult.sas"
y2.df <- read.SAScii(NHISlocation, 
                     NHISread.in.instructions, zipped = T)

export(y2.df, "sampadult13.csv")

##3 2012
NHISlocation <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2012/samadult.zip"
NHISread.in.instructions <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2012/samadult.sas"
y3.df <- read.SAScii(NHISlocation, 
                     NHISread.in.instructions, zipped = T)

export(y3.df, "sampadult12.csv")

## 2011
NHISlocation <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2011/samadult.zip"
NHISread.in.instructions <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2011/samadult.sas"
y1.df <- read.SAScii(NHISlocation, 
                     NHISread.in.instructions, zipped = T)

export(y1.df, "sampadult11.csv")
##2014
### Adding person files
NHISlocation <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2014/personsx.zip"
NHISread.in.instructions <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2014/personsx.sas"
y14.df <- read.SAScii(NHISlocation, 
                     NHISread.in.instructions, zipped = T)

export(y14.df, "personsx14.csv")

##2013
NHISlocation <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2013/personsx.zip"
NHISread.in.instructions <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2013/personsx.sas"
y13.df <- read.SAScii(NHISlocation, 
                     NHISread.in.instructions, zipped = T)

export(y13.df, "personsx13.csv")

##2012
NHISlocation <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2012/personsx.zip"
NHISread.in.instructions <- 
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2012/personsx.sas"
y12.df <- read.SAScii(NHISlocation, 
                     NHISread.in.instructions, zipped = T)

export(y12.df, "personsx12.csv")


###start of code
### make sure dplyr is loaded
## Mering funcdisb with sampadult and personsx
## 2017
df17<- read.csv("./fdb2017.csv")
df171<- read.csv("./samadult2017.csv")
df172<- read.csv("./personsx17.csv")
df171r<-rename(df171, INSLN=INSLN1,  DIBEV= DIBEV1, DIBPILL= DIBPILL1, STRAT_P = PSTRAT, PSU_P = PPSU)
mergedata17sd <- merge(df17,df171r, by= c("HHX", "FMX", "FPX"))
mergedata171<-merge(mergedata17sd, df172, by= c("HHX", "FMX", "FPX"))
mergedata17 <- mergedata171 %>% mutate(
  BMI= BMI / 100)

##2016
df16<- read.csv("./fdb2016.csv")
df161<- read.csv("./samadult2016.csv")
df161r<-rename(df161, INSLN=INSLN1,  DIBPILL= DIBPILL1, DIBEV= DIBEV1, STRAT_P = PSTRAT, PSU_P = PPSU)
df162<- read.csv("./PERSONSX16.csv")
mergedata161<- merge(df16,df161r, by= c("HHX", "FMX", "FPX"))
mergedata16p<- merge(mergedata161, df162, by= c("HHX", "FMX", "FPX"))
mergedata16<- mergedata16p %>% mutate(
  BMI= BMI / 100)

##2015
df15<- read.csv("./fdb2015.csv")
df15r<-rename(df15, PAIN_2A = PAIN_2) 
df151<- read.csv("./samadult2015.csv")
df152 <- read.csv("./personsx15.csv")
df153 <- read.csv("./injpoiep2015.csv")
##mergedata155<- merge(df151, df15r, by= c("HHX", "FMX", "FPX"))
##mergedata15p<- merge(mergedata155, df152, by= c("HHX", "FMX", "FPX"))
### converting BMI
##mergedata15<- mergedata15p %>% mutate(
  ##BMI= BMI / 100)

mergedata153 <- left_join(df15r, df151, by = c("HHX", "FMX", "FPX")) %>%
  left_join(df152,by = c("HHX", "FMX", "FPX"))%>% left_join(df153,by = c("HHX", "FMX", "FPX"))

mergedata15<- mergedata153%>% mutate(
  BMI= BMI / 100)

##2014
df14<- read.csv("./fdb2014.csv"); df141r<-rename(df14, PAIN_2A = PAIN_2) 
df141<- read.csv("./sampadult14.csv")
df142 <- read.csv("./personsx14.csv")
df144 <- read.csv("./injpoiep2014.csv")
##mergedata14sd<- merge(df141,df141r, by= c("HHX", "FMX","FPX"))
##mergedata14<- merge(mergedata14sd, df142, by= c("HHX", "FMX","FPX"))
mergedata14 <- left_join(df141r, df141, by = c("HHX", "FMX", "FPX")) %>%
  left_join(df142, by = c("HHX", "FMX", "FPX"))%>% left_join(df144,by = c("HHX", "FMX", "FPX"))

##2013
df13<- read.csv("./fdb2013.csv"); df131r<-rename(df13, PAIN_2A = PAIN_2)
df131<- read.csv("./sampadult13.csv"); df131s<-rename(df131, CHLYR = CHLYR1) 
df132 <- read.csv("./personsx13.csv")
df133 <- read.csv("./injpoiep2013.csv")
##mergedata13sd<- merge(df131r, df131s, by= c("HHX", "FMX", "FPX"))
##mergedata13<- merge(mergedata13sd, df132, by= c("HHX", "FMX", "FPX"))
mergedata13 <- left_join(df131r, df131s, by = c("HHX", "FMX", "FPX")) %>%
  left_join(df132, by = c("HHX", "FMX", "FPX"))%>% left_join(df133,by = c("HHX", "FMX", "FPX"))

##2012
df12<- read.csv("./fdb2012.csv")
df12r<-rename(df12, PAIN_2A = PAIN_2) #### renaming variable for frequency of pain in the past 3m
df121<- read.csv("./sampadult12.csv")
df12rs<-rename(df121, HYPYR1 = HYPYR) 
#### renaming variable for frequency of pain in the past 3m
df122 <- read.csv("./personsx12.csv")
df123 <- read.csv("./injpoiep2012.csv")
##mergedata12sd <- merge(df12r,df12rs, by= c("HHX", "FMX", "FPX"))
##mergedata12 <- merge(mergedata12sd, df122, by= c("HHX", "FMX", "FPX")), merge function is incaple of fhandling 4 dataframe

mergedata12 <- left_join(df12r, df12rs, by = c("HHX", "FMX", "FPX")) %>%
  left_join(df122,by = c("HHX", "FMX", "FPX")) %>% left_join(df123,by = c("HHX", "FMX", "FPX"))

## Selecting rows to be used as predictors
## renaming variable for frequency of pain in the past 3m

df2012<- select(mergedata12, SRVY_YR.x.x, REGION.y, FPX, FMX, HHX, WTFA.x, WTIA_SA, WTFA_SA, STRAT_P, PSU_P,MRACRPI2.y, RACERPI2.y, HISPAN_I.y, MRACBPI2.y, R_MARITL.y,
                 SEX.y, AGE_P.y, BMI, DOINGLWA, WHYNOWKA,EVERWRK,WRKCATA, WRKLYR4, MOB_3E2, MOB_4,MOB_5, MOB_6, MOB_7,MOB_8,
              UB_SS, TIRED_1, TIRED_2, TIRED_3, PAIN_2A, PAIN_4, MOB_SS2, ANX_2, ANX_3R,
              DEP_2, DEP_3R, PAINECK, PAINLB,PAINLEG, MOB_3A, MOB_3C, MOB_3G, MOB_3B2,
              ARTH1, AASMEV,COPDEV,EPHEV, ANGEV,HRTEV, MIEV,STREV,DIBEV, DEP_1, BMI, ANX_1,
              AHERNOY2, BEDDAYR, NOTCOV, ERNYR_P, ICAUS, IFALL1, IFALL2, IFALLWHY, IPER, IPIHNO,
              HYPEV, HYPYR1, CHLYR,  JNTSYMP, SMKEV, ALTIME4, PHSTAT, PHCDVN2W,P10DVYR,
              CANEV, INSLN, DIBPILL,AHSTATYR, ALCHRONR, ALUNIT4, MODTP, VIGFREQW,  AERREA2R, FLA1AR)

df2013<- select(mergedata13, SRVY_YR.x.x, REGION.y, FPX, FMX, HHX, WTFA.x, WTIA_SA, WTFA_SA, STRAT_P, PSU_P,MRACRPI2.y, RACERPI2.y, HISPAN_I.y, MRACBPI2.y, R_MARITL.y,
                SEX.y, AGE_P.y, BMI, DOINGLWA, WHYNOWKA,EVERWRK,WRKCATA, WRKLYR4, MOB_3E2, MOB_4,MOB_5, MOB_6, MOB_7,MOB_8,
                UB_SS, TIRED_1, TIRED_2, TIRED_3, PAIN_2A, PAIN_4, MOB_SS2, ANX_2, ANX_3R,
                DEP_2, DEP_3R, PAINECK, PAINLB,PAINLEG, MOB_3A, MOB_3C, MOB_3G, MOB_3B2,
                ARTH1, AASMEV,COPDEV,EPHEV, ANGEV,HRTEV, MIEV,STREV,DIBEV, DEP_1, BMI, ANX_1,
                AHERNOY2, BEDDAYR, NOTCOV, ERNYR_P, ICAUS, IFALL1, IFALL2, IFALLWHY, IPER, IPIHNO,
                HYPEV, HYPYR1, CHLYR,  JNTSYMP, SMKEV, ALTIME4, PHSTAT, PHCDVN2W,P10DVYR,
                CANEV, INSLN, DIBPILL,AHSTATYR, ALCHRONR, ALUNIT4, MODTP, VIGFREQW,  AERREA2R, FLA1AR)

df2014<- select(mergedata14, SRVY_YR.x.x, REGION.y, FPX, FMX, HHX, WTFA.x, WTIA_SA, WTFA_SA, STRAT_P, PSU_P,MRACRPI2.y, RACERPI2.y, HISPAN_I.y, MRACBPI2.y, R_MARITL.y,
                SEX.y, AGE_P.y, BMI, DOINGLWA, WHYNOWKA,EVERWRK,WRKCATA, WRKLYR4, MOB_3E2, MOB_4,MOB_5, MOB_6, MOB_7,MOB_8,
                UB_SS, TIRED_1, TIRED_2, TIRED_3, PAIN_2A, PAIN_4, MOB_SS2, ANX_2, ANX_3R,
                DEP_2, DEP_3R, PAINECK, PAINLB,PAINLEG, MOB_3A, MOB_3C, MOB_3G, MOB_3B2,
                ARTH1, AASMEV,COPDEV,EPHEV, ANGEV,HRTEV, MIEV,STREV,DIBEV, DEP_1, BMI, ANX_1,
                AHERNOY2, BEDDAYR, NOTCOV, ERNYR_P, ICAUS, IFALL1, IFALL2, IFALLWHY, IPER, IPIHNO,
                HYPEV, HYPYR1, CHLYR,  JNTSYMP, SMKEV, ALTIME4, PHSTAT, PHCDVN2W,P10DVYR, 
                CANEV, INSLN, DIBPILL,AHSTATYR, ALCHRONR, ALUNIT4, MODTP, VIGFREQW,  AERREA2R, FLA1AR)

df2015<- select(mergedata15, SRVY_YR.x.x, REGION.y, FPX, FMX, HHX, WTFA.x, WTIA_SA, WTFA_SA, STRAT_P, PSU_P,MRACRPI2.y, RACERPI2.y, HISPAN_I.y, MRACBPI2.y, R_MARITL.y,
                SEX.y, AGE_P.y, BMI, DOINGLWA, WHYNOWKA,EVERWRK,WRKCATA, WRKLYR4, MOB_3E2, MOB_4,MOB_5, MOB_6, MOB_7,MOB_8,
                UB_SS, TIRED_1, TIRED_2, TIRED_3, PAIN_2A, PAIN_4, MOB_SS2, ANX_2, ANX_3R,
                DEP_2, DEP_3R, PAINECK, PAINLB,PAINLEG, MOB_3A, MOB_3C, MOB_3G, MOB_3B2,
                ARTH1, AASMEV,COPDEV,EPHEV, ANGEV,HRTEV, MIEV,STREV,DIBEV, DEP_1, BMI, ANX_1,
                AHERNOY2, BEDDAYR, NOTCOV, ERNYR_P, ICAUS, IFALL1, IFALL2, IFALLWHY, IPER, IPIHNO,
                HYPEV, HYPYR1, CHLYR,  JNTSYMP, SMKEV, ALTIME4, PHSTAT, PHCDVN2W,P10DVYR, 
                CANEV, INSLN, DIBPILL,AHSTATYR, ALCHRONR, ALUNIT4, MODTP, VIGFREQW,  AERREA2R, FLA1AR)



m<- do.call("rbind", list(df2012, df2013, df2014, df2015))

## adjusting weights and stratum for sample design period of 2006-2015

### m2<- m%>%
  ## mutate(
     ## STRAT_P=STRAT_P) 
  
## com1215<- rename(m2, NSTRATUM=STRAT_P, NPSU=PSU_P)


## adjusting weights and stratum for sample design period of 2016-2017

##M1<- do.call("rbind", list(df2016, df2017))

##M3<- M1%>%
  ##mutate(
   ## STRAT_P = STRAT_P +2000) 

## com1617<- rename(M3, NSTRATUM=STRAT_P, NPSU=PSU_P)


## com1217<- do.call("rbind", list(com1215, com1617))
COM1217<- m%>%
  mutate(
    WTFA_SA= WTFA_SA/4)

##Tranformdata<- subset(COM1217, MOB_3E2== 1)

### export(COM1217F, "COMBINEDDATA.CSV")


##converting comorbid variable to two categories 0 or 1
arthritis <- NULL
arthritis <- ifelse((COM1217$ARTH1 == 1), 1, 0)
trans1<- cbind(COM1217, arthritis)

Asthma <- NULL
Asthma <- ifelse((trans1$AASMEV == 1), 1, 0)
trans2<- cbind(trans1, Asthma)

copdemph <- NULL
copdemph <- ifelse((trans2$COPDEV == 1 | trans2$EPHEV ==1), 1, 0)
trans3 <- cbind(trans2, copdemph)

Angina <- NULL
Angina <- ifelse((trans3$ANGEV == 1), 1, 0)
trans4 <- cbind(trans3, Angina)

heartdisease <- NULL
heartdisease <- ifelse((trans4$HRTEV == 1), 1, 0)
trans5 <- cbind(trans4, heartdisease)

heartatack <- NULL
heartatack <- ifelse((trans5$MIEV == 1), 1, 0)
trans6 <- cbind(trans5, heartatack)

Stroke <- NULL
Stroke <- ifelse((trans6$STREV ==1), 1, 0)
trans7 <- cbind(trans6, Stroke)

Diabetes <- NULL
Diabetes <- ifelse((trans7$DIBEV ==1), 1, 0)
trans8 <- cbind(trans7, Diabetes)

Depression <- NULL
Depression <- ifelse((trans8$DEP_1 ==1), 1, 0)
trans9 <- cbind(trans8, Depression)

Anxiety <- NULL
Anxiety <- ifelse((trans9$ANX_1 ==1), 1, 0)
trans10 <- cbind(trans9, Anxiety)

obesity <- NULL
obesity <- ifelse((trans9$BMI > 30), 1, 0)
trans11 <- cbind(trans10, obesity)


## creating continous varable with number of comorbidity
sumcomorbidity <- NULL
sumcomorbidity <- rowSums(trans11[, c("arthritis", "Asthma", "copdemph", "Angina", "Stroke","heartdisease","heartatack",
                                      "Diabetes", "Depression", "Anxiety", "obesity")])  
                            
trans12 <- cbind(sumcomorbidity, trans11)

## Comorbidity factor level 
Fcomorbidfaclev <- NULL
Fcomorbidfaclev[trans12$sumcomorbidity == 0]= "2"
Fcomorbidfaclev[trans12$sumcomorbidity == 1]= "1"
Fcomorbidfaclev[trans12$sumcomorbidity > 1]=  "0"

trans13 <- cbind(Fcomorbidfaclev, trans12)

###creating physical impairment variable- veto this variable 

## sum of mob_4 to mob_8

trans13$MOB_41 <- ifelse((trans13$MOB_4 ==1), 1, 0)
trans13$MOB_51 <- ifelse((trans13$MOB_5 ==1), 1, 0)
trans13$MOB_61 <- ifelse((trans13$MOB_6 ==1), 1, 0)
trans13$MOB_71 <- ifelse((trans13$MOB_7 ==1), 1, 0)
trans13$MOB_81 <- ifelse((trans13$MOB_8 ==1), 1, 0)

physicalimpair <- NULL
physicalimpair<- rowSums(trans13[, c("MOB_41", "MOB_51", "MOB_61", "MOB_71", "MOB_81")])  
trans14 <-cbind(physicalimpair, trans13)

trans14$Physicalimpaired2 <- ifelse((trans14$physicalimpair >0), 1, 0) ## create two factor level

## 1 means no difficulty coding is wrong

### creating Pain Category no pain and cat 1 and moderate pain 2

Paincat<- NULL
Paincat[trans14$PAIN_2A ==1] = "1"

Paincat[trans14$PAIN_2A ==2 & trans14$PAIN_4 ==1]= "1"

Paincat[trans14$PAIN_2A ==3 & trans14$PAIN_4 ==1]= "2"
Paincat[trans14$PAIN_2A ==4 & trans14$PAIN_4 ==1]= "2"
Paincat[trans14$PAIN_2A ==2 & trans14$PAIN_4 ==3]= "2"

Paincat[trans14$PAIN_2A ==2 & trans14$PAIN_4 ==2]= "2"
Paincat[trans14$PAIN_2A ==3 & trans14$PAIN_4 ==3]= "2"
Paincat[trans14$PAIN_2A ==4 & trans14$PAIN_4 ==3]= "2"

Paincat[trans14$PAIN_2A ==3 & trans14$PAIN_4 ==2]= "2"
Paincat[trans14$PAIN_2A ==4 & trans14$PAIN_4 ==2]= "2"

trans16<- cbind(Paincat, trans14)

##trans16<- select(trans15, SRVY_YR.x, REGION.x,FPX, FMX, HHX, WTFA_SA, STRAT_P, PSU_P, 
                # AGE_P.y,SEX.x, RACERPI2.y, ERNYR_P,NOTCOV, BMI, WRKLYR4, MOB_3A, MOB_3B2,MOB_3C, PAINECK, 
                 #PAINLB, PAINLEG, sumcomorbidity, Fcomorbidfaclev, PAIN_2A, PAIN_4,Paincat,
                 #AHERNOY2, BEDDAYR, AHSTATYR, ANX_1, ANX_2, ANX_3R,DEP_1, DEP_2, DEP_3R,TIRED_1, TIRED_2, 
                 #TIRED_3, UB_SS, MOB_3E2, MOB_SS2, Diabetes)
  


## transforming variables fatigue (tired 1), anxiety, difficulty with self care.
### Never or some day =2 most everyday =1

FATIGUE <- NULL
FATIGUE[trans16$TIRED_1 == 1]= "2"
FATIGUE[trans16$TIRED_1 == 2]= "2"
FATIGUE[trans16$TIRED_1 == 3]= "1"
FATIGUE[trans16$TIRED_1 == 4]= "1"
trans16 <- cbind(FATIGUE, trans16)

Anxiety<- NULL
Anxiety[trans16$ANX_1 == 1]= "1"
Anxiety[trans16$ANX_1 == 2]= "2"
Anxiety[trans16$ANX_1 == 3]= "2"
Anxiety[trans16$ANX_1 == 4]= "2"
Anxiety[trans16$ANX_1 == 5]= "2"
trans16 <- cbind(Anxiety, trans16)

## Creating pain bothersomeness
Painbothersome<- NULL
Painbothersome[trans16$PAIN_2A ==1] = "2" ##when pain2a = 1 then painbothersomeness is none
Painbothersome[trans16$PAIN_4 ==1] =  "2"
Painbothersome[trans16$PAIN_4 ==2] = "1"
Painbothersome[trans16$PAIN_4 ==3] = "1"
trans16 <- cbind(Painbothersome, trans16)



## creating pain frequency 3&4 is mostday everyday and 1&2 is never and someday
Painfrequency<- NULL
Painfrequency[trans16$PAIN_2A ==1] = "2"
Painfrequency[trans16$PAIN_2A ==2] =  "2"
Painfrequency[trans16$PAIN_2A ==3] = "1"
Painfrequency[trans16$PAIN_2A ==4] = "1"
trans16 <- cbind(Painfrequency, trans16)

##difficulty walking or climbing a step
MOBiltydiff<- NULL
MOBiltydiff[trans16$MOB_SS == 1]= "2"
MOBiltydiff[trans16$MOB_SS == 2]= "2"
MOBiltydiff[trans16$MOB_SS == 3]= "1"
MOBiltydiff[trans16$MOB_SS == 4]= "1"
trans16 <- cbind(MOBiltydiff, trans16)

Selfcare <- NULL
Selfcare[trans16$UB_SS == 1]= "2"
Selfcare[trans16$UB_SS == 2]= "2"
Selfcare[trans16$UB_SS == 3]= "1"
Selfcare[trans16$UB_SS == 4]= "1"
trans17 <- cbind(Selfcare, trans16)

agecat <- NULL
agecat[trans17$AGE_P.y < 35 ]= "4"
agecat[trans17$AGE_P.y >= 35 & trans17$AGE_P.y < 50 ]= "3"
agecat[trans17$AGE_P.y >= 50 & trans17$AGE_P.y < 65 ]= "2"
agecat[trans17$AGE_P.y >= 65]= "1"
trans18 <- cbind(agecat, trans17)

chronicpain <- NULL
chronicpain<- ifelse((trans18$PAIN_2A == 4), 1, 0)
trans19 <- cbind(trans18, chronicpain)

income <- NULL
income[trans19$ERNYR_P <8]= "2"
income[trans19$ERNYR_P >=8 & trans19$ERNYR_P <=11]= "1"
trans20 <- cbind(trans19, income)



length(trans20$AHERNOY2)

##End of code


export(trans20, "painnhis1.csv")                
?cor.test 


options("survey.lonely.psu" = "adjust")
nhissvy<- svydesign(id=~PSU_P,   strata =~STRAT_P,
                                nest = TRUE,
                                weights = ~WTFA_SA,
                    
                                data = trans16)


y<- svyglm(Paincat ~ AGE_P.y + factor(FATIGUE) + factor(PAINLB),  design=subset(nhissvy, MOB_3E2==1),  family = quasibinomial)
 
summary(y)
## when data is not subseted y<- svyglm(Diabetes ~ AGE_P.y + factor(PAINLB),  design=nhissvy,  family = quasibinomial)


###factorlevel has to be 0 and 1

svymean(~AGE_P.y, design=nhissvy)
svytotal(~factor(SEX.x), design=subset(nhissvy, MOB_3E2==1))

sqrt(svyvar(~AGE_P.y, design=nhissvy)) ###gives standard deviation

svyby(~AGE_P.y, by=~SEX.x, design = nhissvy, FUN = svymean)

svytotal(~factor(SEX.x), design=subset(nhissvy, PAINLB=="1"))
### Subsetting data
data<- subset(nhissvy, MOB_3E2==1)
summary(data)


export(, "COMORBidfina1le.csv")
## Linear Regression
## For fitting regression models, use svyglm. The interface is very similar to the core lm or glm functions:
  
linear.reg = svyglm(AGE_P.y~ PAIN_2A + PAIN_4 + MOB_SS2 + WTFA, design = nhissvy)

y<- glm(AGE_P.y~ PAIN_2A + PAIN_4 + MOB_SS2, data= M1)
summary(linear.reg)
plot(linear.reg)



### not in 2012 URYR,CHDEV, CHLEV, SPNYR, APNOTHYR, FATIGYR, FATYR, ANXNWYR,ASTRESYR,DIBEV,
##INSLN and dib pill-very important recoded,SMKLESEV, HYPYR, 
## look up sex.x and HYPYR 

## Taavy's: FPX, FMX, HHX, WTIA_SA, WTFA_SA, SEX, HISPAN_I,
##MRACRPI2, RACERPI2, MRACBPI2, R_MARITL, AGE_P, REGION, DOINGLWA, WHYNOWKA, 
##EVERWRK, WRKCATA, WRKLYR4, HYPEV, CHLEV, CHDEV, ANGEV, MIEV, HRTEV, STREV, EPHEV, COPDEV, AASMEV, CANEV, AHERNOY2, AERHOS, AERREA1R, 
##AERREA2R, AHCAFYR5, AERREA7R, DIBEV, DIFAGE2, AFLHC22_, , LACHRC19, FLA1AR, SPECEQ,

### The Important one I will use  RACERPI2
##
## WRKLYR4
## MIEV,

#combining multiple dataframes based on selected predictors

## End of Code


### Need to add comorbidities and other variable to spreadsheet



## running descriptives



###



### removing duplicated names based on paste column if eval date and DOB match
y2<- m[!duplicated(m[c("HHX")]),]

export(m, "mergedatdup1.csv")

## next step is to merge the sample adult population with functional disabilty csv, then select variables
## needed for model


