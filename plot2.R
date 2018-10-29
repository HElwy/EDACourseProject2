NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips == "24510", ]
balEmPerYear <- aggregate(Emissions ~ year, baltimore, sum)

png('plot2.png')
barplot(balEmPerYear$Emissions, names.arg = balEmPerYear$year, 
        xlab = "Year", ylab = "Emissions",
        main = "Total PM2.5 emission in Baltimore City per year")
dev.off()
