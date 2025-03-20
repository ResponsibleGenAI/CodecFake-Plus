<script lang="ts">
  import { onMount } from 'svelte';
  import { writable } from 'svelte/store';
  import { gsap } from 'gsap';

  const showMenu = writable(false);

  function toggleMenu() {
    showMenu.update(value => !value);
  }

  onMount(() => {
    gsap.from('nav', { opacity: 0, y: -50, duration: 1 });
  });
</script>

<nav class="bg-gray-800 p-4">
  <div class="container mx-auto flex justify-between items-center">
    <a href="/" class="text-white text-2xl font-bold">Organization Name</a>
    <button class="text-white md:hidden" on:click={toggleMenu}>
      <!-- Hamburger Icon -->
      <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
      </svg>
    </button>
    <ul class="hidden md:flex space-x-4">
      <li><a href="/" class="text-gray-300 hover:text-white">Home</a></li>
      <li><a href="/about" class="text-gray-300 hover:text-white">About</a></li>
      <li><a href="/datasets" class="text-gray-300 hover:text-white">Datasets</a></li>
      <li><a href="/news" class="text-gray-300 hover:text-white">News</a></li>
      <li><a href="/contact" class="text-gray-300 hover:text-white">Contact</a></li>
    </ul>
  </div>
  {#if $showMenu}
    <ul class="md:hidden mt-2">
      <li><a href="/" class="block text-gray-300 hover:text-white p-2">Home</a></li>
      <li><a href="/about" class="block text-gray-300 hover:text-white p-2">About</a></li>
      <li><a href="/datasets" class="block text-gray-300 hover:text-white p-2">Datasets</a></li>
      <li><a href="/news" class="block text-gray-300 hover:text-white p-2">News</a></li>
      <li><a href="/contact" class="block text-gray-300 hover:text-white p-2">Contact</a></li>
    </ul>
  {/if}
</nav>

