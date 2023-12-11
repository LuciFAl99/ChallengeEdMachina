<template>
  <div style="background-color: #F8F8F8; height: 100vh;">
    <Nav />
    <div class="d-flex">
      <Sidebar />
    <Menu />
    </div>
  </div>
</template>

<script>
import Nav from '@/components/Nav.vue';
import Sidebar from '@/components/Sidebar.vue';
import Menu from '@/components/Menu.vue'

export default {
  name: 'Home',

  components: {
    Nav,
    Sidebar,
    Menu,
  },
}
</script>
