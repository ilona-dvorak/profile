require 'sqlite3'

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  query = <<-SQL
  SELECT COUNT(*) FROM artists
  SQL
  result = db.execute(query)
  return result[0][0].to_i
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  result = db.execute("SELECT COUNT(*) FROM #{table_name}")
  return result[0][0].to_i
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  query = <<-SQL
  SELECT name FROM artists
  ORDER BY name ASC
  SQL
  names = db.execute(query)
  return names.flatten
end

def love_tracks(db)
  # TODO: return array of love songs' names
  query =
    "SELECT name FROM tracks
  WHERE name LIKE '%love%'"
  results = db.execute(query)
  return results.flatten
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
  query =
    "SELECT name FROM tracks
  WHERE milliseconds > #{min_length * 60_000}
  ORDER BY milliseconds ASC"
  result = db.execute(query)
  return result.flatten
end
