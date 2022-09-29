<script>
    


    // Tidal Fetch API. Example Structure.
    
    
    const url = "https://dataservice.accuweather.com/forecasts/v1/daily/5day/255042?apikey=H1lM7nG32DTJNGY59xxEOiEdpvAkplAR";
      const options = {
        method: "GET",
        headers: {
          "x-apikey": "H1lM7nG32DTJNGY59xxEOiEdpvAkplAR",
          "Accept": "application/json"
        },
      };
      let tide_list = document.createElement("ul");
      let todaysWeather = 0;
      fetch(url)
      .then(response => response.json())
        .then(values => {
        
              console.log("Today's Weather")
              console.log(values.DailyForecasts[0].Temperature.Minimum.Value)
              console.log(values.DailyForecasts[0].Temperature.Maximum.Value)
              let todaysHigh = values.DailyForecasts[0].Temperature.Maximum.Value
              let todaysLow = values.DailyForecasts[0].Temperature.Minimum.Value
              todaysHigh = Math.round((todaysHigh - 32)*5/9) //Converting the Temperature into Celcius
              todaysLow = Math.round((todaysLow - 32)*5/9)
            tide_list.append("Todays Weather")
            let item = document.createElement("li");
            item.innerHTML = "Min" + " " + todaysLow + " C" + "  :   " + "Max" + " " + todaysHigh + " C"
    
           tide_list.append(item)
          console.log("5 Day Forecast")
          tide_list.append("5 Day Forecast")
          values["DailyForecasts"].forEach(x => {
               item = document.createElement("li");
              console.log(x.Date)
              let temp = x.Temperature;
              let min = temp.Minimum
              let max = temp.Maximum
              let minCelcius = Math.round((min.Value - 32) * (5/9))
              let maxCelcius = Math.round((max.Value - 32) * (5/9))
              item.innerHTML = "Min" + " " + minCelcius + " C" + "  :   " + "Max" + " " + maxCelcius + " C"
              console.log("Min" + " " + minCelcius + " C")
    
              console.log("Max" + " " + maxCelcius + " C")
              tide_list.append(item)
          });
    
    
    
    
    
    
          document.querySelector("main").append(tide_list);
    
      });
    
    
    
    
    </script>

<main>

</main>
