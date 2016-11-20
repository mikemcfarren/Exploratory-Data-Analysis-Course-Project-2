# You must address the following questions and tasks in your exploratory analysis. 
# For each question/task you will need to make a single plot. Unless specified, you 
# can use any plotting system in R to make your plot.
#

# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from 
#    motor vehicle sources in Los Angeles County, California (fips == "06037"). Which 
#    city has seen greater changes over time in motor vehicle emissions?

library(ggplot2);

setwd("E:/Coursera/Exploratory-Data-Analysis-Course-Project-2");

NEI <- readRDS("data/summarySCC_PM25.rds");

SCC <- readRDS("data/Source_Classification_Code.rds");

baltimoreSubSet <- subset(NEI, fips == '24510')
losAngelesSubSet <- subset(NEI, fips == '06037')

contains.vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = T)

baltimoreVehicleSubSet <- baltimoreSubSet[baltimoreSubSet$SCC %in% SCC[contains.vehicle,]$SCC,]
baltimoreVehicleSubSet$city <- "Baltimore, MD"

losAngelesVehicleSubSet <- losAngelesSubSet[losAngelesSubSet$SCC %in% SCC[contains.vehicle,]$SCC,]
losAngelesVehicleSubSet$city <- "Los Angeles, CA"

# combine the Baltimore + LA subsets
bothSubSet <- rbind(baltimoreVehicleSubSet,losAngelesVehicleSubSet)


png(filename = "plot6.png", width=640, height=480);

ggplot(bothSubSet,aes(factor(year),Emissions,fill=city)) +
    geom_bar(aes(fill=year),stat="identity") + 
    facet_grid(. ~ city) +
    guides(fill=F) +
    labs(x = 'Year', y = expression(paste('PM', ''[2.5], ' in tons'))) +
    labs(title = expression(paste('Total PM', ''[2.5], ' Motor Vehicle Emissions in Baltimore and LA from 1999 - 2008')))


dev.off()

rm(list=ls());


