
# Brief background- Urinalyses are an important part of a patient work up in order to assess kidney function. UAs consist of physical, chemical and microscopic analyses of the urine.  
# More specific information about UAs and their interpretation can be found here (http://www.eclinpath.com/urinalysis/). 
# While dipstick tests are commonly used as a sensitive measure to detect proteinuria (the presence of protein in the urine), the urine protein:creatinine ratio is recognized as a more accurate assessment of proteinuria. 
# UPCs are commonly used as a follow up test when protein is detected in UA results via dipstick, as it requires a separate workflow in the laboratory and is run on a chemistry analyzer. 
# Additional information can be found here (http://www.eclinpath.com/urinalysis/chemical-constituents/).   
# 
# ACME is a corporate account that has been running UPCs (urine protein creatinine ratios) on most of their UAs (urinalyses) they send in to the MedX reference lab. 
# Their pricing is changing and they will no longer be receiving UPCs for free.  
# Please use ACME's data from the last year to help the professional service veterinarian and corporate accounts manager communicate to ACME's veterinarians 
# that they have been running unnecessary UPCs and that MedX's Urinalysis with Reflex UPCs offering might be a good fit for them and help them reduce unnecessary testing when UPCs are not appropriate. 
# Please use the indicated parameters found below in the MedX Test Directory for your analyses.
# MedX Test Directory info: Urinalysis with Reflex UPC (If Indicated) (2326)
# If the urinalysis is positive for protein and the sediment is not active, a urine protein:creatinine (UPC) ratio is automatically performed. 
# If the urinalysis is negative for protein, or if there is an active sediment (white blood cells ???6/hpf, red blood cells ??? 100/hpf, color is red or pink, and/or bacteria are seen), 
# the UPC ratio will not be performed. The test price is the same whether or not a UPC ratio is performed.



# install.packages("ggplot2")
# install.packages("stringr")
# install.packages("dplyr")
# install.packages("plyr")

library(stringr)
library(ggplot2)
library(dplyr)
library(plyr)

ACME_Data<-read.csv(file = "C:/Users/puj83/OneDrive/CV/Cases/MedX/ACME_Data.csv", header = T, sep = ",")
ACME_Data$Result.Text.URINALYSIS.BACTERIA <- as.character(ACME_Data$Result.Text.URINALYSIS.BACTERIA)
ACME_Data$Result.Text.URINALYSIS.BACTERIA[ACME_Data$Result.Text.URINALYSIS.BACTERIA==""] <- "NA"
ACME_Data$Result.Text.URINALYSIS.BACTERIA <- as.factor(ACME_Data$Result.Text.URINALYSIS.BACTERIA)

# 1.	How many urinalyses were run?

ACME_Data$UA_Count <- ifelse(grepl("NA", ACME_Data$Result.Text.URINALYSIS.BACTERIA), "1", "0")
ACME_Data$UA_Count<-as.numeric(as.character(ACME_Data$UA_Count))

dfl <- ddply(ACME_Data, .(UA_Count), summarize, y=length(UA_Count))
dfl$y<-as.numeric(as.character(dfl$y))

dfl<-as.data.frame(dfl)

ggplot(dfl, aes(UA_Count, y=y, fill=UA_Count)) + geom_bar(stat="identity") +
geom_text(aes(label=y), vjust=0)
      
# 2.	How many UAs were positive for protein? 

ACME_Data$Result.Text.URINALYSIS.PROTEIN<-as.factor(ACME_Data$Result.Text.URINALYSIS.PROTEIN)
levels(ACME_Data$Result.Text.URINALYSIS.PROTEIN)
ACME_Data$Result.Text.URINALYSIS.PROTEIN<-as.character(ACME_Data$Result.Text.URINALYSIS.PROTEIN)
ACME_Data$UAs_Positive_Count <- ifelse(grepl("1+|2+|3+|4+", ACME_Data$Result.Text.URINALYSIS.PROTEIN), "1", "0")
ACME_Data$UAs_Positive_Count<-as.numeric(as.character(ACME_Data$UAs_Positive_Count))

df2 <- ddply(ACME_Data, .(UAs_Positive_Count), summarize, y=length(UAs_Positive_Count))
df2$y<-as.numeric(as.character(df2$y))
df2<-as.data.frame(df2)

ggplot(df2, aes(UAs_Positive_Count, y=y, fill=UAs_Positive_Count)) + geom_bar(stat="identity") +
  geom_text(aes(label=y), vjust=0)

# 3.	How many UAs were positive for protein and had no active sediment? (Number of UPCs which would have been run IF ACME used the Reflex UPC test offering)

ACME_Data$UAs_Positive_Count<-as.factor(ACME_Data$UAs_Positive_Count)
levels(ACME_Data$UAs_Positive_Count)

ACME_Data$Result.Text.URINALYSIS.BACTERIA<-as.factor(ACME_Data$Result.Text.URINALYSIS.BACTERIA)
levels(ACME_Data$Result.Text.URINALYSIS.BACTERIA)

ACME_Data$Result.Text.URINALYSIS.COLOR<-as.factor(ACME_Data$Result.Text.URINALYSIS.COLOR)
levels(ACME_Data$Result.Text.URINALYSIS.COLOR)

ACME_Data$Result.Text.URINALYSIS.RBC<-as.factor(ACME_Data$Result.Text.URINALYSIS.RBC)
levels(ACME_Data$Result.Text.URINALYSIS.RBC)

