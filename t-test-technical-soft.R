# Tested hypotheses with data using one-tailed Student’s t-tests:
# Areas/sub-areas categorized as “technical” scored higher than areas/sub-areas categorized as “soft” or “soft/technical.”

# Read data
nasem_all <- read.csv(file = "data/technical-soft-skills.csv")

# Run one-tailed Student's t-test
# Use var.equal=TRUE for equal variances
t.test(nasem_all$Area_Subarea_Score_Technical, nasem_all$Area_Subarea_Score_Soft, var.equal = TRUE) 
