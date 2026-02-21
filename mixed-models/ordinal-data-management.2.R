# Ordinal mixed-effects model for "Data management and curation" area and 
# post-hoc pairwise comparisons to assess significant differences between sub-areas

library(ordinal)
library(dplyr)
library(emmeans)

# Read data
scores_long <- read.csv(file = "data/data_management_long.csv")

# Drop sub-areas that do not have variation in the scores
scores_long <- scores_long %>%
   filter(Area != "Missing")

scores_long <- scores_long %>%
   filter(Area != "Provenance")

# Ordinal package is expecting a factor for the response variable
scores_long$ScoreOrdinal <- as.factor(scores_long$Score)

# Run mixed model: Area as fixed, program as random; 
# setting threshold = "equidistant" avoids downstream errors in post-hoc tests
scores_clmm <- ordinal::clmm(ScoreOrdinal ~ Area + (1|Program),
                             data = scores_long,
                             threshold = "equidistant") 

# Run post-hoc pairwise comparisons
emm <- emmeans(scores_clmm, ~ Area)
pairs(emm, adjust = "tukey")
