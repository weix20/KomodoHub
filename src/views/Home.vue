<script setup lang="ts">

import Button from "primevue/button";
import Card from "primevue/card";
import Header from "../components/Header/HeaderDefault.vue";

 // TODO: Align Animal pictures
 // TODO: Style the text in the home page, to 
 // TODO: Create a second header component for logged in users

</script>


<template>
<Header class="background" />
<div class="background px-4 py-8">
  <div class="container mx-auto">
    <div>
    
    
      <h1 class="text-center font-bold text-xl mb-16"> A Digital Platform for Community-Supported Animal Conservation </h1>
      <div class="max-w-3xl align-left pl-4">
        <h1 class="text-center font-bold text-lg mb-4"> The Problems </h1>
        <h2 class="text-left text-base"> Badan Pusat Statistik, the Indonesian Bureau of Statistics, has recently published data on the country's endangered endemic species. Despite spending millions of dollars on conservation efforts, the government might have not seen any significant breakthroughs in the population of some species. The success of Komodo has been largely exclusive, and the world is now left with merely less than 100 Sumatran Tigers, Javan Rhinoceros, Bali Mynas, Javan Eagles, Tarsius, and Celebes Crested Macaques, respectively. Habitat loss remains the primary cause of the problems. Other causes include habitat changes, commercial over-exploitation, the introduction of harmful non-native species, pollution, and the spread of diseases. </h2>
      </div>

      <img src="/CustomShapeHomePage.svg" alt="Custom Shape" class="custom-shape" />

      <img src="../assets/Stats.svg" alt="stats" class="stats" />
    </div>
    <div class=" pl-4">
      <h1 class="text-center font-bold text-xl mt-32"> The Vision </h1>
      <div class = " flex-auto align-center ">
        <h2 class="text-center text-base mt-32 max-w-2xl "> Badan Pusat Statistik, the Indonesian Bureau of Statistics, has recently published data on the country's endangered endemic species. Despite spending millions of dollars on conservation efforts, the government might have not seen any significant breakthroughs in the population of some species. The success of Komodo has been largely exclusive, and the world is now left with merely less than 100 Sumatran Tigers, Javan Rhinoceros, Bali Mynas, Javan Eagles, Tarsius, and Celebes Crested Macaques, respectively. Habitat loss remains the primary cause of the problems. Other causes include habitat changes, commercial over-exploitation, the introduction of harmful non-native species, pollution, and the spread of diseases. </h2>
      </div>
    </div>

    <img src="../../public/CustomShapeHome2.svg" alt="Custom Shape" class="custom-shape mt-16" />
    <img src="../assets/Elephant.svg" alt="Elephant" class=" elephant"/>
    <img src="../assets/Tiger.svg" alt="Tiger"  class="elephant"/>
    <img src="../assets/Lizard.svg" alt="Lizard" class="elephant left-8"/>
  </div>
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

.container {
  max-width: 1200px; 
  margin: 0 auto; 
  padding: 0 20px;
}

.custom-shape {
  scale: 1.2;

}

.align-left {
  margin-left: 0;
}

.stats {
  position: absolute;
  top: 50%;
  left: 60%;
  transform: translate(-50%, -50%);
  z-index: 2; 
  max-width: 100%;
  height: auto;
  margin-top: 20px;
  scale: 0.8;
}


.elephant {
  position: absolute;
 
  left: 60%;
  transform: translate(-50%, -50%);
  z-index: 2; 
  max-width: 100%;
  height: auto;
  margin-top: 20px;
  scale: 0.8;
}
</style>