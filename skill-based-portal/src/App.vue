<!-- <template>
  <div class="main-nav">
    <ul style="margin-bottom: 0;">
                <li> 
                  <img src="assets/logo.png" class="logo">
                  <router-link to="/">Home</router-link>
                </li>

                <li class="nav-link"> <a href="#"> Role Listing </a> </li>
                <li class="nav-link"> <a href="#"> My Applications </a> </li>
                <li class="nav-link"> <a href="#"> My Profile </a> </li>

                <div id="nav-user">
                    <li id="nav-user"> 
                      <img src="assets/icons/user.png" style="height: 40px; width: auto;"> </li>
                    <li id="nav-user"> 
                        <div> Alice Tan </div>
                        <div> Staff </div> 
                    </li>
                </div>
            </ul>
  </div>
</template> -->

<template>
  <nav>
    <ul style="margin-bottom: 0;">
      <li> <img src="@/assets/logo.png" class="logo"> </li>
      <li class="nav-link"> <a href="#"> Role Listing </a> </li>
      <li class="nav-link"> <a href="#"> My Applications </a> </li>
      <li class="nav-link"> <a href="#"> My Profile </a> </li>

      <div id="nav-user">
        <li id="nav-user"> <img src="@/assets/icons/user.png" style="height: 40px; width: auto;"> </li>
        <li id="nav-user">
          <div> {{ userName }} </div>
          <div> {{ userRole }} </div>
        </li>
      </div>
    </ul>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      userName: "Alice Tan", // You can set these values dynamically from your Vue component's data
      userRole: "Staff",
    };
  },
};
</script>

<style>
  @import 'assets/styling/nav.css';
  @import 'assets/styling/styles.css';
</style>
