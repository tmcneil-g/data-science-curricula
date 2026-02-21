library(ordinal)
library(dplyr)
library(emmeans)

# Read data
scores_long <- read.csv(file = "data/data_description_long.csv")

# Drop sub-area that does not have variation in the score
scores_long <- scores_long %>%
   filter(Area != "Exploratory")

# Ordinal package is expecting a factor for the response variable
scores_long$ScoreOrdinal <- as.factor(scores_long$Score)

# Run mixed model: Area as fixed, program as random; 
# setting threshold = "equidistant" avoids downstream errors in post-hoc tests
scores_clmm <- ordinal::clmm(ScoreOrdinal ~ Area + (1|Program),
                             data = scores_long,
                             threshold = "equidistant") 

emm <- emmeans(scores_clmm, ~ Area)

pairs(emm, adjust = "tukey")



