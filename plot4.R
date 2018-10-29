NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalMap <- grepl("coal", SCC$Short.Name, ignore.case = TRUE)
coalMap <- SCC[coalMap, ]
coalEmissions <- NEI[NEI$SCC %in% coalMap$SCC, ]
coalEmPerYear <- aggregate(Emissions ~ year, coalEmissions, sum)

png('plot4.png')
barplot(coalEmPerYear$Emissions, names.arg = coalEmPerYear$year, 
        xlab = "Year", ylab = "Emissions",
        main = "Total PM2.5 emission by coal per year")
dev.off()
