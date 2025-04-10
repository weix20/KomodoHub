<script setup lang="ts">


import Header from "../components/Header/HeaderDefault.vue";
import { useRouter } from "vue-router";

const router = useRouter();

const navigateToHelpPage = () => {
  router.push("/help");
};

// TODO: Write links to the login and register pages in the header


</script>


<template>
<Header class="background"  />
<div class="background px-4 py-8">
  <div class="container mx-auto ">
    <div>
    
    
      <h1 class="text-center font-bold text-xl mb-16 "> A Digital Platform for Community-Supported Animal Conservation </h1>
      <div class="max-w-3xl align-left pl-4">
        <h1 class="text-center font-bold text-lg mb-4"> The Problems </h1>
        <h2 class="text-left text-base"> Badan Pusat Statistik, the Indonesian Bureau of Statistics, has recently published data on the country's endangered endemic species. Despite spending millions of dollars on conservation efforts, the government might have not seen any significant breakthroughs in the population of some species. The success of Komodo has been largely exclusive, and the world is now left with merely less than 100 Sumatran Tigers, Javan Rhinoceros, Bali Mynas, Javan Eagles, Tarsius, and Celebes Crested Macaques, respectively. Habitat loss remains the primary cause of the problems. Other causes include habitat changes, commercial over-exploitation, the introduction of harmful non-native species, pollution, and the spread of diseases. </h2>
      </div>

      <img src="/CustomShapeHomePage.svg" alt="Custom Shape" class="custom-shape" />
      <img src="../assets/Stats.svg" alt="stats" 
      class="stats " 
      v-animateonscroll="{ enterClass: 'animate-enter fade-in-10 slide-in-from-l-8 animate-duration-2000', leaveClass: 'animate-leave fade-out-0' }"
      />
    </div>
    <div class = " flex-auto align-center "
    v-animateonscroll="{ enterClass: 'animate-enter fade-in-10 slide-in-from-l-8 animate-duration-1000', leaveClass: 'animate-leave fade-out-0' }" >
      <h1 class="text-center font-bold text-xl mt-32"> The Vision </h1>
      
        <h2 class=" flex-auto text-center text-base mt-32   "> Badan Pusat Statistik, the Indonesian Bureau of Statistics, has recently published data on the country's endangered endemic species. Despite spending millions of dollars on conservation efforts, the government might have not seen any significant breakthroughs in the population of some species. The success of Komodo has been largely exclusive, and the world is now left with merely less than 100 Sumatran Tigers, Javan Rhinoceros, Bali Mynas, Javan Eagles, Tarsius, and Celebes Crested Macaques, respectively. Habitat loss remains the primary cause of the problems. Other causes include habitat changes, commercial over-exploitation, the introduction of harmful non-native species, pollution, and the spread of diseases. </h2>

    </div>

    <img src="/CustomShapeHome2.svg" alt="Custom Shape" class="custom-shape mt-16" />
    <div
     v-animateonscroll="{ enterClass: 'animate-enter fade-in-10 slide-in-from-l-8 animate-duration-1000', leaveClass: 'animate-leave fade-out-0' }"
    >
      <img src="../assets/Elephant.svg" alt="Elephant" class=" elephant"/>
      <img src="../assets/Tiger.svg" alt="Tiger"  class="tiger"/>
      <img src="../assets/Lizard.svg" alt="Lizard" class=" absolute left-1/2 transform translate-x-64 -translate-y-full gap-y-4"/>
    </div>
    
  </div>
</div>

<footer class="bg-white text-center py-4">
  <p class="text-sm text-black">©Manik Hapsara 08/2023 DISCLAIMER This study case has been designed for educational purposes only. The names, persons, job functions, and organizations 
mentioned in the story do not exist in real life. Any similarities to persons living or dead, or actual events are purely coincidental. The opinions expressed within the 
content are solely the author's and do not reflect the opinions and beliefs of any parties or its affiliates.© 2025 Komodo Hub. All rights reserved.</p>

  <h1 @click="navigateToHelpPage" class="text-black"> Help page </h1>
</footer>
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
  position: relative; 
  overflow: visible; 
}

.custom-shape {
  position: relative;
  width: 100vw; 
  left: 50%;
  right: 50%;
  margin-left: -50vw;
  margin-right: -50vw;
  max-width: none; 
  height: auto;
  transform-origin: center;
  
}

.align-left {
  margin-left: 0;
}

.stats {
  position: absolute;
  top: 10%;
  left: 60%;
  transform: translate(-40%, 0%);
  z-index: 2; 
  max-width: 100%;
  height: auto;
  margin-top: 20px;
  scale: 90%;
}


.elephant {
  position: absolute;
  
  left: 60%;
  transform: translate(-40%, -120%);
  z-index: 2; 
  max-width: 100%;
  height: auto;
  margin-top: 20px;
  scale: 0.8;
}

.tiger {
  position: absolute;
  
  left: 80%;
  transform: translate(70%, -150%);
  z-index: 2; 
  max-width: 100%;
  height: auto;
  margin-top: 20px;
  scale: 0.8;
}
</style>