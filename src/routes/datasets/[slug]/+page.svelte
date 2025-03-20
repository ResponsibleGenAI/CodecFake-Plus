<script lang="ts">
  import { onMount } from 'svelte';
  import { page } from '$app/stores';
  import { gsap } from 'gsap';
  import Navbar from '../../../components/Navbar.svelte';

  let dataset = {
    name: '',
    description: '',
    link: '',
    paper: '',
    authors: '',
  };

  $: page.subscribe(({ params }) => {
    const datasets = {
      'dataset-1': {
        name: 'Dataset 1',
        description: 'Detailed description of Dataset 1.',
        link: 'https://example.com/dataset-1',
        paper: 'https://arxiv.org/abs/dataset-1',
        authors: 'Author 1, Author 2',
      },
      'dataset-2': {
        name: 'Dataset 2',
        description: 'Detailed description of Dataset 2.',
        link: 'https://example.com/dataset-2',
        paper: 'https://arxiv.org/abs/dataset-2',
        authors: 'Author 3, Author 4',
      },
      'dataset-3': {
        name: 'Dataset 3',
        description: 'Detailed description of Dataset 3.',
        link: 'https://example.com/dataset-3',
        paper: 'https://arxiv.org/abs/dataset-3',
        authors: 'Author 5, Author 6',
      }
    };

    dataset = datasets[params.slug] || {};
  });

  onMount(() => {
    gsap.from('.dataset-detail', { opacity: 0, y: 50, duration: 1 });
  });
</script>

<Navbar />

<main class="container mx-auto p-4">
  <section class="dataset-detail bg-white p-6 rounded-lg shadow-md">
    <h1 class="text-3xl font-bold mb-4">{dataset.name}</h1>
    <p class="text-lg text-gray-700">{dataset.description}</p>
    <p class="mt-4"><strong>Authors:</strong> {dataset.authors}</p>
    <div class="mt-4">
      <a href={dataset.link} class="text-blue-500 hover:underline" target="_blank">Dataset Link</a> | 
      <a href={dataset.paper} class="text-blue-500 hover:underline" target="_blank">Related Paper</a>
    </div>
  </section>
</main>

