NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissionsPerYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(emissionsPerYear$Emissions, names.arg = emissionsPerYear$year, 
        xlab = "Year", ylab = "Emissions",
        main = "Total PM2.5 emission per year")
dev.off()
