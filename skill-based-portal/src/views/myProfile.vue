<template>
    <v-app>
        <v-container>
            <h1>My Profile</h1>
        </v-container>
    </v-app>
</template>
<script>
    export default {
        name: 'myProfile',
        mounted() {
            document.title = "All in One";
        },
        created() {
            console.log("working")
        }
    }
</script>

<style scoped>
    @import '@/assets/styling/profile.css';
</style>