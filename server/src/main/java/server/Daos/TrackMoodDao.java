package server.Daos;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import server.Models.Track;
import server.Models.TrackMood;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 * Data access object for the track_mood table
 */
@Component
public class TrackMoodDao {
    /**
     * JdbcTemplate instance
     */
    private final JdbcTemplate jdbcTemplate;
    /**
     * Creates a new Track_MoodDao
     *
     * @param dataSource The datasource to connect to
     */
    public TrackMoodDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }


    public List<Track> getTrackByPlaylistId(int id) throws DaoException {
       List<Track> tracks =new ArrayList<>();
       String sql =  "SELECT * FROM track WHERE track_id in (SELECT track_id from track_mood WHERE mood_id=?) ";
       try {
           SqlRowSet results = jdbcTemplate.queryForRowSet(sql,id);
           while(results.next()) {
               Track track = mapRowtoTrack(results);
               tracks.add(track);
           }
       }catch(CannotGetJdbcConnectionException e) {
           throw new DaoException( "Unable to reach the server or database",e);
           }

        return tracks;
    }

    public TrackMood createTrackMood(TrackMood trackMood) {
        Integer id = jdbcTemplate.queryForObject(
                "INSERT INTO track_mood (track_id,mood_id) VALUES (?,?) RETURNING track_mood_id",
                Integer.class,
                trackMood.getTrack_id(),
                trackMood.getMood_id()

        );
            return null;
    }



    private Track mapRowtoTrack(SqlRowSet row) {
        Track track = new Track();
        track.setTrack_id(row.getInt("track_id"));
        track.setTitle(row.getString("title"));
        track.setDescription(row.getString("description"));
        track.setArtist(row.getString("artist"));
        track.setImage(row.getString("image"));
        track.setEnergy(row.getInt("energy"));
        track.setValence(row.getInt("valence"));
        return track;
    }

}
