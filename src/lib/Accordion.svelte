<script>
	export let open = false;
	  import { slide } from 'svelte/transition';
	  const handleClick = () => open = !open
  </script>
  
  <div class="accordion">
	  <div class="header">
		  <div class="text">
			  <slot name="head"></slot>	
		  </div>
		  
		  <button on:click={handleClick} >
			  +/-
		  </button>
	  </div>
	  
	  {#if open}
	  <div class="details" transition:slide>
		  <slot name="details">
		  </slot>
	  </div>
	  {/if}
  </div>
  
  <style>
	  div.accordion {
		  margin: 1rem 0;
	  }
	  
	  div.header {
		  display:flex;
		  width:100%;
	  }
	  
	  div.header .text {
		  flex: 1;
		  margin-right: 5px;
	  }
	  
	  div.details {
		  background-color: #cecece;
		  padding:1rem;
	  }
  </style>

