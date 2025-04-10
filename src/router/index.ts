import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Help from '../views/Help.vue' // Adjust this path if Help.vue is in a different folder

const routes = [
  { path: '/', name: 'Home', component: Home },
  { path: '/help', name: 'Help', component: Help }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
