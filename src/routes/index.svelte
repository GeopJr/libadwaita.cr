<script>
	import Logo from '$lib/logo.svelte';
	import Window from '$lib/window.svelte';
	import Button from '$lib/button.svelte';
	import Live from '$lib/live.svelte';

	import GnomeLogo from '~icons/mdi/gnome';
	import CrystalLogo from '~icons/logos/crystal';
	import GitHubLogo from '~icons/logos/github-icon';
	import Heart from '~icons/mdi/heart';
</script>

<div class="hero center">
	<Window title="libadwaita.cr"
		><div class="center window_content">
			<Logo />
			<h1 class="title">
				<GnomeLogo class="icon" /> bindings for <CrystalLogo class="icon force-prefers-color" />
			</h1>
			<div class="actions">
				<Button href="/docs">Docs</Button>
				<Button ariaLabel="GitHub" href="https://github.com/GeopJr/libadwaita.cr" circle
					><GitHubLogo class="icon force-prefers-color" /></Button
				>
			</div>
			<p style="margin-top: 2rem;font-size:smaller;">
				* Includes: GTK4, libadwaita, cairo, pango, gio & more!
			</p>
		</div></Window
	>
</div>

<div class="floaty">
	<Window title="" minHeight="500px" minWidth="300px" />
</div>
<main>
	<div class="install center">
		<h1 class="header">Installation</h1>
		<h1 class="sub">Add the following inside your shard.yml...</h1>
		<pre><code><span style="color:#8ff0a4">dependencies</span>:
    <span style="color:#8ff0a4">libadwaita</span>:
        <span style="color:#8ff0a4">github</span>: <span style="color:#99c1f1">GeopJr/libadwaita.cr</span></code></pre>
		<h1 class="sub">... and run:</h1>
		<pre><code><span style="color:#ffbe6f">$</span> <span style="color:#f9f06b">shards install</span></code></pre>
	</div>

	<div class="floaty right">
		<Window title="" minHeight="800px" minWidth="300px" />
	</div>

	<div class="live center">
		<h1 class="header">Demo</h1>
		<Live />
	</div>
</main>
<div class="floaty">
	<Window title="" minHeight="250px" minWidth="300px" />
</div>

<div class="footer">
	<Window title="GNOME" minHeight="120px" minWidth="300px"
		><div class="center window_content"><GnomeLogo class="icon" /></div></Window
	>
	<Window title="Crystal" minHeight="120px" minWidth="300px"
		><div class="center window_content"><CrystalLogo class="icon force-prefers-color" /></div></Window
	>
	<Window title="<3" minHeight="120px" minWidth="300px"
		><div class="center window_content"><Heart class="icon" /></div></Window
	>
</div>

<footer>
	<p>
		GNOME and the related logo are trademarks of GNOME Foundation. We are not affiliated with,
		authorized by, sponsored by, or otherwise approved by GNOME Foundation.
	</p>
	<p>
		Crystal and the related logo are trademarks of Manas Technology Solutions. We are not affiliated
		with, authorized by, sponsored by, or otherwise approved by Manas Technology Solutions.
	</p>
	<p>Made with <Heart class="icon" /></p>
</footer>

<style lang="scss">
	footer {
		background-color: #26a269;
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 1rem;
		flex-direction: column;
		text-align: center;
		:global(.icon) {
			vertical-align: sub;
		}
	}
	.footer {
		display: flex;
		flex-direction: row;
		justify-content: space-around;
		align-items: center;
		flex-wrap: wrap;
		margin-top: 2rem;
		row-gap: 2rem;
		background-color: #26a269;
		padding: 5rem 0;
		:global(.icon) {
			font-size: 10em;
		}
	}
	.live {
		padding: 2rem 0;
		min-height: 50vh;
		width: 100vw;
		z-index: 10;
		position: relative;
		.header {
			margin-bottom: 2rem;
		}
	}
	.install {
		min-height: 50vh;
		background-color: #1a5fb4;
		* {
			position: relative;
			z-index: 10;
		}
	}
	.hero {
		height: 100vh;
		width: 100vw;
		position: relative;
		z-index: 10;
	}
	.center {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}
	.window_content {
		height: 100%;
		width: 100%;
		padding: 2rem;
		:global(.icon) {
			vertical-align: sub;
		}
	}
	.title {
		font-size: xx-large;
		vertical-align: middle;
		margin: 1rem 0;
		:global(.icon) {
			vertical-align: sub;
		}
	}
	.header {
		font-size: xx-large;
	}
	.sub {
		margin: 1rem 0;
		font-size: large;
	}
	.floaty {
		margin-left: -150px;
		position: absolute;
		margin-top: -150px;
		z-index: 0;
		&.right {
			margin-left: 0;
			margin-right: -150px;
			right: 0;
			margin-top: -150px;
		}
		@media only screen and (max-width: 600px) {
			display: none;
		}
	}
</style>
