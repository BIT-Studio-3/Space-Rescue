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
		let Regions = [
			{"Beaches":[],"lat":"","lng":"","key":"","Name":"Northland"},
			{"Beaches":[],"lat":"-36.8500","lng":"174.7833","key":"252066","Name":"Auckland"},
			{"Beaches":[],"lat":"","lng":"","key":"","Name":"Northland"},
			{"Beaches":[],"lat":"","lng":"","key":"","Name":"Northland"},
			{"Beaches":[],"lat":"","lng":"","key":"","Name":"Northland"},
			{"Beaches":[],"lat":"","lng":"","key":"","Name":"Northland"},
			{"Beaches":[],"lat":"","lng":"","key":"","Name":"Northland"},
			{"Beaches":[],"lat":"","lng":"","key":"","Name":"Northland"},
			{"Beaches":[],"lat":"","lng":"","key":"","Name":"Northland"},
			{"Beaches":[],"lat":"-41.3","lng":"174.78","key":"","Name":"Wellington"},
			{"Beaches":[],"lat":"","lng":"","key":"","Name":"North Canterbury"},
			{"Beaches":[],"lat":"-45.88","lng":"170.50","key":"255042","Name":"Otago"},
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

