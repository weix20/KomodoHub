<template>
  <Header class="background" />
  <div class="min-h-screen flex flex-col items-center justify-center px-4 background">
    <h1 class="text-2xl font-bold mb-4">Register</h1>
    <form @submit.prevent="handleRegister" class="space-y-4 w-full max-w-sm">
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
        Register
      </button>
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import Header from '../components/Header/HeaderDefault.vue'
// Import test users for reference only (we can't write to this file from the browser)
import testUsers from '../assets/testUsers.json'

const email = ref('')
const password = ref('')
const error = ref('')
const router = useRouter()

function handleRegister() {
  error.value = ''

  if (!email.value || !password.value) {
    error.value = 'Please fill in all fields.'
    return
  }

  const users = JSON.parse(localStorage.getItem('users') || '[]')
  
  // Check if user already exists
  const existingUser = users.find(u => u.email === email.value)
  
  if (existingUser) {
    error.value = 'This email is already registered.'
    return
  }
  
  // Add new user
  const newUser = { email: email.value, password: password.value }
  users.push(newUser)
  localStorage.setItem('users', JSON.stringify(users))

  
  // Store current user information
  localStorage.setItem('currentUser', JSON.stringify(newUser))
  
  // Redirect to community posts
  router.push('/community-posts')
}
</script>


<style scoped>



.background {
  background-color: #1A1537;
  color: white;
}

</style>