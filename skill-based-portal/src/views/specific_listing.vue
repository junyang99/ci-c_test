<template>
    <v-app>
        <v-container>
            <div style="padding-top: 80px;">
                <h1>SPECIFIC LISTING</h1>
            </div>
        </v-container>
    </v-app>
</template>

<script>
    export default {
        name: 'specificListing',
        mounted() {
            document.title = "All in One";
        },
        created() {
            console.log("working")
        }
    }
</script>

<style @scoped>
    @import '@/assets/styling/role_listing.css';
</style>