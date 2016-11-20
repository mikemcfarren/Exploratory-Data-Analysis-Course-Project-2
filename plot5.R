# You must address the following questions and tasks in your exploratory analysis. 
# For each question/task you will need to make a single plot. Unless specified, you 
# can use any plotting system in R to make your plot.
#

# 5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

library(ggplot2);

setwd("E:/Coursera/Exploratory-Data-Analysis-Course-Project-2");

NEI <- readRDS("data/summarySCC_PM25.rds");

SCC <- readRDS("data/Source_Classification_Code.rds");

baltimoreSubSet <- subset(NEI, fips == '24510')

contains.vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = T)

baltimoreVehicleSubSet <- baltimoreSubSet[baltimoreSubSet$SCC %in% SCC[contains.vehicle,]$SCC,]


png(filename = "plot5.png", width=480, height=480);

ggplot(baltimoreVehicleSubSet,aes(factor(year),Emissions,fill=year)) +
    geom_bar(stat="identity") + 
    guides(fill = F) + 
    labs(x = 'Year', y = expression(paste('PM', ''[2.5], ' in tons'))) +
    labs(title = expression(paste('Total PM', ''[2.5], ' Motor Vehicle Emissions in Baltimore, MD from 1999 - 2008')))


dev.off()

rm(list=ls());


