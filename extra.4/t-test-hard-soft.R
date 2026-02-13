# read in data
nasem_all <- read.csv("C:/Users/ual-laptop/Desktop/t_test.2_file.csv")

# t-test
# use var.equal=TRUE for equal variances
t.test(nasem_all$Area.Subarea_Score_Technical, nasem_all$Area.Subarea_Score_Soft, var.equal = TRUE) 