<template>
  <section v-if="playlist">
    <img class="playlist-image" v-if="playlist.mood_img" v-bind:src="playlist.mood_img"/>
    <h1>{{playlist.mood}}</h1>
      <div id="add-track">
        <a class="bn39" @click="newTrack()"><span class="bn39span"> Add track 
          <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-music-note" viewBox="0 0 16 16">
          <path d="M9 13c0 1.105-1.12 2-2.5 2S4 14.105 4 13s1.12-2 2.5-2 2.5.895 2.5 2"/>
          <path fill-rule="evenodd" d="M9 3v10H8V3z"/>
          <path d="M8 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 13 2.22V4L8 5z"/>
          </svg></span>
        </a>
      </div>
    <article v-for="track in tracks" :key="track.track_id" @click="showTrack(track.track_id)" >
      <div id="pic-container">
        <img class="track-image" v-if="track.image" v-bind:src="track.image"/>
      </div>
      <div id="element-container">
        <h2>{{ track.title }}</h2>
        <h3>{{ track.artist }}</h3>
      </div>
      <div id="delete-track">
        <button @click= "deleteTrack(track.track_id, $event)">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
          <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
        </svg>
      </button>
      </div>
    </article>
  </section>
</template>

<script>
import playlistService from '../services/playlist-service';
import trackMoodService from '../services/trackMood-service';
import NewTrackForm from '../components/NewTrackForm.vue';
import trackService from '../services/track-service';
  export default {
    components:{
      NewTrackForm
},
    data(){
      return{
        playlist:null,
        tracks:[]
      }
    },
    methods:{
      showTrack(id){
        this.$router.push({name:'Tracks', params:{id:id}});
      },
      getPlaylistTracks(id){
        trackMoodService.getTrackByPlaylist(id).then(response =>{
          this.tracks = response.data
        }).catch(error =>{
          console.error(error);
        });

      },
      newTrack(){
        this.$router.push({name: 'TrackForm'});
      },
      deleteTrack(id,ev){
        ev.stopPropagation();
        trackService.deleteTrack(id).then((Response) =>{
          this.getPlaylistTracks
        }).catch((error)=>{this.handleErrorResponse('verb:deleting')});
      },
      
      handleErrorResponse(error, verb) {
      if (error.response) {
        if (error.response.status == 404) {
          this.$router.push({name: 'NotFoundView'});
        } else {
          this.$store.commit('SET_NOTIFICATION',
          `Error ${verb} message. Response received was "${error.response.statusText}".`);
        }
      } else if (error.request) {
        this.$store.commit('SET_NOTIFICATION', `Error ${verb} message. Server could not be reached.`);
      } else {
        this.$store.commit('SET_NOTIFICATION', `Error ${verb} message. Request could not be created.`);
      }
    }
    },
    created(){
      playlistService.getPlaylistById(this.$route.params.id).then(response=> {
        this.playlist = response.data;
        this.getPlaylistTracks(this.$route.params.id)
      }).catch(error => {
        console.error(error);
      });
    }
  }
</script>



<style scoped>

h1{
  text-align: center;
  text-transform: capitalize;
  font-weight: lighter;
  letter-spacing: 2px;
  color: white;
}

h2{
  text-transform: capitalize;
  margin-top: 2px;
  margin-bottom: 2px;
  font-size: large;
  font-weight: lighter;
  color: white;
}

h3{
  text-transform: capitalize;
  margin-top: 5px;
  margin-bottom: 2px;
  font-size: medium;
  font-weight: lighter;
  color: rgb(160, 159, 159);
}


section{
  position: relative;
  padding: 30px;
  width: 50%;
  margin-left: 30%;
  margin-right: 30%;
  display:flex;
  flex-direction: column;
  background-color: rgba(0,0,0,.6);
  border-radius: 30px;

  
}

article{
  background-color: black;
  border-radius: 20px;
  max-height: 100px;
  margin: 10px;
  gap: 1px;
  cursor: pointer;
  display:flex;
  justify-content: space-between;
  filter: drop-shadow(5px 5px 4px #0d0c0e);
  transition: 0.3s;

  #pic-container{
    justify-self: start;
  }
  #element-container{
    text-align: center;
    margin-top: 3%;
  }
 
  #delete-track{
    color: white;
    margin-top: 5%;
    margin-right: 5%;

    button{
      cursor: pointer;
      background-color: transparent;
    }
  }

  .track-image{
    max-width: 100px;
    border-radius: 20px;
  }
}

article:hover{
  filter: drop-shadow(5px 5px 4px #796c88);
  scale: 103%;

}

.playlist-image{
  width:70%;
  align-self: center;
border-radius: 5px;
}


#add-track{
  align-self: center;
  margin-bottom: 10px;
}

.bn39 {
  background-image: linear-gradient(135deg, #008aff, #86d472);
  border-radius: 15px;
  box-sizing: border-box;
  color: #ffffff;
  display: block;
  height: 50px;
  font-size: 1.4em;
  font-weight: 300;
  padding: 3px;
  position: relative;
  text-decoration: none;
  width: 7em;
  z-index: 2;
  cursor: pointer;
}

.bn39:hover {
  color: #fff;
}

.bn39 .bn39span {
  align-items: center;
  background: #0e0e10;
  border-radius: 15px;
  display: flex;
  justify-content: center;
  height: 100%;
  transition: background 0.5s ease;
  width: 100%;
}

.bn39:hover .bn39span {
  background: transparent;
}


@media screen and (max-width: 425px) {

  h2{
  text-transform: capitalize;
  margin-top: 2px;
  margin-bottom: 2px;
  font-size: medium;
  font-weight: lighter;
  color: white;
}

h3{
  text-transform: capitalize;
  margin-top: 5px;
  margin-bottom: 2px;
  font-size: small;
  font-weight: lighter;
  color: rgb(160, 159, 159);
}


  section{
  position: relative;
  padding: 30px;
  width: 80%;
  margin-left: 5%;
  margin-right: 5%;
  display:flex;
  flex-direction: column;
  background-color: rgba(0,0,0,.6);
  border-radius: 30px;
  
}

article{
  background-color: black;
  border-radius: 20px;
  max-height: 70px;
  margin: 5px;
  gap: 3px;
  cursor: pointer;
  display:flex;
  justify-content: space-between;
  filter: drop-shadow(5px 5px 4px #0d0c0e);
  transition: 0.3s;

  #pic-container{
    justify-self: start;
  }
  #element-container{
    text-align: center;
    margin-top: 3%;
  }
 
  #delete-track{
    color: white;
    margin-top: 10%;
    margin-right: 5%;
    button{
      cursor: pointer;
      background-color: transparent;
    }
  }

  .track-image{
    max-width: 70px;
    border-radius: 20px;
  }

  svg{
    width: 18px;
  }
}

article:hover{
  filter: drop-shadow(5px 5px 4px #796c88);
  scale: 103%;

}
}

</style>