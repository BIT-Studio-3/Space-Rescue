<script>
// Tidal Fetch API.

  const url = "https://api.niwa.co.nz/tides/data?lat=-45.875&long=170.509&numberOfDays=5&apikey=Zqq1PDtLanleKh2fMvYaDGU0FZAJokWJ";

  const fetchTides = (async () => {
		const response = await fetch(url)
    return await response.json()
	})()

  const convertTime = ( (tide) => {
    let x = new Date(tide)

    let hrs = x.getHours();
    let min = (x.getMinutes()<10?'0':'') + (x.getMinutes());
    let AmOrPm = hrs >= 12 ? "pm" : "am";

    hrs = (hrs % 12) || 12;
    let finalTime = hrs + ":" + min + " " + AmOrPm;
    return finalTime
  })

</script>

{#await fetchTides}  <!-- Await the fetchTides function -->
  <p>loading Tidal data...</p>

{:then data}  <!-- Return the result as "data" -->
<ul>
  {#each data.values as tide}

  <li>{new Date(tide.time).toString().slice(0,16)}{convertTime(tide.time)} | Tide Height: {tide.value}</li> <!-- Cuts off any excess date time formatting to make it more readable-->
  {/each}

</ul>

{:catch error}  <!-- Catch any errors that occur -->
    <h2>A problem has occured...</h2>

{/await}



<style>
  li {
    text-align: left;
    font-weight: bold;
  }
  ul {
    display: grid;
    gap: 15px;
  }
  ul li {
    list-style: none;
  }
</style>
