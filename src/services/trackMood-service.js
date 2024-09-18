import axios from 'axios';

const http = axios.create({
    baseURL: 'http://localhost:8080/api'
});


export default {
    
    getTrackByPlaylist(id) {
        return http.get(`/track_mood/${id}`);
    },
    createTrackMood(trackMood){
        return http.post('/track_mood',trackMood );

    },
}
