

library(data.table)
library(ggplot2)
library(dplyr)
library(reshape)


Womens= read.csv("D:/kjw_data/01_R/data/Womens Clothing E-Commerce Reviews.csv")

str(Womens)

Age_g = cut(as.numeric(Womens$Age),
            breaks = seq(10, 100, by= 10),
            include.lowest = TRUE,
            right = FALSE,
            lables = paste0(seq(10,90,by-10), "th"))

Age_g
