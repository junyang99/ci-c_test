<template>
  <nav>
    <ul style="margin-bottom: 0;">
      <li> <img src="@/assets/logo.png" class="logo"> </li>
      <li class="nav-link">
        <router-link to="/">Role Listing</router-link>
      </li>
      <li class="nav-link">
        <router-link to="/">My Applications</router-link>
      </li>
      <li class="nav-link">
        <router-link to="/">My Profile</router-link>
      </li>

      <div id="nav-user">
        <li id="nav-user">
          <img src="@/assets/icons/user.png" style="height: 40px; width: auto;">
        </li>
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
      userName: "Alice Tan",
      userRole: "Staff",
    };
  },
};
</script>

<style>
  @import 'assets/styling/nav.css';
  @import 'assets/styling/styles.css';
</style>
