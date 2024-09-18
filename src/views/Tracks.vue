
<template>
  <section v-if="track">
    <img class="track-image" v-if="track.image" v-bind:src="track.image"/>

  <h1>Track:{{ track.title }} </h1>
  <h2>Artist: {{ track.artist }}</h2>
  <h3>Description: {{ track.description }}</h3>
</section>
</template>

<script>
import trackService from '../services/track-service';
  export default {
    data(){
      return{
        track:null,
      }
    },
    methods:{
      showTrack(id){
        this.$router.push({name:'Tracks', params:{id:id}});
      },
    
    },
    created(){
      trackService.getTrackById(this.$route.params.id).then(response=> {
        this.track = response.data;
      }).catch(error => {
        console.error(error);
      });
    }
  }
</script>

<style scoped>
h1{
  text-align: left;
  text-transform: capitalize;
  font-weight: lighter;
  letter-spacing: 2px;
  color: white;
}

h2{
  text-align: left;
  text-transform: capitalize;
  font-weight: lighter;
  letter-spacing: 2px;
  color: white;
}

h3{
  text-align: left;
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

.track-image{
 
  border-radius: 20px;
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

.track-image{
  align-self: center;
  max-width: 75% ;
  border-radius: 20px;
}


}
</style>