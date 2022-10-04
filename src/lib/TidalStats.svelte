<script>
// Tidal Fetch API.

  const url = "https://api.niwa.co.nz/tides/data?lat=-45.875&long=170.509&numberOfDays=7&apikey=Zqq1PDtLanleKh2fMvYaDGU0FZAJokWJ";
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
        let date = document.createElement("li");
        let data = document.createElement("li");
        date.innerHTML = tide.time;
        data.innerHTML = tide.value;
        item.innerHTML = "Date/Time: " + tide.time + " Tide Height: " + tide.value + "m";
        let testDate = new Date(tide.time) //Date Object
        console.log(testDate.toString()) //Converts to Local Time Zone

        console.log(tide.value)
        tide_list.append(item);
      
    });
    document.querySelector("body").append(tide_list);

  })
  .catch(err => {
      console.error(err);
    });

</script>

<style>
    
</style>
