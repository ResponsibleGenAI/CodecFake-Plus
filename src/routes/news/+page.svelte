<script lang="ts">
  import { base } from '$app/paths';
  import { onMount } from 'svelte';
  import { gsap } from 'gsap';
  import Navbar from '../../components/Navbar.svelte';

  interface NewsItem {
    title: string;
    date: string;
    summary: string;
    link: string;
  }

  const news: NewsItem[] = [
    { title: 'News Item 1', date: 'March 15, 2025', summary: 'Summary of news item 1.', link: 'news' },
    { title: 'News Item 2', date: 'March 10, 2025', summary: 'Summary of news item 2.', link: 'news' },
  ];

  onMount(() => {
    gsap.from('.news-item', { opacity: 0, x: -50, duration: 1, stagger: 0.3 });
  });
</script>

<Navbar />

<main class="container mx-auto p-4">
  <h1 class="text-3xl font-bold mb-6">Latest News</h1>
  <div class="space-y-4">
    {#each news as item}
      <div class="news-item p-4 border rounded-lg shadow-sm hover:shadow-md transition-shadow">
        <h3 class="text-xl font-bold">
          <a href='{base}/{item.link}' class="text-blue-500 hover:underline">{item.title}</a>
        </h3>
        <p class="text-sm text-gray-500">{item.date}</p>
        <p class="text-gray-700">{item.summary}</p>
      </div>
    {/each}
  </div>
</main>
