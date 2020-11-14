class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  # TODO
  def save
    if @id.nil?
      DB.execute("INSERT INTO posts (url, votes, title)
        VALUES ('#{@url}', #{@votes},'#{@title}')")
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE posts SET title = '#{title}' WHERE id = #{id}")
    end
  end
end
