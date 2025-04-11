

import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/Home.vue';
<<<<<<< HEAD
import Help from '../views/Help.vue';
=======
import RegisterPage from '../pages/RegisterPage.vue'
>>>>>>> 17067d9 (Updated index.ts and added new pages)

// routes go here
const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
<<<<<<< HEAD
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
   {
    path: '/community-posts',
    name: 'CommunityPosts',
     component: () => import('../views/CommunityPosts.vue')
   }
=======
    path: '/register',
    name: 'Register',
    component: RegisterPage
  },
  // Add more routes here
>>>>>>> 17067d9 (Updated index.ts and added new pages)
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;

