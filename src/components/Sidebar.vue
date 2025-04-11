<template>
    <div
      :class="[
        'fixed top-0 left-0 h-screen bg-purple-500 shadow-lg z-50 transition-all duration-300 ease-in-out flex flex-col justify-between py-4',
        expanded ? 'w-52 px-4' : 'w-16 px-2'
      ]"
    >
      <!-- Top: Menu Items -->
      <div class="flex flex-col items-center gap-4">
        <!-- Toggle Button -->
        <button
          @click="toggleSidebar"
          class="bg-white rounded-full w-10 h-10 flex items-center justify-center text-xl text-pink-900 cursor-pointer hover:bg-gray-300 transition" 
        >
          ☰
        </button>
  
        <!-- Menu List -->
        <div class="mt-4 w-full flex flex-col gap-2">
          <div
            v-for="(item, i) in menuItems"
            :key="i"
            class="flex items-center gap-2 bg-white rounded-full px-2 py-1 text-pink-900 cursor-pointer hover:bg-gray-300 transition"
          >
            <div class="w-8 h-8 flex items-center justify-center ">
              {{ item.icon }}
            </div>
            <span v-if="expanded" class="text-sm truncate ">{{ item.label }}</span>
          </div>
        </div>
      </div>
  
      <!-- Bottom: Profile Button -->
      <div class="flex items-center gap-2 bg-white rounded-full px-2 py-1 text-pink-900 mx-auto w-full cursor-pointer hover:bg-gray-300 transition">
        <div class="w-8 h-8 flex items-center justify-center text-xl ">👤</div>
        <span v-if="expanded" class="text-sm">Profile</span>
      </div>
    </div>
</template>
  
<script lang="ts" setup>
  import { ref } from 'vue';
  
  const expanded = ref(false);
  const toggleSidebar = () => {
    expanded.value = !expanded.value;
  };
  
  const menuItems = [
    { icon: '🏠', label: 'Home' },
    { icon: '📝', label: 'Posts' },
    { icon: '📁', label: 'Files' },
  ];
</script>