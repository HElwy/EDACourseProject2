NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BalVehicleEmissions <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
balVehEmPerYear <- aggregate(Emissions ~ year, BalVehicleEmissions, sum)

png('plot5.png')
barplot(balVehEmPerYear$Emissions, names.arg = balVehEmPerYear$year, 
        xlab = "Year", ylab = "Emissions",
        main = "Total PM2.5 emission by vehicles in Baltimore City per year")
dev.off()
