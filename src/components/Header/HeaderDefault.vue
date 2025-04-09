<script lang="ts">
import { defineComponent } from 'vue';
import Button from 'primevue/button';

export default defineComponent({
  name: 'HeaderDefault',
});

// TODO: Make Button appear on the right side of the header
// TODO: Make the header sticky
// TODO: Make the link work and then the second header

</script>

<template>
    <header class="bg-transparent text-white">
        <div>
          <h1 class=" font-bold text-[50px] py-4 Manrope">
              Komodo Hub
          </h1>

          <Button label="Submit" />
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