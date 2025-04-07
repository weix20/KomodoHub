<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'HeaderDefault',
});
</script>

<template>
    <header class="bg-transparent text-white">
        <div>
          <h1 class=" font-bold text-[50px] py-4 Manrope">
              Komodo Hub
          </h1>
        </div>
    </header>
</template>

<style scoped>
.header {
    background-color: #1A1537;
}

.Manrope{
    font-family: Manrope, sans-serif;
}
</style>