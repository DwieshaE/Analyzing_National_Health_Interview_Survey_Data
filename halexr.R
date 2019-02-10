# Clear plots
if(!is.null(dev.list())) dev.off()
# Clear console
cat("\014") 
# Clean workspace
rm(list=ls())

#### start of code (NHIS 2011-2017)

setwd("~/NHANES")
library(rio); install_formats()
library(dplyr); library(survey)
library(tidyr)

memory.limit()
memory.limit(8000) ##this increase memory limit


df17<- read.csv("./fdb2017.csv")
df171<- read.csv("./samadult2017.csv")
df172<- read.csv("./personsx17.csv")
df171r<-rename(df171, INSLN=INSLN1,  DIBEV= DIBEV1, DIBPILL= DIBPILL1, STRAT_P = PSTRAT, PSU_P = PPSU)
#mergedata17sd <- merge(df17,df171r, by= c("HHX", "FMX", "FPX"))
#mergedata171<-merge(mergedata17sd, df172, by= c("HHX", "FMX", "FPX"))
mergedata173 <- left_join(df171r, df172, by = c("HHX", "FMX", "FPX")) %>%
  left_join(df17, by = c("HHX", "FMX", "FPX"))

mergedata17 <- mergedata173 %>% mutate(
  BMI= BMI / 100)

##2016
df16<- read.csv("./fdb2016.csv")
df161<- read.csv("./samadult2016.csv")
df161r<-rename(df161, INSLN=INSLN1,  DIBPILL= DIBPILL1, DIBEV= DIBEV1, STRAT_P = PSTRAT, PSU_P = PPSU)
df162<- read.csv("./PERSONSX16.csv")
#mergedata161<- merge(df16,df161r, by= c("HHX", "FMX", "FPX"))
#mergedata16p<- merge(mergedata161, df162, by= c("HHX", "FMX", "FPX"))
mergedata163 <- left_join(df161r, df162, by = c("HHX", "FMX", "FPX")) %>%
  left_join(df16, by = c("HHX", "FMX", "FPX"))

