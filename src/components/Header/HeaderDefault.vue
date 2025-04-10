<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'HeaderDefault',
});
</script>

<template>
  <header class="text-white px-6 py-4 flex items-center gap-6">
    <h1 class="text-xl font-bold">Komodo Hub</h1>

    <!-- Navigation Links -->
    <nav class="flex gap-4 text-sm">
      <router-link to="/" class="hover:underline">Home</router-link>
      <router-link to="/help" class="hover:underline">Help & Contact</router-link>
    </nav>
  </header>
</template>

<style scoped>
header {
  background-color: #1A1537;
}
</style>
