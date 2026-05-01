Methodology – AlphaPulse Project
1. Data Collection
Historical stock price data was collected for selected companies such as Apple Inc., Tesla Inc., and Alphabet Inc..
Data includes:
Date
Closing Price
👉 The dataset serves as the foundation for all financial analysis.
2. Data Cleaning and Preparation
Raw data was preprocessed to ensure accuracy and consistency.
Steps performed:
Removed missing/null values
Standardized date format
Sorted data chronologically
Ensured consistent column structure
👉 Clean data is essential for accurate financial calculations.
3. Return Calculation
Daily returns were calculated using closing prices.
Percentage change between consecutive days was computed
👉 This step transforms raw price data into analytical data used for:
Volatility
Correlation
Portfolio analysis
4. Portfolio Construction
A portfolio was created by combining multiple stocks.
Equal or assigned weights were used
Portfolio return calculated as weighted average of individual returns
5. Risk Analysis (Volatility)
Volatility was calculated using standard deviation of returns.
Measures the risk level of each stock and the portfolio
👉 Higher volatility indicates higher uncertainty in returns.
6. Rolling Volatility Calculation
To analyze how risk changes over time:
A 30-day rolling window was applied
Standard deviation calculated for each window
👉 Helps identify periods of market instability.
7. Correlation Analysis
Correlation between stock returns was computed.
Pairwise relationships analyzed
Results visualized using a heatmap
👉 Helps understand diversification benefits.
8. Monte Carlo Simulation
Monte Carlo simulation was used to forecast future portfolio values.
Steps:
Random returns generated based on historical mean and volatility
Multiple simulations performed
Final portfolio values recorded
👉 Provides a range of possible future outcomes rather than a single prediction.
9. Data Visualization (Power BI)
All calculated metrics were visualized using Microsoft Power BI.
Visuals created:
Line charts for stock prices and returns
Heatmap for correlation
KPI cards for key metrics
Simulation chart for Monte Carlo results
👉 Visualization enables better interpretation of financial insights.
10. Insight Generation
Final step involved interpreting the results:
Identifying high-risk vs low-risk stocks
Understanding diversification effects
Evaluating possible future portfolio performance
👉 Insights support data-driven financial decision-making.
