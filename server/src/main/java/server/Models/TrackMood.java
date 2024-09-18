package server.Models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Represents the relationship between a track and the mood playlist
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TrackMood {
    /**
     * The serial id (populated by postgres)
     */
    int track_mood_id;
    /**
     * The serial id of the track (populated by postgres)
     * (referenced by the mood playlist table)
     */
    int track_id;
    /**
     * The serial id of the mood (populated by postgres)
     * (referenced by the mood playlist table)
     */
    int mood_id;
}
