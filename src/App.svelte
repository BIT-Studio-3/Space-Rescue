<script>
  import svelteLogo from './assets/svelte.svg'
    import TidalStats from './lib/TidalStats.svelte';
  import Counter from './lib/TidalStats.svelte'
</script>

<main>
  <div class="appBlocks">
    <div class="block one"><TidalStats /></div>
    <div class="block two"></div>
    <div class="block three"></div>
    <div class="block four"></div>
  </div>
</main>

<style>
  .appBlocks {
    display: grid;
    gap: 20px;
    background-color: gray;

  }
  .block {
    width: 600px;
    height: 300px;
    border: 2px solid black;
  }
  .one {
    grid-column-start: 1;
    grid-column-end: 2;
    grid-row-start: 1;
    grid-row-end: 2;
    background-color: aquamarine;
    color: black;
  }
  .two {
    grid-column-start: 2;
    grid-column-end: 3;
    grid-row-start: 1;
    grid-row-end: 2;
    background-color: darkslategray;
  }
  .three {
    grid-column-start: 1;
    grid-column-end: 2;
    grid-row-start: 2;
    grid-row-end: 3;
    background-color: bisque;
  }
  .four {
    grid-column-start: 2;
    grid-column-end: 3;
    grid-row-start: 2;
    grid-row-end: 3;
    background-color: darkkhaki;
  }
</style>
