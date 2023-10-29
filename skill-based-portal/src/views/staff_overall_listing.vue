<template>
    <v-app>
        <v-container>
            <div style="padding-top: 80px; padding-bottom: 80px;">

                <div class="container ms-auto">
                    <div class="page-head">
                        <p class="page-heading">All Role Listings.</p>
                        <p class="page-subheading">Browse all available Role Listings.</p>
                    </div>
                </div>

                <br>
        
                <div class="container ms-auto">
                    <div class="search-and-filter row">
                        <div class="col-6">
        
                            <div class="input-box">
                                <i class="uil uil-search"></i>
                                <input type="text" placeholder="Search" />
                                <!-- <button class="button">Search</button> -->
                            </div>
        
                        </div>
        
                        <div class="col-3">
                            <div class="select-btn" @click="handleDropdown">
                                <span class="btn-text">Select Department</span>
                                <span class="arrow-dwn">
                                    <i class="fa-solid fa-chevron-down"></i>
                                </span>
                            </div>

                            <ul class="list-items">
                                <!-- Use v-for to loop through departments and generate list items -->
                                <li class="item" v-for="(department, index) in departments" :key="index">
                                    <span class="checkbox">
                                    <i class="fa-solid fa-check check-icon"></i>
                                    </span>
                                    <span class="item-text">{{ department }}</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
        
                <br>
        
                <div class="container ms-auto">
                    <div class="row">

                        <router-link class="router-link-custom" :to="{ name: 'roleListing'}">
                        <!-- <router-link :to="{ name: 'specificListing', params:{ id: 1 }}"> -->
                            <a href="./views/specific_listing.vue"></a>

                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-12" v-for="card in cardData" :key="card.id">
                                    <div class="listing-card">
                                    <p class="card-heading">{{ card.title }}</p>
                                    <p class="card-subheading">{{ card.department }}</p>
                                    <p class="card-deadline">Deadline: {{ card.deadline }}</p>
                                    <p class="card-description">{{ card.description }}</p>
                                    <router-link :to="{ name: 'roleListing', params: { id: card.id } }">
                                        <button class="card-find-btn">Find Out More</button>
                                    </router-link>
                                    <router-link :to="{ name: 'roleApplication', params: { id: card.id } }">
                                        <button class="card-apply-btn">APPLY</button>
                                    </router-link>
                                    </div>
                                </div>
                                </div>

                        </router-link>

                    </div>
                </div>
        
            </div>
        </v-container>
    </v-app>
</template>

<script>
    import { handleDropdown } from "../assets/js/dropdown.js";

    export default {
        name: 'overallListing',
        methods: {
            handleDropdown,
        },
        mounted() {
            document.title = "All in One";
        },
        created() {
            console.log("working")
        },

        data() {
            return {
            cardData: [
                {
                id: 1,
                title: "Account Manager",
                department: "Sales",
                deadline: "15 October 2023",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis faucibus est. Proin tristique dolor et tortor venenatis, auctor vestibulum risus consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                },

                {
                id: 2,
                title: "Account Manager",
                department: "Sales",
                deadline: "15 October 2023",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis faucibus est. Proin tristique dolor et tortor venenatis, auctor vestibulum risus consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                },

                {
                id: 3,
                title: "Account Manager",
                department: "Sales",
                deadline: "15 October 2023",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis faucibus est. Proin tristique dolor et tortor venenatis, auctor vestibulum risus consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                },

                {
                id: 1,
                title: "Account Manager",
                department: "Sales",
                deadline: "15 October 2023",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis faucibus est. Proin tristique dolor et tortor venenatis, auctor vestibulum risus consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                },

                {
                id: 2,
                title: "Account Manager",
                department: "Sales",
                deadline: "15 October 2023",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis faucibus est. Proin tristique dolor et tortor venenatis, auctor vestibulum risus consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                },

                {
                id: 3,
                title: "Account Manager",
                department: "Sales",
                deadline: "15 October 2023",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis faucibus est. Proin tristique dolor et tortor venenatis, auctor vestibulum risus consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                },
            ],

            departments: [
                "Chairman",
                "CEO",
                "Sales",
                "Engineering",
                "HR",
                "Finance",
                "Consultancy",
                "Solutioning",
                "IT",
            ]
            };
        },
    }
</script>

<style @scoped>
    @import '@/assets/styling/staff_overall_listing.css';
</style>