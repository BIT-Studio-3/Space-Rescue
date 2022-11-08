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
  <TidalStats lat={lat} long={long}/>
  <Weather exportKey={importKey}/>
  {/key}

  <!--each accordion is a dropdown section that will contain individual components-->
  <Accordion>
    <span slot="head">weather</span>
    <div slot="details">
      <p>
        These are the second details.
      </p>
      <p>
        This can naturally span multiple lines.
      </p>
    </div>
  </Accordion>

  <Accordion>
    <span slot="head">tide</span>
    <div slot="details">
      <p>
        These are the second details.
      </p>
      <p>
        This can naturally span multiple lines.
      </p>
    </div>
  </Accordion>

  <Accordion>
    <span slot="head">condition</span>
    <div slot="details">
      {#key temp}
        {importBeaches}
      {/key}
    </div>
  </Accordion>

</main>


<style>
  

</style>
