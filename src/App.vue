<script>
  import { RouterView, RouterLink } from 'vue-router';
  import loginService from './services/login-service';
  export default {
    components: {
      RouterView,
      RouterLink
    },
    methods: {
      logout() {
        return loginService.logout();
      }
    }
  }
</script>

<template>
  <header>
    <nav>
      <menu>
        <div class="logo">
          <img src="../src/img/logo.png" />
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-music-note" viewBox="0 0 16 16">
          <path d="M9 13c0 1.105-1.12 2-2.5 2S4 14.105 4 13s1.12-2 2.5-2 2.5.895 2.5 2"/>
          <path fill-rule="evenodd" d="M9 3v10H8V3z"/>
          <path d="M8 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 13 2.22V4L8 5z"/>
          </svg>
        </div>
        <section id="internal-links">
        <div class="home">
          <li>
          <router-link to="/">Home</router-link>
          </li>
        </div>
        <div class="playlists">
          <li v-if="$store.state.token !=null">
            <router-link to="/playlists">Playlists</router-link>
          </li>
        </div>
        <li v-if="$store.state.user">
        </li>
        <div class="logout">
          <li v-if="$store.state.token !=null">
            <a href="#" @click="logout">Logout</a>
          </li>
        </div>
        <div class="register">
          <li v-if="$store.state.token ==null">
            <RouterLink to="/register">Register</RouterLink>
          </li>
        </div>
        <div class="login">
          <li v-if="$store.state.token ==null">
            <RouterLink to="/login">Login</RouterLink>
          </li>
      </div>
    </section>
      </menu>
    </nav>
  </header>
  <main>
    <RouterView />
   
  </main>
  <footer>
    <p>&copy; 2024 Zawadi Kirksey-Lamb</p>
  </footer>
</template>

<style scoped>
  /* Styles for content in this component are in main.css, as they are top-level (directly below #app) */
</style>