import { createRouter, createWebHistory, createWebHashHistory, RouteRecordRaw } from "vue-router";
import Pita from "../views/Pita.vue";
import Held from "../views/Held.vue";
import Mine from "../views/Mine.vue";

const routes: Array<RouteRecordRaw> = [
  {
    path: "/",
    name: "pita",
    component: Pita,
  },
  {
    path: "/",
    name: "held",
    component: Held,
  },
  {
    path: "/",
    name: "mine",
    component: Mine,
  },
  //{
  //path: "/about",
  //name: "about",
  //// route level code-splitting
  //// this generates a separate chunk (about.[hash].js) for this route
  //// which is lazy-loaded when the route is visited.
  //component: () =>
  //import([> webpackChunkName: "about" <] "../views/AboutView.vue"),
  //},
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

export default router;
