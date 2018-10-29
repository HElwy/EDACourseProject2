library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips == "24510", ]
balPerYearType <- aggregate(Emissions ~ year + type, baltimore, sum)

png('plot3.png')
plot3 <- ggplot(balPerYearType, aes(year, Emissions, color = type)) +
    geom_line() + geom_point()+ xlab("Year") + ylab("Emissions") +
    ggtitle('Total PM2.5 emission in Baltimore City per year and type')
print(plot3)
dev.off()
