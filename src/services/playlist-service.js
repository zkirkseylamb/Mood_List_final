import axios from 'axios';

const http = axios.create({
    baseURL: 'http://localhost:8080/api'
});


export default {
    listAllPlaylists() {
        return http.get('/playlist');
    },
    
    getPlaylistById(id) {
        return http.get(`/playlist/${id}`);
    },
    editPlaylist(id, moodPlaylist){
        return http.put(`/playlist/${id}`, moodPlaylist);

    },
    createPlaylist(moodPlaylist){
        return http.post('/playlist', moodPlaylist);

    },
    deletePlaylist(id){
        return http.delete(`/playlist/${id}`);
    }

}