mergedata16<- mergedata163 %>% mutate(
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
mergedata153 <- left_join(df152, df151, by = c("HHX", "FMX", "FPX")) %>%
  left_join(df15r,by = c("HHX", "FMX", "FPX"))

mergedata15<- mergedata153%>% mutate(
  BMI= BMI / 100)

##2014
df14<- read.csv("./fdb2014.csv"); df141r<-rename(df14, PAIN_2A = PAIN_2) 
df141<- read.csv("./sampadult14.csv")
df142 <- read.csv("./personsx14.csv")
df144 <- read.csv("./injpoiep2014.csv")
##mergedata14sd<- merge(df141,df141r, by= c("HHX", "FMX","FPX"))
##mergedata14<- merge(mergedata14sd, df142, by= c("HHX", "FMX","FPX"))
mergedata14 <- left_join(df142, df141, by = c("HHX", "FMX", "FPX")) %>%
  left_join(df141r, by = c("HHX", "FMX", "FPX"))

##2013
df13<- read.csv("./fdb2013.csv"); df131r<-rename(df13, PAIN_2A = PAIN_2)
df131<- read.csv("./sampadult13.csv"); df131s<-rename(df131, CHLYR = CHLYR1) 
df132 <- read.csv("./personsx13.csv")
df133 <- read.csv("./injpoiep2013.csv")
##mergedata13sd<- merge(df131r, df131s, by= c("HHX", "FMX", "FPX"))
##mergedata13<- merge(mergedata13sd, df132, by= c("HHX", "FMX", "FPX"))
mergedata13 <- left_join(df132, df131s, by = c("HHX", "FMX", "FPX")) %>%
  left_join(df131r, by = c("HHX", "FMX", "FPX"))

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
mergedata12 <- left_join(df122, df12rs, by = c("HHX", "FMX", "FPX")) %>%
  left_join(df12r,by = c("HHX", "FMX", "FPX")) 


#### selecting variables

df2012<- select(mergedata12, SRVY_YR.x, REGION.x, FPX, FMX, HHX, WTFA, WTIA_SA, WTFA_SA, STRAT_P, PSU_P,MRACRPI2.x, RACERPI2.x, HISPAN_I.x, MRACBPI2.x, R_MARITL.x,
                SEX.y, AGE_P.y, BMI, DOINGLWA, WHYNOWKA,EVERWRK,WRKCATA, WRKLYR4, MOB_3E2, MOB_4,MOB_5, MOB_6, MOB_7,MOB_8,
                UB_SS, TIRED_1, TIRED_2, TIRED_3, PAIN_2A, PAIN_4, MOB_SS2, ANX_2, ANX_3R,
                DEP_2, DEP_3R, PAINECK, PAINLB,PAINLEG, MOB_3A, MOB_3C, MOB_3G, MOB_3B2,
                ARTH1, AASMEV,COPDEV,EPHEV, ANGEV,HRTEV, MIEV,STREV,DIBEV, DEP_1, BMI, ANX_1,
                AHERNOY2, BEDDAYR, NOTCOV, ERNYR_P,PLAADL,PLAIADL,PLAWKNOW, PLAWKLIM,PLIMANY,PHSTAT,
                HYPEV, HYPYR1, CHLYR,  JNTSYMP, SMKEV, ALTIME4, CHDEV, AERHOS, AERREA1R,
                AHCAFYR5, AERREA7R, DIFAGE2, AFLHC22_, LACHRC19, SPECEQ,
                CANEV, INSLN, DIBPILL,AHSTATYR, ALCHRONR, ALUNIT4, MODTP, VIGFREQW,  AERREA2R, FLA1AR)


df2013<- select(mergedata13, SRVY_YR.x, REGION.x, FPX, FMX, HHX, WTFA, WTIA_SA, WTFA_SA, STRAT_P, PSU_P,MRACRPI2.x, RACERPI2.x, HISPAN_I.x, MRACBPI2.x, R_MARITL.x,
                SEX.y, AGE_P.y, BMI, DOINGLWA, WHYNOWKA,EVERWRK,WRKCATA, WRKLYR4, MOB_3E2, MOB_4,MOB_5, MOB_6, MOB_7,MOB_8,
                UB_SS, TIRED_1, TIRED_2, TIRED_3, PAIN_2A, PAIN_4, MOB_SS2, ANX_2, ANX_3R,
                DEP_2, DEP_3R, PAINECK, PAINLB,PAINLEG, MOB_3A, MOB_3C, MOB_3G, MOB_3B2,
                ARTH1, AASMEV,COPDEV,EPHEV, ANGEV,HRTEV, MIEV,STREV,DIBEV, DEP_1, BMI, ANX_1,
                AHERNOY2, BEDDAYR, NOTCOV, ERNYR_P,PLAADL,PLAIADL,PLAWKNOW, PLAWKLIM,PLIMANY,PHSTAT,
                HYPEV, HYPYR1, CHLYR,  JNTSYMP, SMKEV, ALTIME4, CHDEV, AERHOS, AERREA1R,
                AHCAFYR5, AERREA7R, DIFAGE2, AFLHC22_, LACHRC19, SPECEQ,
                CANEV, INSLN, DIBPILL,AHSTATYR, ALCHRONR, ALUNIT4, MODTP, VIGFREQW,  AERREA2R, FLA1AR)


df2014<- select(mergedata14, SRVY_YR.x, REGION.x, FPX, FMX, HHX, WTFA, WTIA_SA, WTFA_SA, STRAT_P, PSU_P,MRACRPI2.x, RACERPI2.x, HISPAN_I.x, MRACBPI2.x, R_MARITL.x,
                SEX.y, AGE_P.y, BMI, DOINGLWA, WHYNOWKA,EVERWRK,WRKCATA, WRKLYR4, MOB_3E2, MOB_4,MOB_5, MOB_6, MOB_7,MOB_8,
                UB_SS, TIRED_1, TIRED_2, TIRED_3, PAIN_2A, PAIN_4, MOB_SS2, ANX_2, ANX_3R,
                DEP_2, DEP_3R, PAINECK, PAINLB,PAINLEG, MOB_3A, MOB_3C, MOB_3G, MOB_3B2,
                ARTH1, AASMEV,COPDEV,EPHEV, ANGEV,HRTEV, MIEV,STREV,DIBEV, DEP_1, BMI, ANX_1,
                AHERNOY2, BEDDAYR, NOTCOV, ERNYR_P,PLAADL,PLAIADL,PLAWKNOW, PLAWKLIM,PLIMANY,PHSTAT,
                HYPEV, HYPYR1, CHLYR,  JNTSYMP, SMKEV, ALTIME4, CHDEV, AERHOS, AERREA1R,
                AHCAFYR5, AERREA7R, DIFAGE2, AFLHC22_, LACHRC19, SPECEQ,
                CANEV, INSLN, DIBPILL,AHSTATYR, ALCHRONR, ALUNIT4, MODTP, VIGFREQW,  AERREA2R, FLA1AR)

df2015<- select(mergedata15, SRVY_YR.x, REGION.x, FPX, FMX, HHX, WTFA, WTIA_SA, WTFA_SA, STRAT_P, PSU_P,MRACRPI2.x, RACERPI2.x, HISPAN_I.x, MRACBPI2.x, R_MARITL.x,
                SEX.y, AGE_P.y, BMI, DOINGLWA, WHYNOWKA,EVERWRK,WRKCATA, WRKLYR4, MOB_3E2, MOB_4,MOB_5, MOB_6, MOB_7,MOB_8,
                UB_SS, TIRED_1, TIRED_2, TIRED_3, PAIN_2A, PAIN_4, MOB_SS2, ANX_2, ANX_3R,
                DEP_2, DEP_3R, PAINECK, PAINLB,PAINLEG, MOB_3A, MOB_3C, MOB_3G, MOB_3B2,
                ARTH1, AASMEV,COPDEV,EPHEV, ANGEV,HRTEV, MIEV,STREV,DIBEV, DEP_1, BMI, ANX_1,
                AHERNOY2, BEDDAYR, NOTCOV, ERNYR_P,PLAADL,PLAIADL,PLAWKNOW, PLAWKLIM,PLIMANY,PHSTAT,
                HYPEV, HYPYR1, CHLYR,  JNTSYMP, SMKEV, ALTIME4, CHDEV, AERHOS, AERREA1R,
                AHCAFYR5, AERREA7R, DIFAGE2, AFLHC22_, LACHRC19, SPECEQ,
                CANEV, INSLN, DIBPILL,AHSTATYR, ALCHRONR, ALUNIT4, MODTP, VIGFREQW,  AERREA2R, FLA1AR)

df2016<- select(mergedata16, SRVY_YR.x, REGION.x, FPX, FMX, HHX, WTFA, WTIA_SA, WTFA_SA, STRAT_P, PSU_P,MRACRPI2.x, RACERPI2.x, HISPAN_I.x, MRACBPI2.x, R_MARITL.x,
                SEX.y, AGE_P.y, BMI, DOINGLWA, WHYNOWKA,EVERWRK,WRKCATA, WRKLYR4, MOB_3E2, MOB_4,MOB_5, MOB_6, MOB_7,MOB_8,
                UB_SS, TIRED_1, TIRED_2, TIRED_3, PAIN_2A, PAIN_4, MOB_SS2, ANX_2, ANX_3R,
                DEP_2, DEP_3R, PAINECK, PAINLB,PAINLEG, MOB_3A, MOB_3C, MOB_3G, MOB_3B2,
                ARTH1, AASMEV,COPDEV,EPHEV, ANGEV,HRTEV, MIEV,STREV,DIBEV, DEP_1, BMI, ANX_1,
                AHERNOY2, BEDDAYR, NOTCOV, ERNYR_P,PLAADL,PLAIADL,PLAWKNOW, PLAWKLIM,PLIMANY,PHSTAT,
                HYPEV, HYPYR1, CHLYR,  JNTSYMP, SMKEV, ALTIME4, CHDEV, AERHOS, AERREA1R,
                AHCAFYR5, AERREA7R, DIFAGE2, AFLHC22_, LACHRC19, SPECEQ,
                CANEV, INSLN, DIBPILL,AHSTATYR, ALCHRONR, ALUNIT4, MODTP, VIGFREQW,  AERREA2R, FLA1AR)

df2017<- select(mergedata17, SRVY_YR.x, REGION.x, FPX, FMX, HHX, WTFA, WTIA_SA, WTFA_SA, STRAT_P, PSU_P,MRACRPI2.x, RACERPI2.x, HISPAN_I.x, MRACBPI2.x, R_MARITL.x,
                SEX.y, AGE_P.y, BMI, DOINGLWA, WHYNOWKA,EVERWRK,WRKCATA, WRKLYR4, MOB_3E2, MOB_4,MOB_5, MOB_6, MOB_7,MOB_8,
                UB_SS, TIRED_1, TIRED_2, TIRED_3, PAIN_2A, PAIN_4, MOB_SS2, ANX_2, ANX_3R,
                DEP_2, DEP_3R, PAINECK, PAINLB,PAINLEG, MOB_3A, MOB_3C, MOB_3G, MOB_3B2,
                ARTH1, AASMEV,COPDEV,EPHEV, ANGEV,HRTEV, MIEV,STREV,DIBEV, DEP_1, BMI, ANX_1,
                AHERNOY2, BEDDAYR, NOTCOV, ERNYR_P,PLAADL,PLAIADL,PLAWKNOW, PLAWKLIM,PLIMANY,PHSTAT,
                HYPEV, HYPYR1, CHLYR,  JNTSYMP, SMKEV, ALTIME4, CHDEV, AERHOS, AERREA1R,
                AHCAFYR5, AERREA7R, DIFAGE2, AFLHC22_, LACHRC19, SPECEQ,
                CANEV, INSLN, DIBPILL,AHSTATYR, ALCHRONR, ALUNIT4, MODTP, VIGFREQW,  AERREA2R, FLA1AR)





m<- do.call("rbind", list(df2012, df2013, df2014, df2015))

## adjusting weights and stratum for sample design period of 2006-2015

m2<- m%>%
  mutate(
    STRAT_P=STRAT_P +1000) 

com1215<- rename(m2, NSTRATUM=STRAT_P, NPSU=PSU_P)


## adjusting weights and stratum for sample design period of 2016-2017

M1<- do.call("rbind", list(df2016, df2017))

M3<- M1%>%
  mutate(
    STRAT_P= STRAT_P +2000) 

com1617<- rename(M3, NSTRATUM=STRAT_P, NPSU=PSU_P)


com1217<- do.call("rbind", list(com1215, com1617))

combined1217<- com1217%>%
  mutate(
    WTFA= WTFA/6)


## export(mergedata17,"Halex17.csv")

## Halex

## calculating Utility Index
When two or more questions had an affirmative response,
the lowest possible SAS was assigned
 
UI = 0.10 + (0.90 *  M),
where M = (0.41 * PHS) + (0.41 * SAS) + (0.18 * PHS * SAS)

PHS coeeficient
PHSTAT
Excellent "1"= 1
very good "2"= 0.85
good "3" = 0.7
fair "4" = 0.3 
poor"5" = 0



## Sas coefficients for yes
PLAADL = 0
PLAIADL = 0.2
PLAWKNOW = 0.4
PLAWKLIM = 0.65
PLIMANY = 0.75
none of the above = 1

## recoding
PLAADLV1<- NULL
#PLAADL = 1 means yes needs personal care 
PLAADLV1[combined1217$PLAADL == 1] = 0
trans2<- cbind(combined1217, PLAADLV1)

PLAIADLV1<- NULL
#PLAADL = 1 means yes needs personal care 
PLAIADLV1[combined1217$PLAIADL == 1] = 0.2
trans3<- cbind(trans2, PLAIADLV1)

PLAWKNOWV1<- NULL
#PLAADL = 1 means yes needs personal care 
PLAWKNOWV1[combined1217$PLAWKNOW == 1] = 0.4
trans4<- cbind(trans3,PLAWKNOWV1)

PLAWKLIMV1<- NULL
#PLAADL = 1 means yes needs personal care 
PLAWKLIMV1[combined1217$PLAWKLIM == 0] = 0.65
PLAWKLIMV1[combined1217$PLAWKLIM == 1] = 0.65
trans5<- cbind(trans4, PLAWKLIMV1)

PLIMANYV1 <- NULL
#PLAADL = 1 means yes needs personal care 
PLIMANYV1[combined1217$PLIMANY == 0] = 0.75
PLIMANYV1[combined1217$PLIMANY == 1] = 0.75
trans6<- cbind(trans5, PLIMANYV1)
 
notlimited<- NULL
notlimited[combined1217$PLAWKLIM == 2] = 1
notlimited[combined1217$PLIMANY == 2] = 1
trans7<- cbind(trans6, notlimited)

PHSTATV1 <- NULL
PHSTATV1[combined1217$PHSTAT == 1]= 1
PHSTATV1[combined1217$PHSTAT == 2]= 0.85
PHSTATV1[combined1217$PHSTAT == 3]= 0.7
PHSTATV1[combined1217$PHSTAT == 4]= 0.3
PHSTATV1[combined1217$PHSTAT == 5]= 0
trans71 <- cbind(PHSTATV1, trans7)

minsas<- select(trans71, notlimited, PLIMANYV1, PLAWKLIMV1,PLAWKNOWV1,PLAIADLV1,
                      PLAADLV1)
minsas$min<- apply(minsas, 1, FUN=min, na.rm=TRUE)

y<- cbind(minsas, trans71) ### worked
y$M<- with(y,(0.41 * PHSTATV1) + (0.41 * min) + (0.18 * PHSTATV1 * min))
y$UI <-with(y, (0.10 + (0.90 *  M)))
### Subsetting data for prosthesis users
data<- subset(y, MOB_3E2==1)
hist(data$UI)

### Subsetting data for nonprosthesis users
hist(y$UI)
##UI = 0.10 + (0.90 *  M)
## UI = 0.10 + (0.90 *  M),
## where M = (0.41 * PHS) + (0.41 * SAS) + (0.18 * PHS * SAS)



