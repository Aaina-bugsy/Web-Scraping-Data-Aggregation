# Automated Web Scraping and Data Aggregation Script 📝

This project is designed to fetch and aggregate weather data from the OpenWeather API and store it in a local SQLite database for reporting and analysis.

---

## Features 
- ✅ Fetch Weather Data – Retrieve current weather data for a specified city.
- 🌦️ Weather Details – Get temperature, wind speed, "feels like" temperature, and weather condition.
- 📊 Data Aggregation – Store weather data in a SQLite database for future reference.
- 📅 Timestamps – Automatically records the time when weather data is fetched and stored.
- 🌐 Command-Line Interface (CLI) – Easy-to-use script run via terminal.

---

## Tech Stack ⚙️
- API: OpenWeather API (Free API key required)
- Backend: Shell Script (.sh)
- Database: SQLite
- Tools: curl, jq, sqlite3, awk
- Version Control: Git
- Scheduler: Cron (optional for automation)

---

## Prerequisites 🛠️
To run this script, you'll need the following tools installed on your system:

- curl – For making HTTP requests to the OpenWeather API.
- jq – For parsing and extracting data from the JSON response.
- sqlite3 – For storing weather data in an SQLite database.
- bash – The shell environment to execute the script.
- Git – For version control (optional, if working with Git).

---

## How to Install 🛠️
- Clone the Repository - Clone this repository to your local machine using the following command:

bash
Copy code
git clone https://github.com/Aaina-bugsy/Web-Scraping-Data-Aggregation.git
2. Install Dependencies
Make sure you have curl, jq, and sqlite3 installed:

For Linux (Ubuntu):

bash
Copy code
sudo apt install curl jq sqlite3
For macOS (use Homebrew):

bash
Copy code
brew install curl jq sqlite3
For Windows: Download and install Git Bash to use the script, along with curl, jq, and sqlite3 from Windows packages.

3. Configure API Key
Get your API key by signing up at OpenWeather.
Replace the placeholder YOUR_API_KEY in the script with your actual API key.
bash
Copy code
api_key="YOUR_API_KEY"
How to Run 🚀
Make the Script Executable: After downloading the repository, navigate to the directory containing the script and make it executable:

bash
Copy code
chmod +x weather_scraper.sh
Run the Script: Execute the script to fetch weather data and store it in the database:

bash
Copy code
./weather_scraper.sh
View Stored Data: To view the weather data stored in the SQLite database, you can use the following command:

bash
Copy code
sqlite3 weather.db "SELECT * FROM weather;"

---

## Database Schema 🗃️
The script creates a table called weather in the SQLite database with the following columns:

- id: Unique identifier for each entry.
- city: Name of the city for which the weather data was fetched.
- temp: Current temperature in Celsius.
- feels_like: "Feels like" temperature in Celsius.
- wind_speed: Wind speed in meters per second.
- description: Weather condition description (e.g., "clear sky").
- timestamp: Timestamp when the data was stored.

## Troubleshooting ❓
If you encounter any issues, make sure:

- Your API key is correctly set and valid.
- You have the necessary dependencies installed.
- Your internet connection is active and can access the OpenWeather API.
