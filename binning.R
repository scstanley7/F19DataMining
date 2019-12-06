setwd("~/Documents/ischoolMaterials/F2019/dataMining/F19DataMiningProject/")
library(mltools)

stroke.df <- read.csv("STROKE_DEMO_NO_IDS.csv", stringsAsFactors = FALSE, header= TRUE)

glucose <- stroke.df$glucose
max(glucose)
min(glucose)

intervals <- c(-Inf, 140, 200, Inf)
labels <- c("Normal", "Prediabetes", "Diabetic")

stroke.df$glucoseDesc <- cut(stroke.df$glucose, breaks = intervals, labels = labels)

write.csv(stroke.df, "STROKE_DEMO_SIMPLE_GLUCOSE.csv")

hemoglobin <- stroke.df$hemoglobin
max(hemoglobin)
min(hemoglobin)

intervals.h <- c(-Inf, 12, 17, Inf)
labels.h <- c("Low", "Normal", "High")

stroke.df$hemoglobinDesc <- cut(stroke.df$hemoglobin, breaks = intervals.h, labels = labels.h)

write.csv(stroke.df, "STROKE_DEMO_SIMPLE_HEMOGLOBIN.csv")
