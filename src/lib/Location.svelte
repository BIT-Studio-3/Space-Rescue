<script>	
		export let latitude='-35.109'
    export let longitude='173.259'
    export let key='249763'
    export let beaches=["Paengarēhia / Twilight Beach", " Tapotupotu Beach", " Te Werahi Beach", " Pandora Beach", " Ninety Mile Beach", " Rarawa Beach", " Rangiputa Beach", " Colteri Beach", " Henderson Bay Beach"]
    let selection
		let selectionName

		
		function myFunction(selection){
			console.log(selection.lat)
			selectionName = selection.Name
      latitude = selection.lat
      longitude = selection.lng
      key = selection.key
      beaches = selection.Beaches
      console.log (beaches)
		}
		let Regions = [                                                                               //Co-ordinates represent:
			{"Beaches":["Paengarēhia / Twilight Beach", " Tapotupotu Beach", " Te Werahi Beach", " Pandora Beach", " Ninety Mile Beach", " Rarawa Beach", " Rangiputa Beach", " Colteri Beach", " Henderson Bay Beach"],"lat":"-35.109","lng":"173.259","key":"249763","Name":"Northland"},           //Kaitaia
			{"Beaches":["Tāwharanui Peninsula"," Pakiri Beach"," Orewa Beach"," Pohutukawa Coast"," Muriwai Beach"," Piha Beach"," Karioitahi Beach"," Te Henga / Bethells Beach"," Karekare Beach"," Awhitu Peninsula"],"lat":"-36.850","lng":"174.783","key":"252066","Name":"Auckland"},            //Auckland City
			{"Beaches":[],"lat":"-37.780","lng":"175.250","key":"256406","Name":"Waikato"},             //Hamilton           
			{"Beaches":[],"lat":"-37.959","lng":"176.982","key":"246986","Name":"Bay of Plenty"},       //Whakatane
			{"Beaches":[],"lat":"-38.664","lng":"178.023","key":"248308","Name":"Gisbourne"},           //Gisbourne City
			{"Beaches":[],"lat":"-39.057","lng":"174.079","key":"250435","Name":"Taranaki"},            //New Plymouth
			{"Beaches":[],"lat":"-39.933","lng":"175.029","key":"250818","Name":"Manawatu-Whanganui"},  //Whanganui
			{"Beaches":[],"lat":"-39.510","lng":"176.876","key":"248572","Name":"Hawke's Bay"},         //Napier
			{"Beaches":["Oriental Bay"," Scorching Bay"," Lyall Bay"," Makara Beach"," Days Bay"," Eastbourne Beach"," Petone Foreshore"," Breaker Bay"," Princess Bay"," Plimmerton Beach"],"lat":"-41.300","lng":"174.780","key":"250938","Name":"Wellington"},          //Wellington City
      {"Beaches":[],"lat":"-41.108","lng":"173.011","key":"250497","Name":"Tasman"},              //Motueka
      {"Beaches":[],"lat":"-41.299","lng":"173.244","key":"249048","Name":"Nelson"},              //Nelson City
      {"Beaches":[],"lat":"-41.513","lng":"173.960","key":"248982","Name":"Marlborough"},         //Blenheim
      {"Beaches":[],"lat":"-41.755","lng":"171.606","key":"251085","Name":"Northern West Coast"}, //Westport
      {"Beaches":[],"lat":"-43.860","lng":"169.046","key":"251089","Name":"Southern West Coast"}, //Haast
			{"Beaches":[],"lat":"-42.340","lng":"173.680","key":"247053","Name":"North Canterbury"},    //Kaikoura
      {"Beaches":["Sumner Beach"," New Brighton Beach"," Corsair Bay"," Waimairi Beach"," Woodend Beach"],"lat":"-43.532","lng":"172.631","key":"252473","Name":"Christchurch"},        //Christchurch City
      {"Beaches":[],"lat":"-44.390","lng":"171.237","key":"247033","Name":"South Canterbury"},    //Timaru
			{"Beaches":["Bushy Beach"," Aramoana Beach"," Purakaunui Bay"," St Clair"," Karitane Beach"," Kaka Point"," Warrington Beach"," Waikouaiti Beach"," Allans Beach"," Papatowai Beach"],"lat":"-45.880","lng":"170.500","key":"255042","Name":"Otago"},               //Dunedin
      {"Beaches":[],"lat":"-46.418","lng":"168.361","key":"250343","Name":"Southland"},           //Invercargill
      {"Beaches":[],"lat":"-46.898","lng":"168.128","key":"3590175","Name":"Stewart Island"},     //Oban (Stewart Island)
		]
		
</script>

<div1>
<select bind:value = {selection} on:change = {myFunction(selection)}>
    {#each Regions as location}
        <option value = {location}>
            {location.Name}					
        </option>			
    {/each}    
</select>	
</div1>

<style>
select{
  text-align: center;
  width: 350px;
  font-size: 30px;
  margin-left: auto ;
  margin-right: auto ;
}
div1{
  display: flex;
  flex-direction:column;
  gap: 10px;
  justify-content: center;
  margin-left: auto ;
  margin-right: auto ;
}
</style>

