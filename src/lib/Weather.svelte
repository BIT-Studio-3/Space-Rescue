
<script>
    import { loop_guard } from 'svelte/internal';

    
    import locationData from '../assets/locationData.json' 
    //Will be adapted to change the locationKey 
	let promise = Promise.resolve([]);
  let data;
    let currentCity = "Dunedin"
	  let currentKey = "255042"
	 async function handleClick(cityName,cityKey) {
		currentCity = cityName
		currentKey = cityKey
    data = await fetchWeather()
    return await data

	}
    const options = {
        method: "GET",
        headers: { 
          "x-apikey": "H1lM7nG32DTJNGY59xxEOiEdpvAkplAR",
          "Accept": "application/json"
        }
      }
    // Tidal Fetch API. Example Structure.

    async function fetchWeather() {
      const url =`https://dataservice.accuweather.com/forecasts/v1/daily/5day/${currentKey}?apikey=H1lM7nG32DTJNGY59xxEOiEdpvAkplAR`; //Link to the API raw Data. Specifies a 5 day forecast , a special location key: at this point it is in Dunedin and an API key.
      console.log(currentKey)  
      const res = await fetch(url)
        const data = await res.json()
        
        return await data

    }

    

    
    </script>

<div class = weatherData>

  <ul>
    <!--{#await fetchWeather} --> <!--Calls the fetchWeather function and waits until the data is finished reading-->
    <!-- <p>Loading Data...</p> --> <!--While the data is loading -->
    <!--{:then data}-->
    {#if data != undefined}
    <h2>{currentCity}</h2> <!--Change the header when the city changes-->

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
    {:else} Please Choose City
      
    
    {/if}

    
    <!-- {/await} -->
  </ul>

</div>
  <button on:click={ () => handleClick("Dunedin","255042")}>
    Dunedin
  </button>
  
  <button on:click={() =>  handleClick("Auckland","252066")}>
    Auckland
  </button>

<style>
  .weatherData{
    text-align: center;
  }





h4 {
  color: rgb(94, 89, 89);


}
.Week{
  display:flex;
  gap:5px;
  
}
.Week div{
  border:1px solid #a4a4a4;
  background-color: #f1f1f1;;
  padding: 2px;
  width:148px
}

</style>