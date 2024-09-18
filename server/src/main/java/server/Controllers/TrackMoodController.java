package server.Controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import server.Daos.TrackMoodDao;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import server.Models.Track;
import server.Models.TrackMood;

import java.util.List;

/**
 * Handles REST requests to /api/track_mood/*
 */
@RestController
@RequestMapping("/api/track_mood")
@CrossOrigin
public class TrackMoodController {

    private final TrackMoodDao trackMoodDao;


    public TrackMoodController(TrackMoodDao trackMoodDao){
        this.trackMoodDao = trackMoodDao;
    }

    @GetMapping("/{id}")
    public List<Track> getTrackByPlaylist(@PathVariable int id){
        return trackMoodDao.getTrackByPlaylistId(id);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("")
    public TrackMood addTrackMood(@Valid @RequestBody TrackMood trackMood) {
        return trackMoodDao.createTrackMood(trackMood);
    }

}