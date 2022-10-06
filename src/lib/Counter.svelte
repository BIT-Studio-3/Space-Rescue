<script>
  let btn = document.querySelector("button")
  console.log(btn)
  let count = 0
  const increment = () => {
    count += 1
  }
</script>

<button on:click={increment}>
  count is {count}
</button>
