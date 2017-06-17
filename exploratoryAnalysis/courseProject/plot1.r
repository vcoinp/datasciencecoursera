# plot 1 code
# Author: Vinicius Pereira

# Reads data from Source Clasification Code and Summary SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# SUM emissions by year
totalYearPM25 <- aggregate(NEI$Emissions, by=list(Year=NEI$year), FUN=sum)

# Rename column to TotalEmissionsPM25
colnames(totalYearPM25)[2] <- "TotalEmissionsPM25"


# Initiates PNG "file plot1"
png(file="plot1.png",width=500,height=500)

# Create the plot displaying total emissions by year
plot(totalYearPM25$Year, (totalYearPM25$TotalEmissionsPM25/1000), type="l" , xlab="year", ylab="PM2.5 emission (Thousands of Tons)", ylim = range(3000:7500), xlim = range(1999:2008), main = "US Total PM2.5 Emission ")

# Closes device
dev.off()