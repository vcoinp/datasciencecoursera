# plot 2 code
# Author: Vinicius Pereira

# Reads data from Source Clasification Code and Summary SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset dataset to get only Baltimore data
baltimoreEmissions <- subset(NEI, fips == "24510")

# SUM emissions by year
totalYearPM25 <- aggregate(baltimoreEmissions$Emissions, by=list(Year=baltimoreEmissions$year), FUN=sum)

# Rename column to TotalEmissionsPM25
colnames(totalYearPM25)[2] <- "TotalEmissionsPM25"

# Initiates PNG "file plot2"
png(file="plot2.png",width=500,height=500)

# Create the plot displaying total emissions by year
plot(totalYearPM25$Year, (totalYearPM25$TotalEmissionsPM25), type="l" , xlab="year", ylab="PM2.5 emission (Tons)", main = "Baltimore City \nTotal PM2.5 Emission ")

# Closes device
dev.off()