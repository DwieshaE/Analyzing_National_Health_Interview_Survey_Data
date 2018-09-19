mydf <- read.csv("C:/Users/dengland/Desktop/agedata.csv")

dcast(setDT(mydf), ID ~ rowid(ID), value.var = c("x","y"))