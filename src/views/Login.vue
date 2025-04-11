<template>
    <Header class="background" />
    <div class="min-h-screen flex flex-col items-center justify-center px-4 background">
      <h1 class="text-2xl font-bold mb-4">Log In</h1>
      <form @submit.prevent="handleLogin" class="space-y-4 w-full max-w-sm">
        <div>
          <label class="block mb-1">Email</label>
          <input v-model="email" type="email" class="w-full border p-2 rounded" />
        </div>
        <div>
          <label class="block mb-1">Password</label>
          <input v-model="password" type="password" class="w-full border p-2 rounded" />
        </div>
        <p v-if="error" class="text-red-500 text-sm">{{ error }}</p>
        <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700">
          login
        </button>
      </form>
    </div>
</template>
  
<script setup>
  import { ref, onMounted } from 'vue'
  import { useRouter } from 'vue-router'
  import Header from '../components/Header/HeaderDefault.vue'
  import testUsers from '../assets/testUsers.json'
  
  const email = ref('')
  const password = ref('')
  const error = ref('')
  const router = useRouter()
  
  // Initialize localStorage with test users if it doesn't exist
  onMounted(() => {
    const existingUsers = JSON.parse(localStorage.getItem('users') || '[]')
    if (existingUsers.length === 0) {
      localStorage.setItem('users', JSON.stringify(testUsers))
    }
  })
  
  function handleLogin() {
    error.value = ''
  
    // Check registered users in localStorage
    const users = JSON.parse(localStorage.getItem('users') || '[]')
    let user = users.find(u => u.email === email.value && u.password === password.value)
    
    // If not found in localStorage, check test users
    if (!user) {
      user = testUsers.find(u => u.email === email.value && u.password === password.value)
    }
  
    if (user) {
      // Store logged in user information
      localStorage.setItem('currentUser', JSON.stringify(user))
      router.push('/community-posts') // Redirect to community posts
    } else {
      error.value = 'Invalid credentials.'
    }
  }
</script>


<style scoped>

  .background {
    background: linear-gradient(to bottom, #1A1537, #1A1537);
  }

</style>