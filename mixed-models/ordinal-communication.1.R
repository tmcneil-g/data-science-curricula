install.packages("ordinal")
library(ordinal)
install.packages("emmeans")
library(emmeans)

# Read data
scores_long <- read.csv(file = "data/communication_long.csv")
# Ordinal package is expecting a factor for the response variable
scores_long$ScoreOrdinal <- as.factor(scores_long$Score)

# Run mixed model: Area as fixed, program as random; 
# setting threshold = "equidistant" avoids downstream errors in post-hoc tests
scores_clmm <- ordinal::clmm(ScoreOrdinal ~ Area + (1|Program),
                             data = scores_long,
                             threshold = "equidistant") 

emm <- emmeans(scores_clmm, ~ Area)

pairs(emm, adjust = "tukey")
