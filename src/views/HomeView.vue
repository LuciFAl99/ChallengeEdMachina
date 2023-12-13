<template>
  <div style="background-color: #F8F8F8;">
    <Nav />
    <div class="d-flex homeView">
      <Sidebar />
      <Menu class="menu-homev" />
      <Details />
    </div>

  </div>
</template>

<script>
import Nav from '@/components/Nav.vue';
import Sidebar from '@/components/Sidebar.vue';
import Menu from '@/components/Menu.vue';
import Details from '@/components/Details.vue';

export default {
  name: 'Home',

  components: {
    Nav,
    Sidebar,
    Menu,
    Details,
  },
}
</script>
<style>
@media screen and (min-width: 320px) and (max-width: 1400px) {
  .homeView {
    display: flex;
    flex-direction: column;
  }
  .menuHomev{
    height: 60vh;
  }
}
</style>

