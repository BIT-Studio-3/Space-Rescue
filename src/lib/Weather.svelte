
<script>
    
    import locationData from '../assets/locationData.json' 
    import { onMount } from 'svelte';
    onMount(() =>{
      let auck = document.querySelector("button.auck") //Selected the buttons with class dunedin and auckland
      let dun = document.querySelector("button.dun")
      dun.addEventListener("click", e=>{ //When the button is clicked
      document.querySelector(".weatherData").innerHTML = ""; //The data is cleared and runs the fetchWeather function, This takes in a locationkey and a name
      let mykey = locationData.Cities.Dunedin.key;
      fetchWeather(mykey,"Dunedin")
      })

      auck.addEventListener("click", e=>{
        document.querySelector(".weatherData").innerHTML = "";
        let mykey = locationData.Cities.Auckland.key;
        
      fetchWeather(mykey,"Auckland")
      })

    })

    // Tidal Fetch API. Example Structure.
    
    let fetchWeather = (locationKey,cityName) =>{ //The fetch weather function takes the name and locationkey and uses it to display the correct info

      const url =`https://dataservice.accuweather.com/forecasts/v1/daily/5day/${locationKey}?apikey=H1lM7nG32DTJNGY59xxEOiEdpvAkplAR`; //Link to the API raw Data. Specifies a 5 day forecast , a special location key: at this point it is in Dunedin and an API key.
      const options = {
        method: "GET",
        headers: { 
          "x-apikey": "H1lM7nG32DTJNGY59xxEOiEdpvAkplAR",
          "Accept": "application/json"
        },
      };

      let weather_list = document.createElement("ul"); //Creates an Unordered List and stores it inside the variable weather_list. But it is not displayed to the screen yet 
      weather_list.style.listStyle = "none"
      weather_list.style.padding = "0"
      let title = document.createElement("h2")

      title.innerHTML = cityName;
      weather_list.append(title)
      
      fetch(url) //fetches the API at the specified url.
      .then(response => response.json()) //converts the response into a readable JSON object and stores it inside the values variable
        .then(values => { 
        
              console.log("Today's Weather")
              console.log(values.DailyForecasts[0].Temperature.Minimum.Value)
              console.log(values.DailyForecasts[0].Temperature.Maximum.Value)
              let todaysHigh = values.DailyForecasts[0].Temperature.Maximum.Value
              let todaysLow = values.DailyForecasts[0].Temperature.Minimum.Value //Looks at the first index of DailyForecasts which will be "Today" and stores the Max and Min Temperature Values into TodaysHigh and TodaysLow
              todaysHigh = Math.round((todaysHigh - 32)*5/9) //Converting the Temperature into Celcius and rounds the value to the nearest integer
              todaysLow = Math.round((todaysLow - 32)*5/9)
           let title1 = document.createElement("h3")

            title1.innerHTML = "Today's Weather"
            weather_list.append(title1)
            let item = document.createElement("li"); //Creates a new List item and stores it inside item.
            item.innerHTML = "Min" + " " + todaysLow + " C" + "  :   " + "Max" + " " + todaysHigh + " C" //Sets the HTML inside item to a string displaying the High and Low Values
    
           weather_list.append(item) //adds item to the weather_list
           weather_list.classList.add("weatherList")
          console.log("5 Day Forecast")
            let title2 = document.createElement("h3")
           
            title2.innerHTML = "5 Day Forecast"
            weather_list.append(title2)
          values["DailyForecasts"].forEach(x => { //Loops each object inside the DailyForecasts. (At this point Today is also included)
               item = document.createElement("li"); //Creates a new list item inside the variable list
              console.log(x.Date)

              let testDate = new Date(x.Date) //Date Object
              
              let dateText = document.createElement("h4")
              dateText.innerHTML = testDate.toString().slice(0,16)
              weather_list.append(dateText)







              let temp = x.Temperature;
              let min = temp.Minimum //At each index the min and max values are stored into the appropriate variables
              let max = temp.Maximum
              let minCelcius = Math.round((min.Value - 32) * (5/9))
              let maxCelcius = Math.round((max.Value - 32) * (5/9))
              item.innerHTML = "Min" + " " + minCelcius + " C" + "  :   " + "Max" + " " + maxCelcius + " C"
              
              console.log("Min" + " " + minCelcius + " C")
    
              console.log("Max" + " " + maxCelcius + " C")
              weather_list.append(item) //At each index in the loop item is added to the list
          });
    
    
    
    
    
          document.querySelector(".weatherData").append(weather_list); //Appends the populated weather_list to the screen inside the section element of this component
          console.log(document.querySelector(".weatherData"))
          
      })
      .catch(err => {
      console.error(err)
    })
    };
  //Close Here  

    
    </script>

<div class = weatherData>

</div>
<button class = "dun">Dunedin</button>
<button class = "auck">Auckland</button>
<style>
  button{
    color:rgb(63, 58, 58);
    font-weight: bold;
    background-color: lightgrey;
  }
</style>