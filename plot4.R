# You must address the following questions and tasks in your exploratory analysis. 
# For each question/task you will need to make a single plot. Unless specified, you 
# can use any plotting system in R to make your plot.
#

# 4. Across the United States, how have emissions from coal combustion-related sources 
#    changed from 1999-2008?

library(ggplot2);

setwd("E:/Coursera/Exploratory-Data-Analysis-Course-Project-2");

NEI <- readRDS("data/summarySCC_PM25.rds");

SCC <- readRDS("data/Source_Classification_Code.rds");


contains.coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case = T)
contains.combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=T)

coalCombustion <- (contains.coal & contains.combustion)

coalCombustionSubSet <- NEI[NEI$SCC %in% SCC[coalCombustion,]$SCC,]


png(filename = "plot4.png", width=480, height=480);

ggplot(coalCombustionSubSet,aes(factor(year),Emissions/1000,fill=type)) +
    geom_bar(stat="identity") + 
    labs(x = 'Year', y = expression(paste('PM', ''[2.5], ' in kilotons'))) +
    labs(title = expression(paste('Total PM', ''[2.5], ' Coal Combustion Emissions from 1999 - 2008')))


dev.off()

rm(list=ls());


