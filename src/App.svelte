<script>
  import Accordion from './lib/Accordion.svelte'
</script>

<main>
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
      <p>
        These are the second details.
      </p>
      <p>
        This can naturally span multiple lines.
      </p>
    </div>
  </Accordion>
</main>

<style>
 
</style>
