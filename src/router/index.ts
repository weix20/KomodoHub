

import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/Home.vue';
import Help from '../views/Help.vue';

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
  // Add more routes here
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;

