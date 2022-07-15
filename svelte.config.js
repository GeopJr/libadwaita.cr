import preprocess from 'svelte-preprocess';
import staticAdapter from '@sveltejs/adapter-static';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	preprocess: preprocess({
		sass: true,
		scss: true
	}),
	kit: {
		adapter: staticAdapter({ fallback: 'index.html' }),
	}
};

export default config;
