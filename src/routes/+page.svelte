<script lang="ts">
	import { onMount } from 'svelte';
	import { gsap } from 'gsap';
	import Navbar from '../components/Navbar.svelte';

	interface Dataset {
		name: string;
		slug: string;
		description: string;
	}

	const datasets: Dataset[] = [
		{ name: 'Dataset 1', slug: 'dataset-1', description: 'A brief description of Dataset 1.' },
		{ name: 'Dataset 2', slug: 'dataset-2', description: 'A brief description of Dataset 2.' },
		{ name: 'Dataset 3', slug: 'dataset-3', description: 'A brief description of Dataset 3.' }
	];

	interface NewsItem {
		title: string;
		date: string;
		summary: string;
		link: string;
	}

	const news: NewsItem[] = [
		{
			title: 'News Item 1',
			date: 'March 15, 2025',
			summary: 'Summary of news item 1.',
			link: '/news/news-item-1'
		},
		{
			title: 'News Item 2',
			date: 'March 10, 2025',
			summary: 'Summary of news item 2.',
			link: '/news/news-item-2'
		}
	];

	onMount(() => {
		gsap.from('.banner', { opacity: 0, y: -50, duration: 1 });
		gsap.from('.organization-image', { opacity: 0, duration: 1, delay: 0.5 });
		gsap.from('.news-item', { opacity: 0, x: -50, duration: 1, stagger: 0.3 });
		gsap.from('.dataset-item', { opacity: 0, scale: 0.8, duration: 1, stagger: 0.3 });
	});
</script>

<Navbar />

<main class="container mx-auto p-4">
	<!-- Banner Section with Animation -->
	<section class="banner mb-8">
		<div class="rounded-lg bg-blue-500 p-8 text-center text-white shadow-md">
			<h1 class="mb-2 text-4xl font-bold">Welcome to Our Organization</h1>
			<p class="text-lg">Advancing research through open datasets.</p>
		</div>
	</section>

	<!-- Organization Image -->
	<section class="mb-8 text-center">
		<img
			src="https://servers.asus.com/upload/images/2023/04-25/1a09dc863f8e4dafb96b94813a763025.jpg"
			alt="Organization"
			class="organization-image mx-auto h-auto max-w-full rounded-lg shadow-md"
		/>
	</section>

	<!-- News Section -->
	<section class="mb-8">
		<h2 class="mb-4 text-2xl font-semibold">Latest News</h2>
		<div class="space-y-4">
			{#each news as item}
				<div class="news-item rounded-lg border p-4 shadow-sm transition-shadow hover:shadow-md">
					<h3 class="text-xl font-bold">
						<a href={item.link} class="text-blue-500 hover:underline">{item.title}</a>
					</h3>
					<p class="text-sm text-gray-500">{item.date}</p>
					<p class="text-gray-700">{item.summary}</p>
				</div>
			{/each}
		</div>
	</section>

	<!-- Datasets Section -->
	<section class="mb-8">
		<h2 class="mb-4 text-2xl font-semibold">Our Datasets</h2>
		<div class="grid gap-6 md:grid-cols-3">
			{#each datasets as dataset}
				<div
					class="dataset-item transform rounded-lg bg-white p-6 shadow-md transition-shadow duration-300 hover:-translate-y-1 hover:shadow-xl"
				>
					<h3 class="mb-2 text-xl font-bold">
						<a href={`/datasets/${dataset.slug}`} class="text-blue-500 hover:underline">
							{dataset.name}
						</a>
					</h3>
					<p class="mb-4 text-gray-700">{dataset.description}</p>
					<div class="flex space-x-4 text-sm">
						<a href={dataset.link} class="text-blue-500 hover:underline" target="_blank">Dataset</a>
						<a href={dataset.paper} class="text-blue-500 hover:underline" target="_blank">Paper</a>
					</div>
				</div>
			{/each}
		</div>
	</section>
</main>
