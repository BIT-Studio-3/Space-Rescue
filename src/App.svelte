<script>
  import Location from './lib/Location.svelte';
  import Shell from './lib/TidalStats.svelte'
  let long
  let lat
  let city
  let key
  let unique = [{}]

  $: temp=lat

  function restart() {
    unique = [{}]
  }
</script>

<main>
  <Location bind:latitude={lat} bind:longitude={long} on:change={restart}/>
  <p>
    {lat}, {long}
  </p>
  {#each unique as key (key)}
  <Shell lat={lat} long={long}/>
  {/each}
</main>

<style>
  
</style>
