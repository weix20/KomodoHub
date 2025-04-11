<template>
    <!-- Could add header here but causes issues with sidebar -->

    <div class="background min-h-screen flex items-center justify-center py-10">
    <div class="max-w-xl mx-auto space-y-8">
      <!-- Search bar -->
      <div class="relative">
        <input
          type="text"
          placeholder="Search (Animals, reports, studies)"
          class="w-full p-3 rounded-full bg-purple-500 text-white placeholder-white focus:outline-none pr-10"
        />
        <span class="absolute right-4 top-3 text-white text-lg pointer-events-none">🔍</span>
      </div>

      <!-- Sidebar -->
      <sidebar class=" flex-auto h-full   " />
  
      <!-- Add Post Button -->
      <div class="text-right">
        <button
          class="bg-purple-500 text-white px-4 py-2 rounded-full hover:bg-pink-500 transition"
          @click="addPost"
        >
          Add Post
        </button>
      </div>
  
      <!-- Posts -->
      <div v-for="(post, index) in posts" :key="index">
        <div
          class="bg-purple-500 p-6 rounded-2xl shadow cursor-pointer hover:bg-purple-200 transition hover:text-black"
          @click="handlePostClick(index)"
        >
          <h2 class="text-xl font-semibold mb-2">{{ post.title }}</h2>
          <p class="mb-4">{{ post.description }}</p>
          </div>
        </div>
    </div>
    </div>
</template>
  
<script lang="ts" setup>
  import { ref } from 'vue';
  import sidebar from '../components/Sidebar.vue';
  // import HeaderLoggedIn from '../components/Header/HeaderLoggedIn.vue';
  
  const posts = ref([
    {
      title: 'Blog Post',
      description:
        'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
    },
    {
      title: 'Blog Post',
      description:
        'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
    },
  ]);
  
  const addPost = () => {
    posts.value.push({
      title: 'New Blog Post',
      description: 'This is a newly added post. Edit me as needed!',
    });
  };
  
  const handlePostClick = (index: number) => {
    alert(`Clicked post ${index + 1}`);
  };
</script>

<style scoped>

.background {
  background-color: #1A1537;
  color: white;
}

</style>