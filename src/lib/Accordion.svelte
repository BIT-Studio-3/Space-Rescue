<script>
	export let open = false;
	  import { slide } from 'svelte/transition';
	  const handleClick = () => open = !open //handleclick is a toggleable variable
  </script>
  
  <div class="accordion">
	  <div class="header">
		  <div class="text">
			  <slot name="head"></slot>	
		  </div>
		  <!--when button is clicked toggle accordion to be open or closed-->
		  <button on:click={handleClick} >
			  +/-
		  </button>
	  </div>
	  
	  {#if open}
	  <div class="details" transition:slide> <!--accordion has a sliding animation when toggled-->
		  <slot name="details">
		  </slot>
	  </div>
	  {/if}
  </div>
  
  <style>
	  div.accordion {
		width: 500px;
		margin: 1rem auto;
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

