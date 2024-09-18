<script>
import playlistService from '../services/playlist-service';
export default {
    data() {
        return {
            newPlaylist: {
                mood: '',
                mood_img: '',
            }
          
        }
    },
    methods: {
        createPlaylist() {
           const newMoodPlaylist = {
            mood: this.newPlaylist.mood,
            mood_img: this.newPlaylist.mood_img,
           };
           playlistService.createPlaylist(newMoodPlaylist).then(response =>{
            this.newPlaylist.mood = '';
            this.newPlaylist.mood_img ='';
            this.loadPlaylist();
           });
        },
        loadPlaylist(){
        playlistService.listAllPlaylists().then(response => {
        this.playlists = response.data;
      });
      }

    }
}
</script>

<template>
    <form @submit.prevent="createPlaylist">
        <h1>New Mood Playlist</h1>
        <p class="error" v-if="errorMessage">{{ errorMessage }}</p>

        <fieldset>
            <label>
                <span>Mood </span>
                <input type="text" v-model="newPlaylist.mood" required>
            </label>
            <label>
                <span>Mood_img </span>
                <input type="text" v-model="newPlaylist.mood_img" required>
            </label>
            <button type="submit">Submit</button>
        </fieldset>
        <RouterLink to="/playlists">Back to Playlists</RouterLink>
    </form>
</template>

<style scoped>
    form {
        width: 500px;
        margin: 50px auto 0 auto;
        padding: 50px;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 1rem;
        background-color: rgba(0, 0, 0, 0.4);
        box-shadow: var(--shadow-3);
        color: white;
    }


    button {
        margin-top: 20px;
        width: 100%;
    }

 
    fieldset {
        border: none;
        display: grid;
        gap: 0.5rem;
        grid-template-columns: auto auto;
    }

    label {
        width: 80%;
        grid-column: span 2;
        display: grid;
        grid-template-columns: subgrid;
        gap: 1rem;
        color: white;
    }

    button {
        grid-column: 2;
        width: 100%;
    }
</style>