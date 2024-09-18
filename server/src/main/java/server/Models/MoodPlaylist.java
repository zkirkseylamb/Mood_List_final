package server.Models;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Represents a mood based playlist
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MoodPlaylist {
    /**
     * The serial id of the mood playlist (populated by postgres)
     */
    private int mood_id;
    /**
     * The name of the mood playlist
     */
    @NotBlank (message = "Mood is mandatory")
    private String mood;
    /**
     * The image associated with a mood playlist
     */
    private String mood_img;

}
