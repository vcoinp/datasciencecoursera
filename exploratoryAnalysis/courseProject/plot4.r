# plot 4 code
# Author: Vinicius Pereira

# Reads data from Source Clasification Code and Summary SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Create "coal "pattern
patterns <- c("Coal","coal")

# Get only the rows related with the pattern "coal" from SCC
matches <- SCC[grepl(paste(patterns, collapse="|"), SCC$Short.Name), ]
coalSCC <- matches$SCC

# From summary, get only the data that matches with the SCC coal related 
coalEmissions <- NEI[NEI$SCC %in% coalSCC, ]

# SUM emissions by year
totalYearPM25 <- aggregate(coalEmissions$Emissions, by=list(Year=coalEmissions$year), FUN=sum)

# Rename column to TotalEmissionsPM25
colnames(totalYearPM25)[2] <- "TotalEmissionsPM25"

# Initiates PNG "file plot4"
png(file="plot4.png",width=500,height=500)

# Create the plot displaying total emissions by year
plot(totalYearPM25$Year, (totalYearPM25$TotalEmissionsPM25), type="l" , xlab="year", ylab="Total 2.5 emission (Tons)", main = "US Total PM2.5 Emission\nfrom Coal Combustion")

# Closes device
dev.off()