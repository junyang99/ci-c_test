import {createRouter, createWebHistory} from "vue-router";

const routes = [
    {
        path: "/",
        name: "overallListing",
        component: () => import("../views/overall_listing.vue")
    },
    {
        path: "/My-Applications",
        name: "myApplications",
        component: () => import("../views/myApplications.vue")
    },
    {
        path: "/My-Profile",
        name: "myProfile",
        component: () => import("../views/myProfile.vue")
    }
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
  });
  
export default router;