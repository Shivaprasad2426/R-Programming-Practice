# Intermediate R Programming

# This script provides intermediate level R programming examples.

# Importing necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)

# Creating a Complex Data Frame
# Let's start by creating a more complex data frame in R.

# Creating data
set.seed(123)
df <- data.frame(
  id = 1:100,
  date = seq.Date(from = as.Date("2025-01-01"), by = "day", length.out = 100),
  category = sample(c("A", "B", "C"), 100, replace = TRUE),
  value = rnorm(100, mean = 50, sd = 10)
)

# Displaying the first few rows of the data frame
head(df)

# Data Manipulation with dplyr
# Filtering, summarizing, and grouping the data.

# Filtering data for category A
df_A <- df %>% filter(category == "A")

# Summarizing data to get the mean value by category
summary_df <- df %>% group_by(category) %>% summarize(mean_value = mean(value))

# Displaying the summary data frame
print(summary_df)

# Data Transformation with tidyr
# Transforming the data from wide format to long format.

# Creating a wide format data frame
wide_df <- df %>% spread(key = category, value = value)

# Transforming the wide format data frame to long format
long_df <- wide_df %>% gather(key = "category", value = "value", -id, -date)

# Displaying the first few rows of the long format data frame
head(long_df)

# Date and Time Manipulation with lubridate
# Extracting and manipulating date and time components.

# Extracting the month from the date
df$month <- month(df$date)

# Extracting the week number from the date
df$week <- week(df$date)

# Displaying the first few rows of the data frame with new date components
head(df)

# Creating Advanced Plots with ggplot2
# Creating advanced visualizations using ggplot2.

# Creating a scatter plot with regression line
ggplot(df, aes(x = date, y = value, color = category)) +
  geom_point() +
  geom_smooth(method = "lm") +
  ggtitle("Scatter Plot with Regression Line") +
  xlab("Date") +
  ylab("Value")

# Creating a box plot
ggplot(df, aes(x = category, y = value, fill = category)) +
  geom_boxplot() +
  ggtitle("Box Plot by Category") +
  xlab("Category") +
  ylab("Value")