levels(ACME_Data$Result.Text.URINALYSIS.RBC)[levels(ACME_Data$Result.Text.URINALYSIS.RBC) == "10-Jun"]<-"6-10"
levels(ACME_Data$Result.Text.URINALYSIS.RBC)[levels(ACME_Data$Result.Text.URINALYSIS.RBC) == "15-Oct"]<-"10-15"
levels(ACME_Data$Result.Text.URINALYSIS.RBC)[levels(ACME_Data$Result.Text.URINALYSIS.RBC) == "5-Feb"]<-"2-5"

ACME_Data$Result.Text.URINALYSIS.WBC<-as.factor(ACME_Data$Result.Text.URINALYSIS.WBC)
levels(ACME_Data$Result.Text.URINALYSIS.WBC)

levels(ACME_Data$Result.Text.URINALYSIS.WBC)[levels(ACME_Data$Result.Text.URINALYSIS.WBC) == "10-Jun"]<-"6-10"
levels(ACME_Data$Result.Text.URINALYSIS.WBC)[levels(ACME_Data$Result.Text.URINALYSIS.WBC) == "15-Oct"]<-"10-15"
levels(ACME_Data$Result.Text.URINALYSIS.WBC)[levels(ACME_Data$Result.Text.URINALYSIS.WBC) == "5-Feb"]<-"2-5"

ACME_Data$Result.Text.URINALYSIS.BACTERIA<-as.character(ACME_Data$Result.Text.URINALYSIS.BACTERIA)
ACME_Data$Bacteria_Q <- ifelse(grepl("0|NONE SEEN|RARE COCCI <9/HPF", ACME_Data$Result.Text.URINALYSIS.BACTERIA), "1", "0")
ACME_Data$Bacteria_Q<-as.numeric(as.character(ACME_Data$Bacteria_Q))

ACME_Data$Result.Text.URINALYSIS.COLOR<-as.character(ACME_Data$Result.Text.URINALYSIS.COLOR)
ACME_Data$Color_Q <- ifelse(grepl("AMBER|BROWN|COLORLESS|DARK YELLOW|ORANGE|OTHER|PALE YELLOW|STRAW|YELLOW", ACME_Data$Result.Text.URINALYSIS.COLOR), "1", "0")
ACME_Data$Color_Q<-as.numeric(as.character(ACME_Data$Color_Q))

ACME_Data$Result.Text.URINALYSIS.RBC<-as.character(ACME_Data$Result.Text.URINALYSIS.RBC)
ACME_Data$RBC_Q <- ifelse(grepl("0-2|6-10|15-20|10-15|20-30|30-50|2-5|50-75|75-100", ACME_Data$Result.Text.URINALYSIS.RBC), "1", "0")
ACME_Data$RBC_Q<-as.numeric(as.character(ACME_Data$RBC_Q))

ACME_Data$Result.Text.URINALYSIS.WBC<-as.character(ACME_Data$Result.Text.URINALYSIS.WBC)
ACME_Data$WBC_Q <- ifelse(grepl("0-2|2-5", ACME_Data$Result.Text.URINALYSIS.WBC), "1", "0")
ACME_Data$WBC_Q<-as.numeric(as.character(ACME_Data$WBC_Q))

ACME_Data$Positive_NoSediment<-with(ACME_Data, ifelse(ACME_Data$UAs_Positive_Count == 1 & 
                                                      ACME_Data$Bacteria_Q == 1 &
                                                      ACME_Data$Color_Q == 1 &
                                                      ACME_Data$RBC_Q == 1 &
                                                      ACME_Data$WBC_Q == 1, 1, 0))

df3 <- ddply(ACME_Data, .(Positive_NoSediment), summarize, y=length(Positive_NoSediment))
df3$y<-as.numeric(as.character(df3$y))
df3<-as.data.frame(df3)

ggplot(df3, aes(Positive_NoSediment, y=y, fill=Positive_NoSediment)) + geom_bar(stat="identity") +
  geom_text(aes(label=y), vjust=0)

# 4.	Number of actual UPCs run: 

#IF UPC was run cell would not be blank, if one cell is blank all three are

UPCRATIOBLANK<-is.na(ACME_Data$Result.Text.UPC.Ratio)
sum(UPCRATIOBLANK)

#46 UPC tests did not run, plus the 2 are insufficent, 48 did not run 

#1230 ran  
  
# 5.	How many UPCs were run that might have been unnecessary using the reflex UPC testing criteria?

ACME_Data$Result.Text.UPC.Ratio<-as.factor(ACME_Data$Result.Text.UPC.Ratio)
levels(ACME_Data$Result.Text.UPC.Ratio)

ACME_Data$Result.Text.UPC.Ratio<-as.numeric(as.character(ACME_Data$Result.Text.UPC.Ratio))

ACME_Data$Unnecessary_UPCs<-with(ACME_Data, ifelse(ACME_Data$UAs_Positive_Count == 0 & 
                                                        ACME_Data$Result.Text.UPC.Ratio > 0, 1, 0))

df4 <- ddply(ACME_Data, .(Unnecessary_UPCs), summarize, y=length(Unnecessary_UPCs))
df4$y<-as.numeric(as.character(df4$y))
df4<-as.data.frame(df4)

ggplot(df4, aes(Unnecessary_UPCs, y=y, fill=Unnecessary_UPCs)) + geom_bar(stat="identity") +
  geom_text(aes(label=y), vjust=0)




  