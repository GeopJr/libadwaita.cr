<script>
	import Window from '$lib/window.svelte';
	import Button from '$lib/button.svelte';

	let title = 'Hello World!';
	let count = 0;

	async function rotateTitle() {
		const delay = (ms) => new Promise((res) => setTimeout(res, ms));
		const titles = ['Crystal + GTK = <3', 'Support GNOME!', 'my_cool_app.cr', 'Hello World!'];
		const typeSpeed = 200;
		let i = 0;
		while (true) {
			await delay(1500);
			while (title.length > 0) {
				title = title.slice(0, -1);
				await delay(typeSpeed);
			}
			let currentTitle = titles[i % titles.length];
			for (let j = 0; j < currentTitle.length; j++) {
				title += currentTitle[j];
				await delay(typeSpeed);
			}
			i++;
		}
	}
	rotateTitle();
</script>

<div class="main">
	<div class="code">
		<pre><code><span class="cyan">require</span> <span class="green">"libadwaita"</span>

<span class="red">app</span> <span class="blue">=</span> <span class="yellow">Adw</span>::<span class="yellow">Application</span>.<span class="cyan">new</span><span class="yellow">(</span><span class="green">"hello.example.com"</span>, <span class="yellow">Gio</span>::<span class="yellow">ApplicationFlags</span>::<span class="yellow">None</span><span class="yellow">)</span>
<span class="red">count</span> <span class="blue">=</span> <span class="orange">0</span>

<span class="red">app</span>.<span class="red">activate_signal</span>.connect <span class="purple">do</span>
  <span class="red">window</span> <span class="blue">=</span> <span class="yellow">Adw</span>::<span class="yellow">ApplicationWindow</span>.<span class="cyan">new</span><span class="yellow">(</span><span class="red">app</span><span class="yellow">)</span>
  <span class="red">window</span>.<span class="red">title</span> <span class="blue">=</span> <span class="green">"{title}"</span>
  <span class="red">window</span>.<span class="cyan">set_default_size</span><span class="yellow">(</span><span class="orange">200</span>, <span class="orange">200</span><span class="yellow">)</span>

  <span class="red">root</span> <span class="blue">=</span> <span class="yellow">Gtk</span>::<span class="yellow">Box</span>.<span class="cyan">new</span><span class="yellow">(</span><span class="yellow">Gtk</span>::<span class="yellow">Orientation</span>::<span class="yellow">Vertical</span>, <span class="orange">0</span><span class="yellow">)</span>
  <span class="red">header</span> <span class="blue">=</span> <span class="yellow">Adw</span>::<span class="yellow">HeaderBar</span>.new
  <span class="red">label</span> <span class="blue">=</span> <span class="yellow">Gtk</span>::<span class="yellow">Label</span>.new
  <span class="red">box</span> <span class="blue">=</span> <span class="yellow">Gtk</span>::<span class="yellow">Box</span>.<span class="cyan">new</span><span class="yellow">(</span><span class="yellow">Gtk</span>::<span class="yellow">Orientation</span>::<span class="yellow">Vertical</span>, <span class="orange">0</span><span class="yellow">)</span>

  <span class="red">box</span>.<span class="red">halign</span> <span class="blue">=</span> <span class="yellow">Gtk</span>::<span class="yellow">Align</span>::<span class="yellow">Center</span>
  <span class="red">box</span>.<span class="red">valign</span> <span class="blue">=</span> <span class="yellow">Gtk</span>::<span class="yellow">Align</span>::<span class="yellow">Center</span>
  <span class="red">box</span>.<span class="red">hexpand</span> <span class="blue">=</span> <span class="orange">true</span>
  <span class="red">box</span>.<span class="red">vexpand</span> <span class="blue">=</span> <span class="orange">true</span>

  <span class="red">label</span>.<span class="red">text</span> <span class="blue">=</span> <span class="cyan">gen_msg</span><span class="yellow">(</span><span class="orange">0</span><span class="yellow">)</span>

  <span class="red">button</span> <span class="blue">=</span> <span class="yellow">Gtk</span>::<span class="yellow">Button</span>.<span class="cyan">new_with_label</span><span class="yellow">(</span><span class="green">"Click me!"</span><span class="yellow">)</span>
  <span class="red">button</span>.<span class="red">css_classes</span> <span class="blue">=</span> <span class="red">button</span>.<span class="red">css_classes</span> <span class="cyan">&lt;&lt;</span> <span class="green">"pill"</span>
  <span class="red">button</span>.<span class="red">clicked_signal</span>.connect <span class="purple">do</span>
    <span class="red">count</span> <span class="blue">+=</span> <span class="orange">1</span>
    <span class="red">label</span>.<span class="red">text</span> <span class="blue">=</span> <span class="cyan">gen_msg</span><span class="yellow">(</span><span class="red">count</span><span class="yellow">)</span>
  <span class="purple">end</span>

  <span class="red">box</span>.<span class="cyan">append</span><span class="yellow">(</span><span class="red">label</span><span class="yellow">)</span>
  <span class="red">box</span>.<span class="cyan">append</span><span class="yellow">(</span><span class="red">button</span><span class="yellow">)</span>

  <span class="red">root</span>.<span class="cyan">append</span><span class="yellow">(</span><span class="red">header</span><span class="yellow">)</span>
  <span class="red">root</span>.<span class="cyan">append</span><span class="yellow">(</span><span class="red">box</span><span class="yellow">)</span>

  <span class="red">window</span>.<span class="red">content</span> <span class="blue">=</span> root
  <span class="red">window</span>.present
<span class="purple">end</span>

<span class="purple">def</span> <span class="cyan">gen_msg</span><span class="yellow">(</span>amount : <span class="yellow">Int32</span><span class="yellow">)</span> : <span class="yellow">String</span>
  <span class="green">"You clicked me</span> <span class="purple">#</span><span class="yellow">{'{'}</span><span class="red">amount</span><span class="yellow">{'}'}</span> <span class="green">times!"</span>
<span class="purple">end</span>

<span class="blue">exit</span><span class="yellow">(</span><span class="red">app</span>.<span class="cyan">run</span><span class="purple">(</span><span class="yellow">ARGV</span><span class="purple">)</span><span class="yellow">)</span></code></pre>
	</div>
	<div class="window">
		<Window {title} minHeight="300px" minWidth="300px">
			<div class="window_content">
				<p>You clicked me {count} times!</p>
				<Button on:click={() => (count = count + 1)}>Click me!</Button>
			</div>
		</Window>
	</div>
</div>

<style lang="scss">
	.main {
		display: flex;
		align-items: center;
		justify-content: space-around;
		width: 100vw;
        flex-wrap: wrap;
        row-gap: 2rem;
		.window_content {
			display: flex;
			width: 100%;
			height: 248px;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}
		.orange {
			color: #ffbe6f;
		}
		.yellow {
			color: #f9f06b;
		}
		.cyan {
			color: #99c1f1;
		}
		.green {
			color: #8ff0a4;
		}
		.red {
			color: #f66151;
		}
		.purple {
			color: #dc8add;
		}
		.blue {
			color: #62a0ea;
		}
	}
</style>
