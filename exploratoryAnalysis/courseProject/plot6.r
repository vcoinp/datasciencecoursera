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

# Subset dataset to get only Los Angeles data
losAngelesEmissions <- subset(motorVehicleEmissions, fips == "06037")

# SUM emissions by year
baltimoreTotalYearPM25 <- aggregate(baltimoreEmissions$Emissions, by=list(Year=baltimoreEmissions$year), FUN=sum)
losAngelesTotalYearPM25 <- aggregate(losAngelesEmissions$Emissions, by=list(Year=losAngelesEmissions$year), FUN=sum)

# Rename column to TotalEmissionsPM25
colnames(baltimoreTotalYearPM25)[2] <- "TotalEmissionsPM25"
colnames(losAngelesTotalYearPM25)[2] <- "TotalEmissionsPM25"

# Initiates PNG "file plot6"
png(file="plot6.png",width=800,height=550)

# Specify mfcol - matrix()1,2
par(mfcol = c(1,2))

# Creates the line chart setting x and y axes names 
plot(baltimoreTotalYearPM25$Year, (baltimoreTotalYearPM25$TotalEmissionsPM25), type="l" , xlab="year", ylab="Total PM 2.5 emission (Tons)", main = "Baltimore City \nMotor Vehicle Emission")

plot(losAngelesTotalYearPM25$Year, (losAngelesTotalYearPM25$TotalEmissionsPM25), type="l" , xlab="year", ylab="Total PM 2.5 emission (Tons)", main = "Los Angeles County\nMotor Vehicle Emission")

# Closes device
dev.off()