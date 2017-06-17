# plot 3 code
# Author: Vinicius Pereira

# Loads library ggplot2
library("ggplot2")

# Reads data from Source Clasification Code and Summary SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset dataset to get only Baltimore data
baltimoreEmissions <- subset(NEI, fips == "24510")

# SUM emissions by year and type of emission
totalYearPM25 <- aggregate(baltimoreEmissions$Emissions, by=list(Year=baltimoreEmissions$year, Type=baltimoreEmissions$type), FUN=sum)

# Rename column to TotalEmissionsPM25
colnames(totalYearPM25)[3] <- "TotalEmissionsPM25"

# Subset only 1999 and 2008 year to make it easier to identify if the emissions decreased or increased over time
totalYearPM25 <- subset(totalYearPM25, Year == 1999 | Year == 2008)

# Initiates PNG "file plot3"
png(file="plot3.png",width=500,height=500)

# Create the plot displaying total emissions by year and type
ggplot(totalYearPM25, aes(Year, TotalEmissionsPM25))+
            geom_line(aes(colour = Type))+
			ggtitle("Baltimore City \nTotal PM2.5 emission by Type")+
			ylab("PM2.5 emission (Tons)")

# Closes device
dev.off()