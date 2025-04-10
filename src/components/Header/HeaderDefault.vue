<script lang="ts">
import { defineComponent } from 'vue';
import Button from 'primevue/button';
import { useRouter } from 'vue-router';

export default defineComponent({
  name: 'HeaderDefault',
  components: {
    Button
  },
  setup(){
    const router = useRouter();
    const navigateToRegister = () => {
      router.push('/register');
    };
    const navigateToLogin = () => {
      router.push('/login');
    };
    return {
      navigateToRegister,
      navigateToLogin
    };
  }
});



// TODO: Make Button appear on the right side of the header
// TODO: Make the header sticky
// TODO: Make the link work and then the second header

</script>

<template>
    <header class="bg-transparent text-white">
        <div class="flex justify-between items-center ">
          <h1 class=" font-bold text-[50px] py-4 Manrope">
              Komodo Hub
          </h1>
          <div class = "flex gap-4">
            <Button label="Register" class="p-button bg-violet-600 hover:bg-violet-800" @click="navigateToRegister" />
            <Button label="Login" class="p-button  bg-violet-600 hover:bg-violet-800" @click="navigateToLogin"/>
          </div>
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

header {
    width: 100%; /* Ensure the header takes up the full width */
    padding: 10px;
}

.flex {
    display: flex;
    justify-content: space-between; /* Push items to the edges */
    align-items: center; /* Vertically center items */
}

.p-button {
   
    color: #ffffff ;
    border: none ;
}


</style>