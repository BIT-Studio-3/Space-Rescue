
<script>

  export let exportKey;
    
  //Will be adapted to change the locationKey 
  const url =`https://dataservice.accuweather.com/forecasts/v1/daily/5day/${exportKey}?apikey=H1lM7nG32DTJNGY59xxEOiEdpvAkplAR`; //Link to the API raw Data. Specifies a 5 day forecast , a special location key: at this point it is in Dunedin and an API key.
    const options = {
      method: "GET",
      headers: { 
        "x-apikey": "H1lM7nG32DTJNGY59xxEOiEdpvAkplAR",
        "Accept": "application/json"
      }
    }
  // Tidal Fetch API. Example Structure.
  
  const fetchWeather = (async () => {
      const res = await fetch(url)
      const data = await res.json()
      return await data

  })()

  

  
  </script>

<div class = weatherData>


  {#await fetchWeather} <!--Calls the fetchWeather function and waits until the data is finished reading-->
  <p>Loading Data...</p> <!--While the data is loading-->
  {:then data}
  <h3>5 day forecast</h3>
  <div class = "Week">
  {#each data.DailyForecasts as weather } <!--Loop through the data and display each data and the temperatures-->
    <div>
    <h4>{new Date(weather.Date).toString().slice(0,16)}</h4>
    <p>Max:{Math.round((weather.Temperature.Maximum.Value -32) * (5/9))}°C Min:{Math.round((weather.Temperature.Minimum.Value -32) * (5/9))}°C</p>
    <p>Brief Description</p>
    </div>
    
    
  {/each}
  </div>
  
  {/await}

</div>



<style>
.weatherData{
  text-align: center;
}





h4 {
color: #000000;


}
.Week{
display:flex;
gap:5px;
justify-content:center;

}
@media (prefers-color-scheme: dark) {
  h4 {
    color:rgb(255, 255, 255)
  }
  
.Week > div{
  border:1px solid #ffffff;
  background-color: #474747;;
  padding: 2px;
  width:160px;
}
}

@media (prefers-color-scheme: light) {
  h4 {
    color:rgb(0, 0, 0)
  }
.Week > div{
  border:1px solid #000000;
  background-color: #cacaca;
  padding: 2px;
  width:160px;
}
}

</style>