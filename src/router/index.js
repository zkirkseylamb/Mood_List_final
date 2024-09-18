import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/Home.vue';
import Playlists from '../views/Playlists.vue';
import PlaylistTracks from '../views/PlaylistTracks.vue';
import Tracks from '../views/Tracks.vue';
import NewPlaylistFormVue from '../components/NewPlaylistForm.vue';
import NewTrackFormVue from '../components/NewTrackForm.vue';
import Login from '../views/Login.vue';
import Register from '../views/Register.vue';
import { store } from '../main';

export function createAppRouter() {
    const router = createRouter({
        history: createWebHistory(),
        routes: [
            {
                path: '/',
                name: 'Home',
                component: Home,
                meta: {
                    requireAuth: false,
                }
            },
            {
                path: '/playlists',
                name: 'Playlists',
                component: Playlists,
                meta: {
                    requireAuth: true,
                }
            },
            {
                path: '/login',
                name: 'Login',
                component: Login,
                meta: {
                    requireAuth: false,
                }
            },
            {
                path: '/register',
                name: 'Register',
                component: Register,
                meta: {
                    requireAuth: false,
                }
            },
            {
                path: '/playlists/:id',
                name:'PlaylistTracks',
                component: PlaylistTracks,
                meta: {
                    requireAuth: true,
                }

            },
            {
                path:'/tracks/:id',
                name:'Tracks',
                component: Tracks,
                meta: {
                    requireAuth: true,
                }
            },
            {
                path:'/PlaylistForm',
                name:'PlaylistForm',
                component: NewPlaylistFormVue,
                meta: {
                    requireAuth: true,
                }
            },
            {
                path:'/TrackForm',
                name:'TrackForm',
                component: NewTrackFormVue,
                meta: {
                    requireAuth: true,
                }
            }
        ]
    });

    router.beforeEach((to, from, next) => {
        if (to.meta.requireAuth  && store.state.token === null) {
            next('/login');
        } else {
            next();
        }
    });
    
    return router;
}