package server.Daos;

import server.Models.MoodPlaylist;
import server.Models.TrackMood;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Data access object for the mood playlist table
 */
@Component
public class MoodPlaylistDao {
    /**
     * JdbcTemplate instance
     */
    private final JdbcTemplate jdbcTemplate;
    /**
     * Creates a new MoodPlaylistDao
     *
     * @param  dataSource The datasource connect
     */
    public MoodPlaylistDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    /**
     * Returns a list of all playlists
     *
     * @return  The list of playlists
     */
    public List<MoodPlaylist> getPlaylistList() {
        return jdbcTemplate.query( "SELECT * FROM mood_playlist order by mood_id",
                this::mapPlaylist
        );
    }

    /**
     *
     * @param id The id of the playlist
     * @return The playlist
     */
    public MoodPlaylist getPlaylistById(int id) {
        try {
            return jdbcTemplate.queryForObject(
                    "SELECT * FROM mood_playlist WHERE mood_id = ? order by mood_id",
                    this::mapPlaylist,
                    id
            );
        }catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    /**
     *
     * @param moodPlaylist The playlist to create
     * @return The created playlist
     */
    public MoodPlaylist createPlaylist(MoodPlaylist moodPlaylist) {
        Integer id = jdbcTemplate.queryForObject(
                "INSERT INTO mood_playlist (mood,mood_img) VALUES (?,?) RETURNING mood_id",
                Integer.class,
                moodPlaylist.getMood(),
                moodPlaylist.getMood_img()

        );
        if (id != null) {
            return getPlaylistById(id);
        }else {
            return null;
        }
    }

    /**
     *
     * @param  moodPlaylist The Playlist to update
     * @return The updated playlist
     */
    public MoodPlaylist updatePlaylist(MoodPlaylist moodPlaylist) {
        int affectedRows = jdbcTemplate.update(
                "UPDATE mood_playlist SET mood = ?, mood_img = ?, WHERE mood_id = ?",
                moodPlaylist.getMood_id(),
                moodPlaylist.getMood(),
                moodPlaylist.getMood_img()

        );
        if (affectedRows > 0) {
            return  getPlaylistById(moodPlaylist.getMood_id());
        }else {
            return null;
        }
    }

    /**
     *
     * @param id The playlist
     * @return The number of affected rows
     */
    public int deletePlaylistById(int id) {
        return jdbcTemplate.update(
                "DELETE FROM mood_playlist WHERE mood_id = ?",
                id
        );
    }

    /**
     *
     * @param row The result set
     * @param rowNumber The row number
     * @return The playlist
     * @throws SQLException If an error occurs
     */
    private MoodPlaylist mapPlaylist(ResultSet row, int rowNumber) throws SQLException {
        MoodPlaylist moodPlaylist = new MoodPlaylist();
        moodPlaylist.setMood_id(row.getInt("mood_id"));
        moodPlaylist.setMood(row.getString("mood"));
        moodPlaylist.setMood_img(row.getString("mood_img"));
        return moodPlaylist;
    }

}
