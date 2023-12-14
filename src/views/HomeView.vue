<template>
  <div style="background-color: #F8F8F8;">
    <Nav />
    <div class="d-flex flex-column">
      <div class="d-flex homeView">
        <Sidebar />
        <Menu class="menu-homev" />
        <Details />
      </div>
      <footer>COPYRIGHT 2023<span class="mdi mdi-copyright"></span>EdMachina</footer>
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
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

footer {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  width: 1,535px !important;
  min-height: 10vh;
  height: 51px;
  gap: 10px;
  font-family: Montserrat;
  font-size: 14px;
  font-weight: 700;
  line-height: 21px;
  letter-spacing: 0px;
  text-align: left;
  color: #888888;
  margin-left: 60px;
  background-color: #EEEEEE;
}
.homeView{
  margin-bottom: 30px;
}

@media screen and (min-width: 320px) and (max-width: 1400px) {
  .homeView {
    display: flex;
    flex-direction: column;
  }

  .menuHomev {
    height: 60vh;
  }
}
</style>

