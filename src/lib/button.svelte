<script>
	export let href = '';
	export let circle = false;
	export let ariaLabel;

	$: external = !href.startsWith('/');
</script>

{#if href.length > 0}
	<a
		{href}
		class={`btn ${circle ? 'circle' : ''}`}
		target={external ? '_blank' : undefined}
		rel="external noopener"
		on:click
		aria-label={ariaLabel}
	>
		<slot />
	</a>
{:else}
	<button class={`btn ${circle ? 'circle' : ''}`} on:click>
		<slot />
	</button>
{/if}

<style lang="scss">
	button {
		border: unset;
	}
	.circle {
		padding: 0.6rem !important;
	}
	.btn {
		background-color: var(--button);
		padding: 0.65rem 1.5rem;
		border-radius: 9999px;
		font-weight: bold;
		font-size: medium;
		user-select: none;
		color: inherit;
		text-decoration: inherit;
		transition-duration: 200ms;
		&:hover {
			background-color: var(--button-hover);
			transition-duration: 200ms;
		}
		&:active {
			background-color: var(--button-focus);
			transition-duration: 200ms;
		}
	}
</style>
