install.packages("ggplot2")
install.packages("tidyr")
install.packages("readr")

# Load necessary libraries
library(dplyr)
library(ggplot2)
library(tidyr)
library(readr)

# Sample data
data <- data.frame(
  Date = seq(as.Date("2025-01-01"), as.Date("2025-01-10"), by="days"),
  Value = c(100, 200, 150, 300, 250, 350, 400, 450, 500, 550)
)

# Print the first few rows of the data
print(head(data))


# Data manipulation: Calculate cumulative sum of the 'Value' column
data <- data %>%
  mutate(CumulativeValue = cumsum(Value))

# Print the modified data
print(data)

# Data visualization: Plot the 'Value' and 'CumulativeValue' over time
ggplot(data, aes(x = Date)) +
  geom_line(aes(y = Value, color = "Value")) +
  geom_line(aes(y = CumulativeValue, color = "Cumulative Value")) +
  labs(title = "Value and Cumulative Value Over Time",
       x = "Date",
       y = "Value") +
  scale_color_manual(name = "Legend", values = c("Value" = "blue", "Cumulative Value" = "red"))

# Save the plot to a file
ggsave("value_plot.png")

# Statistical analysis: Calculate summary statistics for the 'Value' column
summary_stats <- data %>%
  summarise(
    Mean = mean(Value),
    Median = median(Value),
    SD = sd(Value),
    Min = min(Value),
    Max = max(Value)
  )


# Print the summary statistics
print(summary_stats)

# Save the data and summary statistics to CSV files
write_csv(data, "data.csv")
write_csv(summary_stats, "summary_stats.csv")

# Additional operations: Perform a linear regression analysis
linear_model <- lm(Value ~ Date, data = data)
summary(linear_model)

# Print the summary of the linear model
print(summary(linear_model))

# Save the linear model summary to a file
sink("linear_model_summary.txt")
print(summary(linear_model))
sink()

# More advanced visualization: Create a scatter plot with a regression line
ggplot(data, aes(x = as.numeric(Date), y = Value)) +
  geom_point() +
  geom_smooth(method = "lm", col = "red") +
  labs(title = "Scatter Plot with Regression Line",
       x = "Date (numeric)",
       y = "Value")

# Save the scatter plot to a file
ggsave("scatter_plot.png")

# Perform a time series decomposition
ts_data <- ts(data$Value, start = c(2025, 1), frequency = 365)
decomp <- stl(ts_data, s.window = "periodic")

# Plot the decomposition
plot(decomp)

# Save the decomposition plot to a file
png("decomposition_plot.png")
plot(decomp)
dev.off()

# Forecast the next 10 periods using the decomposed time series
forecast_result <- forecast(decomp, h = 10)

# Plot the forecast
plot(forecast_result)

# Save the forecast plot to a file
png("forecast_plot.png")
plot(forecast_result)
dev.off()

# Save the forecast results to a CSV file
write_csv(as.data.frame(forecast_result), "forecast_results.csv")

# End of the R program



















