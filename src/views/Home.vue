<script>
  export default {
  }
</script>

<template>
  <div class="background">
  <section  v-if="$store.state.token ==null">  
    <div class="text">
    <h1> Hey there stranger!</h1>
    <p> Moodlist is a playlist creation application that curates playlists based on the mood of the music.<br/>
      The mood is determined by two values the music's valence and energy.<br/>
      Create an account and start creating playlists now. </p>
    </div>
</section>
<section v-if="$store.state.token !=null"> 
  <div class="text">
  <h1> Welcome back, {{ $store.state.user.username }}</h1>
  <p> Moodlist is a playlist creation application that curates playlists based on the mood of the music.<br/>
      The mood is determined by two values the music's valence and energy.<br/>
      View your created playlists now. </p>
    </div>
</section>
</div>
</template>

<style scoped>
h1{
  color: white;
  text-align: center;
  margin-top: 10%;
  font-size: 8vw;
  text-shadow: 1px 1px 2px rgb(255, 9, 50);

}

p {
  color: white;
  text-align: center;
  font-size: 3vw;
  text-shadow: 1px 1px 2px rgb(255, 9, 50);
}

.text{
  margin-left: 20%;
  margin-right: 20%;
}

.background{
  position: relative;
  height: 100vh;
  background: url(../img/background.png) no-repeat  ;
  background-size:100% 100vh;
  


}

@media screen and (max-width: 425px) {
  h1{
  color: white;
  text-align: center;
  margin-top: 10%;
  font-size: 10vw;
  text-shadow: 1px 1px 2px rgb(255, 9, 50);

}

p {
  color: white;
  text-align: center;
  width: 90;
  font-size: 5vw;
  text-shadow: 1px 1px 2px rgb(255, 9, 50);
}

.text{
  margin-left: 5%;
  margin-right: 5%;
}

.background{
  position: relative;
  height: 100vh;
  background: url(../img/background.png) no-repeat  ;
  background-size:100% 70vh;
  


}


}
</style>