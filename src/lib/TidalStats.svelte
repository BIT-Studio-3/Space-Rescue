<script>
  // Tidal Fetch API.
  
    const url = "https://api.niwa.co.nz/tides/data?lat=-45.875&long=170.509&numberOfDays=5&apikey=Zqq1PDtLanleKh2fMvYaDGU0FZAJokWJ";
  
    //Setting The Dates for the next 5 days.
    let today = new Date() 
  
    let day2 = new Date() 
  
    let day3 = new Date() 
  
    let day4 = new Date()
  
    let day5 = new Date()
  
  day2.setDate(today.getDate() + 1) //Tomorrow = today + 1;
  
  day3.setDate(today.getDate() + 2) 
  
  day4.setDate(today.getDate() + 3) 
  
  day5.setDate(today.getDate() + 4) 
  //Storing the dates into an array of 5 objects, 1 date per object
  let FiveDaysObj = 
  [
    {
    "date":today.toString().slice(0,16), //Setting the date to a string and removing the time.
    "tide":[]
    },
    {
    "date":day2.toString().slice(0,16),
    "tide":[]
    },	
    {
    "date":day3.toString().slice(0,16),
    "tide":[]
    },
    {
      "date":day4.toString().slice(0,16),
      "tide":[]
    },
    {
      "date":day5.toString().slice(0,16),
      "tide":[]
    },
  ]

    const fetchTides = (async () => {
      const response = await fetch(url)
      return await response.json()
    })()
    let dateGroup = (data) => {		
      let arr = data["values"]
        //console.log(time)
       for(let i = 0;i<5;i++){
         let arr = data["values"]
         FiveDaysObj[i].tide = arr.filter(x => new Date(x.time).toString().slice(0,16) == FiveDaysObj[i].date ) //All the tides that match date[i] are stored inside an array in the object 
       }
      console.log(FiveDaysObj)
      return ""
    }
  
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
  <div class = "tidedata">
    {#await fetchTides}  <!-- Await the fetchTides function -->
    <p>loading Tidal data...</p>
  
  {:then data}  <!-- Return the result as "data" -->
  {dateGroup(data)}
  <h3>5 day Tides</h3>
  
  <div class = "Week">
    {#each FiveDaysObj as info} <!--Reading in the array of objects with 5 dates and all the tides per day./-->
      <div>
      <h4>{info.date}</h4> <!--heading per day/-->
        <div>
          {#each info.tide as tidal} <!--reading inside the tide array of each day/-->
        <p>{convertTime(tidal.time)} {tidal.value}m</p>  <!--//spits out the time and the height/-->
        {/each}
        </div>
      </div>
    {/each}
  </div>

  {:catch error}  <!-- Catch any errors that occur -->
    <h2>A problem has occured...</h2>
  
  {/await}
  </div>
  
<style>
  .tidedata{
    text-align:center
  }
h4 {
  color: rgb(255, 255, 255);
}
.Week{
  display:flex;
  gap:5px;
  justify-content:center;
}
.Week > div{
  border:1px solid #ffffff;
  background-color: #474747;;
  padding: 2px;
  width:160px;
}
.Week > div div{
  display:grid;
  grid-template-columns:1fr 1fr;
}
</style>
