<!-- <script>

</script>

<select id="location">
    <option value="">Select Location</option>
    <optgroup label="North Island">
     <option>Auckland</option>
     <option>Hamilton</option>
    </optgroup>
    <optgroup label="South Island">
      <option>Dunedin</option>
  </select>

<style>

</style> -->

<script>
	import ReadThings from './readThings.svelte'
// 		//These are the regions for the top dropdown box
//     let yes = ["Northland","Auckland", "Waikato", "Bay of Plenty", "Gisbourne", "Hawke's Bay", "Taranaki", "Whanganui", "Manawatu", "Wairarapa", "Wellington", "Nelson Bays", "Marlborough", "West Coast", "Canterbury", "Timaru - Oamaru", "Otago", "Southland"];
// 		//These are the arrays for the individual beaches within each region
// 		let Northland = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let Auckland = {"Beaches":[],"lat":"-36.8500","lng":"174.7833","key":"252066"}
// 		let Waikato = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let BayOfPlenty = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let Gisbourne = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let HawkesBay = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let Taranaki = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let Whanganui = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let Manawatu = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let Wairarapa = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let Wellington = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let NelsonBays = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let Marlborough = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let WestCoast = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let Canterbury = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let TimaruOamaru = {"Beaches":[],"lat":"","lng":"","key":""}
// 		let Otago = {"Beaches":[],"lat":"-45.88","lng":"170.50","key":"255042"}
// 		let Southland = {"Beaches":[],"lat":"","lng":"","key":""}
		
		let selection
		let selectionName
		
		function myFunction(selection){
			console.log(selection)
			selectionName = selection.Name
		}
		let Regions = [                                                                         //Co-ordinates represent:
			{"Beaches":[],"lat":"-35.109","lng":"173.259","key":"","Name":"Northland"},           //Kaitaia
			{"Beaches":[],"lat":"-36.850","lng":"174.783","key":"252066","Name":"Auckland"},      //Auckland City
			{"Beaches":[],"lat":"-37.780","lng":"175.250","key":"","Name":"Waikato"},             //Hamilton           
			{"Beaches":[],"lat":"-37.959","lng":"176.982","key":"","Name":"Bay of Plenty"},       //Whakatane
			{"Beaches":[],"lat":"-38.664","lng":"178.023","key":"","Name":"Gisbourne"},           //Gisbourne City
			{"Beaches":[],"lat":"-39.057","lng":"174.079","key":"","Name":"Taranaki"},            //New Plymouth
			{"Beaches":[],"lat":"-39.933","lng":"175.029","key":"","Name":"Manawatu-Whanganui"},  //Whanganui
			{"Beaches":[],"lat":"-39.510","lng":"176.876","key":"","Name":"Hawke's Bay"},         //Napier
			{"Beaches":[],"lat":"-41.300","lng":"174.780","key":"","Name":"Wellington"},          //Wellington City
      {"Beaches":[],"lat":"-14.108","lng":"173.011","key":"","Name":"Tasman"},              //Motueka
      {"Beaches":[],"lat":"-41.299","lng":"173.244","key":"","Name":"Nelson"},              //Nelson City
      {"Beaches":[],"lat":"-41.513","lng":"173.960","key":"","Name":"Marlborough"},         //Blenheim
      {"Beaches":[],"lat":"-41.755","lng":"171.606","key":"","Name":"Northern West Coast"}, //Westport
      {"Beaches":[],"lat":"-43.860","lng":"169.046","key":"","Name":"Southern West Coast"}, //Haast
			{"Beaches":[],"lat":"-42.340","lng":"173.680","key":"","Name":"North Canterbury"},    //Kaikoura
      {"Beaches":[],"lat":"-43.532","lng":"172.631","key":"","Name":"Christchurch"},        //Christchurch City
      {"Beaches":[],"lat":"-44.390","lng":"171.237","key":"","Name":"South Canterbury"},    //Timaru
			{"Beaches":[],"lat":"-45.880","lng":"170.500","key":"255042","Name":"Otago"},         //Dunedin
      {"Beaches":[],"lat":"-46.418","lng":"168.361","key":"","Name":"Southland"},           //Invercargill
      {"Beaches":[],"lat":"-46.898","lng":"168.128","key":"","Name":"Stewart Island"},      //Oban (Stewart Island)
		]
		
</script>

<div1>
<select bind:value = {selection} on:change = {myFunction(selection)}>
	<option>Select Region</option>
    {#each Regions as location}
        <option value = {location}>
            {location.Name}					
        </option>			
    {/each}    
</select>

<ReadThings something = {selectionName}/>

	
</div1>

<style>
select{
  text-align: center;
  width: 300px;
  font-size: 30px;
  margin-left: auto ;
  margin-right: auto ;
}
div1{
    display: flex;
  flex-direction:column;
  gap: 10px;
  justify-content: center;
    }
</style>

