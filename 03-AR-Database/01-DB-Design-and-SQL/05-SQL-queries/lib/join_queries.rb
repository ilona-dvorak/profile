require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  query =
    "SELECT tracks.name, albums.title, artists.name
    FROM tracks, albums, artists
    WHERE albums.artist_id = artists.id
    AND albums.id = tracks.album_id"
  result = db.execute(query)
  return result
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  query =
    "SELECT COUNT(*), ROUND(AVG(tracks.milliseconds) / 60000, 2)
          FROM tracks
          JOIN genres ON genres.id = tracks.genre_id
          WHERE genres.name = '#{genre_name}'"

  result = db.execute(query).flatten
  return {
    category: genre_name,
    number_of_songs: result[0],
    avg_length: result[1]
  }
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  query =
    "SELECT artists.id, artists.name, COUNT(*)
    FROM tracks
    JOIN albums ON albums.id = tracks.album_id
    JOIN artists ON albums.artist_id = artists.id
    JOIN genres ON genres.id = tracks.genre_id
    WHERE genres.name = '#{genre_name}'
    GROUP BY artists.id
    ORDER BY COUNT(*) DESC
    LIMIT 5"
  result = db.execute(query)
  return result
end
