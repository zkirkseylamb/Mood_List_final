<script>
import playlistService from '../services/playlist-service';
import trackService from '../services/track-service';
import trackMoodService from '../services/trackMood-service';
export default {
    data() {
        return {
            newTrack: {
                title: '',
                description: '',
                artist: '',
                image:'',
                energy:'',
                valence:'',
            },
            newTrackMood:{
                track_id:'',
                mood_id:'',

            },
            playlist:null,

        }
    },
    methods: {
        createTrack() {
          const newTrackSong= {
                title: this.newTrack.title,
                description: this.newTrack.description,
                artist: this.newTrack.artist,
                image: this.newTrack.image,
                energy: this.newTrack.energy,
                valence: this.newTrack.valence,
          };
          trackService.createTrack(newTrackSong).then(response =>{
            this.newTrack.title = '';
            this.newTrack.description ='';
            this.newTrack.artist='';
            this.newTrack.image='';
            this.newTrack.energy='';
            this.newTrack.valence='';  
            loadTrack();

          });

        },
       addTrackToPlaylist(){
            const newTrackMood={
                track_id:'',
                mood_id:this.playlist.mood_id,
            };
            trackMoodService.createTrackMood(newTrackMood).then(response =>{
                
            });
       },
       loadTrack(){
        trackService.listTrack().then(response => {
        this.tracks = response.data;
        });
    }
},

    created(){
      playlistService.getPlaylistById(this.$route.params.id).then(response=> {
        this.playlist = response.data;
      }).catch(error => {
        console.error(error);
      });
    }
}
</script>

<template>
    <form @submit.prevent="createTrack">
        <h1>New Track</h1>
        <p class="error" v-if="errorMessage">{{ errorMessage }}</p>

        <fieldset>
            <label>
                <span>Title </span>
                <input type="text" v-model="newTrack.title" required>
            </label>
            <label>
                <span>Description </span>
                <input type="text" v-model="newTrack.description" required>
            </label>
            <label>
                <span>Artist </span>
                <input type="text" v-model="newTrack.artist" required>
            </label>
            <label>
                <span>Track Image </span>
                <input type="text" v-model="newTrack.image" required>
            </label>
            <label>
                <span>Energy</span>
                <input type="text" v-model="newTrack.energy" required>
            </label>
            <label>
                <span>Valence</span>
                <input type="text" v-model="newTrack.valence" required>
            </label>
            <button type="submit">Submit</button>
        </fieldset>
        <RouterLink to="/Playlists">Back to Playlist</RouterLink>
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