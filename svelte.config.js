import preprocess from 'svelte-preprocess';
import staticAdapter from '@sveltejs/adapter-static';
import Icons from 'unplugin-icons/vite';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	preprocess: preprocess({
		sass: true,
		scss: true
	}),
	kit: {
		target: '#svelte',
		adapter: staticAdapter({ fallback: 'index.html' }),
		vite: {
			plugins: [Icons({ compiler: 'svelte' })]
		}
	}
};

export default config;
