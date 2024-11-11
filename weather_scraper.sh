
city="New%20York,US"
api_key="API"

# Fetch weather data
response=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api_key&units=metric")

# Parse temperature , temperature feels like, wind speed and weather description
temp=$(echo "$response" | jq '.main.temp')
feels=$(echo "$response" | jq '.main.feels_like')
wind_speed=$(echo "$response" | jq '.wind.speed')
description=$(echo "$response" | jq -r '.weather[0].description')


if [ -z "$temp" ] || [ -z "$description" ]; then
	echo "Failed to retrieve  weather Data"
	exit 1
fi

# Display formatted data
echo -e "Weather Report for $city\nTemperature : ${temp}°C\nFeels Like: ${feels}°C\nWind Speed: $wind_speed\nCondition: $description"

# Store data in SQLite database
sqlite3 weather.db "CREATE TABLE IF NOT EXISTS weather (id INTEGER PRIMARY KEY, city TEXT, temp REAL, description TEXT, timestamp DATETIME DEFAULT CURRENT_TIMESTAMP);"
sqlite3 weather.db "INSERT INTO weather (city, temp, description) VALUES ('$city', '$temp', '$description');"
