require 'sqlite3'
#comment for repush
def all_artists(db)
  # TODO: use `db` to execute an SQL query against the database to
  # retrieve all columns from all records from the `artists` table.
  db.execute('SELECT * FROM artists')
end
