package server.Controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import server.Daos.MoodPlaylistDao;
import server.Models.MoodPlaylist;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import java.util.List;

/**
 * Handles REST requests to /api/playlist/*
 */
@RestController
@RequestMapping("/api/playlist")
@CrossOrigin
public class MoodPlaylistController {
    /**
     * mood data access object
     */
    private final MoodPlaylistDao moodPlaylistDao;

    /**
     * Creates a new moodController
     *
     * @param moodPlaylistDao The mood data access object
     */
    public MoodPlaylistController(MoodPlaylistDao moodPlaylistDao){
        this.moodPlaylistDao = moodPlaylistDao;
    }
    /**
     * Returns a list of all mood playlists
     *
     * @return The list of mood playlists
     */

    @GetMapping("")
    public List<MoodPlaylist> moodList() {
        return moodPlaylistDao.getPlaylistList();
    }

    /**
     * Returns a mood playlist by their id
     *
     * @param id the id of the mood playlist
     * @return The mood
     */

    @GetMapping("/{id}")
    public MoodPlaylist getMoodById(@PathVariable int id){
        return moodPlaylistDao.getPlaylistById(id);
    }

    /**
     * Adds a new mood playlist
     *
     * @param moodPlaylist The mood to add
     * @return The added mood
     */
    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("")
    public MoodPlaylist addMood(@Valid @RequestBody MoodPlaylist moodPlaylist){
        return moodPlaylistDao.createPlaylist(moodPlaylist);
    }

    /**
     * Updates a mood
     *
     * @param id The id of the mood
     * @param moodPlaylist the mood to update
     * @return The updated mood
     */
    @PutMapping("/{id}")
    public MoodPlaylist updateMood(@PathVariable int id, @Valid @RequestBody MoodPlaylist moodPlaylist) {
        moodPlaylist.setMood_id(id);
        return moodPlaylistDao.updatePlaylist(moodPlaylist);
    }

    /**
     * Deletes a mood
     *
     * @param id The id of the mood
     */
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @DeleteMapping("/{id}")
    public void deleteMood(@PathVariable int id) {
        moodPlaylistDao.deletePlaylistById(id);
    }
}

