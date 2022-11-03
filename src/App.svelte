<script>
  import Location from './lib/Location.svelte';
  let long
  let lat
  let key
 
  $: temp=lat
</script>

<main>
  <Location bind:latitude={lat} bind:longitude={long}/>
</main>

<style>
  
</style>
