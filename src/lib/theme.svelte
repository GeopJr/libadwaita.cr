<script>
	import { onMount, afterUpdate } from 'svelte';
	import { theme } from '../stores';

	const key = 'theme';

	onMount(() => {
		if (matchMedia('(prefers-color-scheme: dark)')?.matches) {
			theme.set('dark');
		}
	});

	afterUpdate(() => {
		if ($theme !== 'dark') return;

		document.documentElement.setAttribute('theme', $theme);
		localStorage.setItem(key, $theme);
	});
</script>

<slot />
