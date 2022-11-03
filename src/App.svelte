<script>
  import Weather from './lib/Weather.svelte'
  import TidalStats from './lib/TidalStats.svelte';
  import Location from './lib/Location.svelte';
  let long
  let lat
  let key
 
  $: temp=lat
</script>

<main>
  <Weather/>
  <TidalStats />
  <Location bind:latitude={lat} bind:longitude={long}/>
</main>

<style>
  

</style>
