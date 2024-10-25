CREATE DATABASE disney_star;
USE disney_star;
# List all channels along with their category and language.
SELECT Channel, Category, Language FROM on_air_channels_final;

# Which channel has the highest average daily viewership?
SELECT Channel, Average_Daily_Viewership_millions FROM on_air_channels_final
ORDER BY Average_Daily_Viewership_millions DESC LIMIT 1;

# How many channels are available in more than one language?
SELECT Language, Count(Channel) AS 'Number_of_channels' FROM on_air_channels_final
GROUP BY Language
HAVING Language LIKE "%,%";

# What is the total annual revenue across all channels?
SELECT SUM(Total_Annual_Revenue_million_USD) AS 'Total Revenue Across all Channels'
FROM on_air_channels_final;

# Which channels support HD or 4K availability?
SELECT Channel,SD_HD_4K_Availability FROM on_air_channels_final
WHERE SD_HD_4K_Availability IN ("SD+HD","HD","4K");

# Which three channels have the highest peak viewership?
SELECT Channel,Peak_Viewership_millions FROM on_air_channels_final
ORDER BY Peak_Viewership_millions DESC LIMIT 3;

# What is the average revenue for each category of channels?
SELECT Category,AVG(Total_Annual_Revenue_million_USD) AS 'Average Revenue per Category'
FROM on_air_channels_final
GROUP BY Category;

# Which channels have produced more than 10 original productions?
SELECT Channel, Number_of_Original_Productions FROM on_air_channels_final
WHERE Number_of_Original_Productions > 10;

# Is there a relationship between prime-time hours and daily viewership?
SELECT Channel, Prime_Time_Broadcast_Hours_per_Day, Average_Daily_Viewership_millions FROM on_air_channels_final
WHERE Prime_Time_Broadcast_Hours_per_Day > 4;

# How many channels are available in each language?
SELECT Language, COUNT(Channel) AS 'Number of Channels' FROM on_air_channels_final
GROUP BY Language;

# List channels with a positive annual growth rate of viewership.
SELECT Channel, Annual_Growth_Rate_of_Viewership_Percentage FROM on_air_channels_final
WHERE Annual_Growth_Rate_of_Viewership_Percentage > 0;

# Identify channels where subscription revenue contributes to more than 50% of total revenue.
SELECT Channel, Subscription_Revenue_million_USD, Total_Annual_Revenue_million_USD
FROM on_air_channels_final
WHERE (Subscription_Revenue_million_USD/Total_Annual_Revenue_million_USD) > 0.5;

# List channels with high viewership (>5 million) but low total revenue (<100 million USD).
SELECT Channel, Average_Daily_Viewership_millions, Total_Annual_Revenue_million_USD
FROM on_air_channels_final 
WHERE Average_Daily_Viewership_millions > 5 AND Total_Annual_Revenue_million_USD < 100;

# Which channels with more than 18 daily broadcast hours and have an average content rating above 8?
SELECT Channel, Average_Daily_Broadcast_Hours, Average_Content_Rating_max_10
FROM on_air_channels_final
WHERE Average_Daily_Broadcast_Hours > 18 AND Average_Content_Rating_max_10 > 8;

# Which channels show both high annual growth in viewership and generate significant total revenue (>300 million USD)?
SELECT Channel, Annual_Growth_Rate_of_Viewership_Percentage, Total_Annual_Revenue_million_USD
FROM on_air_channels_final
WHERE Annual_Growth_Rate_of_Viewership_Percentage > 10 AND Total_Annual_Revenue_million_USD > 300;

# When was the first channel launched ?
SELECT Channel, Launched FROM on_air_channels_final
ORDER BY Launched ASC LIMIT 1;

# The most recent channel launched ?
SELECT Channel, Launched FROM on_air_channels_final
ORDER BY Launched DESC LIMIT 1;

# The year with highest number of channels launched ?
SELECT Launched, COUNT(Channel) 
FROM on_air_channels_final
GROUP BY Launched
ORDER BY COUNT(Channel) DESC LIMIT 1;

# The first channel to be discontinued or dissolved and in which year and why ?
SELECT Channel, Defunct, Notes FROM dissolved_channels
ORDER BY Defunct ASC LIMIT 1;

# The most recent channel discontinued and why ?
SELECT Channel, Defunct, Notes FROM dissolved_channels
ORDER BY Defunct DESC LIMIT 1;

# The year with highest number of discontinued or dissolved channels ?
SELECT Defunct, COUNT(Channel)
FROM dissolved_channels
GROUP BY Defunct
ORDER BY COUNT(Channel) DESC LIMIT 1;

# The channel/channels which were active for a longer time but later dissolved ?
SELECT Channel, Duration_of_Activity_In_Years 
FROM dissolved_channels
ORDER BY Duration_of_Activity_In_Years DESC LIMIT 1; 

# The category with most number of dissolved channels ?
SELECT Category, COUNT(Channel) 
FROM dissolved_channels
GROUP BY Category
ORDER BY COUNT(Channel) DESC LIMIT 1;

# The launguage in which most number of channels were dissolved ?
SELECT Language, COUNT(Channel) 
FROM dissolved_channels
GROUP BY Language
ORDER BY COUNT(Channel) DESC LIMIT 1;

# The Disney Star Network does not own any news channel currently. Find out the channels which were once a part of Star Network and what happened to them ?
SELECT Channel, Category, Language, Notes
FROM dissolved_channels
WHERE Category = 'News';

