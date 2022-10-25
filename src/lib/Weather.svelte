
<script>
    
    import locationData from '../assets/locationData.json' 
    //Will be adapted to change the locationKey 
    const url =`https://dataservice.accuweather.com/forecasts/v1/daily/5day/255042?apikey=H1lM7nG32DTJNGY59xxEOiEdpvAkplAR`; //Link to the API raw Data. Specifies a 5 day forecast , a special location key: at this point it is in Dunedin and an API key.
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

  <ul>
    {#await fetchWeather} <!--Calls the fetchWeather function and waits until the data is finished reading-->
    <p>Loading Data...</p> <!--While the data is loading-->
    {:then data}
    <h2>Dunedin</h2> <!--Change the header when the city changes-->
    <h3>5 day forecast</h3>
      {#each data.DailyForecasts as weather } <!--Loop through the data and display each data and the temperatures-->
        <h4>{new Date(weather.Date).toString().slice(0,16)}</h4>
        <p>Max:{Math.round((weather.Temperature.Maximum.Value -32) * (5/9))} Min:{Math.round((weather.Temperature.Minimum.Value -32) * (5/9))}</p>
      
        

      {/each}
    {/await}
  </ul>

</div>

<style>
  .weatherData{
    text-align: center;
  }



h4 {
  color: rgb(94, 89, 89);


}
</style>