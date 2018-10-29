library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

balLAEmissions <- NEI[(NEI$fips == "24510" | NEI$fips == "06037") & 
                          NEI$type == "ON-ROAD", ]
balLAEmissions$fips[balLAEmissions$fips == "24510"] <- "Baltimore City"
balLAEmissions$fips[balLAEmissions$fips == "06037"] <- "Los Angeles"
balLAEmPerYear <- aggregate(Emissions ~ year + fips, balLAEmissions, sum)

png('plot6.png')
plot6 <- ggplot(balLAEmPerYear, aes(factor(year), Emissions)) +
    geom_bar(stat="identity") + facet_grid(. ~ fips) + 
    xlab("Year") + ylab("Emissions") +
    ggtitle(paste("Total PM2.5 emission by vehicles in Baltimore City and",
            "Los Angeles per year"))
print(plot6)
dev.off()
