<template>
    <v-app>
        <v-container>
            <h1>Overall Listing</h1>
        </v-container>
    </v-app>
</template>

<script>
    export default {
        name: 'overallListing',
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