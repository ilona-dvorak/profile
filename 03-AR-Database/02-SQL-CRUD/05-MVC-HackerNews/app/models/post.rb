class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
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

  def save
    if @id.nil?
      DB.execute("INSERT INTO posts (url, votes, title)
        VALUES ('#{@url}', #{@votes},'#{@title}')")
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE posts SET title = '#{title}' WHERE id = #{id}")
    end
  end

  def destroy
    DB.execute("DELETE FROM posts WHERE id = ?", id)
  end
end
