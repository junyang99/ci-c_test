<template>
    <v-app>
        <v-container>
            <div style="padding-top: 80px;">

                <div class="container ms-auto">
                    <div class="page-head">
                        <p class="page-heading">All Role Listings.</p>
                        <p class="page-subheading">Browse all available Role Listings.</p>
                    </div>
                </div>
        
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
                                <li class="item">
                                    <span class="checkbox">
                                        <i class="fa-solid fa-check check-icon"></i>
                                    </span>
                                    <span class="item-text">Chairman</span>
                                </li>
        
                                <li class="item">
                                    <span class="checkbox">
                                        <i class="fa-solid fa-check check-icon"></i>
                                    </span>
                                    <span class="item-text">CEO</span>
                                </li>
        
                                <li class="item">
                                    <span class="checkbox">
                                        <i class="fa-solid fa-check check-icon"></i>
                                    </span>
                                    <span class="item-text">Sales</span>
                                </li>
        
                                <li class="item">
                                    <span class="checkbox">
                                        <i class="fa-solid fa-check check-icon"></i>
                                    </span>
                                    <span class="item-text">Engineering</span>
                                </li>
        
                                <li class="item">
                                    <span class="checkbox">
                                        <i class="fa-solid fa-check check-icon"></i>
                                    </span>
                                    <span class="item-text">HR</span>
                                </li>
        
                                <li class="item">
                                    <span class="checkbox">
                                        <i class="fa-solid fa-check check-icon"></i>
                                    </span>
                                    <span class="item-text">Finance</span>
                                </li>
        
                                <li class="item">
                                    <span class="checkbox">
                                        <i class="fa-solid fa-check check-icon"></i>
                                    </span>
                                    <span class="item-text">Consultancy</span>
                                </li>
        
                                <li class="item">
                                    <span class="checkbox">
                                        <i class="fa-solid fa-check check-icon"></i>
                                    </span>
                                    <span class="item-text">Solutioning</span>
                                </li>
        
                                <li class="item">
                                    <span class="checkbox">
                                        <i class="fa-solid fa-check check-icon"></i>
                                    </span>
                                    <span class="item-text">IT</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
        
                <br>
        
                <div class="container ms-auto">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="listing-card">
                                <p class="card-heading">Account Manager</p>
                                <p class="card-subheading">Sales</p>
        
                                <p class="card-deadline">Deadline: 15 October 2023</p>
                                <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis faucibus est. Proin tristique dolor et tortor venenatis, auctor vestibulum risus consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        
                                <button class="card-find-btn">Find Out More</button>
                                <button class="card-apply-btn">APPLY</button>
                            </div>
                        </div>
        
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="listing-card">
                                <p class="card-heading">Account Manager</p>
                                <p class="card-subheading">Sales</p>
        
                                <p class="card-deadline">Deadline: 15 October 2023</p>
                                <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis faucibus est. Proin tristique dolor et tortor venenatis, auctor vestibulum risus consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        
                                <button class="card-find-btn">Find Out More</button>
                                <button class="card-apply-btn">APPLY</button>
                            </div>
                        </div>
        
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="listing-card">
                                <p class="card-heading">Account Manager</p>
                                <p class="card-subheading">Sales</p>
        
                                <p class="card-deadline">Deadline: 15 October 2023</p>
                                <p class="card-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis faucibus est. Proin tristique dolor et tortor venenatis, auctor vestibulum risus consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        
                                <button class="card-find-btn">Find Out More</button>
                                <button class="card-apply-btn">APPLY</button>
                            </div>
                        </div>
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
        }
    }
</script>

<style @scoped>
    @import '@/assets/styling/overall_listing.css';
</style>