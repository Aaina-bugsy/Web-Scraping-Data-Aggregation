
city="Waterloo"
api_key="c8097494cf9e7cad4803932e2647f9b9"

response=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api_key&units=metric")

temp=$(echo "$response" | jq '.main.temp')
feels_like=$(echo "$response" | jq '.main.feels_like')
wind_speed=$(echo "$response" | jq '.wind.speed')
description=$(echo "$response" | jq -r '.weather[0].description')


if [ -z "$temp" ] || [ -z "$description" ]; then
	echo "Failed to retrieve  weather Data"
	exit 1
fi

echo -e "Weather Report for $city\nTemperature : ${temp}°C\nFeels Like: ${feels_like}°C\nWind Speed: ${wind_speed} m/s\nCondition: $description"

sqlite3 weather.db "CREATE TABLE IF NOT EXISTS weather (id INTEGER PRIMARY KEY, city TEXT, temp REAL, feels_like REAL, wind_speed REAL, description TEXT, timestamp DATETIME DEFAULT CURRENT_TIMESTAMP);"
sqlite3 weather.db "INSERT INTO weather (city, temp, feels_like, wind_speed, description) VALUES ('$city', $temp, $feels_like, $wind_speed, '$description');"

