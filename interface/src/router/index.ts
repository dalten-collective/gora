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
    meta: { title: 'Gora | Goriverse' }
  },
  {
    path: "/:goraID",
    name: "pita-gora-detail",
    component: Pita,
    meta: { title: `Gora | Detail` }
  },
  {
    path: "/hedl",
    name: "hedl",
    component: Owned,
    meta: { title: 'Gora | Hedl' }
  },
  {
    path: "/hedl/:goraID",
    name: "hedl-gora-detail",
    component: Owned,
    meta: { title: 'Gora | Hedl' }
  },
  {
    path: "/mine",
    name: "mine",
    component: Mine,
    meta: { title: 'Gora | Mine' }
  },
  {
    path: "/mine/:goraID",
    name: "mine-gora-detail",
    component: Mine,
    meta: { title: 'Gora | Mine' }
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
