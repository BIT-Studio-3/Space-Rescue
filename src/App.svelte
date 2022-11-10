<script>
  import Location from './lib/Location.svelte';
  import Weather from './lib/Weather.svelte'
  import TidalStats from './lib/TidalStats.svelte';
  import Accordion from './lib/Accordion.svelte'

  let long
  let lat
  let importKey
  let importBeaches

 
  $: temp=lat
</script>

<main>
  <Location bind:latitude={lat} bind:longitude={long} bind:key={importKey} bind:beaches={importBeaches}/>

  {#key temp}
  
  
  

  <!--each accordion is a dropdown section that will contain individual components-->
  <Accordion>
    <span slot="head">Weather</span>
    <div slot="details">
      <Weather exportKey={importKey}/>
    </div>
  </Accordion>

  <Accordion>
    <span slot="head">Tides</span>
    <div slot="details">
      <TidalStats lat={lat} long={long}/>
    </div>
  </Accordion>

  <Accordion>
    <span slot="head">Beaches</span>
    <div slot="details">
      {#key temp}
        {importBeaches}
      {/key}
    </div>
  </Accordion>
  {/key}
</main>


<style>
  

</style>
