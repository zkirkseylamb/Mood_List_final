package server.Controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import server.Daos.TrackDao;
import server.Models.Track;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Handles REST requests to /api/track/*
 */
@RestController
@RequestMapping("/api/track")
@CrossOrigin
public class TrackController {
    /**
     * Playlist data access object
     */
    private final TrackDao trackDao;

    /**
     * Creates a new TrackController
     *
     * @param trackDao The track data access object
     */
    public TrackController(TrackDao trackDao){
        this.trackDao =trackDao;
    }

    /**
     * Returns a list of all tracks
     *
     * @return The list of tracks
     */
    @GetMapping("")
    public List<Track> listTrack() {
        return trackDao.getTrackList();
    }

    /**
     * Returns a track by their id
     *
     * @param id The id of the track
     * @return The track
     */
    @GetMapping("/{id}")
    public Track getTrack(@PathVariable int id) {
        return trackDao.getTrackBy(id);
    }

    /**
     * Adds a new track
     *
     * @param track The track to add
     * @return The added track
     */
    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("")
    public Track addPlaylistTrack(@Valid @RequestBody Track track) {
        return trackDao.createTrack(track);
    }

    /**
     * Updates a track
     *
     * @param id The id of the track
     * @return The updated track
     */

    @PutMapping("/{id}")
    public Track updatedTrack(@PathVariable int id, @Valid @RequestBody Track track) {
        track.setTrack_id(id);
        return trackDao.updateTrack(track);
    }

    /**
     * Deletes a track
     *
     * @param id The id of the track
     */
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @DeleteMapping("/{id}")
    public void deleteTrack(@PathVariable int id) {
        trackDao.deleteTitle(id);
    }
}
