<template>
  <Header/>
  <div class="min-h-screen flex flex-col items-center justify-center px-4">
    <h1 class="text-2xl font-bold mb-4">Log in</h1>
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
        Login
      </button>
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import Header from '../components/Header/HeaderDefault.vue'

const email = ref('')
const password = ref('')
const error = ref('')
const router = useRouter()

function handleLogin() {
  error.value = ''

  const users = JSON.parse(localStorage.getItem('users') || '[]')
  const user = users.find(u => u.email === email.value && u.password === password.value)

  if (user) {
    router.push('/dashboard') // change to your actual route
  } else {
    error.value = 'Invalid credentials.'
  }
}
</script>