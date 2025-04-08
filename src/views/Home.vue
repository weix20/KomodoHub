<script setup lang="ts">

import Button from "primevue/button";
import Card from "primevue/card";
import Header from "../components/Header/HeaderDefault.vue";


 // TODO: Align image to overlap the shape 
 // TODO: Create a second header component for logged in users
 // TODO: Create a simple Databaase to store the data
</script>


<template>
<Header class="background" />
<div class="background px-4 py-8">
    <h1 class="text-center font-bold text-xl mb-8"> A Digital Platform for Community-Supported Animal Conservation </h1>
    <div class="max-w-3xl align-left pl-4">
      <h1 class="text-center font-bold text-lg mb-4"> The Problems </h1>
      <h2 class="text-left text-base"> Badan Pusat Statistik, the Indonesian Bureau of Statistics, has recently published data on the country's endangered endemic species. Despite spending millions of dollars on conservation efforts, the government might have not seen any significant breakthroughs in the population of some species. The success of Komodo has been largely exclusive, and the world is now left with merely less than 100 Sumatran Tigers, Javan Rhinoceros, Bali Mynas, Javan Eagles, Tarsius, and Celebes Crested Macaques, respectively. Habitat loss remains the primary cause of the problems. Other causes include habitat changes, commercial over-exploitation, the introduction of harmful non-native species, pollution, and the spread of diseases. </h2>
    </div>

    <img src="../../public/CustomShapeHomePage.svg" alt="Custom Shape" class="custom-shape" />

    <img src="../assets/Stats.svg" alt="Stats" class="Stats" />
</div>
</template> 


<style scoped>


.background {
  background-color: #1A1537;
  color: white;
}

/* Media queries for responsive design */
@media (min-width: 768px) {
  .max-w-3xl {
    max-width: 48rem;
  }
}

.align-left {
  margin-left: 0 !important;
}

.Stats {
  max-width: 100%;
  height: auto;
  margin-top: 20px;
}
</style>