<script>
  import Location from './lib/Location.svelte';
  import Weather from './lib/Weather.svelte'
  import TidalStats from './lib/TidalStats.svelte';

  let long
  let lat
  let importKey

 
  $: temp=lat
</script>

<main>
  <Location bind:latitude={lat} bind:longitude={long} bind:key={importKey}/>

  {#key temp}
  <TidalStats lat={lat} long={long}/>
  <Weather exportKey={importKey}/>
  {/key}

</main>

<style>
  

</style>
