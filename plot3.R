# You must address the following questions and tasks in your exploratory analysis. 
# For each question/task you will need to make a single plot. Unless specified, you 
# can use any plotting system in R to make your plot.
#

# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
#    variable, which of these four sources have seen decreases in emissions from 1999-2008 
#    for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the 
#    ggplot2 plotting system to make a plot answer this question.

library(ggplot2);

setwd("E:/Coursera/Exploratory-Data-Analysis-Course-Project-2");

NEI <- readRDS("data/summarySCC_PM25.rds");

SCC <- readRDS("data/Source_Classification_Code.rds");

baltimoreSubSet <- subset(NEI, fips == '24510')

png(filename = "plot3.png", width=640, height=480);

ggplot(baltimoreSubSet,aes(factor(year),Emissions,fill=type)) +
    geom_bar(stat="identity") + 
    facet_grid(.~type) + 
    labs(x = 'Year', y = expression(paste('PM', ''[2.5], ' in tons'))) +
    labs(title = expression(paste('Total PM', ''[2.5], ' Emissions in Baltimore, MD from 1999 - 2008 by type')))


dev.off()

rm(list=ls());


