import { createRouter, createWebHistory, createWebHashHistory, RouteRecordRaw } from "vue-router";
import Pita from "../views/Pita.vue";
// import PitaDetail from "../views/PitaDetail.vue";
import Owned from "../views/Owned.vue";
import Mine from "../views/Mine.vue";

const routes: Array<RouteRecordRaw> = [
  {
    path: "/",
    name: "pita",
    component: Pita,
  },
  {
    path: "/:goraID",
    name: "pita-gora-detail",
    component: Pita,
  },
  {
    path: "/owned",
    name: "owned",
    component: Owned,
  },
  {
    path: "/owned/:goraID",
    name: "owned-gora-detail",
    component: Owned,
  },
  {
    path: "/mine",
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
  history: createWebHistory("/apps/gora/"),
  routes,
});

export default router;
