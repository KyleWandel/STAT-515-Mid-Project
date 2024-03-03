library("tidyverse")
library("tidyr")
library("ggplot2")

source("/Users/kwandel/Documents/Personal Stuff/George Mason University/STAT 515 - Spring 2024/R Theme/hw.R")
getwd()

df <- read.csv(file = "/Users/kwandel/Documents/Personal Stuff/George Mason University/STAT 515 - Spring 2024/Porject Folder/Mid Project/Murrder_By_Weapon.csv")
# Original column names
original_colnames <- colnames(df)

# New column names with spaces instead of periods
new_colnames <- gsub("\\.", " ", original_colnames)

# Rename the columns
colnames(df) <- new_colnames

# Reshape data to long format
df_long <- pivot_longer(df, -Year, names_to = "Offense_Type", values_to = "Count")

# Plotting
ggplot(df_long, aes(x = Year, y = Count, color = Offense_Type)) +
  geom_line() +
  labs(x = "Year", y = "Count", title = "Offenses by Type Over Years") +
  hw 

ggplot(df_long[df_long$Offense_Type == "Firearm", ], aes(x = Year, y = Count)) +
  geom_line(color = "red") +
  geom_point(color = "red") +
  geom_area(fill = "lightcoral", alpha = 0.5) +
  geom_text(data = subset(df_long[df_long$Offense_Type == "Firearm", ], Year %% 5 == 0), aes(label = Count), vjust = 1, color = "black", size = 3) +  # Add labels to data points every 5th point
  labs(x = "Year", y = "Count", title = "Firearm Offenses Over Years") +
  hw
