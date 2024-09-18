<template>

  <section>
    <h1>playlists</h1>
    <div id="add-playlist" v-if="$store.state.user.username !=admin">
        <a class="bn39" @click="newPlaylist()"><span class="bn39span"> Add playlist 
          <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-music-note" viewBox="0 0 16 16">
          <path d="M9 13c0 1.105-1.12 2-2.5 2S4 14.105 4 13s1.12-2 2.5-2 2.5.895 2.5 2"/>
          <path fill-rule="evenodd" d="M9 3v10H8V3z"/>
          <path d="M8 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 13 2.22V4L8 5z"/>
          </svg></span>
        </a>
      </div>
    <article v-for="playlist in playlists" :key="playlist.mood" @click="showPlaylist(playlist.mood_id)">
      <div id="pic-container">

      <img class="playlist-image" v-if="playlist.mood_img" v-bind:src="playlist.mood_img"/>
      </div>
      <div id="element-container">
      <h2>{{ playlist.mood }}</h2>
      </div>
      <div id="delete-playlist" v-if="$store.state.user.username !=admin"> 
        <button @click= "deletePlaylist(playlist.mood_id, $event)" >
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
          <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
        </svg>
      </button>
      </div>
    </article>
  </section>


</template>

<script>
import NewPlaylistForm from '../components/NewPlaylistForm.vue';
import playlistService from '../services/playlist-service';
  export default {
    components:{
      NewPlaylistForm
},
    data(){
      return{
        playlists:[]
      };
    },
    created(){
      this.loadPlaylist();
    },
    methods:{
      showPlaylist(id){
        this.$router.push({name:'PlaylistTracks', params:{id:id}});
      },
      newPlaylist(){
        this.$router.push({name: 'PlaylistForm'});
      },
      loadPlaylist(){
        playlistService.listAllPlaylists().then(response => {
        this.playlists = response.data;
      });
      },
      deletePlaylist(id,ev){
        ev.stopPropagation();
        playlistService.deletePlaylist(id).then((Response) =>{
          this.loadPlaylist();
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
  font-weight: lighter;
  letter-spacing: 2px;
  color: white;
}
section{
  position: relative;
  padding: 30px;
  width: 40%;
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
    margin-top: 1%;
  }
 
  #delete-playlist{
    color: white;
    margin-top: 5%;
    margin-right: 5%;

    button{
      cursor: pointer;
      background-color: transparent;
    }
  }



  .playlist-image{
    max-height: 100px;
    border-radius: 20px;
    margin-right: 10%;
  }
}

article:hover{
  filter: drop-shadow(5px 5px 4px #796c88);
  scale: 103%;

}


#add-playlist{
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

  h1{
  text-align: center;
  text-transform: capitalize;
  font-weight: lighter;
  letter-spacing: 2px;
  color: white;
}

h2{
  text-transform: capitalize;
  font-size: larger;
  font-weight: lighter;
  letter-spacing: 2px;
  color: white;
}

section{
position: relative;
padding: 20px;
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
  }
 
  #delete-playlist{
    color: white;
    margin-top: 10%;
    margin-right: 5%;

    button{
      cursor:context-menu;
      background-color: transparent;
    }
  }



  .playlist-image{
    max-height: 70px;
    border-radius: 20px;
    margin-right: 10%;
  }
}

article:hover{
  filter: drop-shadow(5px 5px 4px #796c88);
  scale: 103%;

}

}
</style>