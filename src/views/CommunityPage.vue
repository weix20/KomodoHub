<script lang="ts" setup>;
import Sidebar from "../components/Header/Sidebar.vue";
import BlogList from "../components/Header/BlogList.vue";
</script>

<template>
  <div class="relative bg-pink-50 min-h-screen">
    <!-- Sidebar overlaps but doesn't force layout filling -->
    <Sidebar />

    <!-- Main Content: scrollable, natural layout -->
    <div class="p-6">
      <BlogList />
    </div>
  </div>
</template>






