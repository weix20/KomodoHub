<script setup lang="ts">
// Importing Vue and PrimeVue components
import { ref } from 'vue'
import Button from 'primevue/button'
import Card from 'primevue/card'
import InputText from 'primevue/inputtext'
import Textarea from 'primevue/textarea'
import Header from '../components/Header/HeaderDefault.vue'

// Array of frequently asked questions
const faqs = [
  { q: 'What is Komodo Hub?', a: 'It’s a digital platform for supporting animal conservation through community engagement.' },
  { q: 'Who can use Komodo Hub?', a: 'Anyone — schools, communities, individuals and conservation groups.' },
  { q: 'Is registration required?', a: 'Only for contributing data or accessing custom features. Browsing is open to all.' }
]

// Form input states
const name = ref('')
const email = ref('')
const message = ref('')
const confirmationMessage = ref('')

// Submit handler for the contact form
function submitForm() {
  if (!name.value || !email.value || !message.value) {
    confirmationMessage.value = 'Please fill out all fields before submitting.'
    return
  }

  confirmationMessage.value = 'Information received. We will get back to you as soon as possible.'

  // Clear form inputs
  name.value = ''
  email.value = ''
  message.value = ''
}
</script>

<template>
  <!-- Global header -->
  <Header />

  <!-- Page wrapper -->
  <div class="background py-10 px-4 text-white flex flex-col items-center gap-10">

    <!-- FAQs Section -->
    <Card style="width: 100%; max-width: 45rem;">
      <template #title>Frequently Asked Questions</template>
      <template #subtitle>Helpful information about Komodo Hub</template>
      <template #content>
        <div v-for="(faq, i) in faqs" :key="i" class="mb-4">
          <h3 class="font-semibold text-lg">{{ faq.q }}</h3>
          <p class="text-sm text-black/80">{{ faq.a }}</p>
        </div>
      </template>
    </Card>

    <!-- Contact Us Section -->
    <Card style="width: 100%; max-width: 45rem;">
      <template #title>Contact Us</template>
      <template #subtitle>We're happy to hear from you!</template>
      <template #content>
        <form @submit.prevent="submitForm" class="flex flex-col gap-4">
          <InputText v-model="name" placeholder="Your Name" class="w-full" />
          <InputText v-model="email" placeholder="Your Email" class="w-full" />
          <Textarea v-model="message" placeholder="Your Message" rows="5" class="w-full" />

          <!-- Confirmation Message -->
          <p v-if="confirmationMessage" class="text-sm text-black-300">{{ confirmationMessage }}</p>

          <!-- Buttons -->
          <div class="flex justify-end gap-4">
            <Button label="Cancel" severity="secondary" outlined @click="() => { name = ''; email = ''; message = ''; confirmationMessage = '' }" />
            <Button label="Send" type="submit" />
          </div>
        </form>
      </template>
    </Card>

  </div>
</template>

<style scoped>
.background {
  background-color: #1A1537;
  min-height: 100vh;
}
</style>