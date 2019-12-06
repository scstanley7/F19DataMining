setwd("~/Documents/ischoolMaterials/F2019/dataMining/")

# take the relevant drugs identified by the initial cleaning step and the stroke demo csv file
# import these files into R as data frames
strokeDrugs.df <- read.csv("relevantDrugs_final.csv", stringsAsFactors = FALSE, header = TRUE)
strokeDemo.df <- read.csv("STROKE_DEMO.csv", stringsAsFactors = FALSE, header = TRUE)

# merge these tables on the subject ID. Include records that have no drug information associated (with NA)
strokeWithDrugs.df <- merge(strokeDemo.df, strokeDrugs.df, by.x="subject_id", by.y="SUBJECT_ID", all = TRUE)

# replace all na values in drug columns with "false" (since the patients were *not* administered these drugs)
strokeWithDrugs.df[is.na(strokeWithDrugs.df)] <- "false"

# test for null values
# is.na would have replaced nulls with false, so this is obviously a bit hacky

strokeWithDrugs.df %>% filter(glucose == "false")
strokeWithDrugs.df %>% filter(hemoglobin == "false")
strokeWithDrugs.df %>% filter(creatinine == "false")
strokeWithDrugs.df %>% filter(systolicBP == "false")
strokeWithDrugs.df %>% filter(diastolicBP == "false")

# write finalized CSV to the project folder.
write.csv(strokeWithDrugs.df, "STROKE_DEMO_WITH_DRUGS.csv")