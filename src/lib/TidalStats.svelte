<script>
// Tidal Fetch API.
export let lat=-45.880, long=170.500;

  const url = `https://api.niwa.co.nz/tides/data?lat=${lat}&long=${long}&numberOfDays=5&apikey=Zqq1PDtLanleKh2fMvYaDGU0FZAJokWJ`;
  const options = {
    method: "GET",
    headers: {
      "x-apikey": "Zqq1PDtLanleKh2fMvYaDGU0FZAJokWJ", //API Key, provided by Chase
      "Accept": "application/json"
    },
  };
  let tide_list = document.createElement("ul");

  fetch(url)
  .then(response => response.json())
    .then(values => {
    values["values"].forEach(tide => {
        let item = document.createElement("li");
        let data = document.createElement("li");
        let testDate = new Date(tide.time) //Date Object
        
        let hrs = testDate.getHours();
        let  min = testDate.getMinutes();
        let AmOrPm = hrs >= 12 ? "pm" : "am";
        hrs = (hrs % 12) || 12;
        let finalTime = "Time: " + hrs + ":" + min + " " + AmOrPm;

        data.innerHTML = tide.value;
        item.innerHTML = testDate.toString().slice(0,16) + finalTime + " Tide Height: " + tide.value + "m";
        testDate = new Date(tide.time) //Date Object
        console.log(testDate.toString()) //Converts to Local Time Zone

        console.log(tide.value);
        tide_list.append(item);
      
    });
    let title = document.createElement("h1");
    title.innerHTML = "Tidal Information: Dunedin";
    document.querySelector("body").append(title);
    document.querySelector("body").append(tide_list);

  })
  .catch(err => {
      console.error(err);
    });

</script>

<style>
    
</style>
