# You must address the following questions and tasks in your exploratory analysis. 
# For each question/task you will need to make a single plot. Unless specified, you 
# can use any plotting system in R to make your plot.
#

# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#    Using the base plotting system, make a plot showing the total PM2.5 emission from 
#    all sources for each of the years 1999, 2002, 2005, and 2008.


setwd("E:/Coursera/Exploratory-Data-Analysis-Course-Project-2");

NEI <- readRDS("data/summarySCC_PM25.rds");

SCC <- readRDS("data/Source_Classification_Code.rds");

totalEmissions <- aggregate(NEI[, 'Emissions'], by = list(NEI$year), FUN = sum);

totalEmissions$PM25kilotons <- round(totalEmissions[, 2] / 1000000.0, 2);

png(filename = "plot1.png");

barplot(totalEmissions$PM25kilotons, 
        names.arg = totalEmissions$Group.1, 
        main = expression(paste('Total PM', ''[2.5], ' Emissions from 1999 - 2008')), 
        xlab = 'Year', 
        ylab = expression(paste('PM', ''[2.5], ' in megatons')), 
        col = "red");

dev.off();

rm(list=ls());


