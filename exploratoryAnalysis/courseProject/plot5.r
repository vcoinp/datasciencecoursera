# plot 5 code
# Author: Vinicius Pereira

# Reads data from Source Clasification Code and Summary SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Create "vehicle" pattern
patterns <- c("vehicle","Vehicle")

# Get only the rows related with the pattern "vehicle" from SCC
matches <- SCC[grepl(paste(patterns, collapse="|"), SCC$Short.Name), ]
motorSCC <- matches$SCC
motorVehicleEmissions <- NEI[NEI$SCC %in% motorSCC, ]

# Subset dataset to get only Baltimore data
baltimoreEmissions <- subset(motorVehicleEmissions, fips == "24510")

# SUM emissions by year
totalYearPM25 <- aggregate(baltimoreEmissions$Emissions, by=list(Year=baltimoreEmissions$year), FUN=sum)

# Rename column to TotalEmissionsPM25
colnames(totalYearPM25)[2] <- "TotalEmissionsPM25"

# Initiates PNG "file plot5"
png(file="plot5.png",width=500,height=500)

# Create the plot displaying total emissions by year and type
plot(totalYearPM25$Year, (totalYearPM25$TotalEmissionsPM25), type="l" , xlab="year", ylab="Total PM2.5 emission (Tons)", main = "US Total PM2.5 Emission \nMotor Vehicle")

# Closes device
dev.off()