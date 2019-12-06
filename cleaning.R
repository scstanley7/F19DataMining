setwd("~/Documents/ischoolMaterials/F2019/dataMining/")

strokeDemo <- read.csv("STROKE_DEMO.csv", stringsAsFactors = FALSE, header = TRUE)

subjIDs <- unique(strokeDemo$subject_id)

drugInfo <- read.csv("DRUGS.csv", stringsAsFactors = FALSE, header = TRUE)

relevantDrug <- drugInfo[drugInfo$SUBJECT_ID %in% subjIDs,]

drugNames <- relevantDrug$DRUG

drugNames.sorted.freqs.t <- sort(table(drugNames), decreasing = T)

drugsForAnalysis <- c("Potassium Chloride", "Furosemide", "Insulin", "D5W", "NS", "Metoprolol", "Iso-Osmotic Dextrose", "SW", "Magnesium Sulfate", "Heparin Sodium")

topStrokeDrugs <- relevantDrug[relevantDrug$DRUG %in% drugsForAnalysis,]

write.csv(topStrokeDrugs, "relevantDrug.csv")
