<script>
  import Location from './lib/Location.svelte';
  import Weather from './lib/Weather.svelte'
  import TidalStats from './lib/TidalStats.svelte';

  let long
  let lat
  let key
 
  $: temp=lat
</script>

<main>
  <Location bind:latitude={lat} bind:longitude={long}/>

  {#key temp}
  <TidalStats lat={lat} long={long}/>
  <Weather key={key}/>
  {/key}

</main>

<style>
  

</style>
