import axios from 'axios';

const http = axios.create({
    baseURL: 'http://localhost:8080/api'
});


export default {
    listTrack() {
        return http.get('/track');
      },
    
    getTrackById(id) {
        return http.get(`/track/${id}`);
    },
    editTrack(id, track){
        return http.put(`/track/${id}`, track);

    },
    createTrack(track){
        return http.post('/track',track );

    },
    deleteTrack(id){
        return http.delete(`/track/${id}`);

    }
}
