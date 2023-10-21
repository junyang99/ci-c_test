<template>
    <v-app>
        <v-container>
            <h1>My Applications</h1>
        </v-container>
    </v-app>
</template>
<script>
    export default {
        name: 'myApplications',
        mounted() {
            document.title = "All in One";
        },
        created() {
            console.log("working")
        }
    }
</script>
<style scoped>
    @import '@/assets/styling/overall_application.css';
</style>