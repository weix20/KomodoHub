<script setup lang="ts">

import Button from "primevue/button";
import Card from "primevue/card";
import Header from "../components/Header/HeaderDefault.vue";



</script>


<template>
<Header />
<div class=" background">
  <div class=" flex align-center justify-center y-9 ">
    <Card style="width: 25rem; overflow: hidden">
      <template #header>
          <img alt="user header" src="../assets/vue.svg" />
      </template>
      <template #title>Advanced Card</template>
      <template #subtitle>Card subtitle</template>
      <template #content>
          <p class="m-0">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore sed consequuntur error repudiandae numquam deserunt quisquam repellat libero asperiores earum nam nobis, culpa ratione quam perferendis esse, cupiditate neque
              quas!
          </p>
      </template>
      <template #footer>
          <div class="flex gap-4 mt-1">
              <Button label="Cancel" severity="secondary" outlined class="w-full" />
              <Button label="Save" class="w-full" />
          </div>
      </template>
    </Card>
  </div>

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