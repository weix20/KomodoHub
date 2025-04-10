

import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/Home.vue';
import Help from '../views/Help.vue';

// routes go here
const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
   path: '/register',
   name: 'Register',
    component: () => import('../views/Register.vue')
  },
  { path: '/help', name: 'Help', component: Help },
  {
    path: '/login',
    name: 'Login',
     component: () => import('../views/Login.vue')
   },
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;

