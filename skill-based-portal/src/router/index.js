import {createRouter, createWebHistory} from "vue-router";

const routes = [
    // {
    //     path: "/",
    //     name: "overallListing",
    //     component: () => import("../views/overall_listing.vue")
    // },
    {
        path: "/overallListing",
        name: "overallListing",
        component: () => import("../views/staff_overall_listing.vue")
    },
    {
        path: "/My-Applications",
        name: "myApplications",
        component: () => import("../views/staff_myApplications.vue")
    },
    {
        path: "/My-Profile",
        name: "myProfile",
        component: () => import("../views/staff_myProfile.vue")
    },
    {
        path: "/Role-Listing",
        name: "roleListing",
        component: () => import("../views/staff_role_listing.vue")
    },
    {
        path: "/Role-Application",
        name: "roleApplication",
        component: () => import("../views/staff_role_application.vue")
    },
    {
        path: "/Application-Confirmation",
        name: "applicationConfirmation",
        component: () => import("../views/staff_application_confirmation.vue")
    },
    {
        path: "/View-Application",
        name: "viewApplication",
        component: () => import("../views/staff_view_application.vue")
    }
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
  });
  
export default router;