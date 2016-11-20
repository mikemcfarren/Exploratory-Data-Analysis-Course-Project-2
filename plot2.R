# You must address the following questions and tasks in your exploratory analysis. 
# For each question/task you will need to make a single plot. Unless specified, you 
# can use any plotting system in R to make your plot.
#

# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#    (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
#    plot answering this question.

setwd("E:/Coursera/Exploratory-Data-Analysis-Course-Project-2");

NEI <- readRDS("data/summarySCC_PM25.rds");

SCC <- readRDS("data/Source_Classification_Code.rds");

baltimoreSubSet <- subset(NEI, fips == '24510')

baltimoreEmissions <- aggregate(baltimoreSubSet[, 'Emissions'], by = list(baltimoreSubSet$year), FUN = sum);

baltimoreEmissions$PM25kilotons <- round(baltimoreEmissions[, 2] / 1000.0, 2);

png(filename = "plot2.png");

barplot(baltimoreEmissions$PM25kilotons, 
        names.arg = baltimoreEmissions$Group.1, 
        main = expression(paste('Total PM', ''[2.5], ' Emissions in Baltimore, MD from 1999 - 2008')), 
        xlab = 'Year', 
        ylab = expression(paste('PM', ''[2.5], ' in kilotons')), 
        col = "blue");

dev.off();

rm(list=ls());


