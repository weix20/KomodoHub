<script setup lang="ts">

import Button from "primevue/button";
import Card from "primevue/card";
import Header from "../components/Header/HeaderDefault.vue";



</script>


<template >
<Header class=" background" />
<div class=" background" >
    <h1 class=" flex-auto align-middle text-center font-bold text-xl"> A Digital Platform for Community-Supported Animal Conservation </h1>
    <div class=" flex-auto left-20   ">
      <h1 class=" flex-auto align-middle text-center "> The Problems </h1>
      <h2 class=" flex-auto align-middle text-center "> Badan Pusat Statistik, the Indonesian Bureau of Statistics, has recently published data on the country’s endangered endemic species. Despite spending millions of dollars on conservation efforts, the government might have not seen any significant breakthroughs in the population of some species. The success of Komodo has been largely exclusive, and the world is now left with merely less than 100 Sumatran Tigers, Javan Rhinoceros, Bali Mynas, Javan Eagles, Tarsius, and Celebes Crested Macaques, respectively. Habitat loss remains the primary cause of the problems. Other causes include habitat changes, commercial over-exploitation, the introduction of harmful non-native species, pollution, and the spread of diseases. </h2>
    </div>

    <img src="../../public/CustomShapeHomePage.svg" alt="Custom Shape" class="custom-shape" />

</div>



  
</template>


<style scoped>
.cls-1 {
  fill: #ffffff;
  stroke: #231f20;
  stroke-width: 2;
  stroke-miterlimit: 10;
}

.cls-2 {
  fill: #231f20;
  stroke: #ffffff;
  stroke-width: 2;
  stroke-miterlimit: 10;
}

.svg-icon:hover #Ellipse {
  animation: jump 0.5s infinite alternate;
}

@keyframes jump {
  from {
    transform: translateY(0);
  }
  to {
    transform: translateY(-20px);
  }
}

.background {
  background-color: #1A1537;
}

</style>