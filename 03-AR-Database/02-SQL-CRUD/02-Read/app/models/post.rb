# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.
class Post
  attr_accessor :title, :url, :votes
  attr_reader :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes]
  end

  def self.find(id)
    DB.results_as_hash = true
    aa = DB.execute("SELECT * FROM posts WHERE id = ?", id).flatten
    if aa != []
      Post.new(
        id: aa.first["id"],
        url: aa.first["url"],
        votes: aa.first["votes"],
        title: aa.first["title"]
      )
    end
  end

  def self.all
    data = DB.execute("SELECT * FROM posts")
    data.map do |posts|
      Post.new(
        id: posts['id'],
        url: posts["url"],
        votes: posts["votes"],
        title: posts["title"]
      )
    end
  end
end
