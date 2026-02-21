# Ordinal mixed-effects model for "Data modeling and assessmentn" area and 
# post-hoc pairwise comparisons to assess significant differences between sub-areas

library(ordinal)
library(emmeans)

# Read data
scores_long <- read.csv(file = "data/data_modeling_long.csv")

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
