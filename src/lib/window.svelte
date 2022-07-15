<script>
	// import Close from "~icons/mdi/close"
	export let title = 'window.cr';
	export let minHeight = '400px';
	export let minWidth = '600px';
</script>

<div class="window" style={`min-height:${minHeight};width:${minWidth};`}>
	<div class="header">
		{title}
		<!-- <div class="actions left">
            <Close />
        </div> -->
	</div>
	<div class="content">
		<slot />
	</div>
</div>

<style lang="scss">
	.window {
		background-color: var(--window-background);
		border-radius: 10px;
		box-shadow: 0 0 12px -5px black;
		border: 1px solid var(--window-border);
		display: flex;
		flex-direction: column;
		max-width: 100vw;
		max-height: 100vh;
		color: var(--window-text-color);
		.header {
			background-color: var(--window-header);
			height: 52px;
			border-radius: 10px 10px 0 0;
			border-bottom: 1px solid var(--window-header-border);
			display: flex;
			justify-content: center;
			align-items: center;
			user-select: none;
			font-weight: bold;
		}
		.content {
			height: 100%;
			width: 100%;
		}
	}
</style>
